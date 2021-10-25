import asyncio
import threading

@asyncio.coroutine
def hello(n):
    print(f'hello,world! from {threading.currentThread()}, n = {n}')
    r = yield from asyncio.sleep(1)
    print(f'hello,again! from {threading.currentThread()}, n = {n}')

loop = asyncio.get_event_loop()
# execute coroutine
tasks = [hello(1), hello(2)]
loop.run_until_complete(asyncio.wait(tasks))
loop.close()