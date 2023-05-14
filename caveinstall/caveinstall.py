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
        