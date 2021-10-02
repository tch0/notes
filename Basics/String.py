# -*- encoding: utf-8 -*-

# string encoding
print('\u4e2d\u6587') # unicode escape
print(chr(74562))
print(ord("𒍂"))
print("asf中文".encode("utf-8"))
print(b'asf\xe4\xb8\xad\xe6\x96\x87'.decode("utf-8")) # bytes

# string format
name = "michael"
age = 18
print("name = %s, age = %2d, %% {{ }}" % (name, age))

# format()
print("name = {0}, age = {1:2.3f} {{ }}".format(name, age))
print(f"name = {name}, age = {age:2.3f} {{ }}")
