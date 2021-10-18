# -*- coding: utf-8 -*-

import struct

# > big endian
# < little endian
# I 32-bit unsinged integer
# https://docs.python.org/zh-cn/3/library/struct.html#format-characters
print(struct.pack('>I', 10234))
print(struct.unpack('>I', b"\x00\x00'\xfa"))