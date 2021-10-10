# -*- coding: utf-8 -*-

from io import StringIO, BytesIO

f = StringIO("hello,world!\r\nyes\r\nno\r\n")
while True:
    s = f.readline()
    if s == '':
        break
    print(s.strip())

print(f.getvalue())

f = BytesIO()
f.write("中文".encode('utf-8'))
print(f.getvalue()) # b'\xe4\xb8\xad\xe6\x96\x87'
print(f.tell()) # 6
f.seek(-6, 1) # move current positiont to begin
print(f.read())