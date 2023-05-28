import getpass
import subprocess
import os
def make_root_passwd(): 
    rootPass = getpass.getpass("Please create a root password, make sure to remember it!!!: ") 
    rootPassConfirm = getpass.getpass("Please confirm your root password: ")

    while rootPass != rootPassConfirm:
        print("Passwords do not match, please try again.")
        rootPass = getpass.getpass("Please create a root password, so people don't screw around with your pc. Make sure to remember it!: ")
        rootPassConfirm = getpass.getpass("Please confirm your root password: ")
    os.system('"username:root" | sudo chpasswd')
def generate_user():
    username = input("Enter your username here: ")
    usernamePassword = getpass.getpass(f"Enter the password for {username}: ")
    usernamePasswordConfirm = getpass.getpass("Please confirm your user password.")
    while usernamePassword != usernamePasswordConfirm:
        print("Passwords do not match, please try again.")
        usernamePasswordConfirm = getpass.getpass("Please create a root password, so people don't screw around with your pc. Make sure to remember it!: ")
    usernamePassword = str(usernamePassword)
    subprocess.run(['useradd', '-m', username])
    os.system(f'"printf "username:{username}" | sudo chpasswd"')
make_root_passwd()
generate_user()
print("yay it works")
