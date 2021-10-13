# -*- coding: utf-8 -*-

from multiprocessing import Process, Queue
import os, time, random

# write to queue
def write(q):
    print(f"Process to write : {os.getpid()}")
    for value in ['A', 'B', 'C']:
        print(f"Put {value} in queue...")
        q.put(value)
        time.sleep(random.random())

# read from queue
def read(q : Queue):
    print(f"Process to read : {os.getpid()}")
    while True:
        value = q.get(True) # block = True
        print(f"Get value {value} from queue.")

if __name__ == "__main__":
    # create queue and pass to subprocess
    q = Queue()
    pw = Process(target=write, args=(q,))
    pr = Process(target=read, args=(q,))
    # start subprocess to write
    pw.start()
    # start subprocess to read
    pr.start()
    # wait pw end
    pw.join()
    # pr is infinite loop, can not end by itself, must be terminated.
    pr.terminate()
