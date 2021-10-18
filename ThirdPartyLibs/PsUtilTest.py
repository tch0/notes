# -*- coding: utf-8 -*-

import psutil

# CPU info
print(psutil.cpu_count()) # logical cpu count
print(psutil.cpu_count(logical=False)) # physical cpy count
print(psutil.cpu_times())

# print the usage of every cpu core, 5 times in one second
for x in range(5):
    print(psutil.cpu_percent(interval=0.2, percpu=True))

# memory and swap memory info
print(psutil.virtual_memory())
print(psutil.swap_memory())

# internet
print(psutil.net_io_counters())
print(psutil.net_if_addrs()) # port info
print(psutil.net_if_stats()) # port status
print(psutil.net_connections())

# process
print(psutil.pids())
p = psutil.Process(psutil.pids()[-1])
print(p.exe()) # executable of process
print(p.cwd()) # working directory of process
print(p.cmdline()) # cmd line of process
print(p.ppid()) # parent process id
print(p.parent()) # parent process
print(p.children()) # children processes
print(p.status()) # status
print(p.username())
print(p.create_time())
# print(p.terminal()) # Unix only
print(p.cpu_times())
print(p.memory_info())
print(p.connections()) # internet connections
print(p.num_threads())
print(p.threads())
print(p.environ()) # environment variables of process

# like ps command
print(psutil.test())