# rhel-app-01 Build Notes

## Server Identity

Hostname: rhel-app-01  
IP Address: RHEL_APP_IP  
OS: Rocky Linux 9  
Role: Application/service server  

## Purpose

This server is part of the Enterprise Admin Foundation lab. It simulates a managed Linux application server administered from `rhel-admin-01`.

## Initial Configuration

Completed the following:

- Installed Rocky Linux 9 minimal.
- Configured hostname as `rhel-app-01`.
- Verified network connectivity.
- Patched the system using `dnf update`.
- Installed admin tools.
- Enabled and started SSH.
- Enabled and started firewalld.
- Installed and started NGINX.

## Services

### SSH

SSH is enabled for remote Linux administration.

Commands used:

sudo systemctl enable --now sshd
sudo systemctl status sshd --no-pager

### Firewalld

Firewalld is enabled for host-based firewall management.

Commands used:

sudo systemctl enable --now firewalld
sudo firewall-cmd --state

### NGINX

NGINX is installed as a sample application service.

Commands used:

sudo dnf install -y nginx
sudo systemctl enable --now nginx
sudo systemctl status nginx --no-pager

## Firewall Rules

HTTP traffic was allowed through firewalld.

Commands used:

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
sudo firewall-cmd --list-all

## Remote Administration

Configured SSH access from `rhel-admin-01` to `rhel-app-01`.

Commands used from `rhel-admin-01`:

ssh peter@RHEL_APP_IP
ssh-keygen
ssh-copy-id peter@RHEL_APP_IP

Validated remote command execution:

ssh peter@RHEL_APP_IP "hostnamectl --static"
ssh peter@RHEL_APP_IP "uptime"
ssh peter@RHEL_APP_IP "systemctl is-active nginx"

## Web Page Validation

Updated the default NGINX web page:

echo "Enterprise Admin Foundation - rhel-app-01" | sudo tee /usr/share/nginx/html/index.html

Validated locally:

curl http://localhost

Validated remotely from `rhel-admin-01`:

curl http://192.168.198.130
