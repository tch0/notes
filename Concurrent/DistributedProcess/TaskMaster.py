# -*- coding: utf-8 -*-
# TaskMaster.py

# distributed multi process, task manager
import random, time, queue
from multiprocessing.managers import BaseManager

# queue that send tasks
task_queue = queue.Queue()
# queue that receive tasks
result_queue = queue.Queue()

class QueueManager(BaseManager):
    pass

def get_task_q():
    return task_queue
def get_result_q():
    return result_queue

if __name__ == '__main__':
    # register two queues to network
    QueueManager.register('get_task_queue', callable=get_task_q)
    QueueManager.register('get_result_queue', callable=get_result_q)
    # bind to port 5000, authentication code abc
    manager = QueueManager(address=('127.0.0.1', 5000), authkey=b'abc')

    # start the manager
    manager.start()
    # get Queue object through network
    task = manager.get_task_queue()
    result = manager.get_result_queue()

    # put some tasks to task queue
    for i in range(10):
        n = random.randint(0, 10000)
        print(f"Put task {n}")
        task.put(n)

    # read result from result queue
    print("Try get results...")
    for i in range(10):
        try:
            r = result.get(timeout=10)
            print(f"Result : {r}")
        except queue.Empty:
            print("The queue is empty...")

    # shudown manager
    manager.shutdown()
    print("Master exit.")