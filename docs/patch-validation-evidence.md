# Patch Validation Evidence

## Purpose

This document explains how post-patch validation evidence is generated for the Enterprise Admin Foundation lab.

The goal is to simulate enterprise patch validation and audit evidence after maintenance activity.

## Script Location

scripts/post-patch-validation.sh

## Report Location

reports/

## Report Naming Format

For localhost:

post-patch-validation-localhost-YYYY-MM-DD-HHMMSS.txt

For a remote server:

post-patch-validation-192-168-56-11-YYYY-MM-DD-HHMMSS.txt

## Validation Checks

The script records:

- Target server
- Validation time
- User running the validation
- Source host
- Hostname
- OS version
- Kernel version
- Uptime
- Recent DNF history
- Firewalld status
- SSHD status
- NGINX status
- HTTP response

## Commands

Validate local server:

./scripts/post-patch-validation.sh localhost

Validate remote application server:

./scripts/post-patch-validation.sh 192.168.195.130

## Operational Value

These reports provide evidence that systems were checked after patching and that core services remained healthy.
