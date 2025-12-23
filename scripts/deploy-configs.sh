#!/bin/bash
# scripts/deploy-configs.sh

CONFIG_SRC="$SCRIPT_DIR/configs"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$XDG_CONFIG_HOME"

# List of configs to deploy to ~/.config/
configs=("openbox" "tint2" "rofi" "dunst" "picom" "gtk-3.0" "fontconfig" "onboard")

for cfg in "${configs[@]}"; do
    if [ -d "$CONFIG_SRC/$cfg" ]; then
        echo "Deploying $cfg config..."
        rm -rf "$XDG_CONFIG_HOME/$cfg"
        cp -r "$CONFIG_SRC/$cfg" "$XDG_CONFIG_HOME/"
    fi
done

# GTK 2.0 and Xresources go to home root
[ -f "$CONFIG_SRC/gtk-2.0/gtkrc-2.0" ] && cp "$CONFIG_SRC/gtk-2.0/gtkrc-2.0" "$HOME/.gtkrc-2.0"
[ -f "$CONFIG_SRC/Xresources" ] && cp "$CONFIG_SRC/Xresources" "$HOME/.Xresources"

echo "Configurations deployed."
