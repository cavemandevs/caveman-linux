import os
import time
import requests
def welcome():
    os.system("clear")
    print("\033[1mCaveman Linux Installation Assistant - python Version\033[0m")
    print("Welcome to Caveman Linux!")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("This installer is by Caveman Linux contributors, & Caveman Software.")
    print("It's also under the GPLv2 License, please visit link to read more.")
    print("")
    print("2023 - 2023, Caveman Software & Contributors")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("END USER NOTICE:")
    print("NETWORKING SETUP IS UNSTABLE, PLEASE SET IT UP BEFORE YOU RUN THE INSTALLER")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    while True:
        print("Please choose an Option:")
        print("")
        print("1. Start Installation")
        print("2. Enter Shell")
        print("3. Shut down Computer")
        choice = input("Enter your choice (1/2/3): ")
        if choice == "1":
            break
        elif choice == "2":
            os.system("clear")
            print("\033[91m\033[1m>>> ENTERED SHELL <<<\033[0m")
            print("")
            print("\033[1mhere be dragons!\033[0m")
            print("")
            print("You've just entered the shell interface.")
            print("You may proceed to do a custom installation, or do other things here.")
            print("")
            print("Please do be warned that doing custom installations, ")
            print("and deviating from the standard Caveman Linux Installer ")
            print("may result in instability, and is NOT supported by Caveman Developers.")
            print("")
            print("If you have entered the shell by mistake, you may re-enter the installer ")
            print("by typing in 'python3 cavemaninstall.py', and pressing enter.")
            quit() 
        elif choice == "3":
            os.system("clear")
            print("shutting down computer..")
            time.sleep(5)
            # os.system("shutdown now") [commented out to prevent shutdowns during testing, this should be uncommented when pushed to main]
        break
    else:
        print("Invalid choice. Please select a valid option (1/2/3).")

def netCheck(hosts_to_check):
    try:
        for host in hosts_to_check:
            requests.get(host)
            print("done checking hosts")
            break
    except requests.exceptions.ConnectionError as e:
            print(e)
            print("\033[91m\033[1mNetwork NOT FOUND!\033[0m")
            print("")
            print("A working network connection was not found.")
            print("")
            print("The Network Configuration Assistant is under construction,")
            print("and will be coming soon.")
            print("")
            print("Please connect to the internet outside of the installer,")
            print("and try again.")
            exit() 
    else:
        print("please make an issue on the caveman linux github repo")
hoststocheck =["https://archlinux.org"]
            
def diskSetup():
    os.system("clear")
    print("\033[1mDisk Configuration - Partitioning - Caveman Linux Installation Assistant / Screen 1 of X\033[0m")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("Disk Configuration")
    print("This screen will assist in setting up the target disk.")
    print("\033[91m\033[1mWARNING: AS OF NOW, SELECTING THE DISK WILL ***ERASE THE ENTIRE DISK***\033[0m")
    print("A proper partitioner is coming soon.")
    print("Here is a list of available disks:")
    print("")
    os.system("lsblk")
    print("")
    print("Make sure you select a disk and not a partition (nvme0n1, sda, sdb) The disk should not have a number at the end")
    print("")
    print("Please enter the target disk where Caveman Linux will be installed.")
    targetdisk = input(">>> ")
    
netCheck(hoststocheck)
welcome()
diskSetup()
