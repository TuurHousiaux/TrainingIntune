### Admin rights opvragen ###

  if(!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"  `"$($MyInvocation.MyCommand.UnboundArguments)`""
Exit
}



### Module MSonline detecteren, anders installeren ###



   if (Get-Module -ListAvailable -Name MSonline) {
     Write-Host "MSOnline Module Is installed"
    pause
    }
    else{
    
    
    Write-Host "Installing MSOnline lodule"
    Install-module MSonline
    
    }



### Connect to MSOnline ###



Connect-MsolService



### variabelen ####
Get-MsolDomain | Export-Csv .\tempintune.csv


### aanmaken users ###
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("david.chew@"+$_.Name) -DisplayName "David Chew" -FirstName "David" -LastName "Chew" -UsageLocation "BE"}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Bas.Schutte@"+$_.Name) -DisplayName "Bas Schutte" -FirstName "Bas" -LastName "Schutte" -UsageLocation "BE" -Department Sales}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Sander.Strauss@"+$_.Name) -DisplayName "Sander Strauss" -FirstName "Sander" -LastName "Strauss" -UsageLocation "BE" -Department Sales}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Teunis.hake@"+$_.Name) -DisplayName "Teunis Hake" -FirstName "Teunis" -LastName "Hake" -UsageLocation "BE" -Department Sales}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Lammert.Homan@"+$_.Name) -DisplayName "Lammert Homan" -FirstName "Lammert" -LastName "Homan" -UsageLocation "BE" -Department Marketing}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Tom.Ras@"+$_.Name) -DisplayName "Tom Ras" -FirstName "Tom" -LastName "Ras" -UsageLocation "BE" -Department Marketing}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Lammert.Kess@"+$_.Name) -DisplayName "Lammert Kess" -FirstName "Lammert" -LastName "Kess" -UsageLocation "BE" -Department Marketing}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Mariska.Cramp@"+$_.Name) -DisplayName "Mariska Cramp" -FirstName "Mariska" -LastName "Cramp" -UsageLocation "BE" -Department Administratie}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Marloes.VanRooy@"+$_.Name) -DisplayName "Marloes Van Rooy" -FirstName "Marloes" -LastName "Van Rooy" -UsageLocation "BE" -Department Administratie}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Paula.VanRooy@"+$_.Name) -DisplayName "Paula Van Rooy" -FirstName "Paula" -LastName "Van Rooy" -UsageLocation "BE" -Department Administratie}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Paulien.tempintuneel@"+$_.Name) -DisplayName "Paulien tempintuneel" -FirstName "Paulien" -LastName "tempintuneel" -UsageLocation "BE" -Department Administratie}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Willeke.Drayer@"+$_.Name) -DisplayName "Willeke Drayer" -FirstName "Willeke" -LastName "Drayer" -UsageLocation "BE" -Department Administratie}
Import-Csv .\tempintune.csv | foreach { New-MsolUser -UserPrincipalName ("Paulien.Goossen@"+$_.Name) -DisplayName "Paulien Goossen" -FirstName "Paulien" -LastName "Goossen" -UsageLocation "BE" -Department Administratie}


##opkuis
del .\tempintune.csv