import mysql.connector

with mysql.connector.connect(host = 'localhost', user = 'root', password = 'aojue', database = 'test') as conn:
    cursor = conn.cursor()
    cursor.execute('select * from students')
    values = cursor.fetchall()
    for x in values:
        print(x)
    cursor.execute("show tables")
    for x in cursor:
        print(x)
    cursor.close()

import pymysql
with pymysql.connect(host = 'localhost', user='root', password='aojue', database='test') as conn:
    cursor = conn.cursor()
    cursor.execute('select * from students')
    values = cursor.fetchall()
    for x in values:
        print(x)
    cursor.execute("show tables")
    for x in cursor:
        print(x)
    cursor.close()