import requests

url = 'https://aur.archlinux.org/rpc/?v=5&type=search&arg=balena'
rq = requests.get(url)
rqj = rq.json()
print(rqj)

