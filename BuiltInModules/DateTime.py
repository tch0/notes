# -*- coding: utf-8 -*-

from datetime import date, datetime, timedelta, timezone
import re

now = datetime.now()
print(now)
print(type(now)) # <class 'datetime.datetime'>
print(datetime.fromtimestamp(datetime.now().timestamp()))

# epoch time: 1970.01.01 UTC+0 zone 00::00
# timstamp: epoch time to now, unit is seconds, a float point, precision to us
print(datetime.now().timestamp())

# construct specific datetime
dt = datetime(2021, 10, 14, 0, 0, 1)
print(dt)
print(datetime.fromtimestamp(dt.timestamp())) # time in current zone
print(datetime.utcfromtimestamp(dt.timestamp())) # UTC+0:00 time

# user input string to datetime
print(datetime.strptime("2021-1-1 10:00:01", "%Y-%m-%d %H:%M:%S")) # do not have a zone

# datetime to string
print(datetime.now().strftime('%a, %b %d %H:%M'))

# calculate time interval
print(datetime.now() - datetime(2021, 10, 14, 0, 0, 1))
print(datetime.now() - timedelta(1, 1, 1))
print(timedelta(10, 10, 10) - timedelta(1, 1, 1))

# timezone
# UTC+08:00 zone:
print(timezone(timedelta(hours=8)))
print(datetime.now().replace(tzinfo=timezone(timedelta(hours=7))).timestamp()) # enforce to change timezone, do not change date and time

# change timezone
print(datetime.utcnow())
print(datetime.now().astimezone())
print(datetime.now().astimezone(timezone(timedelta(hours=8))).timestamp())

# timestamp from datetime and timezone string
def to_timestamp(dt_str, tz_str):
    dt = datetime.strptime(dt_str, "%Y-%m-%d %H:%M:%S")
    m = re.match(r"(UTC)([-+]\d{1,2}):(\d{2})", tz_str)
    dt = dt.replace(tzinfo=timezone(timedelta(hours=int(m.group(2)))))
    return dt.timestamp()

t1 = to_timestamp('2015-6-1 08:10:30', 'UTC+7:00')
assert t1 == 1433121030.0, t1
t2 = to_timestamp('2015-5-31 16:10:30', 'UTC-09:00')
assert t2 == 1433121030.0, t2