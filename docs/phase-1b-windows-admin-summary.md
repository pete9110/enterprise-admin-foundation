# Phase 1B Windows Admin Foundation Summary

## Overview

Phase 1B added Windows Server administration to the Enterprise Admin Foundation lab.

The lab now supports cross-platform Linux and Windows server administration practice.

## Server Built

- win-admin-01

## Skills Practiced

- Windows Server 2022 installation
- Server rename and initial configuration
- RDP enablement
- Windows Firewall rule management
- Local user and group management
- IIS installation and validation
- PowerShell scripting
- Windows health reporting
- Windows patch reporting
- IIS incident triage
- Event Viewer log review
- Windows operations menu creation
- Git-based documentation

## Windows Scripts

Stored on `win-admin-01`:

- C:\EnterpriseAdminFoundation\scripts\windows-health-check.ps1
- C:\EnterpriseAdminFoundation\scripts\windows-patch-report.ps1
- C:\EnterpriseAdminFoundation\scripts\iis-validation.ps1
- C:\EnterpriseAdminFoundation\scripts\windows-ops-menu.ps1

## Windows Reports

Stored on `win-admin-01`:

- C:\EnterpriseAdminFoundation\reports\

Report types include:

- Windows health reports
- Windows patch reports
- IIS validation reports

## Linux Repository Documentation

Windows-related documentation is stored in the main Git repo on `rhel-admin-01` under:

- docs/
- incidents/

## Operational Outcome

The lab now includes Linux and Windows administrative workflows.

An administrator can perform Linux health checks, patch reports, sudo audits, NGINX validation, Windows health checks, Windows patch reports, IIS validation, and incident documentation.

## Next Phase

The next phase can move into GitLab CI basics and automation.

Potential next tasks:

- Add GitLab/GitHub CI pipeline linting for shell scripts
- Add PowerShell script documentation
- Add Ansible for Linux automation
- Add Windows remote management using PowerShell Remoting
- Build a combined cross-platform operations runbook
