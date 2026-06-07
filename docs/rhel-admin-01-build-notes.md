# rhel-admin-01 Build Notes

## Server Identity

Hostname: rhel-admin-01  
OS: Rocky Linux 9.8  
Role: Linux administration server  

## Purpose

This server is part of the Enterprise Admin Foundation lab. It is used to practice RHEL-compatible Linux administration, user/group management, firewall configuration, service management, logging, Bash scripting, and Git-based documentation.

## Initial Configuration

Completed the following:

- Installed Rocky Linux 9 minimal.
- Configured hostname.
- Verified network connectivity.
- Patched the system with `dnf update`.
- Installed admin tools.
- Enabled and started SSH.
- Enabled and started firewalld.
- Installed and started NGINX.

## Groups Created

```bash
sudo groupadd linuxadmins
sudo groupadd appadmins
sudo groupadd auditors

Groups:

- `linuxadmins` — Linux administrator group.
- `appadmins` — Application administration group.
- `auditors` — audit/read-only style group.

## Users Created

Commands used:

sudo useradd -m -G linuxadmins peteradmin
sudo useradd -m -G appadmins appsvc
sudo useradd -m -G auditors audituser

Users:

- `peteradmin` — admin user.
- `appsvc` — application service account.
- `audituser` — audit user.

## Sudo Access

Configured sudo access for the `linuxadmins` group using `visudo`.

Sudoers entry:

%linuxadmins ALL=(ALL) ALL

This allows members of the `linuxadmins` group to run administrative commands using `sudo`.

## Services

### SSH

Commands used:

sudo systemctl enable --now sshd
sudo systemctl status sshd --no-pager

SSH is enabled for remote administration.

### Firewalld

Commands used:

sudo systemctl enable --now firewalld
sudo firewall-cmd --state

Firewalld is enabled for host-based firewall management.

### NGINX

Commands used:

sudo dnf install -y nginx
sudo systemctl enable --now nginx
sudo systemctl status nginx --no-pager

NGINX is installed as a sample enterprise service.

## Firewall Rules

Allowed HTTP traffic:

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
sudo firewall-cmd --list-all

## Validation Commands

Commands used to validate the server:

hostnamectl
ip addr
ping -c 4 google.com
sudo firewall-cmd --state
sudo systemctl status sshd --no-pager
sudo systemctl status nginx --no-pager
curl http://localhost

## Automation

Created the health check script:

scripts/server-health-check.sh

Purpose:

- Check hostname.
- Check uptime.
- Check kernel version.
- Check IP addresses.
- Check disk usage.
- Check memory usage.
- Check firewall state.
- Check SSH status.
- Check NGINX status.
- Check recent failed login attempts.
