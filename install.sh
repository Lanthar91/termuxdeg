#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Termux Openbox Mobile Setup ==="

# 1. Update system
echo "Updating system..."
pacman -Syu --noconfirm

# 2. Install packages
echo "Installing packages..."
source "$SCRIPT_DIR/scripts/install-packages.sh"

# 3. Deploy configurations
echo "Deploying configurations..."
source "$SCRIPT_DIR/scripts/deploy-configs.sh"

# 4. Setup environment
echo "Setting up environment..."
source "$SCRIPT_DIR/scripts/setup-env.sh"

# 5. Final steps
echo "Running post-install tasks..."
source "$SCRIPT_DIR/scripts/post-install.sh"

echo "=== Installation Complete ==="
echo "Launch with startx or connect via Termux-X11/VNC."
