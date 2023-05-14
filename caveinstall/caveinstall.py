import os
import getpass
import json
input("Welcome to CaveInstall! (Press ENTER to continue...)")
input("By continuing, you recognize that you have read the license (https://caernarferon.github.io/caveman/license)")
start = input("Would you like to start the installation?(Y/N) ")
if start.lower() == "y":
    print("Starting CaveInstall...")
else:
    exit("Installation aborted")
class Caveinstall:
    def __init__(self):
        pass
    def infogather(self):
        """collect data for installer"""
        self.hostname = input("What do you want your hostname to be? ")
        self.locale = input("What will your locale be? ")
        self.root_password = ""
        self.confirmroot_password = ""
        while self.root_password != self.confirmroot_password:
            self.root_password = getpass.getpass("What will your root password be?: ")
            self.confirmroot_password = getpass.getpass("Confirm your root password plz:")
        self.username = input("What do you want your username to be?")
        os.system("lsblk | grep 'nvme0n1'")
        return {
            "hostname": self.hostname,
            "locale": self.locale,
            "rootpasswd": self.root_password,
            "username": self.username
        }
    def install(self):
        input("Its time to install!")
        input("Understand that we are going to format and remove all partitions on your computer!")
        input("We are not responsible for any damage done to your computer")
        start = input("Are you sure you want to begin? Y/N ")
        
        if start.lower() != "y":
            exit('aborted installation')
        # os.system("parted -s /dev/sda mkpart primary ext4 0% 512MiB")
        # #swap
        # os.system("parted -s /dev/sda mkpart primary ext4 20GB 30GB")
        # #root
        # os.system("parted -s /dev/sda mkpart primary ext4 30GB 100%")
        os.system("parted -s /dev/nvme0n1 mklabel gpt")
        os.system("parted -s /dev/nvme0n1 mkpart primary ext4 0% 512MiB")
        os.system("parted -s /dev/nvme0n1 mkpart primary linux-swap 512MiB 4.5GiB")
        os.system("parted -s /dev/nvme0n1 mkpart primary ext4 4.5GiB 100%")

        # Format partitions
        os.system("mkfs.ext4 /dev/nvme0n1p1")
        os.system("mkswap /dev/nvme0n1p2")
        os.system("mkfs.ext4 /dev/nvme0n1p3")

        # Mount partitions
        os.system("mount /dev/nvme0n1p3 /mnt")
        os.system("mkdir /mnt/boot")
        os.system("mount /dev/nvme0n1p1 /mnt/boot")
        os.system("swapon /dev/nvme0n1p2")