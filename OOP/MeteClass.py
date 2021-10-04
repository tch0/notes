# -*- coding: utf-8 -*-


# create class dynamically using type()
def fn(self, name = "world"):
    print(f"hello, {name}!")

Hello = type("Hello", (object, ), dict(hello = fn))

h = Hello()
h.hello()
print(type(h)) # <class '__main__.Hello'>
print(Hello)


# create class dynamically using metaclass

# first define metaclass, derived from type
class ListMetaClass(type):
    def __new__(cls, name, bases, attrs):
        attrs['add'] = lambda self, value: self.append(value)
        return type.__new__(cls, name, bases, attrs)
    
# create class using metaclass
class MyList(list, metaclass = ListMetaClass):
    pass

print(MyList) # <class '__main__.MyList'>
print(type(MyList)) # <class '__main__.ListMetaClass'>
print(type(ListMetaClass)) # <class 'type'>

l = MyList()
l.add(10)
l.add(100)
print(l) # [10, 100]