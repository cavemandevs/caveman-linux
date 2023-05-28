import getpass
import subprocess

def make_root_passwd(): 
    rootPass = getpass.getpass("Please create a root password, make sure to remember it!!!: ") 
    rootPassConfirm = getpass.getpass("Please confirm your root password: ")

    while rootPass != rootPassConfirm:
        print("Passwords do not match, please try again.")
        rootPass = getpass.getpass("Please create a root password, so people don't screw around with your pc. Make sure to remember it!: ")
        rootPassConfirm = getpass.getpass("Please confirm your root password: ")
    subprocess.run(['passwd'], input=rootPass.encode(), text=True)

def generate_user():
    username = input("Enter your username here: ")
    usernamePassword = getpass.getpass(f"Enter the password for {username}: ")
    usernamePasswordConfirm = getpass.getpass("Please confirm your user password.")
    while usernamePassword != usernamePasswordConfirm:
        print("Passwords do not match, please try again.")
        usernamePasswordConfirm = getpass.getpass("Please create a root password, so people don't screw around with your pc. Make sure to remember it!: ")
    subprocess.run(['useradd', '-m', username])
    subprocess.run(['passwd', username], input=usernamePassword.encode(), text=True)

# Main script
make_root_passwd()
generate_user()
print("yay it works")
