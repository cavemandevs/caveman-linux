import requests

r = requests.get ('https://aur.archlinux.org/rpc/?v=5&type=search&arg=package')
print(r)