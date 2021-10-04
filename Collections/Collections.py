# -*- coding: utf-8 -*-

# list
print("list============================")
l = list([1, 3, 4])
print([1, 3, 4][2])
print(l)

print(len([1, 3, 4]))

# tuple
print("tuple============================")
print((1, 2, "hello"))
t = ()
print(t) # empty tuple
print(())
print((1)) # just 1
print((1, )) # tuple with one element

a = 1
b = 2
t = (a, b, "hello")
b = 3
print(t) # keep (1, 2, "hello")

# range
print("range============================")
print(range(10)) # 0 to 9 by step 1
print(list(range(10))) # 0 to 9 by step 1
print(range(1, 5))
print(list(range(1, 5)))
print(range(1, 100, 10))
print(list(range(1, 100, 10)))


# dict
print("dict============================")
d = {"hello": 1, "world": 2}
print(d)
print(d["hello"])
print(d.get("yes", -1))
print(d.get("yes"))
d["yes"] = 100
d.pop("hello")
print(d)


# set
print("set============================")
s = {1, 3, 100, "hello", "yes"}
print(s)
s = set([1, 3, 100, "hello"])
print(s)
s.add(1024)
s.remove("hello")
print(s)
print("hello" in s)

s.add((1, 2, 3))
print(s)