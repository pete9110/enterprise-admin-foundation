# Safe NGINX Restart Workflow

## Purpose

This document records the safe NGINX restart workflow used in the Enterprise Admin Foundation lab.

The goal is to prevent service outages caused by restarting NGINX with an invalid configuration.

## Script Location

scripts/safe-nginx-restart.sh

## Command

Run from the project root:

./scripts/safe-nginx-restart.sh RHEL_APP_IP

## Workflow

The script performs these steps:

1. Confirms the target server hostname.
2. Creates a timestamped backup of `/etc/nginx/nginx.conf`.
3. Runs `sudo nginx -t` to validate the configuration.
4. Stops the workflow if the configuration test fails.
5. Restarts NGINX only if the configuration is valid.
6. Confirms NGINX service status.
7. Tests the HTTP response.
8. Saves a timestamped report under `reports/`.

## Why This Matters

A common production outage pattern is restarting a service after a bad configuration change.

This workflow prevents that by validating configuration syntax before restarting the service.

## Validation Command

NGINX configuration is validated using:

sudo nginx -t

## Operational Value

This simulates enterprise change safety by adding a validation gate before a service restart.

The same pattern can be used for other services such as Apache, HAProxy, SSHD, and application services.
