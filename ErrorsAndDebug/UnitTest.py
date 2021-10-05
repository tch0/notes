# -*- coding: utf-8 -*-

class Dict(dict):
    """
    >>> d1 = Dict()
    >>> d1['x'] = 100
    >>> d1.x
    100
    >>> d1.y = 200
    >>> d1['y']
    200
    >>> d2 = Dict(a=1, b=2, c='3')
    >>> d2.c
    '3'
    >>> d2['empty']
    Traceback (most recent call last):
        ...
    KeyError: 'empty'
    >>> d2.empty
    Traceback (most recent call last):
        ...
    AttributeError: 'Dict' object has no attribute 'empty'
    """
    def __init__(self, **kw):
        super().__init__(**kw)
    def __getattr__(self, key):
        try:
            return self[key]
        except:
            raise AttributeError(f"'Dict' object has no attribute '{key}'")
    def __setattr__(self, key, value):
        self[key] = value

import unittest
class DictTest(unittest.TestCase):
    def test_init(self):
        d = Dict(a = 1, b = "test")
        self.assertEqual(d.a, 1)
        self.assertEqual(d.b, 'test')
        self.assertTrue(isinstance(d, dict))
    
    def test_key(self):
        d = Dict()
        d['key'] = 'value'
        self.assertEqual(d.key, 'value')
    
    def test_attr(self):
        d = Dict()
        with self.assertRaises(KeyError):
            value = d['empty']
        
    def test_attrerror(self):
        d = Dict()
        with self.assertRaises(AttributeError):
            value = d.empty
    
    # call before every test
    def setUp(self) -> None:
        print("setUp()...")

    # call after every test
    def tearDown(self) -> None:
        print("tearDown()...")


if __name__ == '__main__':
    # unittest
    unittest.main()
    # doctest
    import doctest
    doctest.testmod()