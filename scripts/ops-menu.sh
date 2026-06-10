#!/bin/bash

APP_SERVER="RHEL_APP_IP"
PROJECT_DIR="$HOME/enterprise-admin-foundation"

cd "$PROJECT_DIR" || {
    echo "ERROR: Could not access project directory: $PROJECT_DIR"
    exit 1
}

while true; do
    clear
    echo "=========================================="
    echo " Enterprise Admin Operations Menu"
    echo "=========================================="
    echo "Project directory: $PROJECT_DIR"
    echo "App server: $APP_SERVER"
    echo
    echo "1) Run multi-server health check"
    echo "2) Run Linux patch report"
    echo "3) Run sudo audit report"
    echo "4) Run post-patch validation for localhost"
    echo "5) Run post-patch validation for app server"
    echo "6) Show latest reports"
    echo "7) Show Git status"
    echo "8) Exit"
    echo
    read -p "Choose an option [1-8]: " CHOICE

    case "$CHOICE" in
        1)
            echo
            echo "Running multi-server health check..."
            ./scripts/multi-server-health-check.sh
            echo
            read -p "Press Enter to return to menu..."
            ;;

        2)
            echo
            echo "Running Linux patch report..."
            ./scripts/patch-report.sh
            echo
            read -p "Press Enter to return to menu..."
            ;;

        3)
            echo
            echo "Running sudo audit report..."
            ./scripts/sudo-audit-check.sh
            echo
            read -p "Press Enter to return to menu..."
            ;;

        4)
            echo
            echo "Running post-patch validation for localhost..."
            ./scripts/post-patch-validation.sh localhost
            echo
            read -p "Press Enter to return to menu..."
            ;;

        5)
            echo
            echo "Running post-patch validation for app server: $APP_SERVER"
            ./scripts/post-patch-validation.sh "$APP_SERVER"
            echo
            read -p "Press Enter to return to menu..."
            ;;

        6)
            echo
            echo "Latest reports:"
            ls -lt reports | head -15
            echo
            read -p "Press Enter to return to menu..."
            ;;

        7)
            echo
            echo "Git status:"
            git status
            echo
            read -p "Press Enter to return to menu..."
            ;;

        8)
            echo
            echo "Exiting operations menu."
            exit 0
            ;;

        *)
            echo
            echo "Invalid option. Choose 1 through 8."
            sleep 2
            ;;
    esac
done
