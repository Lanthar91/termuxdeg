#!/bin/bash
# scripts/post-install.sh

# Generate XDG user directories (Desktop, Downloads, etc.)
xdg-user-dirs-update

# Ensure autostart script is executable
if [ -f "$HOME/.config/openbox/autostart" ]; then
    chmod +x "$HOME/.config/openbox/autostart"
fi

# Set default terminal for xdg
# xdg-settings set default-url-scheme-handler terminal xfce4-terminal.desktop

echo "Post-installation tasks completed."
