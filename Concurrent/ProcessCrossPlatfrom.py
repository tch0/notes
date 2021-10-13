# -*- coding: utf-8 -*-

from multiprocessing import Process
import os

# subprocess will execute
def run_proc(name):
    print(f"Run child process {name} ({os.getpid()})...")

if __name__ == "__main__":
    print(f"Parent process {os.getpid()}.")
    p = Process(target = run_proc, args = ('test', ))
    print("Child process will start.")
    p.start()
    p.join()
    print("Child process end.")