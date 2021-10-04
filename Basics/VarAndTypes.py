# -*- coding: utf-8 -*-

# int
print(100_100)
print(0xFFFF_FFFF)
print(0xffff_ffff_ffff_ffff)
print(0xffff_ffff_ffff_ffff_ffff)
print(1234123423421324132341233541251134323145231)

# float
print(1.324e10)
print(1.234213e300)
print(1.1321e303)
print(1.132423e309) # inf IEEE 754 64 bit
print(1.324e135434134356143_131435143541313135135135145) # inf

# string
print("hello")
print(r"\\\r\t\nhello") # raw string
print("\r\nhello\ttest")
print("""\
        hello
        world
        asdfas
        asdf
        shit
""")

# bool
print(True)
print(False)
print(True and False)
print(True or False)

# none
print(None)

# variable
name = "nephren"
# dynamic type, reference type
a = "ABC"
b = a
b = "abc"
print(a, b)

# 中文标识符
你好 = "你好"
print(你好)