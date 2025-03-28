# Define Log Function with a Date Stamp
Function Log {
    Param(
        [string]$Message
    )
    $Date = Get-Date -Format "dddd dd/MM/yyyy HH:mm"
    $Output = "$($Date) - $($Message)"
    return $Output
}

# Log Path Setup
$LogPath = "$($env:ProgramData)\Microsoft\IntuneManagementExtension\logs"
$logName = "Detection_Blank.log"

# Create Log File Path
$logFilePath = Join-Path -Path $LogPath -ChildPath $logName

# Setup Log File if not created already
if (-not (Test-Path -Path $LogPath)) {
    New-Item -Path $LogPath -ItemType Directory -Force
    Log "Created the log directory at $LogPath" | Out-File -FilePath $logFilePath -Append
}

# Log that the script has started
$startMessage = @"
.
##################################################
###         SCRIPT HAS STARTED                ###
##################################################
"@
Log $startMessage | Out-File -FilePath $logFilePath -Append

# Application Detection Parameters
$AppName = "Application Name"  # Change this to your application name
$File = "C:\Path\To\Your\Application.exe"  # Change this to your application path

Log "Checking for $AppName installation" | Out-File -FilePath $logFilePath -Append

try {
    if (Test-Path $File) {
        Log "Found $AppName at: $File" | Out-File -FilePath $logFilePath -Append
        Write-Host "Detected"
        Exit 0
    } else {
        Log "Application not found at: $File" | Out-File -FilePath $logFilePath -Append
        Write-Host "Not Detected"
        Exit 1
    }
} catch {
    $errMsg = $_.Exception.Message
    Log "Error encountered: $errMsg" | Out-File -FilePath $logFilePath -Append
    Write-Host "Not Detected"
    Exit 1
}

# Log that the script has completed
Log "Detection Script has completed." | Out-File -FilePath $logFilePath -Append 