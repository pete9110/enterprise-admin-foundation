

# SSH Hardening

## Purpose

This document records SSH hardening performed on the Enterprise Admin Foundation Linux servers.

The goal is to reduce risky remote access patterns and simulate baseline enterprise Linux hardening.

## Servers

- rhel-admin-01
- rhel-app-01

## Change Implemented

Disabled direct root SSH login.

Configuration file:

/etc/ssh/sshd_config

Setting applied:

PermitRootLogin no

## Backup Created

Before editing SSH configuration, a backup was created:

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

## Validation

SSH configuration syntax was validated before restarting the service:

sudo sshd -t

The SSH service was restarted:

sudo systemctl restart sshd

Service status was checked:

sudo systemctl status sshd --no-pager

## Access Validation

Normal user SSH login was validated using the `peter` account.

Root SSH login was blocked after the change.

## Operational Value

Disabling direct root SSH login improves accountability because administrators must log in using named user accounts and escalate privileges with `sudo`.

This creates better auditability than allowing direct remote root access.
