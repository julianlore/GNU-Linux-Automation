#!/usr/bin/env bash
# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sed '/^#/ d' aur_packages_to_install.txt | xargs yay -S --noconfirm --needed
