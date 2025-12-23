#!/bin/bash
# scripts/setup-env.sh

PROFILE_FILE="$HOME/.profile"

cat <<EOF >> "$PROFILE_FILE"

# Mobile UI Scaling
export XFT_DPI=192
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_SCALE_FACTOR=2

# Path to local scripts if any
export PATH="\$HOME/.local/bin:\$PATH"
EOF

# Update Xresources immediately if possible
if command -v xrdb >/dev/null 2>&1 && [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

echo "Environment variables added to .profile"
