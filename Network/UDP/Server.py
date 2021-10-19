# -*- coding: utf-8 -*-

import socket

# create a socket: IPv4, UDP
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
# bind to port
s.bind(('127.0.0.1', 9999))
print("Bind UDP on 9999...")

# do not need listen, just receive
while True:
    data, addr = s.recvfrom(1024)
    print("Received from %s:%s" % addr)
    s.sendto(b'hello, %s' % data, addr)