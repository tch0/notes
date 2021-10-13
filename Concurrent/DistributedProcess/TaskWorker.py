# -*- coding: utf-8 -*-
# TaskWorker.py

# distributed multi process, task wroker
import time, sys, queue
from multiprocessing.managers import BaseManager

class QueueManager(BaseManager):
    pass

if __name__ == '__main__':
    QueueManager.register('get_task_queue')
    QueueManager.register('get_result_queue')
    server_addr = "127.0.0.1"
    print(f"Connect to server {server_addr}...")
    m = QueueManager(address=(server_addr, 5000), authkey=b'abc')
    # connect manager obejct to server
    m.connect()
    # get Queue from network
    task = m.get_task_queue()
    result = m.get_result_queue()
    # get task from task queue, calculate and put result to result queue
    for i in range(10):
        try:
            n = task.get(timeout=1)
            print(f"Run task {n} * {n}...")
            r = f"{n} * {n} = {n * n}"
            time.sleep(1)
            result.put(r)
        except queue.Empty:
            print("task queue is empty.")
    
    # end wrok process
    print("Worker exit.")
