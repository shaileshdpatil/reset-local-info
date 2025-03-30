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

## Disclaimer

This tool is provided for educational purposes only. Use of this tool should comply with all applicable laws and regulations. This utility is not intended to bypass, circumvent, or violate any constitutional rights, privacy laws, or terms of service of any platform. 

## Legal References

This tool respects the Fourth Amendment of the U.S. Constitution regarding privacy rights. Users should also be aware of the Computer Fraud and Abuse Act (CFAA) and similar legislation in other jurisdictions that prohibit unauthorized access to computer systems. Always ensure you have proper authorization before using ID generation tools in any production or live environment. 

### Indian Legal Context

In India, this tool should be used in accordance with:
- Article 21 of the Indian Constitution, which includes the right to privacy
- Information Technology Act, 2000 (IT Act), particularly Sections 43, 65, and 66, which address unauthorized access to computer systems
- Information Technology (Reasonable Security Practices and Procedures and Sensitive Personal Data or Information) Rules, 2011
- The Personal Data Protection Bill provisions regarding digital identity management 