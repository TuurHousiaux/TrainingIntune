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
$logName = "Remediation_Hello_script.log"

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

# Import Windows Runtime classes for toast notifications
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null
Log "Imported Windows Runtime classes for Toast Notifications" | Out-File -FilePath $logFilePath -Append

# Define the APP_ID for the toast notification
$APP_ID = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'

Log "APP_ID set to: $APP_ID" | Out-File -FilePath $logFilePath -Append


# Folder Path and Toast Notification Title
$folderPath = "C:\Hello Tuur"
$Title = "Folder Status"
$msgText = ""

# Log the folder path being used
Log "Folder Path check is starting: $folderPath" | Out-File -FilePath $logFilePath -Append


try {
    # Check if the folder exists
    Log "Checking if folder exists at $folderPath" | Out-File -FilePath $logFilePath -Append
    if (-not (Test-Path -Path $folderPath)) {
        # Folder does not exist, create it
        New-Item -Path $folderPath -ItemType Directory | Out-Null
        $msgText = "The folder 'C:\Hello Tuur' was successfully created."
        Log $msgText | Out-File -FilePath $logFilePath -Append
    } else {
        # Folder already exists
        $msgText = "The folder 'C:\Hello Tuur' already exists."
        Log $msgText | Out-File -FilePath $logFilePath -Append
    }
}
catch {
    # Handle errors during folder creation
    $msgText = "Error: Unable to check or create the folder. " + $_.Exception.Message
    Log $msgText | Out-File -FilePath $logFilePath -Append
}

# Log the folder check status
Log "Folder check completed with message: $msgText" | Out-File -FilePath $logFilePath -Append

# Create and display a toast notification
$template = @"
<toast>
    <visual>
        <binding template="ToastText02">
            <text id="1">$Title</text>
            <text id="2">$msgText</text>
        </binding>
    </visual>
</toast>
"@
Log "Toast notification template created." | Out-File -FilePath $logFilePath -Append

$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($template)
$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($APP_ID).Show($toast)

# Log completion of the toast notification
Log "Toast notification displayed with message: $msgText" | Out-File -FilePath $logFilePath -Append

# Log script completion
Log "Script completed successfully." | Out-File -FilePath $logFilePath -Append
