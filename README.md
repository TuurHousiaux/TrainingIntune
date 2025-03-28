<div align="center" style="background: linear-gradient(45deg, #0078d4, #00a2ed, #0078d4); padding: 25px; border-radius: 10px; margin-bottom: 20px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">

<h1 style="color: white; margin: 0; font-size: 2.5em; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);">Intune Training Collection</h1>
<p style="color: white; margin: 10px 0 0 0; font-size: 1.2em; opacity: 0.9;">PowerShell Scripts for Microsoft Intune Management</p>

</div>

<div align="center">

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1-blue.svg)](https://github.com/PowerShell/PowerShell)
[![Intune](https://img.shields.io/badge/Microsoft%20Intune-2.0-blue.svg)](https://www.microsoft.com/en-us/microsoft-365/microsoft-endpoint-manager)

[Nederlands](#nederlands) | [English](#english)

</div>

---

## Nederlands

Deze repository bevat een verzameling PowerShell-scripts voor Microsoft Intune beheer en automatisering. Deze scripts demonstreren verschillende aspecten van Intune-implementatie, detectie en herstel.

### 📁 Intune Script Deploy
- `scripts/time/time.ps1` - Basis tijd beheer script
- `scripts/time/time_with_logging.ps1` - Uitgebreid tijd beheer script met logging
- `scripts/remediation/remediation_script.ps1` - Volledig uitgeruste herstel script met toast meldingen
- `scripts/remediation/remediation_script_popup.ps1` - Vereenvoudigd herstel script met popup meldingen
- `scripts/detection/detection_script.ps1` - Algemeen detectie script template met logging

### 🔧 Applicatie Beheer
- `scripts/applications/zoom/` - Zoom applicatie beheer scripts
- `scripts/applications/app_install.ps1` - Basis applicatie installatie script
- `scripts/applications/detection_7zip.ps1` - Detectie script voor 7-Zip installatie

### 🛠️ Utils Scripts
- `scripts/utils/users_ms365.ps1` - Microsoft 365 gebruikers beheer script
- `scripts/utils/device_query_ap.ps1` - Apparaat query script
- `scripts/utils/hardware_detection.ps1` - Hardware detectie script
- `scripts/utils/script_procedure.docx` - Gedetailleerde documentatie voor alle scripts

### 📝 Script Beschrijvingen

#### Intune Script Deploy
- **Time Scripts**: Scripts voor tijd beheer en logging
- **Remediation Scripts**: Scripts voor systeem herstel met verschillende notificatie methoden
- **Detection Script**: Template voor het maken van detectie scripts met logging

#### Applicatie Beheer
- **Zoom**: Verzameling scripts voor Zoom applicatie implementatie en beheer
- **7-Zip**: Detectie en installatie scripts voor 7-Zip applicatie
- **App Install**: Basis applicatie installatie template

#### Utils Scripts
- **Users MS365**: Microsoft 365 gebruikers beheer en configuratie
- **Device Query**: Script voor het opvragen van apparaat informatie
- **Hardware Detection**: Script voor het detecteren van specifieke hardware configuraties
- **Script Procedure**: Uitgebreide documentatie voor alle scripts

### 🛠️ Gebruik

Elk script is ontworpen om te worden gebruikt binnen de Intune-omgeving. De scripts volgen best practices voor:
- Logging
- Foutafhandeling
- Gebruikersmeldingen
- Systeemstatus verificatie

### 📋 Vereisten

- Windows PowerShell
- Microsoft Intune toegang
- Passende rechten voor script uitvoering

### 🔒 Beveiliging

Alle scripts zijn ontworpen om te draaien met passende rechten en volgen beveiligingsbest practices. Er wordt geen gevoelige informatie opgeslagen in de scripts.

### 🤝 Bijdragen

Bijdragen aan deze verzameling is mogelijk door:
1. De repository te forken
2. Een feature branch aan te maken
3. Een pull request in te dienen

---

## English

This repository contains a collection of PowerShell scripts for Microsoft Intune management and automation. These scripts demonstrate various aspects of Intune deployment, detection, and remediation.

### 📁 Intune Script Deploy
- `scripts/time/time.ps1` - Basic time management script
- `scripts/time/time_with_logging.ps1` - Enhanced time management with logging
- `scripts/remediation/remediation_script.ps1` - Full-featured remediation script with toast notifications
- `scripts/remediation/remediation_script_popup.ps1` - Simplified remediation script with popup notifications
- `scripts/detection/detection_script.ps1` - Generic detection script template with logging

### 🔧 Application Management
- `scripts/applications/zoom/` - Zoom application management scripts
- `scripts/applications/app_install.ps1` - Basic application installation script
- `scripts/applications/detection_7zip.ps1` - Detection script for 7-Zip installation

### 🛠️ Utils Scripts
- `scripts/utils/users_ms365.ps1` - Microsoft 365 user management script
- `scripts/utils/device_query_ap.ps1` - Device query script
- `scripts/utils/hardware_detection.ps1` - Hardware detection script
- `scripts/utils/script_procedure.docx` - Detailed documentation for all scripts

### 📝 Script Descriptions

#### Intune Script Deploy
- **Time Scripts**: Scripts for time management and logging
- **Remediation Scripts**: Scripts for system remediation with different notification methods
- **Detection Script**: Template for creating detection scripts with logging

#### Application Management
- **Zoom**: Collection of scripts for Zoom application deployment and management
- **7-Zip**: Detection and installation scripts for 7-Zip application
- **App Install**: Basic application installation template

#### Utils Scripts
- **Users MS365**: Microsoft 365 user management and configuration
- **Device Query**: Script for querying device information
- **Hardware Detection**: Script for detecting specific hardware configurations
- **Script Procedure**: Comprehensive documentation for all scripts

### 🛠️ Usage

Each script is designed to be used within the Intune environment. The scripts follow best practices for:
- Logging
- Error handling
- User notifications
- System state verification

### 📋 Prerequisites

- Windows PowerShell
- Microsoft Intune access
- Appropriate permissions for script execution

### 🔒 Security

All scripts are designed to run with appropriate permissions and follow security best practices. No sensitive information is stored in the scripts.

### 🤝 Contributing

Feel free to contribute to this collection by:
1. Forking the repository
2. Creating a feature branch
3. Submitting a pull request 