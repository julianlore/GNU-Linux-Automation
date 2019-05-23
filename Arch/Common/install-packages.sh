#!/usr/bin/env bash
pacman -Sy
sed '/^#/ d' packages_to_install.txt | xargs pacman -S --noconfirm --needed
