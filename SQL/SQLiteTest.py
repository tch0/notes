# -*- coding: utf-8 -*-

import sqlite3

import sqlite3

# connect to sqlite3 database, the database is file test.db, if not exist, will create a new file
with sqlite3.connect('test.db') as conn:
    # creat a cursor
    cursor = conn.cursor()
    # execute SQL
    cursor.execute('drop table if exists user')
    cursor.execute('create table user (id varchar(20) primary key, name varchar(20), score int)')
    cursor.execute(r'insert into user (id, name, score) values ("1", "Michael", 90)')
    cursor.execute(r'insert into user (id, name, score) values ("2", "Kim", 80)')
    cursor.execute(r'insert into user (id, name, score) values ("3", "Bob", 65)')

    print(cursor.rowcount)

    # querys
    cursor.execute('select * from user where id=? or id=?', ('1','2'))

    values = cursor.fetchall()
    print(values)

    # close 
    cursor.close() # not necessary, __del__ will close automatically
    conn.commit()

    def get_score_in(con, min, max):
        cursor = conn.cursor()
        cursor.execute(r'select name from user where score >= ? and score <= ?', (min, max))
        values = cursor.fetchall()
        cursor.close()
        return [v[0] for v in values]

    assert get_score_in(conn, 85, 100) == ['Michael']
    assert get_score_in(conn, 70, 100) == ['Michael', 'Kim']
    assert get_score_in(conn, 60, 100) == ['Michael', 'Kim', 'Bob']