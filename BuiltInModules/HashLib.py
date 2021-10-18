# -*- coding: utf-8 -*-

import hashlib

# hashlib

# md5
# result: 128bit byte, usually denoted with a hex charcter string which length is 32
md5 = hashlib.md5()
print(md5)
md5.update('how to use md5 in python hashlib?'.encode('utf-8'))
print(md5.hexdigest())

# call update multiple times, equals to call it one time
md5 = hashlib.md5()
md5.update('how to use md5 in '.encode('utf-8'))
md5.update('python hashlib?'.encode('utf-8'))
print(md5.hexdigest())

md5 = hashlib.md5()
md5.update('how to use md5 in python hashlib'.encode('utf-8')) # modify one character, will cause a totally different result
print(md5.hexdigest())


# sha1
# same as md5
# result: 160 bit, hex character which length is 40
sha1 = hashlib.sha1()
sha1.update('how to use sha1 in '.encode('utf-8'))
sha1.update('python hashlib?'.encode('utf-8'))
print(sha1.hexdigest()) 


# sha256 and sha512
sha256 = hashlib.sha256()
sha256.update('how to use md5 in python hashlib?'.encode('utf-8'))
print(sha256.hexdigest())

sha512 = hashlib.sha512()
sha512.update('how to use md5 in python hashlib?'.encode('utf-8'))
print(sha512.hexdigest())