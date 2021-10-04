# -*- coding: utf-8 -*-

class A(object):
    def foo(self):
        print('A foo')
    def bar(self):
        print('A bar')

class B(object):
    def foo(self):
        print('B foo')
    def bar(self):
        print('B bar')

class C1(A, B):
    pass

class C2(A, B):
    def bar(self):
        super().bar()
        print('C2-bar')

class D(C1, C2):
    pass

if __name__ == '__main__':
    print(D.__mro__) # (<class '__main__.D'>, <class '__main__.C1'>, <class '__main__.C2'>, <class '__main__.A'>, <class '__main__.B'>, <class 'object'>)
    d = D()
    d.foo() # A foo
    d.bar() # C2-bar