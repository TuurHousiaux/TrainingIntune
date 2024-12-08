# Een simpel detectie-script voor een demo van Intune
$folderPath = "C:\Program Files"

try
{
    if (Test-Path -Path $folderPath) {
        # The folder exists
        Write-Host "Match"
        exit 1
    }
    else {
        # The folder does not exist
        Write-Host "No_Match"
        exit 0
    }
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}
