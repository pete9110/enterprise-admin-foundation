#!/bin/bash

INVENTORY_FILE="inventory/servers.txt"

echo "=========================================="
echo " Enterprise Multi-Server Health Check"
echo "=========================================="
echo

if [ ! -f "$INVENTORY_FILE" ]; then
    echo "ERROR: Inventory file not found: $INVENTORY_FILE"
    exit 1
fi

for SERVER in $(cat "$INVENTORY_FILE"); do
    echo "------------------------------------------"
    echo "Checking server: $SERVER"
    echo "------------------------------------------"

    if [ "$SERVER" = "localhost" ]; then
        echo "Hostname:"
        hostnamectl --static

        echo
        echo "Uptime:"
        uptime

        echo
        echo "Disk usage:"
        df -h /

        echo
        echo "Memory usage:"
        free -h

        echo
        echo "Firewall state:"
        sudo firewall-cmd --state

        echo
        echo "SSHD status:"
        systemctl is-active sshd

        echo
        echo "NGINX status:"
        systemctl is-active nginx

    else
        echo "Hostname:"
        ssh peter@"$SERVER" "hostnamectl --static"

        echo
        echo "Uptime:"
        ssh peter@"$SERVER" "uptime"

        echo
        echo "Disk usage:"
        ssh peter@"$SERVER" "df -h /"

        echo
        echo "Memory usage:"
        ssh peter@"$SERVER" "free -h"

        echo
        echo "Firewall state:"
        ssh peter@"$SERVER" "sudo firewall-cmd --state"

        echo
        echo "SSHD status:"
        ssh peter@"$SERVER" "systemctl is-active sshd"

        echo
        echo "NGINX status:"
        ssh peter@"$SERVER" "systemctl is-active nginx"
    fi

    echo
done

echo "Health check complete."
