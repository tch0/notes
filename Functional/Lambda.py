# -*- encoding: utf-8 -*-

# anonymous function aka lambda expression
# with limited support in Python

print(list(map(lambda x : x * x, range(0, 10))))

f = lambda x : x * x
print(f(10))

def fn(x):
    return x * x

print(f) # <function <lambda> at 0x000002A39C515040>
print(fn) # <function fn at 0x000002A39C5150D0>

f = lambda x : (lambda y : (lambda z : x + y + z))
print(f) # <function <lambda> at 0x000001B74BF061F0>
print(f(1)) # <function <lambda>.<locals>.<lambda> at 0x000001B74BF060D0>
print(f(1)(2)) # <function <lambda>.<locals>.<lambda>.<locals>.<lambda> at 0x000001B74BF06280>
print(f(1)(2)(3))
