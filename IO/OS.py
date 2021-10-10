# -*- coding: utf-8 -*-

import os
import shutil

print(os.name) # posix fox Unix-like, nt for windows

# prrint(os.uname()) # detailed system info, do not support in windows

print(os.environ) # all environment variables
print(os.environ.get("path")) # get specific environment variable


# file and directory operations
print(os.path.abspath('.'))
print(os.path.join('..', "test", "hello")) # ../test/hello in Unix-like, ..\test\hello in windows
print(os.path.split("./test/hello.txt"))
print(os.path.splitext("./test/hello.txt"))

# crate and remove dir file
try:
    os.mkdir("./test")
except:
    pass
shutil.copyfile("./OS.py", "./test/OS.py")

testdir = "./test"
for f in os.listdir(testdir):
    os.remove(os.path.join(testdir, f))
os.rmdir(testdir)

# list all files in .
print(os.listdir('.'))
