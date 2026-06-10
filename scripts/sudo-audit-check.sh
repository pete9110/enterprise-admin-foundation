#!/bin/bash

INVENTORY_FILE="inventory/servers.txt"
REPORT_DIR="reports"
TIMESTAMP=$(date +"%Y-%m-%d-%H%M%S")
REPORT_FILE="$REPORT_DIR/sudo-audit-report-$TIMESTAMP.txt"

mkdir -p "$REPORT_DIR"

{
echo "=========================================="
echo " Enterprise Sudo Audit Report"
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
    echo "Checking sudo configuration on: $SERVER"
    echo "------------------------------------------"

    if [ "$SERVER" = "localhost" ]; then
        echo "Hostname:"
        hostnamectl --static

        echo
        echo "Sudo policy file:"
        sudo ls -l /etc/sudoers.d/linuxadmins

        echo
        echo "Sudo policy content:"
        sudo cat /etc/sudoers.d/linuxadmins

        echo
        echo "Sudoers syntax validation:"
        sudo visudo -cf /etc/sudoers

        echo
        echo "Recent sudo log entries:"
        sudo tail -10 /var/log/sudo.log

    else
        ssh -t peter@"$SERVER" "
echo 'Hostname:'
hostnamectl --static

echo
echo 'Sudo policy file:'
sudo ls -l /etc/sudoers.d/linuxadmins

echo
echo 'Sudo policy content:'
sudo cat /etc/sudoers.d/linuxadmins

echo
echo 'Sudoers syntax validation:'
sudo visudo -cf /etc/sudoers

echo
echo 'Recent sudo log entries:'
sudo tail -10 /var/log/sudo.log
"
    fi

    echo
done

echo "Sudo audit report complete."
echo "Report saved to: $REPORT_FILE"

} | tee "$REPORT_FILE"
