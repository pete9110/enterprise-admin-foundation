# win-admin-01 Build Notes

## Server Identity

Hostname: win-admin-01  
OS: Windows Server 2022 Standard Evaluation Desktop Experience  
Role: Windows Server administration node  

## Purpose

This server is part of the Enterprise Admin Foundation lab.

It is used to practice Windows Server administration, Remote Desktop, local users and groups, Windows Firewall, PowerShell, IIS, service management, event logs, and patching workflows.

## Initial Configuration

Completed the following:

- Installed Windows Server 2022 Standard Evaluation with Desktop Experience.
- Renamed server to `win-admin-01`.
- Verified network connectivity.
- Enabled Remote Desktop.
- Enabled Windows Firewall rules for RDP.
- Created local groups and users.
- Installed IIS.
- Created a test web page.
- Allowed HTTP traffic through Windows Firewall.
- Validated IIS service status.
- Reviewed Windows event logs.

## Local Groups

Created groups:

- `WinAdmins` — Windows administrators.
- `AppOperators` — application operators.
- `Auditors` — audit users.

## Local Users

Created users:

- `peteradmin` — Windows admin account.
- `appsvc` — application service account.
- `audituser` — audit user.

## PowerShell Commands Used

Rename computer:

Rename-Computer -NewName "win-admin-01" -Restart

Enable Remote Desktop:

Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

Enable RDP firewall rules:

Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

Create local groups:

New-LocalGroup -Name "WinAdmins" -Description "Windows server administrators"
New-LocalGroup -Name "AppOperators" -Description "Application operators"
New-LocalGroup -Name "Auditors" -Description "Audit users"

Install IIS:

Install-WindowsFeature -Name Web-Server -IncludeManagementTools

Create IIS test page:

Set-Content -Path "C:\inetpub\wwwroot\index.html" -Value "Enterprise Admin Foundation - win-admin-01"

Allow HTTP:

New-NetFirewallRule -DisplayName "Allow HTTP Inbound" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow

Validate IIS:

Get-Service W3SVC
Invoke-WebRequest http://localhost -UseBasicParsing

Check logs:

Get-EventLog -LogName System -Newest 10
Get-EventLog -LogName Application -Newest 10

## Operational Value

This server provides Windows administration practice alongside the existing Linux administration lab.

It supports cross-platform enterprise operations practice for infrastructure, DevOps, and systems administration roles.
