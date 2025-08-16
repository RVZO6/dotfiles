#!/bin/bash

set -e

echo "Updating system..."
sudo pacman -Syu

echo "Installing development tools..."
sudo pacman -S --needed --noconfirm base-devel

echo "Installing Chaotic AUR..."
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.xz'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.xz'

echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf

sudo pacman -Sy

echo "Installing paru..."
sudo pacman -S --needed --noconfirm paru

echo "Installing NVIDIA drivers..."
sudo pacman -S --needed --noconfirm nvidia-open nvidia-utils

echo "Installing stow..."
sudo pacman -S --needed --noconfirm stow

echo "Modifying mkinitcpio..."
sudo cp /etc/mkinitcpio.conf /etc/mkinitcpio.conf.backup
sudo sed -i 's/^MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
sudo mkinitcpio -P

echo "Stowing dotfiles..."
stow -d . -t ~ common
stow -d . -t ~ linux

echo "installing ax-shell"
./ax-shell.sh

echo "Done. Reboot required."
