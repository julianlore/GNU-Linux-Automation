#!/usr/bin/env bash
# Basic Arch Linux installation script, does not ask for user input (change in future script to customize params)
# Currently tested/made for a VM

# set -o xtrace # Shows each command being executed

echo "Set keyboard layout"
loadkeys us

echo "Assuming we already have internet connection from host OS"

echo "Sync with ntp"
timedatectl set-ntp true

echo "Assuming partitions already formatted, will have to accept params to facilitate here"

# fdisk /dev/sda
# p
# 1
# ...
# p
# 2
# ...
# w

echo "Format partitions"
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2

echo "Mount partitions"
mount /dev/sda1 /mnt

echo "Make home mount point and mount"
mkdir /mnt/home
mount /dev/sda2 /mnt/home

# Copy mirrorlist in advance (scp -P 3022 mirrorlist root@127.0.0.1:/etc/pacman.d) or use sed

echo "Installing base and base-devel packages"
pacstrap /mnt base

echo "Generate fstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "Chrooting into new system"
arch-chroot /mnt

