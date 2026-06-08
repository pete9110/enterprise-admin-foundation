# Timestamped Health Reports

## Purpose

The multi-server health check script was upgraded to create timestamped report files under the `reports/` directory.

This provides a basic audit trail for server health checks and can be used for troubleshooting, maintenance validation, and operational documentation.

## Report Directory

Reports are saved in:

reports/

## Report Naming Format

Example:

health-report-2026-06-08-153022.txt

The filename includes:

- Year
- Month
- Day
- Hour
- Minute
- Second

## Command Used

Run from the project root:

./scripts/multi-server-health-check.sh

## Key Script Logic

The script creates a timestamp using:

TIMESTAMP=$(date +"%Y-%m-%d-%H%M%S")

The script writes output to:

REPORT_FILE="$REPORT_DIR/health-report-$TIMESTAMP.txt"

The script uses `tee` so output appears on screen and is saved to a file:

} | tee "$REPORT_FILE"

## Operational Value

This simulates enterprise operational reporting by keeping a history of server health checks.
