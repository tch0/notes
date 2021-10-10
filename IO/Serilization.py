# -*- coding: utf-8 -*-

# pickling and unpickling
import pickle

d = {chr(c) : c for c in range(ord('a'), ord('z') + 1)}
with open("dump.hex", "wb") as f:
    pickle.dump(d, f)
    print(pickle.dumps(d))

with open("dump.hex", 'rb') as f:
    print(pickle.load(f)) # dict

# JSON serilization
import json
with open('dump.json', "wt") as f:
    json.dump(d, f)

with open('dump.json', 'rt') as f:
    print(json.load(f))

# normal object json serilization

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    def __str__(self) -> str:
        return f"Person -> name : {self.name}, age : {self.age}"

def person2dict(p):
    return {
        "name": p.name,
        "age": p.age
    }

def dict2person(d):
    return Person(d['name'], d['age'])

json_str = json.dumps(Person("Kim", 18), default=person2dict)
print(json_str)
print(json.dumps(Person("Jim", 17), default=lambda x : x.__dict__))
print(json.loads(json_str, object_hook=dict2person))

obj = dict(name="小明", age = 20)
print(json.dumps(obj, ensure_ascii=False)) # {"name": "\u5c0f\u660e", "age": 20}, use \uxxxx represent non-ascii character