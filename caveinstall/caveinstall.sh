#!/bin/bash

[ -z "$1" ] && printf "what drive are you installing to (/dev/sda, /dev/nvme0n1. run lsblk to check what you have)\n\n./archstrap.sh [DRIVE]\n\n" && exit
[ ! -b "$1" ] && printf "boy $1 you broke something.\n" && exit
printf "\nthis script will destroy whatever is on $1.\n are you sure (y/n): " && read CERTAIN
[ "$CERTAIN" != "y" ] && printf "abort lol" && exit

pacman -S --noconfirm parted
disk=$1
boot=${disk}1
swap=${disk}2
root=${disk}3
home=${disk}4

#cleanup
swapoff $swap
umount -a # unmount everything

set -xe
parted -s $disk mklabel gpt
parted -sa optimal $disk mkpart primary fat32 0% 
parted -sa optimal $disk mkpart primary linux-swap 512MiB 4G
parted -sa optimal $disk mkpart primary ext4 4G 70G
parted -sa optimal $disk mkpart primary ext4 70G 100%
parted -s $disk set 1 esp on
# L fdisk
# format
mkfs.vfat -IF32 $boot
mkfs.ext4 -F $root
mkfs.ext4 -F $home
mkswap -f $swap

#mount parties and prepare swap
mount $root /mnt
mount -m $boot /mnt/boot
mount -m $home /mnt/home
swapon $swap

#pacstrap and make fstab
pacstrap /mnt linux linux-firmware networkmanager vim base base-devel git man efibootmgr grub
genfstab -U /mnt > /mnt/etc/fstab

# Enter the system and set up basic locale, passwords and bootloader.
arch-chroot /mnt
sed -i "s/^#en_US.UTF-8/en_US.UTF-8/g" /etc/locale.gen;
echo "LANG=en_US.UTF-8" > /etc/locale.conf;
locale-gen;
ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime;
hwclock --systohc;
systemctl enable NetworkManager;
echo root:123 | chpasswd;
echo "archer" > /etc/hostname;                                                                                                             
mkdir /boot/grub;
grub-mkconfig -o /boot/grub/grub.cfg;
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB;'

# Finalize.
umount -R /mnt
set +xe

