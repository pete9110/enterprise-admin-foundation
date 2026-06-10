# Sudo Hardening and Audit Logging

## Purpose

This document records sudo hardening performed on the Enterprise Admin Foundation Linux servers.

The goal is to simulate enterprise privilege management by granting administrative access through a controlled group and recording sudo activity for audit evidence.

## Servers

- rhel-admin-01
- rhel-app-01

## Sudo Policy Location

A sudoers drop-in file was created:

/etc/sudoers.d/linuxadmins

Using a drop-in file is cleaner than repeatedly editing the main `/etc/sudoers` file.

## Group-Based Sudo Access

The following policy grants sudo access to members of the `linuxadmins` group:

%linuxadmins ALL=(ALL) ALL

The `%` symbol means `linuxadmins` is a group.

## Sudo Logging

Sudo logging was configured with:

Defaults logfile="/var/log/sudo.log"
Defaults log_input,log_output
Defaults iolog_dir="/var/log/sudo-io"

## Permissions

The sudoers drop-in file must have secure permissions:

sudo chmod 440 /etc/sudoers.d/linuxadmins

The sudo I/O log directory was created with restricted permissions:

sudo mkdir -p /var/log/sudo-io
sudo chmod 700 /var/log/sudo-io

The sudo log file was created with restricted permissions:

sudo touch /var/log/sudo.log
sudo chmod 600 /var/log/sudo.log

## Validation

Sudoers syntax was validated using:

sudo visudo -cf /etc/sudoers

Sudo logging was tested using:

sudo whoami
sudo tail -5 /var/log/sudo.log

## Audit Script

A script was created to collect sudo configuration and recent sudo log evidence:

scripts/sudo-audit-check.sh

The script creates timestamped reports under:

reports/

## Operational Value

This improves enterprise accountability by ensuring administrators use named accounts and sudo escalation instead of shared root access.

It also provides evidence of privileged command usage.
