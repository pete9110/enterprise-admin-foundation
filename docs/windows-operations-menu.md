# Windows Operations Menu

## Purpose

The Windows operations menu provides a single PowerShell-based interface for common Windows Server administration checks on `win-admin-01`.

This mirrors the Linux operations menu and supports cross-platform enterprise administration practice.

## Server

win-admin-01

## Script Location on Windows

C:\EnterpriseAdminFoundation\scripts\windows-ops-menu.ps1

## Command

Run from PowerShell as Administrator:

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

C:\EnterpriseAdminFoundation\scripts\windows-ops-menu.ps1

## Menu Options

The menu supports:

1. Run Windows health check
2. Run Windows patch report
3. Run IIS validation
4. Show latest reports
5. Show core service status
6. Exit

## Scripts Called by the Menu

The operations menu calls:

- C:\EnterpriseAdminFoundation\scripts\windows-health-check.ps1
- C:\EnterpriseAdminFoundation\scripts\windows-patch-report.ps1
- C:\EnterpriseAdminFoundation\scripts\iis-validation.ps1

## Core Services Checked

The service status option checks:

- W3SVC — World Wide Web Publishing Service
- WAS — Windows Process Activation Service
- wuauserv — Windows Update
- BITS — Background Intelligent Transfer Service

## Report Location

Reports are saved under:

C:\EnterpriseAdminFoundation\reports\

## Operational Value

This script simulates a Windows operations wrapper tool.

It standardizes recurring administration tasks and reduces the need to remember each individual PowerShell script path.
