param(
    [string]$package = "",
    [switch]$uninstall = $false
)

if ($uninstall) {
    winget uninstall $package -h 
} else {
    winget install $package -h --accept-package-agreements --accept-source-agreements
}