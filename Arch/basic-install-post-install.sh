#!/usr/bin/env bash

echo "Configuring enp0s3"
echo "[Match]" >> /etc/systemd/network/enp0s3.network
echo "name=en*" >> /etc/systemd/network/enp0s3.network
echo "[Network]" >> /etc/systemd/network/enp0s3.network
echo "DHCP=yes" >> /etc/systemd/network/enp0s3.network

echo "Restarting network"
systemctl restart systemd-networkd
systemctl enable systemd-networkd

echo "Adding Google DNS servers"
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

echo "Installing openssh"
pacman -S openssh

# Modify or copy pre-configured /etc/ssh/sshd_config

echo "Enabling sshd"
systemctl enable sshd
systemctl start sshd

