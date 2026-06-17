# CI Validation Workflow

## Purpose

This document records the CI validation workflow for the Enterprise Admin Foundation repository.

The goal is to simulate enterprise change validation by automatically checking repository structure, documentation, inventory files, and Bash script syntax when changes are pushed.

## CI Platform

GitHub Actions

## Workflow File

.github/workflows/admin-foundation-ci.yml

## Trigger

The workflow runs on:

- Pushes to `main` or `master`
- Pull requests targeting `main` or `master`

## Validation Checks

The pipeline checks:

- Required directories exist
- Required documentation files exist
- Required Bash scripts exist
- Bash scripts pass syntax validation using `bash -n`
- Inventory file exists and is not empty
- Markdown documentation files are not empty

## Why Bash Syntax Only?

The CI runner cannot reach the private lab VMs.

For that reason, the pipeline checks syntax but does not execute scripts that require access to:

- rhel-admin-01
- rhel-app-01
- win-admin-01

## Operational Value

This simulates enterprise CI validation for infrastructure scripts and operational documentation.

It helps prevent broken scripts, missing files, and incomplete documentation from being merged into the main branch.

## Change Control Practice

Future changes to scripts should be made on feature branches and validated by CI before merging.

This provides a repeatable pattern for infrastructure automation changes.
