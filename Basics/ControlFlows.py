# -*- encoding: utf-8 -*-

# if elif else
a = False
b = True
if a:
    print("a is True")
elif b:
    print("b is True")
else:
    print("a and b are False")


# while
n = 1
sum = 0
while (n < 10):
    sum += n
    n += 1
print(sum)

# for
sum = 0
for x in (1, 2, 3):
    sum += x
print(sum)


sum = 0
for x in range(0, 100, 10):
    sum += x
    c = 1
print(sum)
print(x)
print(c) # scope ?

s = ""
for x in range(ord('a'), ord('z') + 1):
    s += chr(x)
print(s)
