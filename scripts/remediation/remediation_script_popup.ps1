# Import Windows Forms assembly
Add-Type -AssemblyName System.Windows.Forms

# Define Variables
$folderPath = "C:\Hello Tuur"
$Title = "Aanmaken Folder Tuur"
$msgText = ""

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

# Show the popup message
[System.Windows.Forms.MessageBox]::Show($msgText, $Title, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
