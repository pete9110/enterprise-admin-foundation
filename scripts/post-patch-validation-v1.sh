#!/bin/bash

SERVER="$1"

if [ -z "$SERVER" ]; then
    echo "Usage: $0 <server>"
    echo "Example: $0 localhost"
    echo "Example: $0 192.168.56.11"
    exit 1
fi

echo "=========================================="
echo " Post-Patch Validation"
echo "=========================================="
echo "Target server: $SERVER"
echo "Validation time: $(date)"
echo

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
    echo "Uptime:"
    uptime

    echo
    echo "Firewalld:"
    systemctl is-active firewalld

    echo
    echo "SSHD:"
    systemctl is-active sshd

    echo
    echo "NGINX:"
    systemctl is-active nginx

    echo
    echo "HTTP test:"
    curl -s http://localhost

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
    echo "Uptime:"
    ssh peter@"$SERVER" "uptime"

    echo
    echo "Firewalld:"
    ssh peter@"$SERVER" "systemctl is-active firewalld"

    echo
    echo "SSHD:"
    ssh peter@"$SERVER" "systemctl is-active sshd"

    echo
    echo "NGINX:"
    ssh peter@"$SERVER" "systemctl is-active nginx"

    echo
    echo "HTTP test:"
    curl -s http://"$SERVER"
fi

echo
echo "Validation complete."
