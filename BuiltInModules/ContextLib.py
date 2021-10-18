# -*- coding: utf-8 -*-

# with statement
class Query(object):
    def __init__(self, name) -> None:
        self.name = name
    def __enter__(self):
        print('Begin')
        return self
    def __exit__(self, exc_type, exc_value, traceback):
        if exc_type:
            print('Error')
        else:
            print('End')
    def query(self):
        print(f"Query info about {self.name}")

with Query('Bob') as q:
    q.query()


from contextlib import contextmanager

class Query2(object):
    def __init__(self, name):
        self.name = name
    def query(self):
        print(f"Query info about {self.name}")

@contextmanager
def create_query(name):
    print("Begin")
    q = Query2(name)
    yield q
    print('End')

with create_query('Bob') as q:
    q.query()

# application auto generate xml tag
@contextmanager
def tag(name):
    print(f"<{name}>")
    yield
    print(f"</{name}>")

with tag("h1"):
    print("hello")