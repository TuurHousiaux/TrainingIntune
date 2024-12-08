# Define Variables
$folderPath = "C:\Hell Tuur"
$Title = "Folder Status"
$msgText = ""

# Import Windows Runtime classes for toast notifications
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

$APP_ID = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'

try {
    # Check if the folder exists
    if (-not (Test-Path -Path $folderPath)) {
        # Folder does not exist, create it
        New-Item -Path $folderPath -ItemType Directory | Out-Null
        $msgText = "The folder 'C:\Hello Tuur' was successfully created."
    } else {
        # Folder already exists
        $msgText = "The folder 'C:\Hello Tuur' already exists."
    }
}
catch {
    # Handle errors during folder creation
    $msgText = "Error: Unable to check or create the folder. " + $_.Exception.Message
}

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

$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($template)
$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($APP_ID).Show($toast)
