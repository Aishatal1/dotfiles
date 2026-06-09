#!/bin/bash
# Dotfiles installer for Hyprland setup

echo "=========================================="
echo "  Hyprland Dotfiles Installer"
echo "=========================================="

# Update system
echo "[1/5] Updating system..."
sudo pacman -Syu --noconfirm

# Install required packages (from your config)
echo "[2/5] Installing required packages..."
sudo pacman -S --noconfirm \
    hyprland \
    waybar \
    kitty \
    rofi \
    dunst \
    thunar \
    grim \
    slurp \
    wl-clipboard \
    pamixer \
    brightnessctl \
    network-manager-applet \
    pipewire \
    wireplumber \
    playerctl \
    pulseaudio-utils \
    mpv \
    dolphin \
    hyprlauncher \
    ttf-font-awesome \
    otf-font-awesome \
    ttf-jetbrains-mono \
    ttf-nerd-fonts-symbols-mono

# Install AUR packages
echo "[3/5] Installing AUR packages..."
if command -v yay &> /dev/null; then
    yay -S --noconfirm \
        hyprshot \
        wf-recorder \
        mpvpaper \
        hyprlock
else
    echo "yay not found. Install AUR packages manually:"
    echo "  - hyprshot"
    echo "  - wf-recorder"
    echo "  - mpvpaper"
    echo "  - hyprlock"
fi

# Create config directories
echo "[4/5] Creating config directories..."
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/dunst

# Copy wallpaper (video)
echo "[5/5] Setting up wallpaper..."
mkdir -p ~/.config/hypr/wallpapers
cp $(pwd)/wallpapers/wallpaper1.mp4 ~/.config/hypr/wallpapers/

# Create symlinks
echo "[6/5] Creating symlinks..."
ln -sf $(pwd)/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sf $(pwd)/waybar ~/.config/waybar

# Fix the wallpaper path in hyprland.conf (replace with ~/.config path)
sed -i 's|~/Downloads/wallpaper1.mp4|~/.config/hypr/wallpapers/wallpaper1.mp4|g' ~/.config/hypr/hyprland.conf

echo "=========================================="
echo "  Installation Complete!"
echo "=========================================="
echo "Please reboot or restart Hyprland."
