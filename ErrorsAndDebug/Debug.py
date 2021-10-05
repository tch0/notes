# -*- coding: utf-8 -*-


import logging
import pdb
logging.basicConfig(level = logging.INFO, filename="Debug.log", encoding="utf-8", filemode="w")

# assert
def test1():
    n = 11
    assert n == 10, "n is not 10"
    print(n)

# logging
def Fib(n, a, b):
    logging.info(f"call Fib({n}, {a}, {b})")
    # pdb.set_trace()
    if (n == 0):
        return a
    else:
        return Fib(n-1, b, a + b)

def test2():
    n = Fib(10, 0, 1)
    print(n)


if __name__ == "__main__":
    # test1()
    test2()