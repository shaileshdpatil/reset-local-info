function Generate-RandomHex {
    param ([int]$length)
    $bytes = [System.Byte[]]::new($length / 2)
    [System.Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($bytes)
    return ($bytes | ForEach-Object { $_.ToString("x2") }) -join ''
}

function Generate-MachineID {
    $prefix = "auth0|user_"
    $randomPart = Generate-RandomHex -length 64
    return "$prefix$randomPart"
}

function Generate-MacMachineID {
    return Generate-RandomHex -length 64
}

function Generate-DeviceID {
    return [guid]::NewGuid().ToString()
}

function Generate-SqmID {
    return "{" + (Generate-DeviceID) + "}"
}

function Validate-ID {
    param (
        [string]$idString,
        [string]$idType
    )
    
    switch ($idType) {
        "machineID" {
            $prefix = "auth0|user_"
            if ($idString.StartsWith($prefix)) {
                $hexPart = $idString.Substring($prefix.Length)
                return ($hexPart.Length -eq 64 -and ($hexPart -match "^[a-fA-F0-9]{64}$"))
            }
            return $false
        }
        "macMachineID" {
            return ($idString.Length -eq 64 -and ($idString -match "^[a-fA-F0-9]{64}$"))
        }
        "deviceID" {
            return [guid]::TryParse($idString, [ref]([guid]::Empty))
        }
        "sqmID" {
            if ($idString -match "^\{([0-9a-fA-F\-]{36})\}$") {
                return [guid]::TryParse($matches[1], [ref]([guid]::Empty))
            }
            return $false
        }
        default { return $false }
    }
}

# Example Usage
$machineID = Generate-MachineID
Write-Output "Generated Machine ID: $machineID (Valid: $(Validate-ID -idString $machineID -idType 'machineID'))"

$macMachineID = Generate-MacMachineID
Write-Output "Generated MAC Machine ID: $macMachineID (Valid: $(Validate-ID -idString $macMachineID -idType 'macMachineID'))"

$deviceID = Generate-DeviceID
Write-Output "Generated Device ID: $deviceID (Valid: $(Validate-ID -idString $deviceID -idType 'deviceID'))"

$sqmID = Generate-SqmID
Write-Output "Generated SQM ID: $sqmID (Valid: $(Validate-ID -idString $sqmID -idType 'sqmID'))"