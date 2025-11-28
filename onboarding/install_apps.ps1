# Windows Onboarding Script
# Installs standard office software automatically using Winget

Write-Host "Starting Software Installation..." -ForegroundColor Cyan

# 1. Install Google Chrome
Write-Host "Installing Google Chrome..."
winget install -e --id Google.Chrome --accept-package-agreements --accept-source-agreements

# 2. Install Zoom
Write-Host "Installing Zoom..."
winget install -e --id Zoom.Zoom --accept-package-agreements --accept-source-agreements

# 3. Install Adobe Acrobat Reader
Write-Host "Installing Adobe Reader..."
winget install -e --id Adobe.Acrobat.Reader.64-bit --accept-package-agreements --accept-source-agreements

Write-Host "Installation Complete! Please reboot." -ForegroundColor Green