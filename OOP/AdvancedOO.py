# -*- coding: utf-8 -*-

from types import MethodType
from typing import SupportsAbs
from functools import partial

# bind attribute to obejct dynamically
class Person:
    def __init__(self, *args, **kwargs) -> None:
        self.age = kwargs.pop("age")

def setAge(self, age):
    self.age = age
def getAge(self):
    return self.age
def hello():
    print("hello")

# bind to a single object
p = Person(age = 20)
p.setAge = MethodType(setAge, p)
p.getAge = MethodType(getAge, p)
p.setAge(10)
print(p.age) # 10
print(p.getAge()) # 10

# bind to class
Person.setAge = MethodType(setAge, Person)
Person.getAge = MethodType(getAge, Person)
Person.setAge(18)
print(Person.getAge()) # 18
print(Person.age) # 18

# bind instance method to class
Person.setAge = setAge
p = Person(age = 10)
p.setAge(100)
print(p.age) # 100
print(p.getAge()) # 18
Person.getAge = getAge
print(p.getAge()) # 100


# __slots__
class Student(object):
    __slots__ = ("name", "age", "getName")
    def getAge(self):
        return self.age

s = Student()
s.age = 10
s.name = "Adam"

def getName(self):
    return self.name

s2 = Student()
s2.age = 20
s2.name = "lisa"
s2.getName = MethodType(getName, s)
print(s2.getName()) # Adam

# bound method & function
s = Student()
s.age = 10
f = s.getAge
print(f) # <bound method Student.getAge of <__main__.Student object at 0x000001993E72F800>>
print(Student.getAge) # <function Student.getAge at 0x000001A601B2CAF0>
print(f()) # 10
print(Student.getAge(s)) # 10

# define a function just like MethodType
def MyMethodType(f, obj):
    return partial(f, self = obj)

print(MyMethodType(getAge, s))
Student.getName = MyMethodType(getName, Student)
Student.getName()
Student.name = "hello"
print(Student.name)
