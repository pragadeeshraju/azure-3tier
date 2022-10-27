import requests
import json

metadata_url = 'http://169.254.169.254/latest/'
tree_start = ['meta-data/']

def expand_tree(url, arr):
    output = {}
    
    for item in arr:
    
        new_url = url + item
        r = requests.get(new_url)
        text = r.text
        if item[-1] == "/":
            list_of_values = r.text.splitlines()
            output[item[:-1]] = expand_tree(new_url, list_of_values)
        else:
            output[item] = text
    return output

def finditem(obj, key):
    if key in obj: 
        return obj[key]
    for k, v in obj.items():
        if isinstance(v,dict):
            item = finditem(v, key)
            if item is not None:
                return item

def main():
    metadata = expand_tree(metadata_url, tree_start)    
    keyword = input("Enter key in the dict to fetch : ")
    value = finditem(metadata, keyword)
    print(value)

if __name__ == '__main__':
    main()