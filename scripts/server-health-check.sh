#!/bin/bash

echo "======================================"
echo " Enterprise Server Health Check"
echo "======================================"
echo

echo "Hostname:"
hostnamectl --static
echo

echo "Current user:"
whoami
echo

echo "System uptime:"
uptime
echo

echo "Kernel version:"
uname -r
echo

echo "IP addresses:"
ip -br addr
echo

echo "Disk usage:"
df -h
echo

echo "Memory usage:"
free -h
echo

echo "Firewall state:"
sudo firewall-cmd --state
echo

echo "SSH service status:"
systemctl is-active sshd
systemctl is-enabled sshd
echo

echo "NGINX service status:"
systemctl is-active nginx
systemctl is-enabled nginx
echo

echo "Recent failed login attempts:"
sudo journalctl | grep "Failed password" | tail -5
echo

echo "Health check complete."
