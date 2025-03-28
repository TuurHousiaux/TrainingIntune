###==Detection Script (PowerShell)==

###Purpose: Checking that local installed Zoom is equal or greater to the latest online
###Author: John Bryntze
###Date: 20th December 2022

###Find path to WinGet.exe
$JBNWinGetResolve = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe\winget.exe"
$JBNWinGetPathExe = $JBNWinGetResolve[-1].Path
$JBNWinGetPath = Split-Path -Path $JBNWinGetPathExe -Parent
set-location $JBNWinGetPath

###What is the latest version of Zoom online
$JBNSearch = .\winget.exe search -e --id Zoom.Zoom --accept-source-agreements
$JBNOnlineVersion = (-split $JBNSearch[-1])[-2]


###What is the version installed
$JBNLocalSearch = .\winget.exe list -e --id Zoom.Zoom
$JBNCheckIfAvailavbleExist = (-split $JBNLocalSearch[-3])[-2]
if($JBNCheckIfAvailavbleExist -eq "Available")
{
    $JBNLocalVersion = (-split $JBNLocalSearch[-1])[-3]
}
else
{
    $JBNLocalVersion = (-split $JBNLocalSearch[-1])[-2]
}

if($JBNLocalVersion -eq "input")
{
 write-host "Zoom is not installed"
 exit 1
}

if($JBNLocalVersion -ge $JBNOnlineVersion)
{
    Write-Output "The Device got the latest version of Zoom installed"
 exit 0
 #Detection success
}
else
{
 exit 1
 #Detection failed
}