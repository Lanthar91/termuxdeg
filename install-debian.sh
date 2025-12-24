#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Termux Openbox Mobile Setup (Debian) ==="

# 1. Install packages (Debian specific)
echo "Installing packages..."
source "$SCRIPT_DIR/scripts/install-packages-debian.sh"

# 2. Deploy configurations (Shared)
echo "Deploying configurations..."
source "$SCRIPT_DIR/scripts/deploy-configs.sh"

# 3. Setup environment (Shared)
echo "Setting up environment..."
source "$SCRIPT_DIR/scripts/setup-env.sh"

# 4. Final steps (Shared)
echo "Running post-install tasks..."
source "$SCRIPT_DIR/scripts/post-install.sh"

echo "=== Installation Complete ==="
echo "Launch with startx or connect via Termux-X11/VNC."
