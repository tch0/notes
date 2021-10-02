# -*- encoding: utf-8 -*-

from functools import reduce

# assignment
print(abs)
a = abs
print(a)
print(a(-10))

# as parameter
def add(x, y, f):
    return f(x) + f(y)

print(add(10, -5, abs))

# as return value
def addz(x, y):
    def other(z):
        return x + y + z
    return other

print(addz)
print(addz(1, 2))
print(addz(1, 2) == addz(1, 2)) # False
print(addz(1, 2)(3))

# map
def add10(x):
    return x + 10
print(list(map(add10, [1, 2, 3])))

def add(x, y):
    return x + y
print(list(map(add, range(100)[::-1], [-x for x in range(100, 250)])))

# reduce
def sum(x, y):
    return x + y
print(reduce(sum, range(101)))

# example
DIGITS = dict((chr(ord('0') + val), val) for val in range(10)) # '0': 0, '1': 1, ...
def str2int(s):
    def fn(x, y):
        return x * 10 + y
    def char2num(s):
        return DIGITS[s]
    return reduce(fn, map(char2num, s))

print(str2int("1024"))

def str2float(s):
    loc = s.find('.')
    def char2num(s):
        return DIGITS[s]
    part1 = reduce(lambda x, y: x * 10 + y, map(char2num, s[:loc]))
    part2 = reduce(lambda x, y: x / 10 + y, map(char2num, s[-1:loc:-1]))
    return part1 + part2/10

print(str2float("1.234"))

# filter
print(list(filter(lambda x: x % 5 == 0, range(100, 200))))

# example: use Sieve of Eratosthenes to find all prime nunbers
# https://zh.wikipedia.org/wiki/%E5%9F%83%E6%8B%89%E6%89%98%E6%96%AF%E7%89%B9%E5%B0%BC%E7%AD%9B%E6%B3%95
def _odd_iter():
    n = 1
    while True:
        n = n + 2
        yield n

def _not_division(n):
    return lambda x: x % n > 0

def primes():
    yield 2
    it = _odd_iter() # generate odd numbers
    while True:
        n = next(it)
        yield n
        it = filter(_not_division(n), it) # construct new Iterator

gp = primes()
print([next(gp) for _ in range(100)])

# sorted
s = ['bob', 'about', 'Zoo', 'Credit']
print(sorted(s, key = str.lower, reverse=True))
