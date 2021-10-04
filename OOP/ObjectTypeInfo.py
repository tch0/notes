# -*- coding: utf-8 -*-

import types
from typing import get_args

print(type(1)) # <class 'int'>
print(type(1) == type(13))

print(type(type(1))) # <class 'type'>
print(type(abs)) # <class 'builtin_function_or_method'>
print(type(int)) # <class 'type'>

print(int)

def f():
    pass

# all True
print(type(1) == int)
print(type(type) == type)
print(type(object) == type)
print(type(int) == type)
print(type(f) == types.FunctionType)
print(type(abs) == types.BuiltinFunctionType)
print(type(x for x in range(100)) == types.GeneratorType)
print(type([].append) == types.BuiltinMethodType)
print(type(lambda x : x) == types.LambdaType)

# isinstance
print(isinstance([], (list, tuple)))

print("===============================")
# dir, getattr(), setattr(), hasattr()
class Person():
    className = "Person"
    def __init__(self, name) -> None:
        self.name = name
    def sayHi(self):
        print(f"hi, {self.name}")
    def sayHello():
        print("hello")

p = Person("Adam")
print(dir(p))
print(hasattr(p, "name"))
setattr(p, "age", 10)
print(p.age)
print(getattr(p, "age"))
print(getattr(p, "nonexist", "default value"))

f = getattr(Person, "sayHello")
f()
print(f) # <function Person.sayHello at 0x0000023E6318C670>
f = getattr(p, "sayHi")
f()
print(f) # <bound method Person.sayHi of <__main__.Person object at 0x000001AC29507E50>>

print(p.className)
print(Person.className)