# Windows Patch Report Script

## Purpose

The Windows patch report script collects patch and update-related information from `win-admin-01`.

This simulates pre-maintenance patch review for a Windows Server.

## Server

win-admin-01

## Script Location on Windows

C:\EnterpriseAdminFoundation\scripts\windows-patch-report.ps1

## Report Location on Windows

C:\EnterpriseAdminFoundation\reports\

## Checks Performed

The script checks:

- Hostname
- OS product/version/build
- Last boot time
- Latest installed hotfixes
- Windows Update service status
- BITS service status
- Pending reboot registry indicators

## Important Services

Windows Update service:

wuauserv

Background Intelligent Transfer Service:

BITS

## Command

Run from PowerShell as Administrator:

C:\EnterpriseAdminFoundation\scripts\windows-patch-report.ps1

## Operational Value

This provides Windows patch evidence similar to the Linux patch report workflow.

It helps an administrator determine patch state, recent updates, service health, and whether a reboot may be pending.
