#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc
sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'omer' > /etc/hostname
echo '127.0.0.1 localhost
::1 localhost
127.0.1.1   omer.localdomain   omer' >> /etc/hosts

echo omer > /etc/hostname

pacman -S grub efibootmgr --noconfirm
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

echo 'Set root password'
passwd

systemctl enable NetworkManager

exit 
