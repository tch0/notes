# -*- coding: utf-8 -*-

import subprocess

p = subprocess.Popen(['python', '-c', 'print("hello,world!")'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
out, err = p.communicate()
print(out.decode("utf-8"), err.decode("utf-8"))
print("exit code: ", p.returncode)