# -*- coding: utf-8 -*-

import itertools

# infinite iterators: count, cycle, repeat
naturals = itertools.count(10, 10)
for i, n in enumerate(naturals):
    if (i >= 10):
        break
    print(n)

cs = itertools.cycle([1, 2, 3])
for i,n in enumerate(cs):
    if (i >= 10):
        break
    print(n)

riter = itertools.repeat('A', 10)
for elem in riter:
    print(elem)

# chain
for elem in itertools.chain([1, 2, 3], ('x', 'y', 'z'), (x for x in range(10) if x % 2 == 0)):
    print(elem)

# groupby
for key, group in itertools.groupby('AAaaBBbbCccC', lambda c : c.upper()):
    print(key, list(group))

# calculate PI
def pi(N):
    oddnums = itertools.count(1, 2) # 1, 3, 5, 7, ...
    ns = itertools.takewhile(lambda x : x <= 2*N-1, oddnums) # 1, 3, ..., 2*N-1
    nss = map(lambda x : (-1)**(x//2)*4/x, ns)
    return sum(nss) # PI = (1 - 1/3 + 1/5 + ...) * 4

print(pi(10))
print(pi(100))
print(pi(1000))
print(pi(10000))