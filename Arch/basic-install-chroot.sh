#!/usr/bin/env bash

# Second file for basic install, after chroot

echo "Setting time zone"
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime

echo "Generating /etc/adjtime"
hwclock --systohc

# Copy over locale.gen (scp -P 3022 locale.gen root@127.0.0.1:/etc/) or use sed
echo "Generating pre-specified locales"
locale-gen

echo "Setting LANG variable"
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Change to user defined hostname
echo "Creating hostname"
echo "ArchVM" > /etc/hostname
echo "127.0.0.1    localhost" >> /etc/hosts
echo "::1          localhost" >> /etc/hosts
echo "127.0.1.1    ArchVM.localdomain ArchVM" >> /etc/hosts

echo "Set root password" # Can be pre-defined or ask for user input
passwd

echo "Installing bootloader (syslinux)"
pacman -S syslinux
syslinux-install_update -i -a -m

# Might need to check generated /boot/syslinux/syslinux.cfg if configured properly, the one I generated pointed to non existent partition?
