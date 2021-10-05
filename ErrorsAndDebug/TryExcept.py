# -*- coding: utf-8 -*-

import logging
def f():
    try:
        a = 10 / 0
    except ValueError as e:
        print("except :", e)
        raise
    except ZeroDivisionError as e:
        print('except: ', e)
        raise
    finally:
        print("finally...")

def main():
    try:
        f()
    except Exception as e:
        logging.exception(e) # log error and continue to execute

if __name__ == "__main__":
    main()

    print("END")
