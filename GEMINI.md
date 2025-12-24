# Termux Proot Mobile-Friendly Desktop Environment

## Project Overview

This project is a specification and implementation plan for a **mobile-friendly desktop environment** designed to run within **Arch Linux** or **Debian/Ubuntu** via **Termux proot** on Android devices.

The goal is to provide a "ready-to-use" environment optimized for touch interaction on small screens, featuring:

*   **Window Manager:** Openbox (lightweight, flexible)
*   **Panel:** Tint2 (vertical, left-aligned with large icons)
*   **Launcher:** Rofi (fullscreen, touch-friendly grid)
*   **Compositor:** Picom (transparency, vsync)
*   **On-screen Keyboard:** Onboard

## Architecture & Components

The environment is built from standard Linux components configured specifically for mobile constraints (high DPI, touch input, vertical orientation):

| Component | Choice | Reason |
| :--- | :--- | :--- |
| **WM** | `openbox` | Minimal resource usage, XML config allows easy scripting. |
| **Panel** | `tint2` | Vertical layout support, highly customizable styling. |
| **Launcher** | `rofi` | Fullscreen mode acts like an app drawer. |
| **Notifications** | `dunst` | Lightweight, customizable geometry/font size. |
| **Terminal** | `xfce4-terminal` | Good touch support, GUI preferences. |
| **File Manager** | `pcmanfm` / `thunar` | Standard lightweight file management. |

### Mobile Optimization Strategy
*   **High DPI Scaling:** Uses `.Xresources` (`Xft.dpi`), `GDK_SCALE`, and `QT_SCALE_FACTOR` to ensure readable text and usable UI elements.
*   **Touch Targets:** Configurations emphasize large icons (48px+) and large fonts (18pt+).
*   **Gestures:** Planned integration with `touchegg` or similar if supported.

## Directory Structure (Planned)

The project aims to achieve the following structure:

```text
termux-openbox-mobile/
├── install.sh                  # Main entry point for installation
├── packages.txt                # List of pacman packages to install
├── README.md                   # User documentation
├── configs/                    # Configuration files
│   ├── openbox/                # rc.xml, menu.xml, autostart
│   ├── tint2/                  # tint2rc
│   ├── rofi/                   # config.rasi, theme.rasi
│   ├── dunst/                  # dunstrc
│   ├── picom/                  # picom.conf
│   ├── gtk-2.0/                # gtkrc-2.0
│   ├── gtk-3.0/                # settings.ini
│   ├── fontconfig/             # fonts.conf
│   ├── onboard/                # Keyboard settings
│   └── Xresources              # DPI and system colors
├── scripts/                    # Helper scripts used by install.sh
│   ├── install-packages.sh
│   ├── deploy-configs.sh
│   ├── setup-env.sh
│   └── post-install.sh
└── assets/                     # Wallpapers and static resources
```

## Usage & Development

### Current Status
The project is currently in the **specification phase**. The primary reference file is `termux-openbox-mobile-spec.md`.

### Implementation Tasks
1.  **Scaffold Structure:** Create the directories and empty files as defined in the spec.
2.  **Generate Configs:** Populate config files with the "Mobile" settings (large fonts, vertical layouts).
3.  **Write Scripts:** Implement the `install.sh` and helper scripts to automate the setup process.
4.  **Testing:** Verify functionality in a fresh Termux Proot Arch Linux container.

### Building/Running (Future)
Once implemented, the setup will be initiated by running the main script inside the proot environment:

```bash
./install.sh
```
