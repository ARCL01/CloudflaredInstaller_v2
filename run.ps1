$config = Get-Content -Raw -Path "./config.json" | ConvertFrom-Json

Write-Host "Site: $($config.site)"
$hostname = $($config.site)
$command = "cloudflared access rdp --hostname $hostname --url rdp://localhost:3389"
function Clouflared_run {
    Set-Location $($config.cloudflare_directory)
    Start-Process -FilePath 'cmd.exe' -ArgumentList '/c', $command  -NoNewWindow -Wait
}

if (Test-Path -Path $($config.cloudflare_download) -PathType leaf) {
    Write-Host "Clouflared had been found at: $($config.cloudflare_download)"
    Write-Host "Do you wish to iniciate connection?"
    Read-Host "Click ENTER to continue, close terminal to cancel."
    Clouflared_run
    
} else {
    Write-Host "Cloudflared couldn't be found at: $($config.cloudflare_download) , do you want to install it? `n"
    Read-Host "Click ENTER to continue, close terminal to cancel."
    Write-Host "Cloudflared will now be installed from this URL: `n $($config.cloudflare_URL) `n Please check if this is the right URL."
    Read-Host "Click ENTER to continue, close terminal to cancel."
    Invoke-WebRequest -URI "$($config.cloudflare_URL)" -OutFile "$($config.cloudflare_download)"
    Write-Host "Cloudflared was succesfully installed, do you wish to iniciate connection?"
    Read-Host "Click ENTER to continue, close terminal to cancel."
    Clouflared_run
}



