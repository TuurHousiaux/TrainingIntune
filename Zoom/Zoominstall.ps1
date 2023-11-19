####==Install script (PowerShell)==

###Install Zoom latest version using winget
###Author: John Bryntze
###Date: 20th December 2022

### Find path to winget.exe

$JBNWinGetResolve = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe\winget.exe"
$JBNWinGetPathExe = $JBNWinGetResolve[-1].Path

$JBNWinGetPath = Split-Path -Path $JBNWinGetPathExe -Parent
set-location $JBNWinGetPath

###Run winget.exe

.\winget.exe install -e --id Zoom.Zoom --scope=machine --silent --accept-package-agreements --accept-source-agreements