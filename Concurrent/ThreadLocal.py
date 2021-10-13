# -*- coding: utf-8 -*-

import threading

class Student():
    def __init__(self, name) -> None:
        self.name = name
    def __str__(self) -> str:
        return f"Student {self.name}"

# create global ThreadLocal object
local_shool = threading.local()

def process_student():
    std = local_shool.student
    print(f"hello, {std} in thread {threading.current_thread().name}")

def process_thread(name):
    local_shool.student = Student(name) # bind thread local object to atrribute of global threading.local object
    process_student()

if __name__ == "__main__":
    t1 = threading.Thread(target=process_thread, args=("Alice",), name="Thread-A")
    t2 = threading.Thread(target=process_thread, args=("Bob",), name="Thread-B")
    t1.start()
    t2.start()
    t1.join()
    t2.join()