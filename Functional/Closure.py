# -*- encoding: utf-8 -*-

# do not use a loop variable if return a closure
def count():
    fs = []
    for i in range(1, 4):
        def f():
             return i*i
        fs.append(f)
    return fs

f1, f2, f3 = count()
print(f1(), f2(),f3()) # 9 9 9

# bind before i chagne
def count2():
    def f(j):
        def g():
            return j*j
        return g
    fs = []
    for i in range(1, 4):
        fs.append(f(i))
    return fs

f1, f2, f3 = count2()
print(f1(), f2(), f3())

# every call will return a incresing value
def createCounter():
    n = 0
    def counter():
        nonlocal n # need define as nonlocal, if call outter local variable
        n = n + 1
        return n
    return counter

c = createCounter()
print([c() for _ in range(10)])
d = createCounter()
print([d() for _ in range(10)])