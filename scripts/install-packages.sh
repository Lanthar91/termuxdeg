#!/bin/bash
# scripts/install-packages.sh

PACKAGES_FILE="$SCRIPT_DIR/packages.txt"

if [ -f "$PACKAGES_FILE" ]; then
    # Filter out comments and empty lines
    PKGS=$(grep -v '^#' "$PACKAGES_FILE" | xargs)
    pacman -S --needed --noconfirm $PKGS
else
    echo "Error: packages.txt not found!"
    exit 1
fi
