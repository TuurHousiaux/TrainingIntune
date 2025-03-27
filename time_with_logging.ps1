# This demo script uses Logging with Transcript
# It uses a Users path folder for logging (no admin rights or device context needed)

# Define Log Function with a Date Stamp
Function Log {
    Param(
        [string]$Message
    )
    $Date = Get-Date -Format "dddd dd/MM/yyyy HH:mm"
    $Output = "$($Date) - $($Message)"
}

# Log Path Setup (Using user's Documents folder)
$UserDocumentsPath = [System.Environment]::GetFolderPath('MyDocuments')
$LogPath = Join-Path -Path $UserDocumentsPath -ChildPath "TimeSyncLogs"
$logName = "TimeSync_Script.log"

# Create Log File Path
$logFilePath = Join-Path -Path $LogPath -ChildPath $logName

# Setup Log File if not created already
if (-not (Test-Path -Path $LogPath)) {
    New-Item -Path $LogPath -ItemType Directory -Force
    }

Start-Transcript -Path $logFilePath -Append

# Log that the script has started
Log "Time Sync Script has started."
log "trying to stop time service:"
net stop w32time
log "trying to add ntp services:"
w32tm /config /syncfromflags:manual /manualpeerlist:"0.be.pool.ntp.org 1.be.pool.ntp.org 2.be.pool.ntp.org 3.be.pool.ntp.org"
log "trying to start time service:"
net start w32time
log "trying to update service:"
w32tm /config /update
log "trying to aresync time service:"
w32tm /resync /rediscover
log "trying to change time-zone:"
tzutil /s "Romance Standard Time"
# Log that the script has completed
Log "Time Sync Script has completed."
Stop-Transcript
