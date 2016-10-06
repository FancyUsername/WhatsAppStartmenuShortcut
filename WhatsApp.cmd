@echo off
REM ************************************************************
REM * Start WhatsApp Web in Chrome with Autodetect Chrome Path
REM * and resize window + Position on Startup.
REM * by https://solariz.de
REM ************************************************************
REM
IF EXIST "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" GOTO CHROMEA
IF EXIST "%ProgramFiles%\Google\Chrome\Application\chrome.exe" GOTO CHROMEB
IF EXIST "%USERPROFILE%\Local Settings\Application Data\Google\Chrome\Application\chrome.exe" GOTO CHROMEC
IF EXIST "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" GOTO CHROMED
IF EXIST "%PROGRAMFILES%\..\Program Files (x86)\Google\Chrome\Application\chrome.exe" GOTO CHROMEE
IF EXIST "%USERPROFILE%\AppData\Local\Google\Chrome\Application\chrome.exe" GOTO CHROMEF
echo "Chrome not Found!"
GOTO EOF
:CHROMEA
    cd "%ProgramFiles(x86)%\Google\Chrome\Application"
    GOTO RUN
GOTO EOF
:CHROMEB
    cd "%ProgramFiles%\Google\Chrome\Application"
    GOTO RUN
GOTO EOF
:CHROMEC
    cd "%USERPROFILE%\Local Settings\Application Data\Google\Chrome\Application"
    GOTO RUN
GOTO EOF
:CHROMED
    cd "%LOCALAPPDATA%\Google\Chrome\Application"
    GOTO RUN
GOTO EOF
:CHROMEE
    cd "%PROGRAMFILES%\..\Program Files (x86)\Google\Chrome\Application"
    GOTO RUN
GOTO EOF
:CHROMEF
    cd "%USERPROFILE%\AppData\Local\Google\Chrome\Application"
    GOTO RUN
GOTO EOF
:RUN
    start "WhatsApp" /I /LOW chrome.exe --profile-directory="Default" --chrome-frame --app-window-size=800,600 --window-size=800,600 --app="data:text/html,<html><body><script>window.moveTo(200,200);window.resizeTo(800,600);window.location='https://web.whatsapp.com/';</script></body></html>"
GOTO EOF
:EOF