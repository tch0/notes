# -*- coding: utf-8 -*-

from enum import Enum, unique
WeekDay = Enum('WeekDay', ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))

print(WeekDay)
print(WeekDay.Monday)
print(WeekDay['Tuesday'])

# more precise control about enum
@unique
class WeekD(Enum):
    Sun = 0
    Mon = 1
    Tue = 2
    Wed = 3
    Thu = 4
    Fri = 5
    Sat = 6
print(WeekD) # <enum 'WeekD'>
print(WeekD.Sun)
print(WeekD["Tue"])
print(WeekD(1))
print(WeekD.Fri.value)

for name, member in WeekD.__members__.items():
    print(name, "->", member)