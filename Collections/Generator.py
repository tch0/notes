# -*- coding -*-

from re import I
from typing import Iterable, Iterator

# list comprehension
print(list(range(100)))
print([n for n in range(100) if n % 10 + n // 10 == 9])
print([x*x for x in range(10) if x % 2 == 0])

print([m + n for m in "ABC" for n in "XYZ"])

L1 = ['Hello', 'World', 18, 'Apple', None]
L2 = [s.lower() for s in L1 if isinstance(s, str)]
print(L2)

# generator
g = (x * x for x in range(10) if x % 2 == 0)

def fib(max):
    n, a, b = 0, 0, 1
    while (n < max):
        yield a
        a, b = b, a + b
        n += 1
    return "done"

print([x for x in fib(10)])

g = fib(10)
while True:
    try:
        print(next(g))
    except StopIteration as e:
        print("Generator return value: ", e.value)
        break

# pascal triangles
def triangles(max):
    n, L = 0, [1]
    while n < max:
        yield L.copy()
        L.append(0)
        L = [L[i] + L[i-1] for i in range(len(L))]
        n += 1
    return "done"

g = triangles(10)
res = [elem for elem in g]
print(res)
print(isinstance(g, Iterator)) # True
print(isinstance(g, Iterable)) # True

print(isinstance([1, 2], Iterable)) # True
print(isinstance([1, 2], Iterator)) # False
print(isinstance(iter([1, 2]), Iterator)) # True, collections to Iterator

# the natrue of for
for x in [1, 2, 3, 4, 5]:
    print(x)

# equals to
it = iter([1, 2, 3, 4, 5])
while True:
    try:
        x = next(it)
        print(x)
    except StopIteration:
        break

print(triangles)