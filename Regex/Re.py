# -*- coding: utf-8 -*-

import re

print(re.match(r"^\d{3}-\d{3,8}", "012-23423"))
print(re.split(r'\s+', 'a b   c')) # ['a', 'b', 'c']
print(re.split(r'\$\^\.\{\}', 'a$^.{}b$^.c$'))
print(re.match(r'^(\d+?)(0*)$', '102300').groups()) # non-greedy matching of \d+?

print(type(re.compile(r"\d+$")))

# test if a string is a email address
def is_valid_email(addr):
    regex = r"\w+(\.\w+)*@\w+.\w+"
    return re.match(regex, addr) != None

assert is_valid_email('someone@gmail.com')
assert is_valid_email('bill.gates@microsoft.com')
assert not is_valid_email('bob#example.com')
assert not is_valid_email('mr-bob@example.com')

def name_of_email(addr):
    m1 = re.match(r"<([\w\s]+)>\s([a-zA-Z]+)@\w+.\w+", addr)
    m2 = re.match(r"([a-zA-Z]+)@\w+.\w+", addr)
    if m1 == None and m2 == None:
        return None
    elif m1 != None:
        return m1.group(1)
    else:
        return m2.group(1)

assert name_of_email('<Tom Paris> tom@voyager.org') == 'Tom Paris'
assert name_of_email('tom@voyager.org') == 'tom'