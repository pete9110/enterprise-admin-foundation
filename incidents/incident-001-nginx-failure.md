# Incident 001 - NGINX Failure on rhel-app-01

## Summary

NGINX failed to start on rhel-app-01 due to an invalid directive added to the NGINX configuration file.

## Affected Server

rhel-app-01

## Detection

The issue was detected using the multi-server health check script:

./scripts/multi-server-health-check.sh

The health check showed that NGINX was not active on the application server.

## Impact

The web service on rhel-app-01 was unavailable.

The HTTP endpoint failed until the NGINX configuration was restored and the service was restarted.

## Investigation Commands

Commands used during troubleshooting:

ssh peter@192.168.195.130 "sudo systemctl status nginx --no-pager"

ssh peter@192.168.195.130 "sudo nginx -t"

ssh peter@192.168.195.130 "sudo journalctl -u nginx -n 30 --no-pager"

## Root Cause

The NGINX configuration file contained an invalid directive:

INVALID_DIRECTIVE;

This caused the NGINX configuration test to fail and prevented the service from starting.

## Resolution

The previous working NGINX configuration was restored from backup:

ssh peter@192.168.195.130 "sudo cp /etc/nginx/nginx.conf.bak /etc/nginx/nginx.conf"

The configuration was validated:

ssh peter@192.168.195.130 "sudo nginx -t"

NGINX was restarted:

ssh peter@192.168.195.130 "sudo systemctl restart nginx"

Service health was confirmed:

ssh peter@192.168.195.130 "systemctl is-active nginx"

HTTP response was confirmed:

curl http://192.168.195.130

## Validation

Post-fix validation was completed using:

./scripts/post-patch-validation.sh 192.168.195.130

./scripts/multi-server-health-check.sh

## Prevention

Before restarting NGINX after configuration changes, always run:

sudo nginx -t

Future automation should include a config validation step before restarting services.

## Lessons Learned

- Service health checks quickly identified that NGINX was down.
- journalctl and nginx -t helped identify the exact configuration issue.
- Keeping a backup of the configuration allowed fast recovery.
- Configuration validation should happen before service restart.
