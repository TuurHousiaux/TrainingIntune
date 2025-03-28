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
$logName = "Detection_Remediation_Script.log"

# Create Log File Path
$logFilePath = Join-Path -Path $LogPath -ChildPath $logName

# Setup Log File if not created already
if (-not (Test-Path -Path $LogPath)) {
    New-Item -Path $LogPath -ItemType Directory -Force
    Log "Created the log directory at $LogPath" | Out-File -FilePath $logFilePath -Append
}

# Log that the script has started with a visual separator and more emphasis
$startMessage = @"
.
##################################################
###         SCRIPT HAS STARTED                ###
##################################################
"@
Log $startMessage | Out-File -FilePath $logFilePath -Append

# Folder path to check
$folderPath = "C:\Hello Tuur"
Log "Checking if folder exists: $folderPath" | Out-File -FilePath $logFilePath -Append

try {
    if (Test-Path -Path $folderPath) {
        # The folder exists
        Log "Folder '$folderPath' exists." | Out-File -FilePath $logFilePath -Append
        Write-Host "Match"
        exit 1
    }
    else {
        # The folder does not exist
        Log "Folder '$folderPath' does not exist." | Out-File -FilePath $logFilePath -Append
        Log "Will start Remediation." | Out-File -FilePath $logFilePath -Append
        Log "See Remediation_Hello_script.log for more information about the remediation." | Out-File -FilePath $logFilePath -Append
        Write-Host "No_Match"
        exit 0
    }
}
catch {
    $errMsg = $_.Exception.Message
    Log "Error encountered: $errMsg" | Out-File -FilePath $logFilePath -Append
    Write-Error $errMsg
    exit 1
}

# Log that the script has completed
Log "Detection Script has completed." | Out-File -FilePath $logFilePath -Append
