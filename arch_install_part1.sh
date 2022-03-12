#!/bin/bash

# Add execution permission to the second script
chmod u+x arch_install_part2.sh

# Configure ntp
timedatectl set-ntp true

# Clean partitions on /dev/sda and create 2 new partitions:
#     ESP (for UEFI)
#     root
dd if=/dev/zero of=/dev/sda bs=512 count=1 conv=notrunc
parted --script /dev/sda mklabel msdos mkpart primary fat32 1MiB 513MiB set 1 boot on mkpart primary ext4 513Mib 100%

# Create file system
mkfs.fat -F32 /dev/sda1
mkfs.ext4 -F /dev/sda2

# Configure the pacman mirrors and install (and run) reflector
pacman -Syy reflector --noconfirm
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector --protocol http --protocol https --latest 20 --sort rate --save /etc/pacman.d/mirrorlist

# Mount arch linux
mount /dev/sda2 /mnt

# Install necessary packages
pacstrap /mnt base linux linux-firmware vim networkmanager

# Generate fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# Run the arch-chroot part
cp -r ../arch-linux-install-ansible-main /mnt/root
arch-chroot /mnt sh root/arch-linux-install-ansible-main/arch_install_part2.sh

# Cleanup
echo 'Setup Complete!'
echo 'type "reboot" and remove installation media.'
