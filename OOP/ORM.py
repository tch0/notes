# -*- coding: utf-8 -*-

# a simple ORM(Object Relational Mapping) framwork
# maping one line in database to an object, a table to a class
# define a class according to the data dynamically.

# ORM frame Model
class Field(object):
    def __init__(self, name, column_type):
        self.name = name
        self.column_type = column_type
    def __str__(self):
        return f"<{self.__class__.__name__}:{self.name}>"

class StringField(Field):
    def __init__(self, name):
        super(StringField, self).__init__(name, 'varchar(100)')

class IntegerField(Field):
    def __init__(self, name):
        super(IntegerField, self).__init__(name, 'bigint')

class ModelMetaClass(type):
    def __new__(cls, name, bases, attrs):
        if name == 'Model':
            return type.__new__(cls, name, bases, attrs)
        print(f'Found Model: {name}')
        mappings = dict()
        for k, v in attrs.items():
            if isinstance(v, Field):
                print(f'Found mapping: {k} => {v}')
                mappings[k] = v
        for k in mappings.keys(): # delete class attributes from table class.
            attrs.pop(k)
        attrs['__mappings__'] = mappings # save the mapping between atrribute and column
        attrs['__table__'] = name # name of table, assume that is same as class name
        return type.__new__(cls, name, bases, attrs)

# derived from dict, add an attribute will add to dict
class Model(dict, metaclass = ModelMetaClass):
    def __init__(self, **kw):
        super(Model, self).__init__(**kw)

    def __getattr__(self, key):
        try:
            return self[key]
        except KeyError:
            raise AttributeError(f"'Model' objct has no attribute {key}")

    def __setattr__(self, key, value) -> None:
        self[key] = value

    def save(self):
        fields = []
        params = []
        args = []
        for k, v in self.__mappings__.items():
            fields.append(v.name)
            params.append('?')
            args.append(getattr(self, k, None))
        sql = f"insert into {self.__table__} ({','.join(fields)}) values {','.join(params)}"
        print(f"SQL: {sql}")
        print(f'ARGS: {args}')

    # other operations like: delete, find, update, ...


# using like this
# map to table User
class User(Model):
    id = IntegerField('id')
    name = StringField("username")
    email = StringField("email")
    password = StringField("password")

# create instance, map to one line in table User
u = User(id = 12345, name = "Adam", email = "Adam@orm.org", password = "my-passwd")
# save to databse
u.save()
