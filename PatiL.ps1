$apiUrl = "https://backend-apis-tau.vercel.app/api/renew-subscription"

try {
    # Prompt for password
    $password = Read-Host "Enter password" -AsSecureString
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
    $plainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

    # Create request body
    $body = @{
        password = $plainPassword
    } | ConvertTo-Json

    # Make the API call
    $response = Invoke-RestMethod -Uri $apiUrl -Method Post -Body $body -ContentType "application/json"

    # Only display message from response
    if ($response.message) {
        Write-Host $response.message
    } else {
        Write-Host "Unexpected response from API"
    }
} catch {
    Write-Host "Error occurred: $_"
} finally {
    if ($plainPassword) {
        $plainPassword = $null
    }
    if ($BSTR) {
        [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
    }
}
