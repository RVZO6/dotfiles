#!/bin/bash

set -e  # Exit immediately if a command fails
set -u  # Treat unset variables as errors
set -o pipefail  # Prevent errors in a pipeline from being masked

REPO_URL="https://github.com/Axenide/Ax-Shell.git"
INSTALL_DIR="$HOME/.config/Ax-Shell"
PACKAGES=(
  brightnessctl
  cava
  cliphist
  fabric-cli-git
  gnome-bluetooth-3.0
  gobject-introspection
  gpu-screen-recorder
  hypridle
  hyprlock
  hyprpicker
  hyprshot
  hyprsunset
  imagemagick
  libnotify
  matugen-bin
  noto-fonts-emoji
  nvtop
  playerctl
  power-profiles-daemon
  python-fabric-git
  python-gobject
  python-ijson
  python-numpy
  python-pillow
  python-psutil
  python-pywayland
  python-requests
  python-setproctitle
  python-toml
  python-watchdog
  swappy
  swww
  tesseract
  tmux
  ttf-nerd-fonts-symbols-mono
  unzip
  upower
  uwsm
  vte3
  webp-pixbuf-loader
  wl-clipboard
)

# Prevent running as root
if [ "$(id -u)" -eq 0 ]; then
    echo "Please do not run this script as root."
    exit 1
fi

# Check if paru is installed
if ! command -v paru &>/dev/null; then
    echo "Paru is not installed. Please install it first."
    exit 1
fi

# Clone or update the repository
if [ -d "$INSTALL_DIR" ]; then
    echo "Updating Ax-Shell..."
    git -C "$INSTALL_DIR" pull
else
    echo "Cloning Ax-Shell..."
    git clone --depth=1 "$REPO_URL" "$INSTALL_DIR"
fi

# Install required packages using paru
echo "Installing required packages for Ax-Shell..."
paru -Syy --needed --devel --noconfirm "${PACKAGES[@]}" || true

echo "Installing gray-git..."
yes | paru -Syy --needed --devel --noconfirm gray-git || true

echo "Installing required fonts for Ax-Shell..."

FONT_URL="https://github.com/zed-industries/zed-fonts/releases/download/1.2.0/zed-sans-1.2.0.zip"
FONT_DIR="$HOME/.fonts/zed-sans"
TEMP_ZIP="/tmp/zed-sans-1.2.0.zip"

# Check if fonts are already installed
if [ ! -d "$FONT_DIR" ]; then
    echo "Downloading Zed Sans font..."
    curl -L -o "$TEMP_ZIP" "$FONT_URL"

    echo "Extracting font to $FONT_DIR..."
    mkdir -p "$FONT_DIR"
    unzip -o "$TEMP_ZIP" -d "$FONT_DIR"

    echo "Cleaning up..."
    rm "$TEMP_ZIP"
else
    echo "Zed Sans font is already installed. Skipping."
fi

# Copy local fonts if not already present
if [ ! -d "$HOME/.fonts/tabler-icons" ]; then
    echo "Copying local Tabler Icons font..."
    mkdir -p "$HOME/.fonts/tabler-icons"
    cp -r "$INSTALL_DIR/assets/fonts/"* "$HOME/.fonts"
else
    echo "Tabler Icons font is already installed. Skipping."
fi