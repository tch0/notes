# -*- coding: utf-8 -*-

class Person(object):
    def __init__(self, name, age) -> None:
        super().__init__()
        self.name = name
        self.age = age
        self.__gender = "female"
    def put(self):
        print(f"name: {self.name}, age: {self.age}")
    def hi(self):
        print("hello, self")
        self.put()
        Person.hello()
    def hello():
        print("hello")

p = Person("lisa", 10)
p.__init__("Adam", 20)
p.put()
p.hi()
Person.hello()

# add property dynamically
p.gender = "male"
print(p.gender)
print(p._Person__gender) # decorated name