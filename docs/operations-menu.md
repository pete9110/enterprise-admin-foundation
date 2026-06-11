# Enterprise Admin Operations Menu

## Purpose

The `ops-menu.sh` script provides a single menu-driven interface for common Linux administration checks in the Enterprise Admin Foundation lab.

Instead of manually remembering each script name, the administrator can run one command and choose the desired operation.

## Script Location

scripts/ops-menu.sh

## Command

Run from the project root:

./scripts/ops-menu.sh

## Menu Options

The menu supports:

1. Multi-server health check
2. Linux patch report
3. Sudo audit report
4. Post-patch validation for localhost
5. Post-patch validation for the application server
6. Show latest reports
7. Show Git status
8. Exit

## Scripts Called by the Menu

The operations menu calls these scripts:

- scripts/multi-server-health-check.sh
- scripts/patch-report.sh
- scripts/sudo-audit-check.sh
- scripts/post-patch-validation.sh

## Reports

Reports are saved under:

reports/

Examples:

- health-report-YYYY-MM-DD-HHMMSS.txt
- patch-report-YYYY-MM-DD-HHMMSS.txt
- sudo-audit-report-YYYY-MM-DD-HHMMSS.txt
- post-patch-validation-server-YYYY-MM-DD-HHMMSS.txt

## Operational Value

This simulates an enterprise operations wrapper script.

It helps standardize recurring administration tasks and reduces the chance of running the wrong command during troubleshooting, patching, or audit preparation.

## Change Control Note

This operations menu should be updated through a Git branch workflow.

Recommended workflow:

1. Create a feature branch.
2. Make the script or documentation change.
3. Review the diff.
4. Commit the change.
5. Merge the branch back into the main branch.
6. Tag important stable checkpoints.

This simulates enterprise change control and helps prevent untracked administrative changes.
