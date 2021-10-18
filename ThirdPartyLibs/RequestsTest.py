# -*- coding: utf-8 -*-

import requests
r = requests.get('https://baidu.com')
print(r.status_code)
print(r.text)
print(r.encoding)
print(r.content.decode('utf-8'))
