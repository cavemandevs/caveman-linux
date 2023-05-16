import os
import getpass
import subprocess
#cool stuff
input("Welcome to CaveInstall! (Press ENTER to continue...)\n")
input("By continuing, you understand that you've read the license (https://caernarferon.github.io/caveman/license)")
input("The license is also available on the installation media.")
input("It's available at ~/LICENSE")
shart = input("Would you like to start the installation?(Y/N) ")
if shart.lower() == "y":
    print(f"{shart}Starting CaveInstall...")
else:
    exit("Installation aborted")
class Caveinstall:
    def __init__(self):
        self.version = "0.1"
    def infogather(self):
        """collect data for installer"""
        hostname = input("What do you want your hostname to be? ")
        locale = input("What will your locale be? ")
        root_password = True
        confirmroot_password = False
        root_password = getpass.getpass("What will your root password be?: ")
        confirmroot_password = getpass.getpass("Confirm your root password plz:")
        while root_password != confirmroot_password:
            root_password = getpass.getpass("Sorry, try entering it again?: ")
            confirmroot_password = getpass.getpass("Confirm your root password plz:")
        username = input("What do you want your username to be?")
        os.system("lsblk | grep 'nvme0n1'")
        return {
            "hostname": hostname,
            "locale": locale,
            "rootpasswd": root_password,
            "username": username
        }
    def install(self):
        input("Its time to install!")
        input("Understand that we are going to format and remove all partitions on your computer!")
        input("We are not responsible for any damage done to your computer")
        start = input("Are you sure you want to begin? Y/N ")
        
        if start.lower() != "y":
            exit('aborted installation')
            
print(Caveinstall.infogather(self=1))
