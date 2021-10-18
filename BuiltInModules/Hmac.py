# -*- coding: utf-8 -*-

# hashing for message authentication
import hmac
import hashlib
message = b"hello,world!"
key = b"sercet"
h = hmac.new(key, message, digestmod="MD5")
print(h.hexdigest())

h = hmac.new(key, message, digestmod="SHA1")
print(h.hexdigest())

h = hmac.new(key, message, digestmod="SHA256")
print(h.hexdigest())

h = hmac.new(key, message, digestmod="SHA512")
print(h.hexdigest())