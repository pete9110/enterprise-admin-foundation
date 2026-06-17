# Windows IIS Validation Script

## Purpose

The IIS validation script checks the health of IIS on `win-admin-01` and creates a timestamped report.

This supports Windows Server service validation and incident response practice.

## Server

win-admin-01

## Script Location on Windows

C:\EnterpriseAdminFoundation\scripts\iis-validation.ps1

## Report Location on Windows

C:\EnterpriseAdminFoundation\reports\

## Checks Performed

The script checks:

- Hostname
- Validation time
- W3SVC service status
- WAS service status
- IIS website status
- HTTP response from localhost
- Recent IIS/System-related events

## Key PowerShell Commands

Check IIS service:

Get-Service W3SVC

Check Windows Process Activation Service:

Get-Service WAS

Load IIS administration module:

Import-Module WebAdministration

Check IIS websites:

Get-Website

Test HTTP:

Invoke-WebRequest http://localhost -UseBasicParsing

Review recent IIS-related system events:

Get-EventLog -LogName System -Newest 20

## Operational Value

This script provides repeatable IIS validation evidence.

It can be used after IIS configuration changes, patching, service restarts, or incident recovery.
