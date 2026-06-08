# Linux Patch Report Script

## Purpose

The `patch-report.sh` script checks available package updates across Linux servers listed in the inventory file.

This simulates pre-maintenance patch planning in an enterprise environment.

## Inventory File

The script reads servers from:

inventory/servers.txt

Example:

localhost
192.168.56.11

## Script Location

scripts/patch-report.sh

## Report Location

Patch reports are saved under:

reports/

Example report name:

patch-report-2026-06-08-085500.txt

## Checks Performed

For each server, the script records:

- Hostname
- OS version
- Kernel version
- Available package updates

## Main Command Used

dnf check-update

## DNF Exit Codes

`dnf check-update` may return different exit codes:

- `0` means no updates are available.
- `100` means updates are available.
- `1` means an error occurred.

## Operational Value

This script helps an administrator review patch status before performing system updates during a maintenance window.
