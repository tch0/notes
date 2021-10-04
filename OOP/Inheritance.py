# -*- coding: utf-8 -*-

class Person:
    def __init__(self, name, age) -> None:
        super().__init__()
        self.__name = name
        self.age = age
    def sayHello(self):
        print("hello in Person")
    def getName(self):
        return self.__name
    def getAge(self):
        return self.age
    def hi():
        print("hi in Person")

class Student(Person):
    def __init__(self, name, age, score) -> None:
        super().__init__(name, age)
        self.__name = "default" # new variable, not the __name from Person
        self.age = 20
        self.__score = score
    def sayHello(self): # override
        super().sayHello()
        print("hello in Student")
    def getName2(self):
        return self.__name
    def getAge2(self):
        return self.age
    def hi():
        print("hi in Student")

p = Person("lisa", 18)
p.sayHello()

s = Student("lisa", 18, 100)
s.sayHello()
print(s._Person__name) # lisa
print(s._Student__name) # default
print(s.getAge()) # 20
print(s.getAge2()) # 20
print(isinstance(s, Person)) # True
print(isinstance(s, object)) # True

Student.hi()
Person.hi()

print(isinstance(1, object)) # True
print(isinstance(None, object)) # True
print(isinstance("hello", object)) # True
print(isinstance(True, object)) # True