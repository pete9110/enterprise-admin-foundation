# Phase 1A Linux Admin Foundation Summary

## Overview

Phase 1A built a two-server Linux administration lab using Rocky Linux 9.

The lab simulates foundational enterprise Linux administration for infrastructure, DevOps, and SRE-style operations.

## Servers Built

- rhel-admin-01
- rhel-app-01

## Skills Practiced

- Linux installation and initial configuration
- SSH remote administration
- User and group management
- Sudo access control
- Sudo audit logging
- Firewalld management
- NGINX service management
- Systemd service validation
- Patch reporting
- Controlled patching workflow
- Post-patch validation
- Health check automation
- Timestamped operational reports
- Incident triage
- Log review using journalctl
- Safe service restart workflow
- Git branch, commit, merge, and tag workflow

## Key Scripts

- scripts/server-health-check.sh
- scripts/multi-server-health-check.sh
- scripts/patch-report.sh
- scripts/post-patch-validation.sh
- scripts/sudo-audit-check.sh
- scripts/ops-menu.sh
- scripts/safe-nginx-restart.sh

## Key Directories

- docs/
- scripts/
- reports/
- inventory/
- incidents/

## Operational Outcome

The lab now functions as a small Linux operations toolkit.

From `rhel-admin-01`, an administrator can check server health, produce reports, validate patching, review sudo audit evidence, safely restart NGINX, and document operational incidents.

## Enterprise Relevance

This phase supports foundational enterprise administration skills needed for infrastructure, DevOps, platform engineering, and systems operations roles.

The work demonstrates Linux server buildout, operational scripting, access hardening, patch validation, service recovery, and Git-based documentation.

## Next Phase

Phase 1B adds Windows Server administration.

The Windows server is:

- win-admin-01

Focus areas:

- Windows Server installation
- RDP access
- Local users and groups
- Windows Firewall
- PowerShell administration
- IIS service management
- Event Viewer logs
- Windows patching workflow
- Cross-platform documentation
