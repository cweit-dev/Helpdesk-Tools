\# Windows Helpdesk Administration Toolkit



\## Overview

This repository contains a collection of PowerShell automation scripts designed to streamline common IT helpdesk tasks. The goal of this toolkit is to reduce manual repetition during workstation setups and standard troubleshooting procedures.



\## Repository Structure

\* \*\*onboarding/\*\*: Scripts for provisioning new user workstations.

\* \*\*maintenance/\*\*: Scripts for system troubleshooting and network repair.



\## Included Scripts



\### 1. Automated Software Installer 

\* \*\*Location:\*\* `onboarding/install\_apps.ps1`

\* \*\*Description:\*\* Leverages the Windows Package Manager (Winget) to silently install standard business applications (Google Chrome, Zoom, Adobe Reader).

\* \*\*Impact:\*\* Reduces software provisioning time by approximately 15 minutes per workstation.



\### 2. Network Connectivity Fixer

\* \*\*Location:\*\* `maintenance/fix\_network.ps1`

\* \*\*Description:\*\* Automates the standard network troubleshooting workflow. It releases the current IP address, flushes the local DNS (Domain Name System) cache, and renews the IP address.

\* \*\*Impact:\*\* Resolves common "No Internet" or "Page Cannot Be Displayed" tickets with a single click.



\## How to Run

\*\*Note:\*\* By default, Windows restricts the execution of local scripts.

1\. Open PowerShell as Administrator.

2\. Run the following command to allow local script execution:

&nbsp;  `Set-ExecutionPolicy RemoteSigned`

3\. Navigate to the directory and run the script:

&nbsp;  `.\\maintenance\\fix\_network.ps1`

