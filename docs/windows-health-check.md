# Windows Server Health Check Script

## Purpose

The Windows health check script collects basic operational health data from `win-admin-01`.

This mirrors the Linux health check workflow and supports cross-platform enterprise administration practice.

## Server

win-admin-01

## Script Location on Windows

C:\EnterpriseAdminFoundation\scripts\windows-health-check.ps1

## Report Location on Windows

C:\EnterpriseAdminFoundation\reports\

## Checks Performed

The script checks:

- Hostname
- Current user
- OS information
- Uptime
- IPv4 configuration
- Disk usage
- Memory usage
- Windows Firewall profiles
- Remote Desktop firewall rules
- IIS service status
- HTTP response
- Recent System event logs
- Recent Application event logs

## Execution Policy

For lab use, the script was run with:

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

This bypasses execution policy only for the current PowerShell session.

## Command

Run from PowerShell as Administrator:

C:\EnterpriseAdminFoundation\scripts\windows-health-check.ps1

## Operational Value

This script simulates Windows Server operational health reporting.

It gives administrators evidence for server status, service health, firewall posture, and recent event logs.
