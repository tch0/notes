# -*- coding: utf-8 -*-

import socket, threading, time

def tcplink(sock, addr):
    print('Accept new connection from %s:%s...' % addr)
    sock.send(b"Welcome!")
    while True:
        data = sock.recv(1024)
        time.sleep(1)
        if not data or data.decode('utf-8') == 'exit':
            break
        sock.send((f"hello {data.decode('utf-8')}").encode('utf-8'))
    sock.close()
    print("Connection from %s:%s closed." % addr)

if __name__ == "__main__":
    # create a socket: Ipv4, TCP
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # bind a port
    s.bind(('127.0.0.1', 9999))

    # listen a port, argument is max connection count
    s.listen(5)
    print("waiting for connection...")
    # accept connection from client
    while True:
        # accept a new conection
        sock, addr = s.accept()
        # create a new thread to handle TCP connection
        t = threading.Thread(target=tcplink, args=(sock, addr))
        t.start()
