# -*- coding: utf-8 -*-

class Person:
    __slots__ = ("_age")
    @property
    def age(self):
        return self._age
    @age.setter
    def age(self, value):
        if not isinstance(value, int):
            raise ValueError("age must be a integer!")
        if value < 0:
            raise ValueError("age must non-negative!")
        self._age = value

p = Person()
p.age = 10
print(p.age)
p.age = "18" # ValueError: age must be a integer!