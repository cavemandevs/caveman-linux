import requests
import os
def search_aur(package_name):
    url = f'https://aur.archlinux.org/rpc/?v=5&type=search&arg={package_name}'
    rq = requests.get(url)
    rqj = rq.json()
    if rqj['results']:
        results = rqj['results']
        sorted_results = sorted(results, key=lambda r: r['NumVotes'], reverse=True)
        for i in range(min(3, len(sorted_results))):
            result = sorted_results[i]
            print(f"{result['Name']}, with {result['NumVotes']} upvotes. description: {result['Description']}\n")
    else:
        print(f"cant find '{package_name}' on the aur.\n")

package_name = input('what package are you looking for  \n')
if package_name == '':
    exit()
search_aur(package_name)
