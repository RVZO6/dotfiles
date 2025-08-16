#!/bin/bash

set -e

echo "Updating system..."
sudo pacman -Syu

echo "Installing development tools..."
sudo pacman -S --needed --noconfirm base-devel

echo "Installing Chaotic AUR..."
sudo pacman-key --recv-key 3056513887B78AEB
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf >/dev/null
echo "Installing paru..."
sudo pacman -Sy --needed --noconfirm paru

sudo pacman -Sy

sudo pacman -S --needed --noconfirm paru

echo "Installing NVIDIA drivers..."
sudo pacman -S --needed --noconfirm nvidia-open nvidia-utils

echo "Installing Hyprland..."
sudo pacman -S --needed --noconfirm hyprland

echo "Installing stow..."
sudo pacman -S --needed --noconfirm stow

echo "Modifying mkinitcpio..."
sudo cp /etc/mkinitcpio.conf /etc/mkinitcpio.conf.backup
sudo sed -i 's/^MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
sudo mkinitcpio -P

echo "Stowing dotfiles..."
mkdir -p ~/.config/hypr
stow -d . -t ~ common
for pkg in linux/*/; do
    stow -d linux -t ~ "$(basename "$pkg")"
done

echo "installing ax-shell"
./ax-shell.sh

echo "Done. Reboot required."
