# -*- coding: utf-8 -*-

def myabs(a):
    if a < 0:
        return -a
    else:
        return a

print(myabs(-10))

def swap(x, y):
    return x, y # return as a tuple

x = 1
y = 2
x, y  = swap(x, y)
print(x, y)
(x, y) = (y, x)
print(x, y)

import math
print(math.sin(math.pi / 4))

# default arguments
def power(x, n = 2):
    res = 1
    while n > 0:
        res *= x
        n -= 1
    return res
print(power(10))
print(power(10, 3))

# variable arguments
def printargs(*args):
    print(args)

printargs()
printargs((1, 2), 10)
printargs(1, 2, 3)
printargs(*[1, 2, 3], 10, 100)
printargs([1, 2, 3])

# keyword arguments
def person(name, age, *, city, job):
    print(f"name: {name}, age: {age}, city: {city}, jog: {job}")

person("kim", 18, job = "waiter", city = "beijing")

def person2(name, age, *args, city, job):
    print(f"name: {name}, age: {age}, city: {city}, jog: {job}")

person2("kim", 18, job = "waiter", city = "beijing")

# named keyword arguments
def person3(name, age, **args):
    print(f"name: {name}, age: {age}, args: {args}")

person3("kim", 18, job = "waiter", city = "beijing")
person3("kim", 18, **{'job': 'waiter', 'city': 'beijing'})

# combine multiple arguments
def foo(a, b, c = 0, *args, d = 10, **kw):
    print(a, b, c, args, d, kw)

foo(1, 2)
foo(1, 2, 3)
foo(1, 2, 3, 100)
foo(1, 2, 3, 100)
foo(1, d = 10, b = 2, c = 3, args = {1, 2}, kw = {"hello": 10})

# recursive
def fib(n):
    return fibonacci(n, 0, 1)

def fibonacci(n, a, b):
    if (n == 0):
        return a
    else:
        return fibonacci(n-1, b, a+b)

import sys
sys.setrecursionlimit(2000)
print(fib(1990))