# -*- coding: utf-8 -*-

import os
print(f"porcess {os.getpid()} start ...")

# only works on *nix(Linux/Unix/MacOS)
pid = os.fork()
if pid == 0:
    print(f"This is child process {os.getpid()}, and parent is {os.getppid()}.")
else:
    print(f"This is parent process {os.getpid()}, and just created a child process {pid}")
