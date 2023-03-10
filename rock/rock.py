import requests

def search_aur(package_name):
    url = f'https://aur.archlinux.org/rpc/?v=5&type=search&arg={package_name}'
    rq = requests.get(url)
    rqj = rq.json()
    if rqj['results']:
        first_result = rqj['results'][0]
        second_result = rqj['results'][1]
        third_result = rqj['results'][2]
        print(f"{first_result['Name']}, with {first_result['NumVotes']} upvotes")
        print(f"{second_result['Name']}, with {second_result['NumVotes']} upvotes")
        print(f"{third_result['Name']}, with {third_result['NumVotes']} upvotes")
    else:
        print(f"i cant find '{package_name}' on the aur.")

package_name = input('what are you looking for: ')
search_aur(package_name)
