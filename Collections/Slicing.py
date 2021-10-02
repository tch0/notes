# -*- encoding: utf-8 -*-

# slicing of collections: tuple and list
l = list(range(101))
print(l[:])
print(l[:10])
print(l[10:20])
print(l[::5])
print(l[-20:]) # last 20 elements
print(l[-1:]) # last element
print(l[70:40:-1])

# slicing of string
s = "abcdefghijklmnopqrstuvwxyz"
print(s[10:20:2])
print(s[2:])
print(s)

print(range(0, 10)[:50:2])
print(list(range(1, 100)[::2]))
print(range(0, 10))