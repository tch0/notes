# -*- coding: utf-8 -*-

import chardet
print(chardet.detect(b'Hello, world!'))

data = '你好，世界！'.encode('gbk')
print(chardet.detect(data)) # {'encoding': None, 'confidence': 0.0, 'language': None}, why?

data = '你好，世界！'.encode('utf-8')
print(chardet.detect(data))

data = '最新の主要ニュース'.encode('euc-jp')
print(chardet.detect(data))