# Controlled Linux Patching Workflow

## Purpose

This document describes a controlled patching workflow for Linux servers in the Enterprise Admin Foundation lab.

The goal is to simulate enterprise maintenance-window patching where servers are patched in a controlled order and validated after updates.

## Patch Order

Servers are patched in this order:

1. `rhel-app-01`
2. `rhel-admin-01`

The application server is patched first to validate the update process before patching the administration server.

## Pre-Patch Validation

Before patching, run:

./scripts/post-patch-validation.sh localhost
./scripts/post-patch-validation.sh 192,168,195,130

Validation checks include:

- Hostname
- OS version
- Kernel version
- Uptime
- Firewalld status
- SSHD status
- NGINX status
- HTTP response

## Patch Command

For a remote server:

ssh peter@RHEL_APP_IP "sudo dnf update -y"

For the local server:

sudo dnf update -y

## Reboot Check

Install `dnf-utils` if needed:

sudo dnf install -y dnf-utils

Check whether a reboot is required:

needs-restarting -r

For a remote server:

ssh peter@RHEL_APP_IP "needs-restarting -r"

## Reboot Process

If a reboot is required:

Remote server:

ssh peter@RHEL_APP_IP "sudo reboot"

Local server:

sudo reboot

## Post-Patch Validation

After reboot or after patching completes, run:

./scripts/post-patch-validation.sh localhost
./scripts/post-patch-validation.sh RHEL_APP_IP

## Operational Value

This workflow simulates enterprise Linux patching by combining:

- Pre-checks
- Controlled server order
- Package updates
- Reboot decision-making
- Service validation
- Documentation
