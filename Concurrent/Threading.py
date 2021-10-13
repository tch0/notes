# -*- coding: utf-8 -*-

import time, threading

def loop():
    print(f"thread {threading.current_thread().name} is running...")
    for i in range(5):
        print(f"thread {threading.current_thread().name} >>> {i}")
        time.sleep(1)
    print(f"thread {threading.current_thread().name} end.")

if __name__ == "__main__":
    print(f"thread {threading.current_thread().name} is running...")
    t = threading.Thread(target=loop, name="LoopThread")
    t.start()
    t.join()
    print(f"thread {threading.current_thread().name} end.")