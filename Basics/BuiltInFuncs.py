# -*- coding: utf-8 -*-

# test suite
count = 0
category = ""
def myprint(*args, **kwargs):
    global count
    count += 1
    print(f"{count} {category} : ", *args, **kwargs)

def test(s):
    global category
    category = s

# abs
test("abs")
myprint(abs(-10))

# all any bool
test("all any bool")
myprint(all([]), all(()), all([0, 1]), all([True, False]))
myprint(any([]), any([[]]), any([0, 1]), any([True, False]))
myprint(bool([]), bool([[]]), bool([0, 1]), bool([True, False]))

class Student:
    def __repr__(self) -> str:
        return b'asf\xe4\xb8\xad\xe6\x96\x87'.decode("utf-8")
    def __bool__(self):
        return False

# ascii
test("ascii repr")
myprint(ascii(Student()), repr(Student()))

# bin : to 0b10101... binary format string
test("bin")
myprint(bin(-10), bin(0xFFFF), type(bin(1)), f"{100:#b}")

# class bool : __bool__() return False or __len__() return 0 -> False, else -> True
test("bool")
myprint(bool(Student()))

# class bytearray([source[, encoding[, errors]]]), mutable version of bytes
test("bytearray")
myprint(bytearray(b"asdf\xff"), type(bytearray()))

# class bytes([source[, encoding[, errors]]]), immutable version of bytearray
test("bytes")
myprint(bytes(b"asdf\xff"), type(bytes()))

# callable(object), can call(the class of the object have __call__()) -> True, else -> False, a class is a callable and calling will return a new instance
test("callable")
myprint(callable(int), callable(callable), callable(lambda x : x * x))

# chr(i) return a single character string of code point i
# ord(c) inversion of chr, return code point of a single character string
test("chr ord")
myprint(chr(8364), ord(chr(8346)))

# @classmethod, decorate a method to a class method, will pass the class itself at first argument implicitly
class Person:
    @classmethod
    def f(cls, *args, **kwargs):
        myprint("call function f in calss ", cls.__name__)
    def f2():
        pass
test("@classmethod")
Person.f()
myprint(Person.f, Person.f2)

# class complex
test("complex")
myprint(complex(1, 2), complex("1+2j"), complex())
myprint(complex(1, 2.5) + complex(1, 3) - complex(1.5, 4))
myprint(type(complex()))

class MyComplex:
    def __init__(self, a, b):
        self._a = a
        self._b = b
    # if do not have __complex__, will call __float__ __index__ in order
    # def __complex__(self):
    #     return complex(self._a, self._b)
    def __float__(self):
        return (self._a ** 2 + self._b ** 2) ** 0.5
myprint(complex(MyComplex(1, 3)))

# delattr(object, name) : delete attribute
# setattr(object, name, value)
# getattr(object, name[, default])
# hasattr(object, name)
test("delattr setattr getattr hasattr")
delattr(MyComplex, "__float__")
try:
    myprint(complex(MyComplex(1, 3)))
except Exception as e:
    myprint(e)

def special_complex(self):
    return complex(self._a, self._b)
setattr(MyComplex, "__complex__", special_complex)
myprint(complex(MyComplex(1, 3)))
myprint(getattr(MyComplex, "__complex__", None) == special_complex)
myprint(hasattr(MyComplex, "justamethod"))

# calss dict
test("dict")
myprint(dict((x, str(x)) for x in range(10)))

# dir([object]) : return name list of current domain or specific object
test("dir")
myprint(dir())
myprint(dir(MyComplex))
myprint(dir(test))

# divmod(a, b) : get (result of division, remainder), (a // b, a % b) for int, and (match.floor(a/b), a % b) for float usually
test("divmod")
myprint(divmod(10.5, 3.1))

# enumerate(iterable, start=0)
test("enumerate")
myprint([t for t in enumerate(["hello", "world"], 10)])

# eval(expression[, globals[, locals]]), eval as a python expression
test("eval")
a = 1
myprint(eval("1+2+a"))

# exec(object[, globals[, locals]])
test("exec")
exec("b = 1")
myprint(b)

# filter(function, iterable)
test("filter")
myprint([x for x in filter(lambda x : x % 2 == 0, [1, 2, 3, 4])])
# supplement : itertools.filterfalse()
from array import array
from io import TextIOWrapper
from itertools import filterfalse
myprint([x for x in filterfalse(lambda x : x % 2 == 0, [1, 2, 3, 4])])

# class float([x]), return float number from number or string
# for normal object: call __float__, if not exist, call __index__ instead, else fail
test("float")
myprint(float("  -1234.5   "))
myprint(float("1.4e300"))
myprint(float("-InfInItY")) # case non-sensitive
myprint(float("+InF"))
class MyFloat:
    def __init__(self, val) -> None:
        self._val = val
    def __float__(self):
        return self._val * 10
class MyInt:
    def __init__(self, val):
        self._val = int(val)
    def __index__(self):
        return self._val * 10

myprint(float(MyFloat(10.0)))
myprint(float(MyInt(100)))

# format()
test("format")
myprint(format(101, "#X"))

# class frozenset([iterable]), as inner elemnt of set, if there is a nested set
# class set([iterable])
test("set frozenset")
myprint({frozenset([1, 2]), frozenset([2, 3])})
myprint(frozenset([1, 2, 3, 3, 4]))
myprint(set([1, 2, 3, 4]))

# globals() : dict of global symbol table
test("globals")
myprint(globals())

# hash(object) : get hash value, call object.__hash__()
test("hash")
myprint(hash(object))
myprint(hash(1))
myprint(hash(1.10))

# hex(x) : integer to hex lower-case string with 0x prefix
test("hex")
myprint(hex(255))
myprint(hex(46543468463545343))

# id(object) : id of a oejct, unique and constant in it's lifetime
test('id')
myprint(id(object))
myprint(id(1))
myprint(id(1 + 2))

# input([prompt]) : write prompt to stdout and read one line from input
test("input")
# a = input("input a integer: ")
# myprint(a)

# class int([x])
# class int(x, base=10)
# __int__, __index__, __trunc__
test('int')
myprint(int("10", base = 8))
myprint(int(10.07))
myprint(int())

# RTTI
# isinstance(object, classinfo)
# issubclass(class, classinfo)
class Person:
    pass
class Student(Person):
    pass
test("isinstance issubclass")
myprint(isinstance(Student(), (Student, object)))
myprint(isinstance(1, object))
myprint(issubclass(Student, Person))
myprint(issubclass(int, object))

# iter(object[, sentinel]) : __iter__(), __getitem__()
test("iter")
myprint(iter([]))
myprint(iter({}))
myprint(iter({1, 2}))

# len(s) : __len__
test("len")
myprint(len([]))
myprint(len({1, 2}))

# locals() : local symbol table, do not modify
test("locals")
myprint(locals())
myprint(globals() == locals()) # True
class Person:
    name = "Kim"
    age = 10
    def __init__(self, *args, **kwargs):
        pass
    myprint(locals())

# map(function, iterable, ...)
from itertools import starmap
test("map")
myprint([elem for elem in map(lambda x, y: x * y, [x for x in range(10)], [y for y in range(0, -10, -1)])])
myprint([elem for elem in starmap(lambda x, y: x * y, [(x, -x) for x in range(10)])]) # element for func are tuples

# max(iterable, *[, key, default])
# max(arg1, arg2, *args[, key])
# min(iterable, *[, key, default])¶
# min(arg1, arg2, *args[, key])
test('max min')
myprint(max([1, 2, 3], key = lambda x : -x))
myprint(max(1, 2, 3))

# class memoryview(object) : memory view of an object
test("memoryview")
myprint(memoryview(b"\xffasdfl")[1])

# next(iterator[, default]) : call __next__ of iterator, return defualt at end, if no defualt, raise StopIteration
test("next")
try:
    it = iter([1, 2, 3, 4])
    while True:
        myprint(next(it))
except StopIteration as e:
    myprint(e.value)

# class object
test('object')
myprint(object())

# oct(x) : to octal number with a 0o prefix
test("oct")
myprint(oct(0xff), oct(10), oct(8), oct(0o77))

# open(file, mode='r', buffering=- 1, encoding=None, errors=None, newline=None, closefd=True, opener=None) : open file
test("open")
with open("BuiltInFuncs.py", mode = "r") as f:
    from functools import reduce
    myprint(reduce(lambda x, y: x + 1, f, 0)) # get line of current file

# pow(base, exp[, mod])
test("pow")
myprint(pow(10, 3, 512))
myprint(pow(10, 100)) # equals to 10 ** 100

# class property(fget=None, fset=None, fdel=None, doc=None)
test("property")
class C:
    def __init__(self):
        self._x = None
    def getx(self):
        return self._x
    def setx(self, value):
        self._x = value
    def delx(self):
        del self._x
    x = property(getx, setx, delx, "I'm the 'x' property.") # defoine a delegate property
c = C()
c.x = 10
myprint(c.x)
del c.x
# myprint(c.x) # will failed

# or use as decorator, equals to definition of C
class D:
    def __init__(self):
        self._x = None
    @property
    def x(self):
        """I'm the 'x' property.""" # doc
        return self._x
    @x.setter
    def x(self, value):
        self._x = value
    @x.deleter
    def x(self):
        del self._x
d = D()
d.x = 10
myprint(d.x)
del d.x
# myprint(d.x)

# reversed(seq) : __reversed__ or (__len__ and __getitem__)
test("reversed")
myprint([x for x in reversed(range(10))])

# round(number[, ndigits])
test("round")
myprint(round(2.346, 2))

# class slice(stop)
# class slice(start, stop[, step])
test("slice")
myprint(slice(10))
myprint(slice(0, 10, 2))
myprint([x for x in range(10)][slice(0, 10, 2)])

# sorted(iterable, *, key=None, reverse=False)
test("sorted")
import random
L = [x for x in range(100)]
random.shuffle(L)
myprint(L)
myprint(sorted(L, key = lambda x : -x, reverse = True))

# @staticmethod, change a method to static method, will not pass class or object implicitly
# just like static method in java/method
test("@staticmethod")
class A:
    @staticmethod
    def f(x):
        return x * x
    def f2(x): # just like f
        return -x
myprint(A.f) # <function A.f at 0x00000224C076DE50>
myprint(A.f(20))
myprint(A.f2) # <function A.f2 at 0x000001F22345DEE0>
myprint(A.f2(-10))

# class str(object='')
# class str(object=b'', encoding='utf-8', errors='strict')
test("str")
myprint(str("hello"))
myprint(str(b"\x7fasdf"))

# sum(iterable, /, start=0)
test("sum")
myprint(sum([x for x in range(11)], 0))
myprint(sum([[x for x in range(10)], [x for x in range(30, 40)], [10, 100, 1000, 10000]], [])) # to one dim array

# class super([type[, object-or-type]])
# return a proxy object, delegate a method call to father or brother class
test("super")
class A:
    def foo(self):
        myprint("foo in A")
class B(A):
    def foo(self):
        myprint("foo in B")
class C(A):
    def foo(self):
        myprint("foo in C")
class D(B, C):
    def foo1(self):
        super().foo() # B, super(D, self).foo()
    def foo2(self):
        super(B, self).foo() # C
    def foo3(self):
        super(C, self).foo() # A
    def foo4(self):
        super(C, D).foo(self) # A
    def foo5(self):
        super(B, D).foo(self) # C

myprint(D.__mro__) # D -> B -> C -> A
D().foo() # B
D().foo1() # B
D().foo2() # C
D().foo3() # A
D().foo4() # A
D().foo5() # C

# class tuple([iterable])
test("tuple")
myprint(tuple([1, 2, 3]))

# class type(object), get type of object
# class type(name, bases, dict, **kwds), return a new type
test("type")
myprint(type(1))
Coord = type("Coord", (object, ), dict(x = 1, y = 2, res = lambda x, y : x + y))
myprint(Coord)
myprint(Coord.x, Coord.y, Coord.res(1, 2))

# zip(*iterables, strict=False)
test("zip")
myprint(list(zip([x for x in range(10)], [chr(a) for a in range(ord('a'), ord('z'), 2)], [10 ** x for x in range(10)])))
x, y = zip(*zip([1, 2, 3], [4, 5, 6])) # disassemable a tuple list to seperate tuple
myprint(x, y)

# __import__(name, globals=None, locals=None, fromlist=(), level=0)
# import statement will call