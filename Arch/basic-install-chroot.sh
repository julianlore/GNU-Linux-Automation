#!/usr/bin/env bash

# Second file for basic install, after chroot

echo "Setting time zone"
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime

echo "Generating /etc/adjtime"
hwclock --systohc

echo "Copying locale.gen"
cp locale.gen /etc
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

echo "Installing bootloader (grub)"
pacman -S --noconfirm grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd
