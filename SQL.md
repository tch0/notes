<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [SQL入门](#sql%E5%85%A5%E9%97%A8)
  - [关系数据库](#%E5%85%B3%E7%B3%BB%E6%95%B0%E6%8D%AE%E5%BA%93)
  - [环境配置](#%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE)
  - [关系模型](#%E5%85%B3%E7%B3%BB%E6%A8%A1%E5%9E%8B)
  - [查询数据](#%E6%9F%A5%E8%AF%A2%E6%95%B0%E6%8D%AE)
  - [修改数据](#%E4%BF%AE%E6%94%B9%E6%95%B0%E6%8D%AE)
  - [MySQL](#mysql)
  - [MySQL实用SQL语句](#mysql%E5%AE%9E%E7%94%A8sql%E8%AF%AD%E5%8F%A5)
  - [事务](#%E4%BA%8B%E5%8A%A1)
  - [TODO](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# SQL入门

现代程序员离不开关系数据库，要使用关系数据库就必须掌握SQL。SQL(Structured Query Language)称之为结构化查询语言，是一门典型的DSL。

现在很流行NoSQL，也就是非SQL的数据库，但事实上SQL从始至终都没有被取代过，学习NoSQL之前学习关系数据库也是必须的。

阅读：
- [廖雪峰SQL教程](https://www.liaoxuefeng.com/wiki/1177760294764384)
- [SQL教程 | 菜鸟教程](https://www.runoob.com/sql/sql-tutorial.html)

## 关系数据库

为什么要使用数据库？
- 随着应用程序的功能越来越复杂，数据量越来越大，如果管理数据就成为了大问题。
- 读取文件并解析数据需要大量重复代码。
- 从大量数据中快速查询指定数据需要大量复杂的逻辑。
- 每个应用程序都有各自读写数据的代码，效率低容易出错。
- 每个程序访问数据的接口各不相同，数据难以复用。
- 所以数据库出现了，作为专门管理数据的程序，应用程序通过数据库提供的接口来读写数据，而不需要自己管理数据，至于数据如何存储如何读取，则不需要应用程序自己来考虑。

数据模型：
- 数据库按照组织、存储和管理数据。典型的有三种模型：层次模型、网状模型、关系模型。
- 层次模型的数据结构就是一棵树。
- 网状模型则是一个图，每个数据节点和许多其他节点连接起来。
- 关系模型把数据看做一个二维表格，任何数据都可以通过行号列号唯一确定。

数据库关系模型具有一套复杂的数学理论，以关系为基础，不在这里展开。

举例：
- 所有学生信息可以用一张表表示。

ID|姓名|班级ID|性别|年龄
:-:|:-:|:-:|:-:|:-:
1|小明|201|M|9
2|小红|202|F|8
3|小军|202|M|8
4|小白|201|F|9

- 其中班级ID对应着另一个班级表。

ID|名称|班主任
:-:|:-:|:-:
201|二年级一班|王老师
202|二年级二班|李老师

- 这样，给定一个班级名称，就可通过第二张表查找到班级ID，然后去第一张表中找到这个班中所有学生，二维表之间通过ID映射建立了一对多的关系。

数据类型：
- 对于一个关系表，除了定义每一列名称，还需要定义每一列的数据类型，关系数据库支持的标准数据类型如下：

名称|类型|说明
:-:|:-:|:-:
INT|整型|4字节整数类型，范围约+/-21亿
BIGINT|长整型|8字节整数类型，范围约+/-922亿亿
REAL|浮点型|4字节浮点数，范围约+/-10^38
DOUBLE|浮点型|8字节浮点数，范围约+/-10^308
DECIMAL(M,N)|高精度小数|由用户指定精度的小数，例如，DECIMAL(20,10)表示一共20位，其中小数10位，通常用于财务计算
CHAR(N)|定长字符串|存储指定长度的字符串，例如，CHAR(100)总是存储100个字符的字符串
VARCHAR(N)|变长字符串|存储可变长度的字符串，例如，VARCHAR(100)可以存储0~100个字符的字符串
BOOLEAN|布尔类型|存储True或者False
DATE|日期类型|存储日期，例如，2018-06-22
TIME|时间类型|存储时间，例如，12:20:59
DATETIME|日期和时间类型|存储日期+时间，例如，2018-06-22 12:20:59

- 上表为常用数据类型，许多数据类型还有别名，还有一些不常用数据类型，例如，TINYINT（范围在0~255）。各数据库厂商还会支持特定的数据类型，例如JSON。选择数据类型的时候，要根据业务规则选择合适的类型。通常来说，BIGINT能满足整数存储的需求，VARCHAR(N)能满足字符串存储的需求，这两种类型是使用最广泛的。

主流关系数据库：
- 商用数据库，例如：[Oracle](https://www.oracle.com)，[SQL Server](https://www.microsoft.com/sql-server/)，[DB2](https://www.ibm.com/db2/)等。
- 开源数据库，例如：[MySQL](https://www.mysql.com/)，[PostgreSQL](https://www.postgresql.org/)等。
- 桌面数据库，以微软[Access](https://products.office.com/access)为代表，适合桌面应用程序使用。
- 嵌入式数据库，以[Sqlite](https://sqlite.org/)为代表，适合手机应用和桌面程序。


SQL：
- Structured Query Language，称之为结构化查询语言
- SQL语句既可以查询数据库中的数据，也可以添加、更新和删除数据库中的数据，还可以对数据库进行管理和维护操作。
- 不同数据库都支持SQL。
- 虽然SQL已经被ANSI组织定义为标准，不幸地是，各个不同的数据库对标准的SQL支持不太一致。
- 就是说如果只使用标准SQL，理论上所有数据库都支持，如果是使用某个特定数据库的扩展SQL，那么换一个数据库就不能执行了。
- 但现实情况是，只使用标准SQL的核心功能，所有数据库都可以执行，不常用的功能，不同数据库支持程度不一样。各个数据库支持的各自扩展的功能，通常我们把它们称之为“方言”。
- SQL定义了集中操作数据库的能力：
    - DDL：Data Definition Language，允许用户定义数据，就是创建表、删除表、修改表，通常由数据库管理员执行。
    - DML：Data Manipulation Language，为用户提供添加、删除、更新数据的能力，应用程序对数据库的日常操作。
    - DQL：Data Query Language，允许用户查询数据，通常是最频繁的数据库日常操作。
    - DCL：Data Control Language，对用户访问数据的权限的控制，基本表和视图的授权和回收。
    - TCL：Transaction Control Language，事务控制，事务提交和回滚。
    - 其中DDL、DML、DQL最为常用。
- 语法特点：
    - SQL语言关键字不区分大小写。
    - 针对不同的数据库，对于表名和列名，有的数据库区分大小写，有的数据库不区分大小写。
    - 同一个数据库，有的在Linux上区分大小写，有的在Windows上不区分大小写。
    - 此处SQL关键字总是大写，以示突出，表名和列名均使用小写。

## 环境配置

安装MySQL：
- MySQL是瑞典的MySQLAB公司开发，后被Sun公司收购，Sun后又被Oracle收购，MySQL就变成了Oracle旗下产品。
- MySQL本身实际上只是一个SQL接口，它的内部还包含了多种数据引擎，常用包括：
    - InnoDB：由Innobase Oy公司开发的一款支持事务的数据库引擎，2006年被Oracle收购；
    - MyISAM：MySQL早期集成的默认数据库引擎，不支持事务
    - 接口和数据库引擎的关系就像浏览器和浏览器引擎，对用户而言，切换引擎不影响用户界面。
    - 使用MySQL时，不同的表还可以使用不同的数据库引擎，不知道该如何选择时，选择InnoDB引擎就行。
- MySQL还有其他的开源分支版，比如MariaDB、Aurora、PolarDB。
- 官方版分了好几个版本：社区，标准，企业，集群。社区版免费，其他版本功能和价格依次递增，主要增加监控、集群等管理功能，基本的SQL功能是一致的。
- 安装：
    - Windows：[官网下载](https://dev.mysql.com/downloads/mysql/)，选择版本下载安装，会自动添加环境变量。
    - Linux：`sudo apt install mysql-server`。
    - 安装之后设置密码：`sudo mysqladmin -u root password "newpwd"`
- MySQL安装后会自动后台运行，Linux中启动MySQL：`sudo service mysql restart`。
- 登录MySQL：`mysql -u root -p`输入密码，即可进入MySQL的shell，Linux中可能需要`sudo`。

启动和停止MySQL服务：
- Linux中：
```shell
service mysql status
service mysql start
service mysql stop
service mysql restart
```
- windows中：服务名可以在windows服务`services.msc`中找到，本机上是`MySQL80`。需要管理员权限执行终端。
```shell
net stop mysql80
net restart mysql80
```

Linux中卸载MySQL：
```shell
sudo apt purge mysql-*
sudo rm -rf /etc/mysql/ /var/lib/mysql
sudo apt autoremove
sudo apt autoclean
```


## 关系模型

关于表：
- 表的一行称为记录（Record），记录是一个逻辑意义上的数据。
- 表的一列称为字段（Column），同一个表的每一行记录都拥有相同的若干字段。
- 字段定义了数据类型，以及是否允许为`NULL`，`NULL`表示字段数据不存在。一个整型字段为`NULL`表示不存在而不是为0，其他同理。
- 通常情况下应该避免允许`NULL`，不允许`NULL`可以简化查询条件，加快查询速度，应用程序读取数据后也不需要判断是否为`NULL`。
- 关系数据库的表和表之间需要建立“一对多”，“多对一”和“一对一”的关系，这样才能够按照应用程序的逻辑来组织和存储数据。
- 关系数据库中，关系是通过**主键**和**外键**来维护的。

主键：
- 一行是一条记录，一条记录由若干定义好的字段组成，同一个表的所有记录都拥有相同的字段定义。
- 对于一张表而言，有一个很重要的约束，就是任意两条记录不能重复，不是指两条记录不能完全相同，而是要能够通过某个字段唯一区分出不同记录。这个字段成为**主键**。
- 插入两条主键相同的记录是非法的。
- 对主键的要求：记录一旦被插入到表中，主键最好不要再修改，因为主键是用来唯一定位用的，修改主键会造成一系列影响。
- 如何选取主键将对业务开发产生重要的影响，像用户名、身份证号等唯一的编号似乎能够唯一定位记录，但也同样存在可能修改扩展等对业务产生的风险。
- 所以，选取主键，非常重要的一个基本原则是：**不使用任何业务相关的字段作为主键**。比如身份证号、手机号、邮箱这种看起来可以唯一的字段，都不可以作为主键。
- 一般将主键选为一个业务无关的字段，一般命名为`id`，常见的id可以有：
    - 自增整数，数据库插入数据时自动为每一条记录分配一个自增整数。
    - 全局唯一的GUID：使用全局唯一的一个GUID（一个128的标识符）作为主键，类似于`8f55d96b-8acc-4636-8cb8-76bf8abc2f57`。GUID算法通过网卡MAC地址、时间戳和随机数保证任意计算机在任意时间生成的字符串都是不同的，大部分编程语言都内置了GUID算法，可以自己预算出主键。
- 大部分应用来说，自增类型主键就能满足需求，这里的主键使用`BIGINT NOT NULL AUTO_INCREMENT`，如果用`INT`因为是32位整数，最高到21亿还是有风险的（大部分情况下`INT`可能也够用了）。用`BIGINT`的话实际中不可能有那么多条记录。
- 关系数据库实际上还允许通过多个字段唯一标识记录，即两个或更多的字段都设置为主键，这种主键被称为联合主键。
- 对于联合主键，允许一列有重复，只要不是所有主键列都重复即可。实际上并不常用。
- 没有必要的情况下，应该尽量不使用联合主键，因为提高了表的复杂度。

外键：
- 主键可以表示和记录的一对一关系。
- 外键用来表示一种一对多的关系，比如一个学生有一个唯一的班级，就需要用一个键来表示，就可以用班级表的主键（班级的id）来表示。一个班中可以有多名学生，一个班级id唯一标识了一个班级，在学生表中就有班级id到记录或者说学生id的一对多关系。
- 外键并不通过列名实现，而是通过定义外键约束`FOREIGN KEY`实现：
```sql
ALTER TABLE students
ADD CONSTRAINT fk_class_id
FOREIGN KEY (class_id)
REFERENCES classes (id);
```
- `fk_class_id`是外键约束名称，可以随意，`FOREIGN KEY (class_id)`指定了外键为`calss_id`，`REFERENCES classes (id)`指定了这个外键将关联到`classes`表的`id`列。
- 定义外键约束可以保证无法插入无效的数据，比如`class_id`为空或者不存在于表`classes`中的记录。
- 外键约束会降低数据库性能，大部分互联网应用程序为了追求速度，并不设置外键约束，而是仅靠应用程序自身来保证逻辑的正确性。这种情况下，`class_id`仅仅是一个普通的列，只是它起到了外键的作用而已。
- 删除一个外键约束（并不删除外键这一列，只是这一类不再是外键）：
```sql
ALTER TABLE students
DROP FOREIGN KEY fk_class_id;
```

多对多：
- 主键可以一对一，外键一对多。有些时候，还需要定义多对多关系，多对多关系可以通过关联两个一对多关系实现。
- 比如一个班级可能有多个老师，一个老师也可能教多个班级，已经有一个老师表`teachers`，一个班级表`classes`，可以新增一个`teacher_class`表，将所有老师教某个班级记录插入（两个外键分别是老师的`id`和班级的`id`），就形成了多对多关系。
- `teachers`

id|name
:-:|:-:
1|张老师
2|王老师
3|李老师
4|赵老师

- `classes`

id|name
:-:|:-:
1|一班
2|二班

- `teacher_class`

id|teacher_id|class_id
:-:|:-:|:-:
1|1|1
2|1|2
3|2|1
4|2|2
5|3|1
6|4|2

一对一：
- 除了主键和记录的这种亲而易见的一对一，可能还需要一个表的记录对应到另一个表的唯一一个记录。
- 比如每个学生都可以有自己的唯一联系方式，添加一个`contacts`保存学生id为外键，就可以实现一对一。准确地说是电话对应学生的一对一，而不是学生对应电话的一对一，因为学生有可能没有电话。如果是双向的一对一，那么两张表就可以合并为一张表了。业务允许也可以合并为一张表，然后没有电话的直接为`NULL`就行，但这样对查询性能可能不是很友好。
- 一些应用会将一个大表拆分成两个一对一的表，目的可能只是为了将经常读取和不经常读取的字段分开，以获得更高性能。
- 关系数据库通过外键可以实现一对多、多对多和一对一的关系。外键既可以通过数据库来约束，也可以不设置约束，仅依靠应用程序的逻辑来保证。

索引：
- 在关系数据库中，如果有上万甚至上亿条记录，在查找记录的时候，想要获得非常快的速度，就需要使用索引。
- 索引是关系数据库中对某一列或多列的值进行预排序的数据结构（就是用一部分列作为key做了散列）。通过使用散列可以大大加快查询速度。
- 比如对`name`和`score`两列做索引：
```sql
ALTER TABLE students
ADD INDEX idx_name_score (name, score);
```
- `ADD INDEX idx_name_score (name, score)`创建名为`idx_name_score`，使用列`name score`的索引。
- 索引效率取决于索引项的值是否散列，值越不相同，索引效率越高，如果不同记录这一列存在大量相同的值，那么对该列创建索引意义不大。
- 可以对一张表建立多个索引，索引的优点是提高了查询效率，缺点就是在插入、更新和删除记录时必须要同时修改索引。索引越多，插入更新和删除的速度就越慢。
- 对于主键，关系数据库会自动对其创建主键索引，主键一定唯一，所以使用效率最高。
- 设计数据表时，某些看上去唯一的列，比如身份证号、电话、邮箱等，因为具有业务含义，不用来做主键，但又因为具有唯一性约束，就可以给这种键添加一个唯一索引。查找时效率就会很高。
- 通过`UNIQUE`关键字可以添加唯一索引，这时这一列同时具有了唯一性约束。
```sql
ALTER TABLE students
ADD UNIQUE INDEX uni_email (email);
```
- 如果只添加唯一性约束，而不创建索引，可以使用`ADD CONSTRAINT xxx UNIQUE`：
```sql
ALTER TABLE students
ADD CONSTRAINT uni_email UNIQUE (email);
```
- 无论是否创建索引，对于用户和程序来说，使用关系数据库都不会有任何区别（透明）。索引仅仅是影响查询和修改效率，因此索引可以在使用数据库过程中逐步优化，比如随着用户增多感受到性能压力之后来建立索引。

## 查询数据

准备：
- 建立一个表，后续操作会以这个为基础。
```sql
-- init-test-data.sql
-- 如果test数据库不存在，就创建test数据库：
CREATE DATABASE IF NOT EXISTS test;

-- 切换到test数据库
USE test;

-- 删除classes表和students表（如果存在）：
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS students;

-- 创建classes表：
CREATE TABLE classes (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建students表：
CREATE TABLE students (
    id BIGINT NOT NULL AUTO_INCREMENT,
    class_id BIGINT NOT NULL,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    score INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 插入classes记录：
INSERT INTO classes(id, name) VALUES (1, '一班');
INSERT INTO classes(id, name) VALUES (2, '二班');
INSERT INTO classes(id, name) VALUES (3, '三班');
INSERT INTO classes(id, name) VALUES (4, '四班');

-- 插入students记录：
INSERT INTO students (id, class_id, name, gender, score) VALUES (1, 1, '小明', 'M', 90);
INSERT INTO students (id, class_id, name, gender, score) VALUES (2, 1, '小红', 'F', 95);
INSERT INTO students (id, class_id, name, gender, score) VALUES (3, 1, '小军', 'M', 88);
INSERT INTO students (id, class_id, name, gender, score) VALUES (4, 1, '小米', 'F', 73);
INSERT INTO students (id, class_id, name, gender, score) VALUES (5, 2, '小白', 'F', 81);
INSERT INTO students (id, class_id, name, gender, score) VALUES (6, 2, '小兵', 'M', 55);
INSERT INTO students (id, class_id, name, gender, score) VALUES (7, 2, '小林', 'M', 85);
INSERT INTO students (id, class_id, name, gender, score) VALUES (8, 3, '小新', 'F', 91);
INSERT INTO students (id, class_id, name, gender, score) VALUES (9, 3, '小王', 'M', 89);
INSERT INTO students (id, class_id, name, gender, score) VALUES (10, 3, '小丽', 'F', 85);

-- OK:
SELECT 'ok' as 'result:';
```
- 在`mysql`的shell内执行`\. init-test-data.sql`会导入这个sql文件执行其中语句。
- 新建`test`数据库并在其中创建出如下的表：
```shell
mysql> show tables;
+----------------+
| Tables_in_test |
+----------------+
| classes        |
| students       |
+----------------+
2 rows in set (0.00 sec)

mysql> select * from students;
+----+----------+------+--------+-------+
| id | class_id | name | gender | score |
+----+----------+------+--------+-------+
|  1 |        1 | 小明 | M      |    90 |
|  2 |        1 | 小红 | F      |    95 |
|  3 |        1 | 小军 | M      |    88 |
|  4 |        1 | 小米 | F      |    73 |
|  5 |        2 | 小白 | F      |    81 |
|  6 |        2 | 小兵 | M      |    55 |
|  7 |        2 | 小林 | M      |    85 |
|  8 |        3 | 小新 | F      |    91 |
|  9 |        3 | 小王 | M      |    89 |
| 10 |        3 | 小丽 | F      |    85 |
+----+----------+------+--------+-------+
10 rows in set (0.00 sec)

mysql> select * from classes;
+----+------+
| id | name |
+----+------+
|  1 | 一班 |
|  2 | 二班 |
|  3 | 三班 |
|  4 | 四班 |
+----+------+
4 rows in set (0.00 sec)
```
- 显示所有数据库：`show databses;`
- 切换到`test`数据库：`use test;`
- 显示数据库中的表：`show tables;`
- Windows中再Cmd中执行显示会乱码，在PowerShell中不会。数据都是同样的，显示问题，切换控制台字符页为65001未能解决。


基本查询：
- 查询一张表中所有记录：
```sql
SELECT * FROM <table_name>
```
- `select`可以不跟`from`，比如`select 100 + 200;`则会得到`100+200`的结果。

条件查询：
- 根据某一个条件来查询：
```sql
SELECT * FROM <table_name> WHERE <condition_expression>;
```
- 条件可以是单一的条件比如：`score >= 80`，也可以是复合的条件：使用`AND OR NOT`。
```sql
<cond> AND <cond>
<cond> OR <cond>
NOT <cond>
```
- 要组合三个或以上条件，需要用括号`()`表明逻辑运算符的优先级。
- 如果不加括号，则按照优先级进行运算：`NOT > AND > OR`。
- 常用条件运算符：

条件|表达式举例1|表达式举例2|说明
:-|:-|:-|:-
使用=判断相等|score = 80|name = 'abc'|字符串需要用单引号括起来
使用>判断大于|score > 80|name > 'abc'|字符串比较根据ASCII码，中文字符比较根据数据库设置
使用>=判断大于或相等|score >= 80|name >= 'abc'|
使用<判断小于|score < 80|name <= 'abc'|
使用<=判断小于或相等|score <= 80|name <= 'abc'|
使用<>判断不相等|score <> 80|name <> 'abc'|
使用LIKE判断相似|`name LIKE 'ab%'`|`name LIKE '%bc%'`|%表示任意字符，例如`'ab%'`将匹配`'ab'`，`'abc'`，`'abcd'`，`%`表示0个到多个，`_`表1个。

投影查询：
- 如果只希望结果返回某些列数据，可以使用：
```sql
SELECT <col1>, <col2>, ..., <coln> FROM <table_name> WHERE <condition>;
```
- 称之为投影查询，返回的结果集只会包含指定的列，结果集中列顺序可以和原表中不一致。还可以给每一列起一个别名，结果集显示的就是别名而不是原表中的列名。
```sql
SELECT <col1> [AS] <alias1>, <col2> [AS] <<alias2>, ..., <coln> [AS] <aliasn> FROM <table_name> WHERE <condition>;
```
- 列名和别名中间可以可以加`AS`可以不加。


排序：
- 使用`SELECT`查询时，查询结果通常是按照主键排序的，如果要按照其他条件排序，可以使用`ORDER BY`子句。
```sql
SELECT * from <table_name> ORDER BY <col1> [DESC], <col2> [DESC], ...;
```
- 默认是`ASC`升序排列可以省略，如果在要排序的列名后面加了`DESC`则会逆序也就是降序排列。如果有多个排序的列，那么先按照第一个排序，对于第一个列值相同的记录再按照第二列的值排序，以此类推。
- 如果有`WHERE`子句，那么`ORDER BY`子句放到`WHERE`后面。

分页：
- 当结果集数据量很大时，比如几万条，放在一个页面显示就太大，就需要分页，分页其实就是从中截取出一部分记录。
- 分页可以通过`LIMIT <record_num> OFFSET <start_index>`子句实现，放在`ORDER BY`后面，最多显示`record_num`数量的记录。
```sql
SELECT * from <table_name> ORDER BY ... LIMIT <record_num> OFFSET <start_index>;
```
- 比如得到按成绩排序的开始三条记录：`SELECT * FROM students ORDER BY score DESC LIMIT 3 OFFSET 0;`
- `OFFSET`是可选的，不加`OFFSET`相当于`OFFSET 0`。
- MySQL中，`LIMIT <record_num> OFFSET <start_index>`可以写作`LIMIT <record_num>, <start_index>`。
- 使用`LIMIT <M> OFFSET <N>`分页时，随着`N`越来越大，查询效率会越来越低。

聚合查询：
- SQL提供了专门的聚合函数，比如统计总数、计算平均数等，使用聚合函数进行查询，就是聚合查询，可以快速获得结果。
- 查询一共有多少条记录：聚合结果虽然是一个整数，但是结果依然是一个二维表，只有一行一列，列别名是`COUNT(*)`。
```SQL
SELECT COUNT(*) FROM students;
```
- 使用聚合查询时应该给一个别名，便于处理结果：`SELECT COUNT(*) AS num FROM students`。
- 其中`COUNT(*)`和`COUNT(id)`是一样的结果。
- 聚合查询同样可以使用`WHERE`条件。
- 其他聚合函数：

函数|说明
:-:|:-:
`SUM`|计算某一列的合计值，该列必须为数值类型
`AVG`|计算某一列的平均值，该列必须为数值类型
`MAX`|计算某一列的最大值
`MIN`|计算某一列的最小值

- `MAX MIN`并不限于数值类型，会返回排序最后和最前的值。
- 统计男生的平均成绩可以使用：`SELECT AVG(score) average FROM students WHERE gender = 'M'`。
- 如果`WHERE`没有匹配到任何行，`COUNT()`返回0而`SUM() AVG() MAX() MIN()`返回`NULL`。
- 对于聚合查询，还提供了**分组聚合**的功能。
```sql
SELECT gender, COUNT(*) num FROM students GROUP BY gender;
```
- `GROUP BY`子句指定了分组，执行`SELECT`前会先将表按照`gender`分组，再分别计算，所以会得到两行结果。
```
mysql> SELECT gender, COUNT(*) num FROM students GROUP BY gender;
+--------+-----+
| gender | num |
+--------+-----+
| M      |   5 |
| F      |   5 |
+--------+-----+
2 rows in set (0.00 sec)
```
- 上述一条结果代表了表中的多条记录，`sql_mode`变量中有没有`ONLY_FULL_GROUP_BY`规则将决定查询结果中有不是分组的列时的效果，有的话将报错，没有的话将会显示多条记录中第一条的数据。
```
mysql> set @@sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION,ONLY_FULL_GROUP_BY';  
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> select @@sql_mode;
+---------------------------------------------------------------+
| @@sql_mode                                                    |
+---------------------------------------------------------------+
| ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION |
+---------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT name, gender, COUNT(*) num FROM students GROUP BY gender; 
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'test.students.name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
```
- 也可以使用多个列进行分组，均不同才会看做一组。
```sql
SELECT class_id, gender, COUNT(*) num FROM students GROUP BY class_id, gender;
```
- 结果：
```
mysql> SELECT class_id, gender, COUNT(*) num FROM students GROUP BY class_id, gender;
+----------+--------+-----+
| class_id | gender | num |
+----------+--------+-----+
|        1 | M      |   2 |
|        1 | F      |   2 |
|        2 | F      |   1 |
|        2 | M      |   2 |
|        3 | F      |   2 |
|        3 | M      |   1 |
+----------+--------+-----+
6 rows in set (0.00 sec)
```
- 例子：
```
mysql> SELECT class_id, AVG(score) avg_score FROM students GROUP BY class_id;
+----------+-----------+
| class_id | avg_score |
+----------+-----------+
|        1 |   86.5000 |
|        2 |   73.6667 |
|        3 |   88.3333 |
+----------+-----------+
3 rows in set (0.00 sec)

mysql> SELECT class_id, gender, COUNT(*) num, AVG(score) avg_score FROM students GROUP BY class_id, gender;
+----------+--------+-----+-----------+
| class_id | gender | num | avg_score |
+----------+--------+-----+-----------+
|        1 | M      |   2 |   89.0000 |
|        1 | F      |   2 |   84.0000 |
|        2 | F      |   1 |   81.0000 |
|        2 | M      |   2 |   70.0000 |
|        3 | F      |   2 |   88.0000 |
|        3 | M      |   1 |   89.0000 |
+----------+--------+-----+-----------+
6 rows in set (0.00 sec)
```

多表查询：
- 除了从一张表查数据，还可以从多张表查数据：
```sql
SELECT * from classes, students;
```
- 查询结果也是一张二维表，是两张表的乘积，具体来说就是将两张表的记录做了一个笛卡尔积，两张表的记录的列叠加到一起，行直接笛卡尔积全排列。
- 多表查询也称笛卡尔积查询。比如上述结果中会有两列`id`，分别来自两张表。要解决这个问题，可以使用投影查询设置列的别名。
```sql
SELECT
    students.id sid,
    students.name,
    students.gender,
    students.score,
    classes.id cid,
    classes.name cname
FROM students, classes;
```
- 多表查询时可以使用`table_name.column_name`这样的方式引用列和设置列的别名。这种方式也还是有点麻烦，SQL还允许给表设置别名。
```sql
SELECT
    s.id sid,
    s.name,
    s.gender,
    s.score,
    c.id cid,
    c.name cname
FROM students s, classes c;
```
- 上述结果中某些记录是不合理没有意义的，因为`class_id`已经代表了班级，添加`WHERE c.id = s.class_id`条件可以得到合理的查询结果。
- 多表查询会做笛卡尔积，结果集数量可能很大，要小心使用，一般情况下不使用，因为会有效率问题。

连接查询：
- 另一种类型的多表查询，连接查询对多个表进行JOIN运算，简单地说，就是先确定一个主表作为结果集，然后，把其他表的行有选择性地“连接”在主表结果集上。
- 连接查询使用`INNER JOIN`子句：
```sql
SELECT s.id, s.name, s.class_id, c.name class_name, s.gender, s.score
FROM students s
INNER JOIN classes c
ON s.class_id = c.id;
```
- `INNER JOIN`写法：
    - 确定主表`FROM table1`
    - 确定要连接的表`INNER JOIN table2`
    - 确定连接条件，`ON <condition>`，这里使用`ON s.class_id = c.id`表示`students`表的`class_id`列与`classes`表的`id`列相同的行需要连接。
    - 加上可选的`WHERE ORDER BY`等子句。
- `INNER JOIN`是内连接，同样还有`OUTER JOIN`外连接。
- 外连接分三种：`RIGHT OUTER JOIN` `LEFT OUTER JOIN` `FULL OUTER JOIN`。
    - 内连接`INNER JOIN`只返回同时存在于两张表的行数据
    - 右连接`RIGHT OUTER JOIN`返回右表中都存在的行。如果某一行仅在右表存在，那么结果集就会以`NULL`填充剩下的字段。
    - 左连接`LEFT OUTER JOIN`则返回左表都存在的行。如果某一行仅在左表存在，那么结果集中同样以`NULL`填充右表中的对应列。
    - 全连接`FULL OUTER JOIN`则会将两张表中所有记录都选择出来，自动把对方不存在的列填充`NULL`。
    - 用集合来表示的话，左表记录集合为A，右表为B，`INNER`就是AB交集，`LEFT`是AB交集与A并集，`RIHGT`是AB交集与B并集，`FULL`是AB并集。
- `JOIN`查询依然可以使用`WHERE`条件`ORDRE BY`排序。
- `INNER JOIN`是最常用的`JOIN`查询，`INNER JOIN`也可以直接写作`JOIN`。
- MySQL中不能用`FULL OUTER JOIN`全连接，可以通过对左右连接的结果`UNION`取并集实现。
- `RIGHT OUTER JOIN` `LEFT OUTER JOIN` `FULL OUTER JOIN`中的`OUTER`可以省略，写作`RIGHT JOIN` `LEFT JION` `FULL JION`。

## 修改数据

数据库的基本操作就是CRUD即Create、Retrieve、Update、Delete。

除了查询，增删改对应的SQL是：
- `INSERT` 插入新纪录。
- `UPDATE` 更新已有记录。
- `DELETE` 删除已有记录。

插入：
- 基本语法：
```sql
INSERT INTO <table_name> (field1, field2, ..., fieldn) VALUES (value1, value2, ... valuen) [, (value21, ...)] ;
```
- 如果一个字段有默认值，比如一个自增的主键，那么`INSERT`语句中可以不出现。
- 字段顺序不必和数据库中字段顺序一致，值顺序必须和字段顺序一致。
- 可以一次性插入多条记录，数据用`,`分隔，每条记录的值放在`()`中。

更新：
- 语法：
```sql
UPDATE <table_name> SET field1=value1, field2=value2, ... WHERE <condition>;
```
- 可以根据条件同时更新多条记录。
- 设置值时可以使用原值比如`SET score = score + 10`。
- 如果`WHERE`没有匹配到任何记录，`UPDATE`不会报错，也不会更新任何记录。
- 使用MySQL这类数据库，`UPDATE`语句会返回更新的行数以及`WHERE`条件匹配的行数。
```shell
mysql> update classes set name = '六班' where id = 6;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```

删除：
- 语法：
```sql
DELETE FROM <table> WHERE <condition>;
```
- 一次可以删除一条或者多条记录。
- 如果`WHERE`条件没有匹配到任何记录，`DELETE`语句不会报错，也不会有任何记录被删除。
- 注意如果不带`WHERE`条件，那么所有记录都匹配，整张表中所有记录都会删除。所以删除之前最好先用`SELECT`语句测试`WHERE`条件筛选的结果集是否符合期望。
- 使用MySQL这类关系数据库时，`DELETE`语句也会返回删除的行数以及`WHERE`条件匹配的行数。
- 如果一个记录有外键:
    - 创建外键时定义了`ON DELETE CASCADE`，删除记录时关联数据自动删除。
    - 如果没有定义`ON DELETE CASCADE`，有关联数据时删除会报错。

基本的增删改查大概就这些了。

## MySQL

安装完MySQL后，除了真正的MySQL服务器（MySQL Server），还有一个MySQL Client，是一个命令行客户端。通过客户端可以登录MySQL，输入`mysql -u root -p`，输入密码后，就连上了MySQL Server，进入MySQL的提示符。
- MySQL Client执行的程序是`mysql`，MySQL Server执行的程序是`mysqld`。
- MySQL Client是通过TCP连接连接到MySQL Server的。默认端口是3306，如果是连接到本机MySQL Server那么地址就是`127.0.0.1:3306`。
- 在MySQL Client中输入的SQL语句被发送到MySQL Server中执行。
- 也可以只装MySQL Client，然后连接到远程的MySQL Server，假设远程MySQL Server的地址是`10.0.1.99`，那么可以用`-h`选项指定IP或者域名：`mysql -h 10.0.1.99 -u root -p`。
- 在Windows或者Linux中，命令行执行的`mysql`就是客户端，MySQL服务器以服务的方式运行。
- 可以有多个MySQL Client连接到同一个MySQL Server。

可视化终端：
- 除了使用命令行客户端连接MySQL Server，也可以使用可视化图形界面终端[MySQL Workbench](https://dev.mysql.com/downloads/workbench/)。
- MySQL Workbench可以用可视化的方式查询、创建和修改数据库表，但是，归根到底，MySQL Workbench是一个图形客户端，它对MySQL的操作仍然是发送SQL语句并执行。
- 虽然可以图形界面管理数据库，但是很多时候通过SSH远程连接，只能使用SQL命令，了解SQL是必要的。

数据库常用命令：
- 列出所有数据库：`SHOW DATABASES;`
- 其中，`information_schema`、`mysql`、`performance_schema`和`sys`是系统库，不要去改动它们。其他的是用户创建的数据库。
- 创建数据库：`CREATE DATABASE test;`
- 删除数据库：`DROP DATABASE test;`
- 删除一个数据库将导致该数据库的所有表全部被删除。
- 对一个数据库进行操作前，需要先将其切换为当前数据库：`USE test;`
- 列出当前数据库所有表：`SHOW TABLES;`
- 查看表的结构：`DESC <table>;`
    - 可以获得的信息：字段名称、数据类型、是否允许NULL、键的约束(主键外键唯一等)、默认值，额外约束（比如自增）。
- 查看创建表的SQL语句：`SHOW CREATE TABLE <table>;`
- 创建表：`CREATE TABLE <table>;`
- 删除表：`DROP TABLE <table>;`
- 修改表：`ALTER TABLE <table> ...`
    - 新增一列：`... ADD COLUMN birth VARCHAR(10) NOT NULL;`
    - 修改某一列：`... CHANGE COLUMN birth birthday VARCHAR(20) NOT NULL;`
    - 删除列：`... DROP COLUMN birthday;`
    - 添加约束：`... ADD CONSTRAINT <constraint_name> ...;`
    - 删除约束：`... DROP CONSTRAINT <constraint_name>;`
    - 添加外键约束：`... ADD CONSTRAINT <constraint_name> FOREIGN KEY (<fields>) REFERENCES <foreign_table> (<foreign_fields>);`
    - 删除外键约束：`... DROP FOREIGN KEY <constraint_name>`
- 退出MySQL客户端：`exit`。
- 更多常用命令TODO，待实践后补充。

## MySQL实用SQL语句

在编写SQL时，灵活运用一些技巧，可以大大简化程序逻辑。一些常用的SQL语句，其他数据库不一定有：

插入或替换：
```SQL
REPLACE INTO students (id, class_id, name, gender, score) VALUES (1, 1, '小明', 'F', 99);
```
- 若`id = 1`的记录不存在，则直接插入，如果存在，则先删除在插入新纪录。

插入或更新：
```SQL
INSERT INTO students (id, class_id, name, gender, score) VALUES (1, 1, '小明', 'F', 99) 
ON DUPLICATE KEY UPDATE name='小明', gender='F', score=99;
```
- 使用`INSERT INTO ... ON DUPLICATE KEY UPDATE ...`
- 若`id = 1`的记录不存在，则直接插入，否则，更新当前记录，更新的字段由`UPDATE`指定。

插入或忽略：
```SQL
INSERT IGNORE INTO students (id, class_id, name, gender, score) VALUES (1, 1, '小明', 'F', 99);
```
- 使用`INSERT IGNORE INTO ...`语句。
- 若`id = 1`记录不存在，则插入，否则直接忽略什么事也不做。

对表做快照：
- 即复制一个表的数据到一个新表，可以结合`CREATE TABLE`和`SELECT`：
```sql
CREATE TABLE students_of_class1 SELECT * FROM students WHERE class_id=1;
```
- 新创建的表结构和SELECT使用的表结构完全一致。

将查询结果集写入表：
- 可以创建表后结合`INSERT INTO`和`SELECT`直接写入：
```sql
CREATE TABLE statistics (
    id BIGINT NOT NULL AUTO_INCREMENT,
    class_id BIGINT NOT NULL,
    average DOUBLE NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO statistics (class_id, average) SELECT class_id, AVG(score) FROM students GROUP BY class_id;
```
- 确保`INSERT`语句的列和`SELECT`语句的列能一一对应，就可以在statistics表中直接保存查询的结果。

强制使用索引：
- 在查询的时候，数据库系统会自动分析查询语句，并选择一个最合适的索引。
- 但很多时候数据库的查询优化器并不一定总是能使用最优索引，如果知道如何选择索引，就可以使用`FORCE INDEX`强制查询使用的索引：
```sql
SELECT * FROM students FORCE INDEX (idx_class_id) WHERE class_id = 1 ORDER BY id DESC;
```
- 指定索引需要索引存在，不要将索引名称指定为与某一列名称相同，会导致冲突找索引名称时会找不到。推荐使用`idx_<column_name>`这种名称。


## 事务

事务：
- 在执行SQL语句的时候，某些业务要求，一系列操作必须全部执行，而不能仅执行一部分。也就是整个操作必须是原子的，如果一系列操作中途某条语句执行失败，已经执行的语句就必须全部撤销。
- 这种将多条语句作为一个整体操作的功能，成为**数据库事务**。
- 数据库事务可以确保该事务范围内的所有操作都可以全部成功或者全部失败。如果事务失败，那么效果就和没有执行这些SQL一样，不会对数据库数据有任何改动。
- 数据库事务具有ACID这4个特性：
    - A：Atomic，原子性，将所有SQL作为原子工作单元执行，要么全部执行，要么全部不执行。
    - C：Consistent，一致性，事务完成后，所有数据状态是一致的。
    - I：Isolation，隔离性，如果有多个事务并行执行，那么事务所做的修改必须与其他事务隔离。
    - D：Duration，持久性，事务完成后，对数据库数据的修改被持久化存储。
- 对于单条SQL语句，数据库系统自动将其作为一个事务执行，这种事务被称为**隐式事务**。
- 手动将多条SQL作为一个事务执行：使用`BEGIN`开启事务，`COMMIT`提交一个事务，这种称之为**显式事务**。
```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```
- 多条语句要作为事务执行，就必须使用显式事务。
- `COMMIT`是指提交事务，即试图把事务内的所有SQL所做的修改永久保存。如果`COMMIT`语句执行失败了，整个事务也会失败。
- 某些场景，如果我们希望事务执行主动失败，可以使用`ROLLBACK`回滚事务。
```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
ROLLBACK;
```
- 数据库事务是数据库系统保证的，只需要按照业务逻辑使用即可。

隔离级别：
- 对于两个并发执行的事务，如果涉及到操作同一条记录的时候，可能就会发生问题。因为并发操作会带来数据的不一致性，包括脏读、不可重复读、幻读等。数据库系统提供了隔离级别来让我们有针对性地选择事务的隔离级别，避免数据不一致的问题。
- SQL标准定义了4中隔离级别，其可能产生的：

Isolation Level|脏读（Dirty Read）|不可重复读（Non Repeatable Read）|幻读（Phantom Read）
:-:|:-:|:-:|:-:
Read Uncommitted|Yes|Yes|Yes
Read Committed|-|Yes|Yes
Repeatable Read|-|-|Yes
Serializable|-|-|-

实际使用事务的用法类似(Java示例)：如果事务中的SQL执行失败，立即执行`ROLLBACK`。
```java
try {
    executeUpdate("...");
    executeUpdate("...");
    commit();
} catch (SQLException e) {
    rollback();
}
```

**Read Uncommitted**:
- Read Uncommitted是隔离级别最低的一种事务级别。在这种隔离级别下，**一个事务会读到另一个事务更新后但未提交的数据**，如果另一个事务回滚，那么当前事务读到的数据就是脏数据，这就是**脏读（Dirty Read）**。

**Read Committed**:
- 在Read Committed隔离级别下，一个事务可能会遇到**不可重复读（Non Repeatable Read）**的问题。
- 不可重复读是指，在一个事务内，多次读同一数据，在这个事务还没有结束时，如果另一个事务已经开始执行并结束提交恰好修改了这个数据，那么，在第一个事务中，**两次读取的数据就可能不一致（就不可重复读）**。

**Repeatable Read**:
- 在Repeatable Read隔离级别下，一个事务可能会遇到 **幻读（Phantom Read）** 的问题。
- 幻读是指，在一个事务中，第一次查询某条记录，发现没有，但是，当试图更新这条不存在的记录时，竟然能成功，并且，再次读取同一条记录，它就神奇地出现了。
- 幻读就是没有读到的记录，以为不存在，但其实是可以更新成功的，并且，更新成功后，再次读取，就出现了。原因是其他事务在中途插入了这条数据，但插入后的时刻去读取结果是不存在，因为是**可重复读，但允许更新，经过更新后，就能够读取**到了。

**Serializable**:
- Serializable是最严格的隔离级别。在Serializable隔离级别下，所有事务按照次序依次执行，因此，脏读、不可重复读、幻读都不会出现。
- 虽然Serializable隔离级别下的事务具有最高的安全性，但是，由于事务是串行执行，所以效率会大大下降，应用程序的性能会急剧降低。如果没有特别重要的情景，一般都不会使用Serializable隔离级别。

默认事务隔离级别：
- 如果没有指定隔离级别，数据库就会使用默认的隔离级别。在MySQL中，如果使用InnoDB，默认的隔离级别是Repeatable Read。

除了靠数据库系统本身提供的隔离级别，还需要应用程序的逻辑处理脏读、不可重复读、幻读的情况。或者某些场景下可能就不需要处理，脏读、不可重复读、幻读本身可能就是符合业务逻辑的。

MySQL获取修改事务隔离级别：

- 查询全局和会话的事务隔离级别，MySQL8.0.3版本以前是`tx_isolation`：
```sql
SELECT @@global.transaction_isolation;
SELECT @@session.transaction_isolation;
```
- 修改：
```sql
SET [SESSION | GLOBAL] TRANSACTION ISOLATION LEVEL {READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE}
```
- 影响范围：
    - SESSION：表示修改的事务隔离级别将应用于当前 session（当前 cmd 窗口）内的所有事务。
    - GLOBAL：表示修改的事务隔离级别将应用于所有 session（全局）中的所有事务，且当前已经存在的 session 不受影响。
    - 如果省略 SESSION 和 GLOBAL，表示修改的事务隔离级别将应用于当前 session 内的下一个还未开始的事务。
    - 任何用户都能改变会话的事务隔离级别，但是只有拥有 SUPER 权限的用户才能改变全局的事务隔离级别。
- 也可以用`set transaction_isolation`设置当前session的事务隔离级别：
```sql
SET transaction_isolation='READ-COMMITTED';
```
- 也可以通过配置文件修改隔离级别：
```sql
transaction-isolation = REPEATABLE-READ
transaction-isolation = READ-COMMITTED
transaction-isolation = READ-UNCOMMITTED
transaction-isolation = SERIALIZABLE
```

## TODO

- 更多SQL语法。
- 更严谨的SQL语法描述。
- SQL标准与数据库实现的区分。
- 具体数据库实现相关内容，其他数据库系统内容。
- 更多数据库系统使用与配置内容。
- 编程语言与数据库的交互。
- SQL编码风格。
- 待有实践需求后补充。