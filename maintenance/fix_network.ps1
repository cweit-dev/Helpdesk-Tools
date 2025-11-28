# Network Troubleshooting Script
# Flushes DNS and resets IP configuration

Write-Host "Starting Network Reset..." -ForegroundColor Yellow

# Release current IP address
ipconfig /release

# Flush DNS Cache (Fixes bad website lookups)
ipconfig /flushdns

# Renew IP address (Gets a fresh connection from the router)
ipconfig /renew

Write-Host "Network Reset Complete. Try opening a website." -ForegroundColor Green