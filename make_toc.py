#!/usr/bin/env python
import json
import sys

def int_to_roman(input):
    """ Convert an integer to a Roman numeral. """
    ints = (1000, 900,  500, 400, 100,  90, 50,  40, 10,  9,   5,  4,   1)
    nums = ('M',  'CM', 'D', 'CD','C', 'XC','L','XL','X','IX','V','IV','I')
    result = []
    for i in range(len(ints)):
        count = int(input / ints[i])
        result.append(nums[i] * count)
        input -= ints[i] * count
    return ''.join(result)


def load_json(filename):
    out = None
    with open(filename) as file:
        out = json.load(file)
    return out

def main():
    data = load_json(sys.argv[1])
    print("# data", data)
    for [livre, page] in data['chapters']:
        if isinstance(livre, int):
            livre = int_to_roman(livre)
        elif isinstance(livre, str):
            livre = livre.capitalize()
        print(livre, page)

if __name__ == '__main__':
    main()
