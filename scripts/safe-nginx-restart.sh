#!/bin/bash

SERVER="$1"
REPORT_DIR="reports"
TIMESTAMP=$(date +"%Y-%m-%d-%H%M%S")

if [ -z "$SERVER" ]; then
    echo "Usage: $0 <server>"
    echo "Example: $0 localhost"
    echo "Example: $0 192.168.195.130"
    exit 1
fi

SAFE_SERVER_NAME=$(echo "$SERVER" | tr '.' '-')
REPORT_FILE="$REPORT_DIR/safe-nginx-change-$SAFE_SERVER_NAME-$TIMESTAMP.txt"
BACKUP_FILE="/etc/nginx/nginx.conf.backup-$TIMESTAMP"

mkdir -p "$REPORT_DIR"

{
echo "=========================================="
echo " Safe NGINX Change Report"
echo "=========================================="
echo "Target server: $SERVER"
echo "Run time: $(date)"
echo "Run by: $(whoami)"
echo "Source host: $(hostnamectl --static)"
echo

if [ "$SERVER" = "localhost" ]; then
    echo "Step 1: Confirming server hostname"
    hostnamectl --static

    echo
    echo "Step 2: Creating NGINX config backup"
    if sudo cp /etc/nginx/nginx.conf "$BACKUP_FILE"; then
        echo "Backup created: $BACKUP_FILE"
    else
        echo "ERROR: Backup failed."
        echo "NGINX will NOT be reloaded."
        exit 1
    fi

    echo
    echo "Step 3: Testing NGINX configuration"
    if sudo nginx -t; then
        echo "NGINX configuration test passed."
    else
        echo
        echo "ERROR: NGINX configuration test failed."
        echo "NGINX will NOT be reloaded."
        echo "Review the configuration before making changes."
        exit 1
    fi

    echo
    echo "Step 4: Reloading NGINX safely"
    if sudo systemctl reload nginx; then
        echo "NGINX reload completed."
    else
        echo "ERROR: NGINX reload failed."
        exit 1
    fi

    echo
    echo "Step 5: Validating NGINX service status"
    systemctl is-active nginx

    echo
    echo "Step 6: HTTP test"
    curl -s http://localhost

else
    echo "Step 1: Confirming server hostname"
    ssh peter@"$SERVER" "hostnamectl --static"

    echo
    echo "Step 2: Creating NGINX config backup"
    if ssh -t peter@"$SERVER" "sudo cp /etc/nginx/nginx.conf '$BACKUP_FILE'"; then
        echo "Backup created: $BACKUP_FILE"
    else
        echo "ERROR: Backup failed."
        echo "NGINX will NOT be reloaded."
        exit 1
    fi

    echo
    echo "Step 3: Testing NGINX configuration"
    if ssh -t peter@"$SERVER" "sudo nginx -t"; then
        echo "NGINX configuration test passed."
    else
        echo
        echo "ERROR: NGINX configuration test failed."
        echo "NGINX will NOT be reloaded."
        echo "Review the configuration before making changes."
        exit 1
    fi

    echo
    echo "Step 4: Reloading NGINX safely"
    if ssh -t peter@"$SERVER" "sudo systemctl reload nginx"; then
        echo "NGINX reload completed."
    else
        echo "ERROR: NGINX reload failed."
        exit 1
    fi

    echo
    echo "Step 5: Validating NGINX service status"
    ssh peter@"$SERVER" "systemctl is-active nginx"

    echo
    echo "Step 6: HTTP test"
    curl -s http://"$SERVER"
fi

echo
echo "Safe NGINX change complete."
echo "Report saved to: $REPORT_FILE"

} | tee "$REPORT_FILE"
