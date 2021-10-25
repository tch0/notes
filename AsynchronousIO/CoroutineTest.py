def consumer():
    print("hello")
    r = ''
    while True:
        n = yield r # get message through return value of yield
        if not n:
            return
        print('[CONSUMER] Consuming %s...' % n)
        r = '200 OK'

def produce(c):
    c.send(None) # start generator, will first call generator, print hello, then run to first yield
    n = 0
    while n < 5:
        n = n + 1
        print('[PRODUCER] Producing %s...' % n)
        r = c.send(n)
        print('[PRODUCER] Consumer return: %s' % r)
    c.close() # close generator

c = consumer()
produce(c)