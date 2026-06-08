#!/bin/bash

INVENTORY_FILE="inventory/servers.txt"
REPORT_DIR="reports"
TIMESTAMP=$(date +"%Y-%m-%d-%H%M%S")
REPORT_FILE="$REPORT_DIR/patch-report-$TIMESTAMP.txt"

mkdir -p "$REPORT_DIR"

{
echo "=========================================="
echo " Enterprise Linux Patch Report"
echo "=========================================="
echo "Report generated: $(date)"
echo "Run by: $(whoami)"
echo "Source host: $(hostnamectl --static)"
echo

if [ ! -f "$INVENTORY_FILE" ]; then
    echo "ERROR: Inventory file not found: $INVENTORY_FILE"
    exit 1
fi

for SERVER in $(cat "$INVENTORY_FILE"); do
    echo "------------------------------------------"
    echo "Checking available updates on: $SERVER"
    echo "------------------------------------------"

    if [ "$SERVER" = "localhost" ]; then
        echo "Hostname:"
        hostnamectl --static

        echo
        echo "OS version:"
        cat /etc/redhat-release

        echo
        echo "Kernel:"
        uname -r

        echo
        echo "Available package updates:"
        sudo dnf check-update

        echo
        echo "DNF update check exit code: $?"

    else
        echo "Hostname:"
        ssh peter@"$SERVER" "hostnamectl --static"

        echo
        echo "OS version:"
        ssh peter@"$SERVER" "cat /etc/redhat-release"

        echo
        echo "Kernel:"
        ssh peter@"$SERVER" "uname -r"

        echo
        echo "Available package updates:"
        ssh -t peter@"$SERVER" "sudo dnf check-update"

        echo
        echo "Remote update check completed."
    fi

    echo
done

echo "Patch report complete."
echo "Report saved to: $REPORT_FILE"

} | tee "$REPORT_FILE"
