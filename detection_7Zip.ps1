####### Geef hier de juiste package naam mee ########

$Package = "7zip.7zip"

#####################################################
# Verander hieronder niets
#####################################################

$winget_Exist = winget list --id $Package --exact
    if ($winget_Exist -like "*$Package*"){
    Write-Host "Found it!"
}