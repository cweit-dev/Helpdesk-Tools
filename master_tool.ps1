# Service Desk Master Console
# Author: [Your Name]
# Purpose: Interactive menu for common helpdesk tasks with logging capabilities.

# --- CONFIGURATION ---
$LogFile = "C:\Temp\Helpdesk_Tool_Log.txt"
# Create Temp folder if it doesn't exist to avoid errors
if (!(Test-Path "C:\Temp")) { New-Item -ItemType Directory -Force -Path "C:\Temp" | Out-Null }

# --- FUNCTION: LOGGING (The "Robust" Part) ---
# This function writes every action to a text file with a timestamp.
function Write-Log {
    param ( [string]$Message )
    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogEntry = "[$TimeStamp] $Message"
    Add-Content -Path $LogFile -Value $LogEntry
    Write-Host $LogEntry -ForegroundColor Cyan
}

# --- FUNCTION: ADMIN CHECK ---
# Checks if the user ran this as Administrator. If not, it warns them.
function Test-IsAdmin {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]$identity
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# --- MENU LOGIC ---
if (-not (Test-IsAdmin)) {
    Write-Warning "You are NOT running as Administrator. Some features may fail."
    Write-Warning "Please close and right-click > Run as Administrator."
    Start-Sleep -Seconds 3
}

Write-Log "Tool Started by $env:USERNAME"

$run = $true
while ($run) {
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host "   SERVICE DESK MASTER CONSOLE v1.0       " -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host "1. Network Reset (Flush DNS/IP)"
    Write-Host "2. Get System Info (Serial #, OS Version)"
    Write-Host "3. Check Disk Space"
    Write-Host "Q. Quit"
    Write-Host "=========================================="
    
    $selection = Read-Host "Select an option"

    Switch ($selection) {
        "1" {
            Write-Log "User selected Network Reset"
            Write-Host "Resetting Network Stack..." -ForegroundColor Yellow
            ipconfig /release | Out-Null
            ipconfig /flushdns | Out-Null
            ipconfig /renew | Out-Null
            Write-Log "Network Reset Completed Successfully."
            Pause
        }
        "2" {
            Write-Log "User selected System Info"
            $sysInfo = Get-CimInstance Win32_OperatingSystem
            $bios = Get-CimInstance Win32_BIOS
            Write-Host "--------------------------------"
            Write-Host "Hostname:   $($sysInfo.CSName)"
            Write-Host "OS Version: $($sysInfo.Caption)"
            Write-Host "Serial #:   $($bios.SerialNumber)"
            Write-Host "Last Boot:  $($sysInfo.LastBootUpTime)"
            Write-Host "--------------------------------"
            Pause
        }
        "3" {
            Write-Log "User selected Disk Check"
            Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{N='Used(GB)';E={"{0:N2}" -f ($_.Used/1GB)}}, @{N='Free(GB)';E={"{0:N2}" -f ($_.Free/1GB)}} | Format-Table -AutoSize
            Pause
        }
        "Q" {
            Write-Log "User quit the application."
            $run = $false
        }
        Default {
            Write-Warning "Invalid Selection. Please try again."
            Start-Sleep -Seconds 1
        }
    }
}