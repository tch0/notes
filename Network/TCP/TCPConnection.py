# -*- coding: utf-8 -*-


import socket

# create a socket: AF_INET -> ipv4, SOCK_STREAM -> TCP
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('www.baidu.com', 80))

# send a request
s.send(b'GET / HTTP/1.1\r\nHost: www.baidu.com\r\nConnection: close\r\n\r\n')

# receive data
buffer = []
while True:
    # 1 KB every time
    d = s.recv(1024)
    if d:
        buffer.append(d)
    else:
        break
data = b''.join(buffer)
s.close()

header, html = data.split(b'\r\n\r\n')
print(header.decode('utf-8'))
with open('baidu.html', 'wb') as f:
    f.write(html)