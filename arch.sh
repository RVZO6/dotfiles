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

echo "Detecting environment..."
if systemd-detect-virt &>/dev/null; then
    VIRT_TYPE=$(systemd-detect-virt)
    echo "Running in a virtual machine: ${VIRT_TYPE}. Installing VM-specific drivers..."
    case "${VIRT_TYPE}" in
        qemu|kvm)
            sudo pacman -S --needed --noconfirm qemu-guest-agent spice-vdagent xf86-video-qxl
            ;;
        vmware)
            sudo pacman -S --needed --noconfirm open-vm-tools
            sudo systemctl enable vmtoolsd
            ;;
        oracle|vbox)
            sudo pacman -S --needed --noconfirm virtualbox-guest-utils
            sudo systemctl enable vboxservice
            ;;
        *)
            echo "Unknown VM type. Installing generic video drivers..."
            sudo pacman -S --needed --noconfirm mesa
            ;;
    esac
else
    echo "Running on physical hardware. Detecting graphics card..."
    if lspci | grep -E "VGA|3D" | grep -iq "NVIDIA"; then
        echo "NVIDIA card detected. Installing NVIDIA drivers..."
        sudo pacman -S --needed --noconfirm nvidia-open nvidia-utils

        echo "Modifying mkinitcpio for NVIDIA..."
        sudo cp /etc/mkinitcpio.conf /etc/mkinitcpio.conf.backup
        sudo sed -i 's/^MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
        sudo mkinitcpio -P
    elif lspci | grep -E "VGA|3D" | grep -iq "AMD"; then
        echo "AMD card detected. Installing AMD drivers..."
        sudo pacman -S --needed --noconfirm mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon
    elif lspci | grep -E "VGA|3D" | grep -iq "Intel"; then
        echo "Intel card detected. Installing Intel drivers..."
        sudo pacman -S --needed --noconfirm mesa lib32-mesa xf86-video-intel vulkan-intel lib32-vulkan-intel
    else
        echo "No NVIDIA, AMD, or Intel graphics card detected. Installing generic video drivers..."
        sudo pacman -S --needed --noconfirm mesa
    fi
fi

echo "Installing Hyprland..."
sudo pacman -S --needed --noconfirm hyprland

echo "Installing stow..."
sudo pacman -S --needed --noconfirm stow

echo "Stowing dotfiles..."
mkdir -p ~/.config/hypr
stow -d . -t ~ common
for pkg in linux/*/; do
    stow -d linux -t ~ "$(basename "$pkg")"
done

echo "installing ax-shell"
./ax-shell.sh

echo "Done. Reboot required."
