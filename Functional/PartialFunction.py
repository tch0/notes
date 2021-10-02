# -*- encoding: utf-8 -*-

from functools import partial
from math import log

# partial function
int2 = partial(int, base = 2)
print(int2("1000")) # 8

# equals to
kw = {"base": 2}
print(int("1000", **kw))

def f(a, b, *, c, d):
    print(f"{a}, {b}, {c}, {d}")

f1 = partial(f, 10, d = 40)
f1(20, c = 30, d = 50) # named arguemnt from partial function can be overrided

f2 = partial(f, b = 20)
f2(10, c = 30, d = 40)