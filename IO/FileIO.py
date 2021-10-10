# -*- coding: utf-8 -*-

# synchronous IO : simple but inefficient
# asynchronous IO : complicated and efficient

with open("Test.txt", "r") as f:
    for line in f.readlines():
        print(line.strip())

try:
    f = open("Test.txt", "r")
    print(f.read())
finally:
    if f:
        f.close()