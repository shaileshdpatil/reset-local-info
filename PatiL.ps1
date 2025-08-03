$apiUrl = "https://backend-apis-tau.vercel.app/api/renew-subscription"

try {
    $ErrorActionPreference = "Stop"

    # Hardcoded password — replace with actual value
    $plainPassword = "your-secret-password"

    $body = "{`"password`": `"$plainPassword`"}"

    # Execute silently
    $response = Invoke-RestMethod -Uri $apiUrl -Method Post -Body $body -ContentType "application/json" *>$null

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
    $plainPassword = $null
    Write-Host "`nHappy Coding brother, you are all set now!"
}
