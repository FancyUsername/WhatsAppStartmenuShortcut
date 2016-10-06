@echo off

set REL_PATH=.
set ABS_PATH=
rem
pushd %REL_PATH%
rem
set ABS_PATH=%CD%
rem
popd

set LINK_DIR=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\WhatsApp
mkdir "%LINK_DIR%"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%LINK_DIR%\WhatsApp.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%ABS_PATH%\WhatsApp.cmd" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%ABS_PATH%" >> CreateShortcut.vbs
echo oLink.Description = "My Application" >> CreateShortcut.vbs
echo oLink.IconLocation = "%ABS_PATH%\whatsapp-icon.ico" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
