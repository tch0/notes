# -*- coding: utf-8 -*-

from collections import defaultdict, namedtuple, deque
from typing import ChainMap, Counter, OrderedDict

# namedtuple
Point = namedtuple('Point', ['x', 'y'])
p = Point(10, 20)
print(p, p.x, p.y, p[0], p[1])

# deque
q = deque([1, 2, 3, 'x'])
print(q.pop())
q.append(10) # return None
print(q.popleft())
q.appendleft(10)
print(q)

# defaultdict
d = defaultdict(lambda: 'N/A')
print(d[10], d['nonexistkey'])
d[10] = 100
print(d)

# OrderedDict
d = OrderedDict()
d['x'] = 1
d['y'] = 2
print(d.keys())
print(d)

# ChainMap
c = ChainMap(d, {'x' : 200})
print(c['x'])

# Counter
c = Counter()
for ch in "hello":
    c[ch] = c[ch] + 1
print(c)