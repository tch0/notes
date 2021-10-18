# -*- coding: utf-8 -*-

import base64

print(base64.b64encode(b'helloworld'))
print(base64.b64decode(b'aGVsbG93b3JsZA=='))

# safe url encoding and decoding
print(base64.b64encode(b'\xff\xff\xff', altchars=b"-_"))
print(base64.b64decode(b'____', altchars=b"-_"))

# euqals to
print(base64.urlsafe_b64encode(b'\xff\xff\xff'))
print(base64.urlsafe_b64decode(b'____'))