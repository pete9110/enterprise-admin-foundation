# Incident 002 - IIS Service Stopped on win-admin-01

## Summary

The IIS web service on `win-admin-01` became unavailable because the World Wide Web Publishing Service (`W3SVC`) was stopped.

## Affected Server

win-admin-01

## Affected Service

World Wide Web Publishing Service

Service name:

W3SVC

## Detection

The issue was detected using the Windows health check script:

C:\EnterpriseAdminFoundation\scripts\windows-health-check.ps1

The health check showed that IIS was not serving HTTP successfully.

## Impact

The local IIS website was unavailable while `W3SVC` was stopped.

Users attempting to reach the web page would not receive the expected IIS response.

## Investigation Commands

PowerShell commands used during troubleshooting:

Get-Service W3SVC

Get-Service W3SVC | Format-List *

Get-Service W3SVC,WAS

Get-EventLog -LogName System -Newest 20

Get-EventLog -LogName Application -Newest 20

Import-Module WebAdministration

Get-Website

Invoke-WebRequest http://localhost -UseBasicParsing

## Root Cause

The `W3SVC` service was stopped manually as part of the incident simulation.

## Resolution

The service was restarted using:

Start-Service W3SVC

Service status was validated using:

Get-Service W3SVC

HTTP response was validated using:

Invoke-WebRequest http://localhost -UseBasicParsing

## Validation

After restart, the IIS service returned to `Running` state and HTTP returned status code `200 OK`.

Additional validation was performed with:

C:\EnterpriseAdminFoundation\scripts\iis-validation.ps1

## Prevention

Before and after IIS maintenance, validate service status and HTTP response.

For production environments, monitoring should alert when `W3SVC` is stopped or HTTP checks fail.

## Lessons Learned

- Windows services can be checked quickly with `Get-Service`.
- IIS health should be validated with both service status and HTTP response.
- Event logs provide supporting evidence during incident investigation.
- A dedicated IIS validation script provides repeatable operational evidence.
