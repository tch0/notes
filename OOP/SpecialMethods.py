# -*- coding: utf-8 -*-

from typing import Iterable, Iterator

# more about special methods and attributes: https://docs.python.org/zh-cn/3/reference/datamodel.html#special-method-names

# __str__
class Person:
    def __init__(self, name, age) -> None:
        self.name = name
        self.age = age
    def __str__(self) -> str:
        return f"Person: name: {self.name}, age: {self.age}"
    __repr__ = __str__
    def __call__(self):
        print(f"Call from Person object")

if __name__ == "__main__":
    print(Person("Adam", 20))
    Person("Adam", 18)()