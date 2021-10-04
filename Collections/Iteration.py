# -*- coding: utf-8 -*-

# use for to iterate collections, aka range for

from collections.abc import Iterable


for x in [12, 124, 1234]:
    print(x)

for x in (1, 2, 3):
    print(x)

for x in {1, 2, 3, 1, 4}:
    print(x)

d = {"hello": 10, 2 : 100, "world": "yes"}
for k in d:
    print(k)
for k, v in d.items():
    print(k, v)
for kv in d.items():
    print(kv)
for v in d.values():
    print(v)

print(isinstance([1, 2, 3], Iterable))
print(isinstance((1, 2, 3), Iterable))
print(isinstance({1, 2, 3}, Iterable))
print(isinstance({1:2}, Iterable))
print(isinstance(range(100), Iterable))
print(isinstance('abc', Iterable))

a = [1, 2, "hello"]
for i, val in enumerate(a):
    print(i, val)

for i, pair in enumerate(d.items()):
    print(i, pair)

for x in range(100):
    print(x)