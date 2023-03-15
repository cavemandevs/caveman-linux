import requests

response = requests.get('https://rory.cat/purr')
data = response.json()
cat_url = data['url']
print(cat_url)
