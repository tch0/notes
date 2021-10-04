# -*- coding: utf-8 -*-

import functools, time

# __name__ of a function
def f(x):
    return x * x

print(f.__name__) # f 
print((lambda x : x * x).__name__) # <lambda>

# decorator
def log(func):
    def warpper(*args, **kv):
        print(f"call {func.__name__}")
        return func(*args, **kv)
    return warpper

@log # equals to log = log(now2)
def now():
    print('2021-10-2')

def now2():
    print('2021-10-2')

now()
log(now2)() # equals to now()
print(now.__name__) # wrapper

# decorator with arguments
def log2(text):
    def decorator(func):
        @functools.wraps(func)
        def warpper(*args, **kv):
            print(f"{text} : {func.__name__}")
            return func(*args, **kv)
        return warpper
    return decorator

@log2("execute") # equals to now3 = log("execute")(now3)
def now3():
    print('2021-10-2')

now3()
print(now3.__name__) # now3, if without @functools.wraps(func), will be wrapper


# example: for any functions, print time of the execution in miniseconds
def metric(func):
    t = time.time()
    @functools.wraps(func)
    def warpper(*args, **kv):
        k = func(*args, **kv)
        print(f"{func.__name__} executed in {(time.time() - t) * 1000} ms")
        return k
    return warpper

@metric
def fast(x, y):
    time.sleep(0.0012)
    return x + y

@metric
def slow(x, y, z):
    time.sleep(0.1234)
    return x + y + z

print(fast(10, 20))
print(slow(20, 30, 134))
