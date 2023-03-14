import requests
import os
def search_aur(package_name):
    Furl = 'https://aur.archlinux.org/rpc/?v=5&type=search&arg=' + package_name
    rq = requests.get(Furl)
    rqj = rq.json()
    if rqj['results']:
        results = rqj['results']
        sorted_results = sorted(results, key=lambda r: r['NumVotes'], reverse=True)
        print(f"\nFound {len(results)} results for '{package_name}':\n")
        for i in range(min(5, len(sorted_results))):
            result = sorted_results[i]
            print(f"{i + 1}. {result['Name']}, with {result['NumVotes']} upvotes. description: {result['Description']}\n") 
        selected = input('which one do you want to get: ')
        if selected == '':
            exit()
        try:
            selected = int(selected) - 1
            result = sorted_results[selected]
            url = result['PackageBase']
            os.system(f'git clone https://aur.archlinux.org/{url}.git')
            print(url)
            os.chdir(url)
            os.system('ls')
            os.system('makepkg -sri')
        except (ValueError, IndexError):
            print(f"oops try again?: '{selected}'.")
    else:
        print(f"try searching something different because this isnt '{package_name}' on the AUR.\n")
pac = input('what package are you looking for?: ')
if pac == '':
    exit()
search_aur(pac)