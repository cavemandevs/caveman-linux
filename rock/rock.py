import requests

def search_aur(package_name):
    url = f'https://aur.archlinux.org/rpc/?v=5&type=search&arg={package_name}'
    rq = requests.get(url)
    rqj = rq.json()
    if rqj['results']:
        results = rqj['results']
        sorted_results = sorted(results, key=lambda r: r['NumVotes'], reverse=True)
        for i in range(min(3, len(sorted_results))):
            result = sorted_results[i]
            print(f"{result['Name']}, with {result['NumVotes']} upvotes")
    else:
        print(f"Cannot find '{package_name}' on the AUR.")

package_name = input('What package are you looking for? ')
if package_name == '':
    exit()
search_aur(package_name)
