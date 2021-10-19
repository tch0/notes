# -*- coding: utf-8 -*-

import socket, time

# create a socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 9999))

# send requests
print(s.recv(1024).decode('utf-8'))
for data in [b"Alice", b"Bob", b"Mary"]:
    s.send(data)
    print(s.recv(1024).decode('utf-8'))
s.send(b'exit')
s.close()