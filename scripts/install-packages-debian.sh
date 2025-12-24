#!/bin/bash
# scripts/install-packages-debian.sh

PACKAGES_FILE="$SCRIPT_DIR/packages-debian.txt"

if [ -f "$PACKAGES_FILE" ]; then
    # Filter out comments and empty lines
    PKGS=$(grep -v '^#' "$PACKAGES_FILE" | xargs)
    
    # Update package list
    echo "Updating apt cache..."
    apt update
    
    # Install packages
    echo "Installing packages..."
    apt install -y $PKGS
else
    echo "Error: packages-debian.txt not found!"
    exit 1
fi
