# Reset ID Generator

A PowerShell utility for generating and validating various types of IDs used in system authentication and identification.

## Features

- Generate secure random Machine IDs with Auth0 format
- Generate Mac-specific Machine IDs 
- Generate standard Device IDs using GUIDs
- Generate SQM IDs with specific formatting
- Validate all ID types against expected patterns

## Usage

```powershell
# Generate IDs
$machineID = Generate-MachineID
$macMachineID = Generate-MacMachineID
$deviceID = Generate-DeviceID
$sqmID = Generate-SqmID
```

## ID Formats

- **Machine ID**: `auth0|user_` followed by 64 hexadecimal characters
- **Mac Machine ID**: 64 hexadecimal characters
- **Device ID**: Standard GUID format
- **SQM ID**: Standard GUID enclosed in curly braces 