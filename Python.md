<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Python语言入门](#python%E8%AF%AD%E8%A8%80%E5%85%A5%E9%97%A8)
  - [环境](#%E7%8E%AF%E5%A2%83)
  - [变量与字符串](#%E5%8F%98%E9%87%8F%E4%B8%8E%E5%AD%97%E7%AC%A6%E4%B8%B2)
  - [常用数据结构](#%E5%B8%B8%E7%94%A8%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84)
  - [控制流](#%E6%8E%A7%E5%88%B6%E6%B5%81)
  - [函数](#%E5%87%BD%E6%95%B0)
  - [集合高级特性](#%E9%9B%86%E5%90%88%E9%AB%98%E7%BA%A7%E7%89%B9%E6%80%A7)
  - [函数式编程](#%E5%87%BD%E6%95%B0%E5%BC%8F%E7%BC%96%E7%A8%8B)
  - [模块](#%E6%A8%A1%E5%9D%97)
  - [面向对象](#%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1)
  - [错误、调试与测试](#%E9%94%99%E8%AF%AF%E8%B0%83%E8%AF%95%E4%B8%8E%E6%B5%8B%E8%AF%95)
  - [IO](#io)
  - [并发编程](#%E5%B9%B6%E5%8F%91%E7%BC%96%E7%A8%8B)
  - [正则表达式](#%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F)
  - [常用内建模块](#%E5%B8%B8%E7%94%A8%E5%86%85%E5%BB%BA%E6%A8%A1%E5%9D%97)
  - [常用第三方模块](#%E5%B8%B8%E7%94%A8%E7%AC%AC%E4%B8%89%E6%96%B9%E6%A8%A1%E5%9D%97)
  - [virtualenv & pipenv](#virtualenv--pipenv)
  - [图形界面](#%E5%9B%BE%E5%BD%A2%E7%95%8C%E9%9D%A2)
  - [网路编程](#%E7%BD%91%E8%B7%AF%E7%BC%96%E7%A8%8B)
  - [电子邮件](#%E7%94%B5%E5%AD%90%E9%82%AE%E4%BB%B6)
  - [数据库](#%E6%95%B0%E6%8D%AE%E5%BA%93)
  - [Web开发](#web%E5%BC%80%E5%8F%91)
  - [异步IO](#%E5%BC%82%E6%AD%A5io)
  - [总结](#%E6%80%BB%E7%BB%93)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Python语言入门

Python（英国发音：/ˈpaɪθən/ 美国发音：/ˈpaɪθɑːn/）是一种广泛使用的解释型、高级和通用的编程语言。Python支持多种编程范型，包括函数式、指令式、结构化、面向对象和反射式编程。它拥有动态类型系统和垃圾回收功能，能够自动管理内存使用，并且其本身拥有一个巨大而广泛的标准库。

Python由吉多·范罗苏姆（Guido van Rossum，荷兰人）创造，第一版发布于1991年，它是ABC语言的后继者，也可以视之为一种使用传统中缀表达式的LISP方言。

语言特点：
- 基础库完善：网络、文件、GUI、数据库、文本等。
- 第三方库众多。
- 解释型语言，运行效率不高。
- 动态类型、强类型。

多种解释器：
- CPython，官方版本，C语言编写。
- IPython，基于CPython的一个交互式解释器。
- PyPy：采用JIT技术对Python进行动态编译，目标是执行速度，[PyPy和Python有一定不同](https://doc.pypy.org/en/latest/cpython_differences.html)。
- Jython：运行在JVM上的Python解释器，可以直接将Python代码编译为Java字节码执行。
- IronPython：和Jython类似，编译到.NET字节码。
- Python的解释器很多，但使用最广泛的还是CPython。如果要和Java或.Net平台交互，最好的办法不是用Jython或IronPython，而是通过网络调用来交互，确保各程序之间的独立性。

阅读：
- [Python3中文文档](https://docs.python.org/zh-cn/3/)
- [Python 语言参考手册](https://docs.python.org/zh-cn/3/reference/index.html) Python句法和核心语义，有一定基础可直接阅读。
- [Python 教程](https://docs.python.org/zh-cn/3/tutorial/index.html) Python官方非正式教程，无基础可先从这开始阅读。
- [Python 标准库](https://docs.python.org/zh-cn/3/library/index.html) Python标准库的文档，用来查阅。
- [廖雪峰Python教程](https://www.liaoxuefeng.com/wiki/1016959663602400)（本文主要参考，用于入门）
- [Python 3 教程 | 菜鸟教程](https://www.runoob.com/python3/python3-tutorial.html)
- [Python最佳实践指南](https://pythonguidecn.readthedocs.io/zh/latest/index.html)，一份第三方的最佳实践指南，强烈建议阅读。

## 环境

Python3和Python2不兼容，Python2已经停止维护，原则上不应再使用。时下（2021.10.1）最新版本3.9.7。

- 官方解释器CPython，下载安装配置环境变量。
- VSCode安装Python插件。
- 推荐IDE：PyCharm。

```python
print("hello,world!")
```

各种Python相关文件后缀：
- `.py` python源文件。
- `.pyw` 默认的`.py`是控制台应用，而`.pyw`是用于编写GUI应用的，运行时`stdout stderr`输出无效，`stdin`只会读取到`EOF`。用`pythonw.exe`运行。
- `.pyc` 类似于Java字节码文件，编译后的Python字节码脚本文件，供解释器使用，不想提供源码时可以提供。某些情况`__pycache__`就会生成和Python源文件同名并加上后缀`.cpython-3X.pyc`的文件，其实就是编译后字节码。如果源文件未发生改变，那么就不会再次编译，而是直接执行。
- `.pyo` 优化编译后的`.pyc`文件，截止至Python3.5，现已不再使用。
- `.pyd` 一般是其他语言编写的编译后Python扩展模块，提供给python用来调用。其实就是编译后的动态链接库。
- `.pyi` 存根文件。
- `.pyz` Python脚本存档，包含标准Python脚本头之后的二进制形式的压缩Python脚本（ZIP）的脚本。
- `.pyx` Cython源文件，Python的C扩展，可以调用本地C/C++代码，提供接近C的性能。
- `.pxd` Cython脚本，相当于C/C ++标头。


编译运行：
- `python -m compileall <xxx.py or dir/>` 编译结果保存在`__pycache__/`下。编译后的`.pyc`可以通过`python xxx.pyc`运行。`compileall`其实就是python提供的一个模块。
- 一般情况下是直接运行：`python xxx.py`。

## 变量与字符串

注释：行注释`#`

代码块：
- 每一行一条语句。一行写多条语句可以用`;`分隔。
- 语句以`:`结尾时，缩进表示代码块。
- 约定俗成是用4空格缩进。
- 不要在Python源文件中混用空格和Tab。

标识符：
- 字母数字下划线组合，不能用数字开头。

数据类型：
- 整数：没有大小限制，天然支持高精度。
- 浮点数：没有大小限制，超出一定范围会直接表示为`inf`无穷大。其实就是IEEE 754 64位浮点数，最大范围在十进制下约为10的308数量级。
- 字符串
- 布尔值
- 在Python中，任何数据都是对象，

字面量：
- 整数：十进制、十六进制`0x`，整数浮点数中允许使用下划线分隔，下划线会被忽略。
- 浮点：C写法。
- 字符串：单引号或者双引号括起来的文本，使用其中一者时另一者可以不用转义。一般是如果字符串中包含其中一者就用另一者，如果都包含那使用转义字符。
- 字符：和字符串一样，长度为1那就是字符，单引号或者双引号表示。具体有无字符这个类型还不好说，可能接受字符的函数只是通过字符串长度做了判断而已。
- 转义字符：`\r \n \t \\ ...`。
- 原始字符串：前缀`r""`内部字符串不会转义。其中的同样的引号仍需转义。
- 多行字符串：`"""hello"""`，也可以是原始字符串。
- 布尔值：`True False`
- 空值：`None`
- 习惯上使用全大写来定义常量，但是没有机制保证不变。

动态类型语言：
- 类型绑定发生在运行时。
- 定义时不要求显式写出类型。
- 可以将一个已经存在的变量赋为其他类型，变量即变为新类型。

字符串编码：
- ASCII，Unicode，UTF-8，GBK，不赘述。
- 一般对Unicode的处理方式，文件使用utf-8编码，读取后Python字符串中按照Unicode码点形式存放，读取和保存是做解码和编码的工作。
- Python支持Unicode，Python 3中字符串是以Unicode编码（即保存为Unicode码点）的。
- `ord()`函数获取字符对应的Unicode码点，`chr()`将Unicode码点转化为字符。
- 可以使用`\u4e2d`这种十六进制Unicode转义字符。
- 字符串的`encode()`方法可以将Unicode字符串编码为指定编码的字节。对不能编码的字符，比如中文编码为`ascii`的话会运行错误。
- 在编码得到的字节序列中，无法显示为ASCII的字符将显示为`\x##`的形式。
- 如果读取了字节流，保存为字节序列，需要解码就需要调用`decode()`方法。如果字节中有无效的字节，可以添加命名参数`errors='ignore'`忽略错误的字节。
- 字符串长度：`len(string)`
- 字符类型：`str`
- 字节序列类型：`bytes`
- 为了避免乱码问题，应当始终坚持使用UTF-8编码对`str`和`bytes`进行转换。
- 字节序列`bytes`的字面量表示：`b"absd\x##"`，只能使用ASCII字符和`\x##`这种形式表示`7f-ff`之间的字节。

文件编码：
- 保存源文件时，最好保存为`utf-8`编码。
- 当Python解释器读取源代码时，为了让它按UTF-8编码读取，我们通常在文件开头写上这两行：
```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
```
- 第一行是为了能在类Unix系统中当做脚本执行，windows中不能当脚本执行，不需要的话可以直接去掉。
- 第二行告诉Python解释器，按照UTF-8编码读取源码，声明了UTF-8是确定了编译器的读取方式，并不意味这文件就是utf-8编码了。为了正确读取，需要保存为UTF-8 无BOM格式。
- 支持中文标识符。

字符串格式化：
- 第一种和C类似`%`占位符实现：`"name = %s, age = %2d" % (name, age)`，格式化字符串后再用`%`加上参数列表。
- 格式化占位符：`%d %f %s %x`等。
- `%s`永远起作用，会把任何数据类型转换为字符串。
- 第二种格式化方式是使用字符串的`format()`方法：`"name = {0}, age = {1:2.3f}".format(name, age)`。使用`{}`包围的从0开始的参数索引作为占位符。
- 第三种格式化方式`f-string`，字符串前添加`f`，其中可以直接插入变量，用`{var:formatstr}`的形式。也即是字符串插值，算是最方便的方式。
- 二三种格式中使用`{{ }}`对原始的`{ }`字符进行转义。

## 常用数据结构

列表`list`：
- 定义：`[elem1, elem2, ...]`
- 索引访问：`[index]`从0开始
- 访问最后一个元素`[-1]`
- 追加`append` 插入`insert` 删除指定位置元素`pop(i)`
- 长度：`len(list)`
- 元素类型可以不同、列表中存列表可以当多维数组使用。

元组`tuple`：
- 定义：`(elem1, elem2, elem3)`
- 长度固定。
- 同样可以使用`[index]`索引访问。
- 定义元组时，元组的元素必须被确定下来，不能修改元素的值。
- `()`定义空的元组。
- 只有一个元素是和单纯的一个值有歧义，所以`(1)`表示值1，而不是一个元素的元组，末尾加`,`可以消除歧义，`(1, )`。
- tuple确定下来后，tuple中的元素值便不能修改，也就是tuple元素指向的对象不能变，但是可以修改对象本身，比如对象是一个列表，那就可以修改列表的元素值。

字典：
- 类型：`dict`
- 定义：`d = {key1: value1, key2: value2, ...}`，元素无序。
- 取元素：
    - `d[key]`，不存在报错。
    - `d.get(key)`，不存返回None。
    - `d.get(key, -1)`，不存在时返回传入的默认值。
- 判断key是否存在：`key in d`
- 插入：`d[key] = value`
- 删除某一个key：`d.pop(key)`
- 哈希表实现，O(1)插入删除时间复杂度，内存占用大。
- 需要注意`dict`的key需要是不可变对象。这样才能才能保证每次通过哈希函数计算出的哈希值不变。
- 元组是不可变对象，但是元组内的元素不一定是，元组需要内部元素都是不可变时才能作为key。
- 最常见的key是字符串。

集合：
- 无序、哈希表实现、自动去重，
- 定义：`s = {elem1, elem2, ...}`
- 或者：`s = set([elem1, elem2, ...])` 传入一个列表得到列表所有元素构成的集合。
- 直接对元素做哈希，元素需要不可变。
- 添加：`add(key)`
- 删除：`remove(key)` 元素需要存在。
- 判断是否在集合内：`key in s`。
- 集合间操作：交集`s1 & s2` 并集`s1 & s2`。


不可变对象：
- 字符串`str`是不可变对象，列表`list`是可变对象。
- 对于可变对象：对其进行操作可以改变源对象内部的内容。
- 不可变对象改变内容的操作都是返回一个新的对象，源对象保持不变。
- 不可变对象优点：不变对象一旦创建，对象内部的数据就不能修改，这样就减少了由于修改数据导致的错误。同时多线程环境下同时读取不用加锁。
- 编写程序时，如果可以设计为不变对象，尽量设计为不变对象。

## 控制流

条件：
```python
if condition:
    if_statements
elif condition:
    elif_statements
else:
    else_statements
```
- 并不要求条件一定是逻辑值`True False`，只要是非零数值、非空字符串、非空list等，都判断为`True`，否则`False`。
- 检查是否是int类型`int()`，如果不是则会

循环：
```python
for x in collections:
    body

while condition:
    body
```
- 循环中可以用`break continue`。

范围：
- python提供了一个方便的`range(a, b)`函数，用来方便地遍历，传入`list(range(a, b))`可以得到a到b-1的列表。默认步长是1。
    - `range(a)` 0到a-1。
    - `range(a, b)` a到b-1。
    - `range(a, b, step)` a到b-1，指定步长。
```python
for x in range(1, 5): # x from 1 to 4
    body
```


## 函数

内置函数：
- [Python内置了很多有用的函数](https://docs.python.org/zh-cn/3/library/functions.html)，前面已经用过一些了，包括字符和码点转换、输入输出、列表长度、构造范围列表等集合、常用数学操作等。都了解一遍是必要的。
- 内置的帮助函数可以打印出内置函数的帮助：`help(abs)`，可以早交互式执行环境下尽情查看。
- 数据类型转换：`int float`。

定义函数：
```python
def func(args):
    body
```
- 返回：`return retval`，函数结束时没有`return`语句会自动返回`None`，也可以显式地`return`和`return None`。
- 空语句：`pass`语句什么都不做，一般用来作为占位符（比如条件、循环、函数体等）。比如还未实现函数，因为必须要有一个函数体。
- 会检查函数调用的参数个数是否匹配。
- 返回多个值：
    - `return nx, ny`，结果会作为一个元组，所以和`return (nx, ny)`是等价的。这个过程叫打包（pack）。
    - 如果用一个变量来接收返回值，那么会获取到整个元组。用和元组大小匹配的变量来接收，那么会一一赋值（解包），其他情况，变量少了会
    - 用多个变量接受时其实对返回值就是做迭代，依次赋值。只要返回值是可迭代的比如列表，并且变量个数等于或多于元素元素个数，那么就能成功解包。
- 如果有必要可以对参数做类型检查，使用内置的`isinstance(instance, typeOrTypeTuple)`。

参数：
- 默认参数：从后往前添加。
```python
def power(x, n = 2):
    res = 1
    while n > 0:
        res *= x
        n -= 1
    return res
```
- 注意：python函数在定义时默认参数就被计算出来了，如果默认参数也是一个变量，多次调用时使用默认参数，如果在函数内改变了默认参数，那么后面的调用时参数就被改变了。要避免这一点，请将默认参数设置为不变量。即**默认参数必须指向不变对象！**，比如`str None`等。


可变参数：
- 定义参数时使用`*args`，`args`在函数内将作为对应传入参数构成的元组。可以是空，可以是任意个数。
- 调用时可以传0个或任意个参数。
- 可以传入`list`或者`tuple`，只要在参数前加一个`*`，就等价于是将列表或者元组所有元素按顺序传入（所以传入非可变参数函数也是可行的，只要数量匹配）。这种写法非常常见。

关键字参数：
- 定义参数时使用`**args`，`args`在函数内作为一个字典，key是参数名称，值是参数值。
- 可以传入0或任意个必须带参数名的参数。
- 非常灵活，可以用在除了必要选项还支持用户自定选项的场景下。
- 调用时同理，可以使用`**dict`方式调用，key必须是字符串，表示参数名。

命名关键字参数：
- 如果要限制关键字参数的名字，就可以用命名关键字参数。
- 命名关键字参数需要一个特殊分隔符`*`，`*`后面的参数被视为命名关键字参数。
```python
def person(name, age, *, city, job): # city and job are named keyword parameters
    print(name, age, city, job)
```
- 命名关键字参数必须传入参数名，这和位置参数不同。如果没有传入参数名，调用将报错。
- 如果中间有可变参数了，那后面的参数自动成为命名关键字参数。
- 命名关键字参数可以有默认值，并且调用时因为已经有参数命了，所以顺序可以随意。

参数组合：
- 在Python中定义函数，可以用必选参数、默认参数、可变参数、关键字参数和命名关键字参数，这5种参数都可以组合使用。
- 参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数。
- 对于任意形式组合参数列表，总是可以通过`fun(*args, **kw)`的方式调用，只要数量和名称是匹配的。
- 必选参数也可以通过命名参数方式调用，然后后续的所有参数都必须以命名方式传入，对顺序没有要求。总体上**只要函数能够获取到所有参数并且不会重复即可**，没有传入但有默认值的参数就用默认值。
- 使用太多组合会降低可读性，适度就行。

递归：
```python
def fib(n):
    return fibonacci(n, 0, 1)

def fibonacci(n, a, b):
    if (n == 0):
        return a
    else:
        return fibonacci(n-1, b, a+b)
```
- python中函数不要求定义一定在调用前。
- 尾递归优化可以避免递归层次太深导致的栈溢出问题。但好像cpython对上面的尾递归直接做优化，需要自己手动实现。
- 在没有循环的函数语言中，循环只能通过尾递归实现。
- python中限制了最大递归深度，`import sys`，通过`sys.getrecusionlimit()`可以获取最大递归深度，通过`sys.setrecursionlimit()`可以设置。

## 集合高级特性

切片（slicing）：
- 取列表或元组部分元素：`L[beginIndex : endIndexExclusive : step]`，从开头开始取那起始索引可以省略，取到结尾时结束索引也可以省略，步长默认是1可省略，`:step`可选。结束索引超出范围按照最大计算。
- 从末尾开始计数取元素，用负的索引即可：`[-2:-1]`，最后一个元素索引是`-1`而不是0需要记住。也就是负的索引范围是`-length to -1`。取到末尾那么结束索引应该省略而不是用0。
- 起始结束都省略：`L[:]`即表示复制整个列表。
- 正负索引可以混用，都是表示一个位置而已。
- `step`为负可以倒过来切，此时同样包括起始但不包括结束，方向反过来了而已。形成的子序列和其在原序列中的相对顺序是反过来的，很好理解。
- 字符串也可以切片，结果同样是字符串。
- 得到的结果是新对象。列表得到列表，元组得到元组。
- `range`也可以随机访问，也可以切片。

迭代：
- 用for循环来遍历一个集合，称之为迭代，`for x in collection`。
- 除了对于`list tuple range`这种有下标的集合，还有`set dict`这种无下标的集合。只要可迭代，无论有无下标，都可以用`for`进行迭代。包括自定义的数据类型。
- 对字典进行迭代：
    - `for key in d` 默认迭代key。
    - `for key, value in d.items()` 字典元素其实就是二元组，也可以用一个变量获取。
    - `for value in d.values()` 迭代值。
- 对可迭代的集合同时迭代下标：
    - `enumerate()`可以将集合元素变成索引元素对。
    - `for index, val in enumerate(collection)`
- `from collections.abc import Iterable`，可迭代的对象都是`Iterable`类型。

列表生成式：
- 使用列表生成式（List Comprehensions）可以方便地生成列表。
- `[expression for ... for ... if condition]`
- 可以有多层循环，可以添加条件进行筛选，条件满足才会执行前面的表达式得到元素。
- 例：`[x*x for x in range(10) if x % 2 == 0]`
- `[]`中的式子本身是一个生成器。
- `for`前面也可以添加`if-else`，函数是表达式，必须有`else`，而`for`后面的`if`是筛选条件，不能带`else`。

生成器：
- 一边执行循环一边生成元素的机制，就叫生成器（Generator），可以避免一开始就将所有元素生成。
- 将上面列表生成式的式子用`()`括起来就是一个生成器。
- 使用`next()`可以获取生成式的下一个元素，没有更多元素抛出`StopIteration`错误。
- 生成器也是可迭代对象，用for循环迭代生成器时，整个迭代过程是生成器和循环代码交叉执行的，需要元素就执行生成器取出元素，取到后执行下一次循环，如此往复。生成结束后循环就结束了。
- 创建了生成器后，其实一般不会通过`next`取元素来用，基本上都是通过`for`循环来迭代，不需要担心`StopIteration`错误。
- 定义函数时在其中使用`yield`返回生成的元素使其成为一个生成器。函数返回值保存在`StopIteration.value`中，要获取返回值，需要在迭代完成后调用`next`捕获异常进行获取。
- 杨辉三角例子：
```python
# pascal triangles
def triangles(max):
    n, L = 0, [1]
    while n < max:
        yield L.copy()
        L.append(0)
        L = [L[i] + L[i-1] for i in range(len(L))]
        n += 1
    return "done"

g = triangles(10)
res = [elem for elem in g]
print(res)
```

迭代器：
- 可以被`next()`函数调用并不断返回下一个值的对象称为迭代器：`Iterator`。
- `typing.py`中：
```python
Iterable = _alias(collections.abc.Iterable, 1)
Iterator = _alias(collections.abc.Iterator, 1)
```
- 生成器都是`Iterator`对象，但`list`、`dict`、`str`虽然是`Iterable`，却不是`Iterator`。将其变为`Iterator`可以调用`iter()`函数。
- Python的`for`循环本质就是不断调用`next`函数实现的。
```python
for x in [1, 2, 3, 4, 5]:
    pass
# equals to
it = iter([1, 2, 3, 4, 5])
while True:
    try:
        x = next(it)
    except StopIteration:
        break
```
- `Iterator`继承自`Iterable`，后续再详述。

## 函数式编程

纯粹的函数式编程语言中没有变量，任何一个函数，只要输入确定，输出就是确定的。这种纯函数是没有副作用的。而允许使用变量的编程语言中，函数内部状态不确定，同样输入可能得到不同输出，称之为有副作用。

函数编程特点：
- 函数可以用来赋值。
- 可以作为参数返回值
- 支持高阶函数、闭包、柯里化。

高阶函数：使用函数作为参数返回值的函数。
```python
def add(x, y, f):
    return f(x) + f(y)
```

映射（map）和规约（reduce）：
- `map(func, iterable)`传入一个函数和`Iterable`，将函数一次作用于序列每个元素，得到一个`Iterator`。`Iterator`是惰性序列，要求出具体结果需要遍历，或者传入`list()`得到序列。
- `from functools import  reduce` `reduce(func, iterable, ...)`传入一个函数，一个`Iterable`，这个函数必须接受2个参数，reduce将func应用于序列第1和第2个元素，并将结果继续运用于下一个元素，直到序列结束。不是内建函数，可以传入多个`Iterable`，这是函数接受与`Iterable`个数相同的参数，运用之后得到结果，最短的`Iterable`迭代完之后将结束。
```python
# map
def add10(x):
    return x + 10
print(list(map(add10, [1, 2, 3])))

def add(x, y):
    return x + y
print(list(map(add, range(100)[::-1], [-x for x in range(100, 250)])))

# reduce
def sum(x, y):
    return x + y
print(reduce(sum, range(101)))

# example
DIGITS = dict((chr(ord('0') + val), val) for val in range(10)) # '0': 0, '1': 1, ...
def str2int(s):
    def fn(x, y):
        return x * 10 + y
    def char2num(s):
        return DIGITS[s]
    return reduce(fn, map(char2num, s))
```
- `filter(func, iterable)`用于过滤，其实也是广义上的映射。根据函数作用于元素是`True`保留，`False`丢弃。
- 例子：埃拉托色尼筛法求素数。
```python
# example: use Sieve of Eratosthenes to find all prime nunbers
# https://zh.wikipedia.org/wiki/%E5%9F%83%E6%8B%89%E6%89%98%E6%96%AF%E7%89%B9%E5%B0%BC%E7%AD%9B%E6%B3%95
def _odd_iter():
    n = 1
    while True:
        n = n + 2
        yield n

def _not_division(n):
    return lambda x: x % n > 0

def primes():
    yield 2
    it = _odd_iter() # generate odd numbers
    while True:
        n = next(it)
        yield n
        it = filter(_not_division(n), it) # construct new Iterator

gp = primes()
print([next(gp) for _ in range(100)])
```
- 内建的`sorted(iterable, *, key=None, reverse=False)`方法。接受`key`函数实现自定义排序，`key`函数将作用于元素上，根据其结果进行排序。比如字符串忽略大小写传入`str.lower`，返回排序后的新列表。

闭包：
- 函数作为返回值时，调用函数将获得返回的函数，此时传入的参数变量等状态被保存，也就是喜闻乐见的闭包了。
- 返回闭包时不要引用任何循环变量，或者后续会发生变化的量。
- 返回一个函数时，牢记该函数并未执行，返回函数中不要引用任何可能会变化的变量。
```python
# every call will return a incresing value
def createCounter():
    n = 0
    def counter():
        nonlocal n # need define as nonlocal, if call outter local variable
        n = n + 1
        return n
    return counter

c = createCounter()
print([c() for _ in range(10)])
d = createCounter()
print([d() for _ in range(10)])
```

匿名函数：
- 传入函数时，有些比较简单的情况，传入匿名函数更加方便。
- Python中对匿名函数提供了有限的支持。
- 语法：`lambda args: expression`，匿名函数的限制是只能有个表达式，不用写`return`，返回值就是该表达式值。
- 匿名函数也是函数对象，也可以赋值。
- 支持确实有限，相比之下Scala就灵活了很多。
```python
f = lambda x : (lambda y : (lambda z : x + y + z))
print(f)
print(f(1))
print(f(1)(2))
print(f(1)(2)(3)) # 6
```

偏函数：
- `functools`模块中提供了偏函数（partial function）支持。
- `functools.partial`就是用来帮助创建偏函数的。
- python中偏函数是指，把一个参数的某些参数固定住，并返回一个新的函数。调用这个函数会更加简单。
```python
from functools import partial

# partial function
int2 = partial(int, base = 2)
print(int2("1000")) # 8

# equals to
kw = {"base": 2}
print(int("1000", **kw))

def f(a, b, c, d):
    print(f"{a}, {b}, {c}, {d}")

f1 = partial(f, 10, 20)
f1(30, 40) # 10, 20, 30, 40
```
- 偏函数如果定义时传了命名参数，在生成的偏函数调用中还可以通过命名参数的方式覆盖这个偏函数定义时传入的参数。
- 定义时不命名的话会将参数加到`*args`的最左边。不能使用命名参数再覆盖。
- 命名关键字参数只能以命名方式传入，位置参数可以通过位置传入就是从前往后，也可以命名传入，那么后面的都需要命名传入。和普通函数调用规则差不多。


装饰器（Decorator）：
- 在运行期增加函数功能的一种方式，装饰器模式在语言层面的实践。
- 本质上，decorator就是一个返回函数的高阶函数。调用要修饰的函数，并添加自己的功能。
- 例子：添加日志打印功能。
```python
# decorator
def log(func):
    def warpper(*args, **kv):
        print(f"call {func.__name__}")
        return func(*args, **kv)
    return warpper

@log
def now():
    print('2021-10-2')

def now2():
    print('2021-10-2')

now()
log(now2)() # equals to now()
print(now.__name__) # wrapper
```
- 将`@log`放在函数定义处，相当于执行`log = log(now)`。
- 如果`log`需要加参数，那么就需要多加一层，最外层接受装饰器参数，里层接受函数，最里层添加逻辑执行转调。此时经过装饰后的函数 `__name__`等属性会变成最里层函数的属性，需要添加`@functools.wraps(func)`来将原始函数的属性复制到`warpper`函数函数中。
```python
# decorator with arguments
def log2(text):
    def decorator(func):
        @functools.wraps(func)
        def warpper(*args, **kv):
            print(f"{text} : {func.__name__}")
            return func(*args, **kv)
        return warpper
    return decorator

@log2("execute") # equals to now3 = log("execute")(now3)
def now3():
    print('2021-10-2')

now3()
print(now3.__name__) # now3, if without @functools.wraps(func), will be wrapper
```

## 模块

模块：
- 在Python中，一个`.py`就是一个模块。
- 可以避免函数变量名冲突，编写模块时不必考虑名字会与其他模块冲突，但要注意尽量不要和内置函数重名。
- 为了避免模块名冲突，Python又引入了按目录组织模块的方法，称为包（Package）。
- 引入包以后，只有顶层的名字不与别人冲突，那所有模块就不会与别人冲突。
```
mycompany
├─ __init__.py
├─ abc.py
└─ xyz.py
```
- 上述例子中`mycompany`中的模块名就分别是`mycompany.abc` `mycompany.utils`。
- 每个包目录下都会有一个`__init__.py`文件，是必须存在的，否则Python不会将其视为包。`__init__.py`可以是空文件，也可以有Python代码，因为`__init__.py`本身就是一个模块，而它的模块名就是`mycompany`。【Python3.3后版本模块已经可以不要这个文件了。】
- 自定义模块时只有命名不要和Python自带模块冲突。例如系统引入了`sys`模块，就不要再命名`sys.py`，否则将无法导入系统自带的`sys`模块。
- 模块名要遵循Python变量命名规范，不要使用中文、特殊字符。
- 模块名（文件名）不要和系统模块冲突，最好先查看系统是否有这个模块，交互环境下`import abc`成功则说明存在。

写一个模块的标椎手法：
- 脚本和编码注释。
- 模块代码的第一个字符串都被视为模块的文档注释。
- 使用`__author__`变量表明作者。
- 后面是真正的代码部分。一般导入模块写在最前面。
```python
if __name__=='__main__':
    test()
```
- 然后是通过命名行运行模块文件时，`__name__`会被置为`__main__`，其中逻辑就会执行，而如果在其他文件中导入（此时`__name__`是模块名）判断就会失败，就不会执行。最常见是将模块内测试代码写在此处。

作用域：
- 在一个模块中，我们可能会定义很多函数和变量，但有的函数和变量我们希望给别人使用，有的函数和变量我们希望仅仅在模块内部使用。在Python中，是通过`_`前缀来实现的。
- 正常的函数和变量名是公开的，可以被直接引用。
- 类似`__xxx__`这种变量是特殊变量，可以直接引用，但是有特殊用途，比如`__author__ __name__`，模块文档注释可以通过特殊变量`__doc__`引用。自己定义变量一般不要定义为这种形式。
- 类似于`_xxx __xxx`这种命名的变量是非公开（private）的，不应该直接引用（其实也是可以引用的，只是编程习惯约定而已）。
- 外部不需要使用的函数全部定义为`private`，只有需要引用的才定义为`public`（通过命名的方式，非常简单粗暴）。
- 引入模块的操作只作用于当前模块，也就是当前文件，其他模块引入了该模块并不会引入该模块引入的模块。

包管理工具pip：
- [PyPI](https://pypi.org/)（The Python Package Index）是Python的包管理工具，可以搜索安装第三方库，命令是`pip`。
- 比如：`pip install numpy`。
- 版本：`pip --version`
- 更新`pip`：` python -m pip install --upgrade pip`。
- 换源安装：
```shell
pip install numpy -i https://pypi.tuna.tsinghua.edu.cn/simple
```
- 国内镜像设为默认源：
```shell
# 清华源
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 或：
# 阿里源
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
# 腾讯源
pip config set global.index-url http://mirrors.cloud.tencent.com/pypi/simple
# 豆瓣源
pip config set global.index-url http://pypi.douban.com/simple/s
```
- 更新包：
```shell
pip install --upgrade <package-name>
```
- 安装包：
```shell
pip install packagename         # 最新版本
pip install packagename==1.0.4  # 指定版本
```
- 卸载包：
```shell
pip uninstall <package-name>
```
- windows下一般Python安装到了`Program Files`目录中的话，安装第三方库时会没权限写入，转而安装到`Users\user\AppData\Roaming\Python\Python39\site-packages`下。
- `import sys`，`sys.path`下存放着包的搜索目录，包含安装目录和用户目录，都能搜索到。不需要太过关心。
- 要添加自己的搜索目录：
    - 第一种`sys.path.append("your_path")`。这种方法是运行时修改，运行后失效。
    - 第二种方法是设置环境变量`PYTHONPATH`，该环境变量中路径会自动添加到模块搜索路径中。只需要添加自己的搜索路径，Python标准库和第三方库的路径不受影响。

使用Anaconda：
- Anaconda自带了很多python第三方科学计算库。可以方便地直接使用。
- 安装时如果选择添加环境变量到path，就会将系统path中的Python指向自己的Python，在命令行下就能使用这些库了。

## 面向对象

面向对象：
- Python中，所有数据类型都可以视作对象。同样也支持自定义类。
- 类的数据成员在Python中称为属性（Property），成员函数称为方法（Method）。
- 定义类：
```python
class Person(object):
    def __init__(self, name, age) -> None:
        super().__init__()
        self.name = name
        self.age = age
    def print(self):
        print(f"name: {self.name}, age: {self.age}")
    def hello():
        print("hello")
```
- 如果没有合适的基类，就使用`object`。
- 担任构造方法角色的是`__init__`方法。
- Python中定义实例方法第一个参数一定是`self`，通过实例调用时解释器会默认传入实例自身，但定义时需要显式声明。
- 定义类方法则不用传入`self`，这是时可以通过类名调用。以第一个参数是否是`self`区分实例和类方法。
- 在实例方法中调用其他实例方法需要通过`self.method()`，调用类方法需要通过类名`ClassName.method()`。
- 和静态类型语言不通，Python允许实例变量绑定任何数据，通过`instance.newproperty = val`就可以绑定新属性到实例上。
- 构造新实例：`instance = ClassName(*args)`。
- 类方法和实例方法是有区分的，也就是有没有传`self`，调用时也能明确的确定。但是属性就不一样了，类的属性（也就相当于静态字段或静态数据成员）是可以通过实例访问的，所以千万不要定义同名的实例属性和类属性。在类中可以通过`self`或者类名调用区分，但外部调用时就区分不了了（用实例可以调，但不能通过实例改，一改其实就相当于定义了同名实例属性了）。
    - 即**不要定义同名类属性/方法和实例属性/方法**。
    - 一般来说经验也是不要通过实例调用类属性。

访问修饰：
- 不通过任何修饰符，还是通过变量名称，属性或者方法前添加`__`就变成了私有的，只能内部访问。
- 当然同样，特殊方法和属性，前后都有`__`的方法外部还是可以访问。
- 封装依然可以做，可以添加getter和setter，可以在其中视情况做一些参数检查和容错。
- 也会有单下划线开头的，外部可以访问，但一般约定为私有的。
- 其实并不是不可访问，只是双下划线开头的做了修饰，`__attr`被修饰成了`_ClassName__attr`，其实依旧可以访问。脱裤子放屁有一套，简单粗暴，能用就行。毕竟代码是死的人是活的。这算是CPython解释器特性，所以不建议这么干，不同解释器规则可能不同。
- 如果在外部设置私有变量是可以成功的，但和想设置的那一个不是一个变量了，毕竟内部的已经做了名称修饰。比如`p.__name = "lisa"`其实是新加了一个变量。


继承与多态：
- `class ClassName(baseClass):`
- 子类会继承父类的全部实例属性和方法。
- 子类中不能访问父类的私有属性和方法，因为经过了名称修饰之后子类中再去访问同名属性经过修饰后和基类是不一样的，会相当于在子类中新增了同名属性，而不会访问到基类的那一个。
- 子类父类存在相同方法时，子类的覆盖父类的。
- 所有类型最终都有共同基类`object`，不写基类默认就是`object`。
```python
print(isinstance(1, object)) # True
print(isinstance(None, object)) # True
print(isinstance("hello", object)) # True
print(isinstance(True, object)) # True
```
- 类方法（也就是其他语言中所说的静态方法）不会继承，只能通过自己的类名访问。


鸭子类型：
- 动态语言是鸭子类型的，就决定了实现多态不必像静态类型一样必须继承，只要实现同样的方法，就可以视为实现了多态。

对象信息：
- 类型：`type(obj)`，得到的`type`类型对象。
- 可以理解`int str bytes`等类型都是这个`type`类型实例。所以内置类型可以直接这样判断类型`type(1) == int`
- 函数则可以使用`types`中定义的常量：
```python
def f():
    pass
# all True
print(type(1) == int)
print(type(type) == type)
print(type(object) == type)
print(type(int) == type)
print(type(f) == types.FunctionType)
print(type(abs) == types.BuiltinFunctionType)
print(type(x for x in range(100)) == types.GeneratorType)
print(type([].append) == types.BuiltinMethodType)
print(type(lambda x : x) == types.LambdaType)
```
- `type`是确定对象的严格类型，`isinstance`则是可以匹配对象类型或者其基类类型。
-  `isinstance`第二个参数可以是类型，也可以是类型元组，用于匹配多个类型，只有有一个匹配，就返回`True`。
- 一般来说为了支持多态总是优先使用`isinstance`。
- 获取一个对象的所有属性和方法：`dir(obj)`，得到一个列表。
- 前后双下划线的特殊方法都是有用途的，比如`__len__`方法，就用于内建的`len`函数，`len`函数实际上就是调用`__len__`方法。只要实现了`__len__`方法，就可以用于`len`函数。
- 除了列出属性和方法，配合`getattr()`、`setattr()`以及`hasattr()`，可以直接操作一个对象的状态。
```python
# dir, getattr(), setattr(), hasattr()
class Person():
    def __init__(self, name) -> None:
        self.name = name
    def sayHi(self):
        print(f"hi, {self.name}")
    def sayHello():
        print("hello")

p = Person("Adam")
print(dir(p))
print(hasattr(p, "name"))
setattr(p, "age", 10)
print(p.age)
print(getattr(p, "age"))
print(getattr(p, "nonexist", "default value"))

f = getattr(Person, "sayHello")
f()
print(f) # <function Person.sayHello at 0x0000023E6318C670>
f = getattr(p, "sayHi")
f()
print(f) # <bound method Person.sayHi of <__main__.Person object at 0x000001AC29507E50>>
```
- 也可以获取方法，获取到后就是一个函数，实例方法就通过对象获取，相当于第一个参数已经传递。而类方法，就通过类名（其实也是一个对象）来获取。
- 通过内置函数，可以对Python对象进行剖析，拿到对象信息，一般只有不知道对象信息时才这样做。


动态绑定属性：
- 动态类型具有静态类型不具有的灵活性，例如动态给对象或者类添加属性和方法。
```python
class Person:
    def __init__(self, *args, **kwargs) -> None:
        self.age = kwargs.pop("age")

def setAge(self, age):
    self.age = age
def getAge(self):
    return self.age

# bind to a single Person object
p = Person(age = 20)
p.setAge = MethodType(setAge, p)
p.getAge = MethodType(getAge, p)
p.setAge(10)
print(p.age) # 10
print(p.getAge()) # 10

# bind to Person class (instance of type class)
Person.setAge = MethodType(setAge, Person)
Person.getAge = MethodType(getAge, Person)
Person.setAge(18)
print(Person.getAge()) # 18
print(Person.age) # 18

# bind instance method to class, just assignment
Person.setAge = setAge
p = Person(age = 10)
p.setAge(100)
print(p.age) # 100
print(p.getAge()) # 18, Person has no instance method call getAge(), so will call Person.getAge() -> 18
Person.getAge = getAge
print(p.getAge()) # 100
```
- 注意就算定义了`self`，`MethodType`第二个参数是要添加方法的实例，所以通过这种方式绑定方法到类其实是成为类方法而不是成为实例方法。【Python中类也是对象(`type`类的实例)！！！】
- 要绑定类的实例方法到类上，直接赋值就可以搞定！
- 总结：
    - 通过`MethodType`绑定，**第二个参数作为`self`被传入方法**，方法必须有`self`参数。
    - 通过赋值绑定的不会传入一个默认的`self`。
    - 通过赋值直接绑定到类上就和直接定义在类里面没有区别，绑定到类上通过实例调用则会将实例作为`self`传入。
    - 通过赋值绑定到对象上也可以，不能有`self`参数。
    - `MethodType`的结果给人感觉就像是定义了一个偏函数(类型本身打印出来并不是)，然后指定了`self`参数。
- 类方法和实例方法并不像其他语言区分那么严格（或许就不该这么区分）：通过实例调用会隐式传`self`，同时通过类也可以调用，只要把实例放在`self`位置，效果是完全一样的。
```python
class Student(object):
    __slots__ = ("name", "age", "getName")
    def getAge(self):
        return self.age

s = Student()
s.age = 10
f = s.getAge
print(f) # <bound method Student.getAge of <__main__.Student object at 0x000001993E72F800>>
print(Student.getAge) # <function Student.getAge at 0x000001A601B2CAF0>
print(f()) # 10
print(Student.getAge(s)) # 10
```
- 需要分清楚绑定方法和函数：`MethodType`返回的结果就是一个绑定方法，通过对象调用的实例方法也是一个绑定方法。

使用`__slots__`：
- 动态添加属性很方便也可能被滥用，Python中允许限制实例的属性，通过定义一个特殊的`__slots__`变量，限制能添加的属性。
```python
class Student:
    __slots__ = ("name", "age")

s = Student()
s.age = 10
s.name = "Adam" 
# s.grade = 4.0 # AttributeError
```
- 此时再添加其他属性，就会失败。方法也可以看做函数类型的属性，所以添加同样会失败。
- `__slots__`定义的属性仅对当前类实例的属性起限制作用，对继承子类实例和类本身属性不起作用。如果继承的子类中使用`__slots__`，那么能用的属性就是自身加上父类的。
- 如果父类不限制，仅子类限制，那么子类实例也是可以绑定新属性的。【这确实有点让人迷惑！】
- 也就是说要限制属性必须要继承链条上所有类都有`__slots__`才行。


`@property`：
- 直接暴露属性简单但是如果要做参数有效性检查就麻烦了，设置为私有并添加对应的getter和setter也可以不过调用起来就有点繁琐了。
- 通过Python内置的`@property`装饰器可以把一个getter方法变成属性调用，然后本身又会创建另一个装饰器`@attr.setter`添加到`setter`上就可以直接通过属性形式转调方法实现读写。
```python
class Person:
    __slots__ = ("_age")
    @property
    def age(self):
        return self._age
    @age.setter
    def age(self, value):
        if not isinstance(value, int):
            raise ValueError("age must be a integer!")
        if value < 0:
            raise ValueError("age must non-negative!")
        self._age = value

p = Person()
p.age = 10
print(p.age)
p.age = "18" # ValueError: age must be a integer!
```
- 只定义getter不定义setter就是只读属性。
- 属性的方法不要和实例变量重名，实例变量最好使用`_`开头的私有访问。

多继承/Mixin：
- `class ClassName(BaseClass1, BaseClass2, ...)`
- 基类可以有多个，如果多个类有同一个方法，那么继承顺序按照顺位调用第一个。
- 多继承也叫混入，不同语言有不同语言的叫法。
- `__mro__`特殊变量是基类的元组，一个实例的方法解析期间基于此来查找基类。
- 已知`__mro__`，在使用[`super`](https://docs.python.org/zh-cn/3/library/functions.html?highlight=super#super)时可以在类定义中调用基类方法的情形中从`__mro__`元组中的特定位置开始查找。
```python
# -*- coding: utf-8 -*-

class A(object):
    def foo(self):
        print('A foo')
    def bar(self):
        print('A bar')

class B(object):
    def foo(self):
        print('B foo')
    def bar(self):
        print('B bar')

class C1(A, B):
    pass

class C2(A, B):
    def bar(self):
        print('C2-bar')

class D(C1, C2):
    pass

if __name__ == '__main__':
    print(D.__mro__) # (<class '__main__.D'>, <class '__main__.C1'>, <class '__main__.C2'>, <class '__main__.A'>, <class '__main__.B'>, <class 'object'>)
    d = D()
    d.foo() # A foo
    d.bar() # C2-bar
```
- 菱形继承不会有多份数据，最终都是通过`__mro__`中的查找顺序来确定的。

定制类：
- 通过定义特殊变量和方法可以定制特定的功能。
- `__xxx__` 特殊变量的用途：
- `__slots__`
- `__len__()` 用于`len`函数。
- `__str__()` 返回字符串，调用`print`打印对象时会打印这个字符串。
- `__repr__()` 为调试服务，python交互环境中输入变量打印出的那个字符串，通常`__repr__`和`__str__`是一样的，可以直接`__repr__ = __str__`。
- `__iter__()` 返回迭代器(`Iterator`)，要在`for in`循环中使用必须重写这个方法，`for`循环拿到迭代器后会调用器`__next__()`获取下一个元素，直到`StopIteration`。`collections.abc.Iterable`是提供了这个方法的抽象基类。`iter(obj)`内置函数调用这个方法。
- `__next__()` 返回下一个元素，`Iterator`类型是提供了`__iter__()`和`__next__()`的抽象基类。`next(obj)`调用这个函数。
- `__getitem__()` 用于通过下标访问`[]`，可能传入整数下标，可能传入切片对象（`slice`），比如对于`dict`，可能传入的是一个作为key的对象。视支持情况实现。
- `__setitem__()` 通过下标设置元素`[]`。
- `__delitem__()` 删除元素。
- `__getattr__()` 动态返回属性，只有类中没有的才会尝试通过这个方法获取，类似于`method_missing()`的功能。
- `__call__()` 一个对象实例可以有自己的属性和方法，定义`__call__()`之后就可以直接对实例进行调用，可以类比为C++中的函数对象，可以有参数。这样其实函数和对象的边界就很模糊了。`callable(obj)`会检查对象是否可调用。比如其实自定义类也是一个`type`的对象，创建时调用`className()`其实就是调用了`type`的`__call__()`然后可能是转调了自定义类的`__init__`。
- 每种内置类型都会定义很多的特殊属性和方法。通过实现同样的方法就可以模拟这些行为，甚至不需要去继承抽象类，因为Python是鸭子类型的，依赖方法而不依赖接口。
- 很多内置函数都是依赖于特殊属性和方法的，将所有[特殊属性、方法](https://docs.python.org/zh-cn/3/reference/datamodel.html#special-method-names)和[内置函数](https://docs.python.org/zh-cn/3/library/functions.html)都理解一遍是有必要的。

枚举类：
```python
from enum import Enum
WeekDay = Enum('WeekDay', ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))
```
- 更精确的控制可以派生`Enum`：`@unique`装饰器检查没有重复值。
```python
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
```
- 访问：
    - `EnumClassName.member`
    - `EnumClassName["membername"]`
    - `EnumClass(valueofenum)` 从常量构建枚举值。
    - `EnumClass.__members__` 获取枚举名到枚举常量的字典。
    - `EnumClass.member.value` 枚举常量的值。

`type`：
- 动态语言和静态语言最大的不同，就是函数和类的定义，不是编译时定义的，而是运行时动态创建的。
- 当Python解释器载入一个模块时，就会依次执行该模块的所有语句，执行结果就是动态创建出一个其中类的class对象。
- `type`函数查看一个类型或者变量的类型，也就是用类名表示的那个`type`类型实例。传入类名得到的结果就是`type`，自定义的类其实就是`type`类型的实例。
- `type`函数还可以用于创建一个新的类型。依次传入：
    - 类名。
    - 继承父类的元组。
    - 方法名称与函数绑定的字典。
```python
def fn(self, name = "world"):
    print(f"hello, {name}!")

Hello = type("Hello", (object, ), dict(hello = fn))

h = Hello()
h.hello()
print(type(h)) # <class '__main__.Hello'>
print(Hello) # <class '__main__.Hello'>
```
- 通过`type`创建类直接通过`calss`关键字创建时完全一致的，也非常简单。而在静态语言中创建类必须通过各种方式动态编译才能做到。

元类metaclass：
- 除了`type`还可以通过元类来管理类的创建行为。
- 可以将类理解为元类的实例，要通过元类来创建类，就需要先定义元类。可以通过元类来创建或者修改类。
- 元类是Python面向对象中最难理解、最难使用的魔法代码，正常情况下不会碰到。
- 元类是类的模板，所以需要从`type`派生。
```python
# create class dynamically using metaclass

# first define metaclass, derived from type
class ListMetaClass(type):
    def __new__(cls, name, bases, attrs):
        attrs['add'] = lambda self, value: self.append(value)
        return type.__new__(cls, name, bases, attrs)
    
# create class using metaclass
class MyList(list, metaclass = ListMetaClass):
    pass

print(MyList) # <class '__main__.MyList'>
print(type(MyList)) # <class '__main__.ListMetaClass'>

# create instance using calss
l = MyList()
l.add(10)
l.add(100)
print(l) # [10, 100]
```
- 定义类时传入`metaclass`关键字参数即可使用元类。
- 此时创建出的`MyList`类（对象）的类型不再是`type`，而是自定义的从`type`派生的元类，在其中重写`__new__`并添加方法，调用`__type__`的`__new__`并且添加了自定义的`add`方法。
- `__new__`接收参数：
    - 当前准备创建的类对象。
    - 类名字。
    - 类父类集合。
    - 类方法集合。
- 最终`MyList`是`list`子类，同时类型是`ListMetaClass`（`type`子类）。
- 那么可以理解为`type`就是一个元类，并且应该作为自定义元类的基类。有一点点抽象，可能需要深入了解一个类的具体创建过程才理解。
- `__new__ __init__`区别是前者是创建过程，是一个静态方法，返回这个实例，后者是已经创建好了后的初始化过程，实例方法，构造时使用前者返回的实例调用`__init__`，返回`None`。两者加起来是实例化过程。
- 元类可以隐式继承到子类中。

元类使用例子：
- 定义一个简单的ORM（Object Relational Mapping，对象关系映射）框架，将数据库的一张表映射为一个类，每一行映射为一个实例。通过定义调用方法就可以实现`update insert delete`等操作。
- [代码在Python分支](../../tree/Python/OOP/ORM.py)


总结：
- Python面向对象实现相当自由与简单，但动态类型的确是这样的。
- 写惯了静态类型切换过来感觉确实诸多魔法。
- 万物皆对象，甚至类也是对象，函数也是对象，对象也可以被调用。
- 特殊属性非常有用非常魔法，自由度可能不及运算符重载，稍微繁琐了一点，但调用规则都是语法内置的，不像运算符重载读起来那么摸不着头脑。
- 还需要进一步深入。


## 错误、调试与测试

各种各样错误：
- 输入非法。添加检测。
- 逻辑问题，修改逻辑。
- 运行时错误，比如磁盘写满，网络连接中断等。这时候就需要异常处理。

异常处理：
- 可以使用错误代码返回值，需要大量代码判读是否出错。没执行一个函数都要检查返回值。
- 异常处理：`try...except...finally...`，将可能出错的逻辑放在`try`中运行，出错则会跳转到`except`，然后执行`finally`（finally中语句无论是否发生错误都会执行，可以没有`finally`）。
- 可以有多个`except`依次捕获不同类型的错误，直到捕获到。未捕获到则会继续向上抛，直到被Python解释器捕获，打印出调用栈，结束程序运行。
- 所有错误的基类`BaseException`。
- [Python内置的异常的派生结构层次](https://docs.python.org/zh-cn/3/library/exceptions.html#exception-hierarchy)。

记录错误：
- 使用`logging`模块，捕获错误记录下后继续执行。
- `import logging`
- 捕获错误时：`logging.exception(e)`

抛出错误：
- 错误不是凭空产生的，而是有意创建并抛出的。Python的内置函数会抛出很多错误，自己编写的函数也可以抛出错误。
- 可以自定义错误类，选择好继承关系，使用`raise AnExceptionInstance`抛出。
- 在捕获一个错误后可以记录下错误，如果无法处理，再向外抛出。直接`raise`可以原样抛出，也可以抛出另一种类型的错误（需要有道理可言比如说把多种错误合并成一种公共的错误，不能说转换成一种不相干的错误，那样会干扰错误诊断）。
- 出错都是希望得到处理的，分析错误信息并定位错误发生的代码位置并修正错误才是最关键的。
- 如果程序给别人用，应当说明什么情况下会抛哪些错误，以帮助使用者编写错误处理逻辑。

调试：
- `print`大法永远可行，但是调完后得删，其实就是简略版日志。
- 断言：`assert assertionCondition, errinfoString`，断言失败会抛出`AssertionError`。启动时加上`-O`选项关闭断言。
- 日志：`import logging`。
    - 不同级别：`NOTSET DEBUG INFO WARNING/WARN ERROR FATAL/CRITICAL`
    - 设置输出级别：`logging.basicConfig(level = logging.INFO)`
    - 对应输出方法：`debug info warning error/exception critical/fatal`
    - 指定`level = INFO`时`debug`就不起作用了。
    - 默认日志级别为`WARNING`。
    - 通过简单的配置，一条语句可以输出到不同地方，比如控制台和文件。
    - 日志是比较方便的工具。
- `pdb`单步调试：`python -m pdb xxx.py`
    - `l`查看代码。
    - `n`单步执行。
    - `p variable`查看变量。
    - `a` 查看当前函数所有变量。
    - `q` 退出程序。
    - `c` 继续执行。
- `pdb`设置断点：
    - `import pdb`
    - `pdb.set_trace()` 设置断点。
- 命令行调试还是太麻烦了，使用VsCode或者PyCharm就行。
- 使用IDE调试虽然方便，但到最后`logging`才是终极武器。对于大型系统单步调试关注局部，大量日志分析更关注整体，都必不可少。

单元测试：
- 单元测试是对一个模块、一个类或者一个函数进行正确性检验的测试工作。
- 思路，比如对于函数`abs()`：
    - 输入正数期待与输入相同。
    - 输入负数期待与输入相反。
    - 输入0期待返回0。
    - 输入非数值类型，比如`[] () {} None`期待抛出`TypeError`。
    - 以上测试放到一个模块中就是一个完整的针对`abs`函数的单元测试。
- 如果测试未通过，需要确定是单元测试编写得有问题还是函数有bug，有则修复，使之能够测试通过。
- 单元测试的意义：在我们修改了`abs()`代码之后，再跑一边测试用例，通过则说明修改对现有`abs()`函数原有的行为未造成影响。不通过的话，要么修改代码与原来需求一致，要么修改测试函数功能发生变化（使用的地方同样需要注意）。
- 这种测试驱动开发的好处就是确保程序模块行为符合设计的测试用例，在将来修改重构时，可以极大程度保证该模块行为仍然是正确的。
- python自带的单元测试模块：`unittest`
- 测试类从`unittest.TestCase`继承，其中以`test`开头的方法就是测试方法，不以`test`开头的方法不会被认为是测试方式，测试时不会被执行。
- `unittest.TestCase`提供了很多内置的条件判断：
    - `assertEqual` 最常用
    - `assertTrue`
    - `assertRaises` 处理错误输入，会抛出异常的情况。
- 最后执行测试的逻辑中直接执行`unittest.main()`（放到`__name__ == "__main__"`中）即可执行这些测试，不需要一个一个添加到代码中。
- 运行测试：`python xxx.py`或者`python -m unittest xxx`测试模块。
- 可以在单元测试中编写两个特殊的`setUp()`和`tearDown()`方法。这两个方法会分别在每调用一个测试方法的前后分别被执行。设想你的测试需要启动一个数据库，这时，就可以在`setUp()`方法中连接数据库，在`tearDown()`方法中关闭数据库。
- 单元测试通过并不代表没有bug了，但是没有通过一定就有bug，无论是测试代码还是具体逻辑。

文档测试：
- Python内置的文档测试`doctest`可以直接提取注释中的代码并执行测试。
- `doctest`严格按照Python交互式命令行的输入和输出来判断测试结果是否正确。只有在测试异常时，可以用`...`表示其中一大段烦人的输出。
- 执行测试：`import doctest` `doctest.testmod()` 一般同样写在`__name__ == "__main__"`条件中，被其他模块导入时不会被执行，只有单独执行改文件才会执行。执行失败会有提示，执行成功不会有任何提示。


## IO

IO分为同步IO和异步IO，因为磁盘读写网络操作等都比CPU处理慢，所以发起一个IO操作CPU可以选择等待处理结束再继续执行，还是说直接继续执行，以其他方式处理IO（IO处理结束后回调或者CPU去轮询IO状态）。异步IO复杂高效，同步IO简单但是低效，这里仅先探讨同步IO。

文件读写：
- 打开文件：`f = open("Test.txt", "r")`
- 函数原型：`open(file, mode='r', buffering=- 1, encoding=None, errors=None, newline=None, closefd=True, opener=None)`
- 读写模式：可以读或者写，写时可以选择覆盖还是添加到末尾，读写可以选择文本格式还是二进制格式，写时可以选择文件不存在和存在时的默认操作（创建还是报错）。
- 具体读写选项：`rwxa` `bt` `+` 可以排列组合，根据需要添加，默认是`rt`文本格式读打开。

|字符|含意|
|:-:|:-|
|`'r'`|读取（默认）
|`'w'`|写入，并先截断文件
|`'x'`|排它性创建，如果文件已存在则失败
|`'a'`|打开文件用于写入，如果文件存在则在末尾追加
|`'b'`|二进制模式
|`'t'`|文本模式（默认）
|`'+'`|打开用于更新（读取与写入）

- Python区分二进制和文本IO，二进制格式打开的内容返回`bytes`对象，不进行任何解码。文本格式打开内容返回`str`，使用指定的`encoding`（如果指定了的话）或者平台默认字节编码解码。
- 平台无关，不依赖操作系统底层的文本文件概念，所有处理由python自身完成。
- 更多参数细节查看[文档](https://docs.python.org/zh-cn/3/library/functions.html#open)。
- 返回一个文件对象，类型取决于所用模式，文本二进制、是否使用缓冲都会有影响，一般文本模式读或写打开是返回的是一个`io.TextIOBase`子类（特别是`io.TextIOWrapper`）。
- 调用`read`读取全部内容，得到的文件对象可以迭代，文本模式下迭代单位是行。
- 使用结束后需要`close`关闭。
- 文件读写时都有可能错误，可以使用`try ... finally`确保文件一定被关闭。
```python
try:
    f = open("Test.txt", "r")
    print(f.read())
finally:
    if f:
        f.close()
```
- 为了简化，Python引入了`with`语句来自动调用`close`。
```python
with open("Test.txt", "r") as f:
    print(f.read())
```
- 文件很大时`read`直接读取可能并不好，可以使用`read(size)`读取指定字节内容，`readline()`每次读取一行，`readlines()`读取所有行放到列表中。
```python
for line in f.readlines(): # iterate list of lines
    print(line)
for line in f: # iterate line in file
    print(line)
```
- `open`返回的具有`read()`方法的对象成为file-like object，除了文件还可以是字节流、网络流、自定义流等，可以自定义，不要求从特定类派生，因为是鸭子类型的，只需要实现`read()`方法就行。
- 写文件使用`write`。写时会缓冲，不会立即写到磁盘，文件关闭时才被写到磁盘。
- python中最好使用`with`语句操作文件IO。

`StringIO`/`BytesIO`：
- 很多时候数据读写不一定就是文件，也可以在内存中读写，内存中读写`str`和`bytes`分别使用`io.StringIO io.BytesIO`。
- 用法和文件流一样，创建之后就可以使用，另外可以使用`getvalue()`获取内容。
- 除了读写，其实IO对象有一个指针指向当前的位置，使用`tell`获取，并且可以使用`seek(offset, whence)`移动（偏移可负可正表向前后移动，后一个参数表相对的位置，默认为0文件开头，1当前位置，2文件末尾），读写、读取行等操作后指针就会移动到写的内容末尾或者下一行。
- 搞清楚当前位置，同时只用来读或写，一般不要同时读或写，会很迷惑容易出错。

操作系统接口：
- 使用`os`模块直接调用操作系统提供了接口。
- `import os`
- `os.name`表明当前系统，类Unix系统是`posix`，windows系统是`nt`。
- `os.uname()`获取系统详细信息。windows上不提供，某些函数是与操作系统相关的。
- 环境变量：
```python
print(os.environ) # environment variables
print(os.environ.get("path")) # get specific environment variable
```

操作文件与目录：
- 接口一部分在`os`模块，`os.path`下。
- `os.mkdir() os.rmdir()`新建和删除目录。
- `os.path.abspath('.')`获取绝对路径。
- 合并路径时，使用`os.path.join()`而不是使用字符串的`join`，这个接口会处理不同操作系统中的目录分隔符。
```python
print(os.path.join('..', "test", "hello")) # ../test/hello in Unix-like, ..\test\hello in windows
```
- 同理拆分路径时使用`os.path.split()`，拆成目录和文件名的元组。
- 拆分文件扩展名`os.path.splitext()`。
- 路径拆分不要求文件存在，仅处理路径。
- 更多函数`os.rename() os.remove()`
- `os`中不存在复制文件的接口，在`shutil`模块中提供了`copyfile`用于复制，这个模块可以看做是`os`模块的补充。
- 还有更多接口，可以查看标准库文档。

序列化：
- 序列化就是将对象写进文件，反过来的过程称为反序列化。Python中称之为Pickling和Unpickling。
- Python的对象序列化可以使用`pickle`模块，使用`pickle.dumps(obj)`将对象转换为字节序列`bytes`，可以直接保存到文件`pickle.dump(obj, fd)`。
- 反序列化则使用`obj = pickle.load(fd)`从文件加载，`obj = pickle.loads(s)`从`bytes`加载。
- 使用`pickle`模块问题和其他语言特有的序列化问题一样，只能用于Python语言，不同版本可能不兼容。泛用性有限。
- 更一般的序列化方法还是使用JSON或者XML这种结构化描述。JSON表示的对象就是标准的Javascript语言的对象。
- JSON和python内置类型对应关系。

|JSON类型|Python类型|
|:-:|:-|
`{}`|`dict`
`[]`|`list`
`"string"`|`str`
`1234.56`|`int`或`float`
`true/false`|`True/False`
`null`|`None`
- Python内置的`json`模块提供了非常完善的JSON格式转换。
- `json.dumps(obj) -> str` `json.dump(obj, fd)`
- `json.loads(json_str) -> obj` `json.load(fd) -> obj`
- 实际使用中还需要能序列化一般对象，为此对象需要是能够序列化为JSON的对象才行，为此需要实现一个将对象转换为字典的方法，作为关键字参数`default`传入`dumps dump`。
```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    def __str__(self) -> str:
        return f"Person -> name : {self.name}, age : {self.age}"

def person2dict(p):
    return {
        "name": p.name,
        "age": p.age
    }

def dict2person(d):
    return Person(d['name'], d['age'])

json_str = json.dumps(Person("Kim", 18), default=person2dict)
print(json_str)
print(json.dumps(Person("Jim", 17), default=lambda x : x.__dict__))
print(json.loads(json_str, object_hook=dict2person))
```
- 同理反序列化时也可以定制一个将字典转换为对象的钩子方法，作为`object_hook`关键字参数传入。
- 通常的实例都有一个`__dict__`属性，就是一个字典，用来存储实例变量，所以序列化时可以传入`default=lambda x : x.__dict__`。也有少数例外，比如定义了`__slots__`的class。
- 当默认的序列化或反序列机制不满足我们的要求时，我们又可以传入更多的参数来定制序列化或反序列化的规则，既做到了接口简单易用，又做到了充分的扩展性和灵活性。
- 比如`ensure_ascii`参数可以确保写到Json字符串中的字符是否允许非ASCII字符，默认是`True`则会将非ASCII的Unicode字符用`\uxxxx`转义。


## 并发编程

多任务：
- 即操作系统同时运行多个任务，表现上就是并发执行的。
- 操作系统的任务就是进程，进程内部可以有子任务，就是线程。
- 多任务的实现方式：
    - 多进程。
    - 多线程。
    - 多进程+多线程。
- Python既支持多进程，又支持多线程。
- 线程是最小的执行单元，进程至少由一个线程组成。进程和线程的调度由操作系统决定，程序不能决定什么时候执行，执行多长时间。
- 多线程和多进程的程序涉及到同步、数据共享等问题，编写起来更复杂。

类Unix系统的多进程：
- `fork()`系统调用一次，返回两次，操作系统自动把当前进程（父进程）复制了一份（子进程），然后在父进程和子进程内分别返回。
- 子进程永远返回0，父进程返回子进程的ID。一个父进程可以`fork`出多个子进程，所以父进程要记下子进程的ID，子进程只需要调用`getppid()`就可以拿到父进程ID。
- Python的`os`模块封装了常见的系统调用，包括`fork`。仅在*nix上有这个接口，windows上没有。
```python
# -*- coding: utf-8 -*-
import os
print(f"porcess {os.getpid()} start ...")

# only works on *nix(Linux/Unix/MacOS)
pid = os.fork()
if pid == 0:
    print(f"This is child process {os.getpid()}, and parent is {os.getppid()}.")
else:
    print(f"This is parent process {os.getpid()}, and just created a child process {pid}")
```

跨平台的多线程：
- 如果是打算编写多进程的服务程序，运行在Linux平台显然是最佳的选择。
- Python是跨平台的，所以也封装了跨平台的多线程模块`multiprocessing`。
- 其中提供了`Process`类代表一个进程。
```python
from multiprocessing import Process
import os

# subprocess will execute
def run_proc(name):
    print(f"Run child process {name} ({os.getpid()})...")

if __name__ == "__main__":
    print(f"Parent process {os.getpid()}.")
    p = Process(target = run_proc, args = ('test', ))
    print("Child process will start.")
    p.start()
    p.join()
    print("Child process end.")
```
- 创建子进程时，传入一个执行函数和函数参数构造新的`Process`对象，使用`start`方法启动，`join()`方法等待子进程结束后再继续往下执行，通常用于进程间同步。

进程池：
- 如果要创建大量子进程，可以使用进程池`multiprocessing.Pool`批量创建子进程。
```python
from multiprocessing import Pool, Process
import os, time, random

def long_time_task(name):
    print(f"Run task {name} ({os.getpid()})...")
    start = time.time()
    time.sleep(random.random() * 3)
    end = time.time()
    print(f"Task {name} runs {end-start:0.2f} seconds.")

if __name__ == "__main__":
    print(f"Parent process {os.getpid()}.")
    p = Pool(4)
    for i in range(5):
        p.apply_async(long_time_task, args = (i, ))
    print("Waiting for all subprocess done...")
    p.close()
    p.join()
    print("All subprocess done.")
```
- 通过`Pool`对象创建进程池，调用`apply_async`添加子进程，调用`join()`会等待进程池内所有子进程执行完毕，之前必须调用`close()`，调用`close()`之后便不能再添加新的子进程了。
- 某一次运行结果：子进程0,1,2,3是立即执行的，而子进程4要等待前面某个子进程执行完后才执行，这是因为`Pool(4)`指定了同时执行的子进程数量是4，因此最多同时执行4个子进程，这是刻意的设计。如果改成`Pool(5)`就能同时执行5个进程了。如果不指定的话，默认大小是CPU的核心数量（逻辑核心而非物理核心数量，比如Intel的四核八线CPU，逻辑核心数量就是8）。
```
Parent process 7400.
Waiting for all subprocess done...
Run task 0 (17464)...
Run task 1 (10520)...
Run task 2 (1504)...
Run task 3 (5836)...
Task 2 runs 0.20 seconds.
Run task 4 (1504)...
Task 3 runs 0.89 seconds.
Task 1 runs 1.23 seconds.
Task 0 runs 1.31 seconds.
Task 4 runs 1.58 seconds.
All subprocess done.
```

和外部进程通信：
- 很多时候子进程可能是外部进程，这时候如果要通信，可以使用`subprocess`模块调用外部命令。
- 通过`Popen`调用，通过`communicate`通信，传入输入信息，得到标准输出和标准错误输出。
```python
import subprocess

p = subprocess.Popen(['python', '-c', 'print("hello,world!")'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
out, err = p.communicate()
print(out.decode("utf-8"), err.decode("utf-8"))
print("exit code: ", p.returncode)
```

进程间的通信：
- `Process`需要通信的话，python的`multiprocessing`模块封装了底层机制，提供了`Queue Pipes`多种方式用来交换数据。
- 以`Queue`为例，父进程中创建两个子进程。一个往队列中写数据，另一个读取数据。
```python
from multiprocessing import Process, Queue
import os, time, random

# write to queue
def write(q):
    print(f"Process to write : {os.getpid()}")
    for value in ['A', 'B', 'C']:
        print(f"Put {value} in queue...")
        q.put(value)
        time.sleep(random.random())

# read from queue
def read(q : Queue):
    print(f"Process to read : {os.getpid()}")
    while True:
        value = q.get(True) # block = True
        print(f"Get value {value} from queue.")

if __name__ == "__main__":
    # create queue and pass to subprocess
    q = Queue()
    pw = Process(target=write, args=(q,))
    pr = Process(target=read, args=(q,))
    # start subprocess to write
    pw.start()
    # start subprocess to read
    pr.start()
    # wait pw end
    pw.join()
    # pr is infinite loop, can not end by itself, must be terminated.
    pr.terminate()
```
- 在Unix/Linux下，`multiprocessing`模块封装了`fork()`调用，使我们不需要关注`fork()`的细节。由于Windows没有`fork`调用，因此，`multiprocessing`需要“模拟”出`fork`的效果，父进程所有Python对象都必须通过`pickle`序列化再传到子进程去，所以，如果`multiprocessing`在Windows下调用失败了，要先考虑是不是`pickle`失败了。
- `Pipe`就是管道，每端都有`send()`和`recv()`方法，也就是发送和接收，如果两个进程试图在同一时间的同一端进行读取和写入那么，这可能会损坏管道中的数据。

**多线程**：
- 进程是由若干线程组成的，一个进程至少有一个线程。线程是操作系统直接支持的执行单元，高级语言都有内置多线程支持。Python的线程是真正的Posix Thread，而不是模拟出来的线程。
- Python的多线程模块：`_thread`和`threading`，`_thread`是低级模块，`threading`是高级模块，对`_thread`进行了封装。绝大多数情况话都是直接使用`threading`模块。
- 启动一个线程：创建一个`Thread`实例，传入函数，调用`start()`开始执行。
```python
import time, threading

def loop():
    print(f"thread {threading.current_thread().name} is running...")
    for i in range(5):
        print(f"thread {threading.current_thread().name} >>> {i}")
        time.sleep(1)
    print(f"thread {threading.current_thread().name} end.")

if __name__ == "__main__":
    print(f"thread {threading.current_thread().name} is running...")
    t = threading.Thread(target=loop, name="LoopThread")
    t.start()
    t.join()
    print(f"thread {threading.current_thread().name} end.")
```
- 主线程名称默认是`MainThread`。
- 多进程中，同一个变量有多份拷贝，互不影响，交互一般通过文件或者管道。而在多线程中，每个线程是一个调用栈，变量是共享的。而线程之间执行顺序不是确定的，一个线程修改变量之后会影响另一个线程的执行。所以必须对这种行为加以限制。
- 调用`threading.active_count()`获取当前活跃的线程数量（主线程或者子线程）。
- `Thread.setDaemon(True)`设置当前线程为主线程的守护线程，守护线程不必被全部执行完毕，当主线程执行完毕时，它的守护线程就会自动停止结束，直接退出。

锁：
- 为了保证线程安全，必须给多个线程使用或者修改了共享变量的代码加锁。当一个线程执行时，另一个线程不得同时进入，必须等待另一个线程执行结束之后才能进入。
- 通过`threading.Lock()`创建互斥锁。
- 使用`lock.acquire()`获取锁，`lock.release()`释放锁。获取锁时如果已经被其他线程获取，那么就会挂起等待其他线程执行完释放锁之后再才能获取。如果加锁的代码可能可能会抛异常，可以使用`try ... finally`确保一定能够释放锁。
- 多个线程同时获取锁时，只要一个能获取成功。加了锁的部分在线程内可是视为原子的操作，一定能够顺序地完整执行完。
- 获取锁之后一定要释放，否则其他需要获取该锁的线程就会苦苦等待，成为死线程。
- 锁的的存在实际上阻止了多线程并发执行，包含锁的代码也只能同时在一个线程内执行。
- 可以存在多个锁，当不同线程拥有不同锁，并尝试去获取对方的锁时，就会造成死锁。
- Python中的多线程有一个全局的GIL锁（Global Interpreter Lock，官方解释器CPython的历史遗留问题），任何Python代码执行前必须先获得GIL锁。然后，每执行100条字节码，解释器就自动释放GIL锁，让别的线程有机会执行。所以其实Python中多线程也只能交替执行，而无法在多核CPU的多个核心上同时执行。PyPy和Jpython中是没有GIL的。
- Python虽然不能利用多线程实现多核任务，但可以通过多进程实现多核任务。多个Python进程有各自独立的GIL锁，互不影响。
- 如果一定要在Python多线程中利用多核，也可以通过C扩展实现。
- 锁本身属于共享变量，不属于任何一个线程，这里的说的锁主要是`threading.Lock()`互斥锁，还有其他锁类型。

`ThreadLocal`：
- 多线程环境中，线程使用局部变量更好（这样每一个线程都会有一份），而不是使用共享的全局变量，全局变量使用必须加锁。
- 要在一个线程内局部变量，麻烦的是，如果另一个函数需要使用该变量就必须作为参数传进去。这样多调用几层后参数会越来越多。
- 还有一个方法就是在一个全局的字典中根据线程ID作为key，保存属于不同线程的同类型对象，线程中根据ID去获取。这样理论上虽然可行，但是太麻烦了，并且还需要注意字典的并发访问。
- 为了应对这种问题，就出现了`ThreadLocal`对象。
```python
import threading

class Student():
    def __init__(self, name) -> None:
        self.name = name
    def __str__(self) -> str:
        return f"Student {self.name}"

# create global ThreadLocal object
local_shool = threading.local()

def process_student():
    std = local_shool.student
    print(f"hello, {std} in thread {threading.current_thread().name}")

def process_thread(name):
    local_shool.student = Student(name) # bind thread local object to atrribute of global threading.local object
    process_student()

if __name__ == "__main__":
    t1 = threading.Thread(target=process_thread, args=("Alice",), name="Thread-A")
    t2 = threading.Thread(target=process_thread, args=("Bob",), name="Thread-B")
    t1.start()
    t2.start()
    t1.join()
    t2.join()
```
- 创建全局的`thread.local()`对象之后，将线程局部的变量绑定到其上，就可以在线程内部访问该线程对应的对象了。每个线程都有有该对象，但是每个线程都不一样。
- `ThreadLocal`最常见的用法是为每个线程绑定一个数据库连接，HTTP请求，用户身份信息等。

进程与线程：
- 为了实现多任务，我们通常为使用Master-Worker模式，一个主进程/线程负责任务分发，多个工作进程/线程负责任务执行。
- 多进程模式优点是稳定性高，一个子进程崩溃，不会影响主进程和其他子进程。（当然主进程崩溃其他进程也无法幸免，但是主进程只负责任务分发一般崩溃概率比较低）。
- 多进程的缺点是创建进程的代价较大，类Unix下，`fork`还行，但Windows下，进程创建的开销很大。操作系统能运行的进程数量也是有限的。
- 多线程模式的话，线程创建的开销会比进程小一些。多线程下任何一个子线程崩溃都可能导致整个程序崩溃，因为所有线程共享内存。
- 无论是线程还是进程，切换都是有开销的，线程和进程多到一定程度，光是切换可能就会消耗大量CPU资源，得不偿失。
- 考虑采用多任务处理的类型，可以将任务分为IO密集型还是计算密集型任务。计算密集型大量消耗CPU资源，对程序性能有要求，Python这种脚本语言运行效率低下，不适合用来编写计算密集型程序。IO密集型任务涉及网络文件等IO，CPU消耗少，大部分时间用于等待IO操作，对于IO密集型任务，并行的任务越多，CPU效率越高，但也有一个限度。常见的大部分任务都是IO密集型任务，比如Web应用。对于IO密集型语言，使用Python这样的脚本语言开发比较合适，开发效率高，运行效率也不差。
- 一个程序中如果涉及到IO密集操作，如果采用单进程/线程模型可能会导致IO时其他任务无法并行执行，需要花费大量时间等待IO的情况。为此才需要多进程和多线程模型来支持并行。
- 现代操作系统对IO操作做了巨大改进，最大的特点就是支持异步IO，如果充分利用操作系统的异步IO，可以使用单进程/线程来执行多任务。这种全新的模型成为**事件驱动模型**。Nginx就是支持异步IO的Web服务器，它在单核CPU上采用单进程模型就可以高效地支持多任务。在多核CPU上，可以运行多个进程（数量与CPU核心数相同），充分利用多核CPU。
- 在Python语言中，单线程的异步模型成为协程（很多编程语言中都有对协程的支持），有了协程的支持，就可以基于事件驱动编写高效的多任务程序。后续探讨协程（实践中真正用得多的东西）。

协程：TODO。
- 对于多线程应用，CPU通过切片的方式来切换线程间的执行，线程切换时需要耗时。协程，则只使用一个线程，分解一个线程成为多个“微线程”，在一个线程中规定某个代码块的执行顺序。
- 适用场景：当程序中存在大量不需要CPU的操作时（IO）
常用第三方模块`gevent`和`greenlet`，前者是后者的封装，常用前者。

分布式进程：
- 创建多任务程序时，应该首选多进程，多进程更稳定，而且多进程可以部署到不同的机器上，而多线程最多只能部署到同一机器的多个CPU上。何况CPython的多线程不能并行。
- Python的`multiprocessing`不仅支持多线程，其中的子模块`managers`还支持把多进程分布到多台机器上，一个服务进程作为调度者，依靠网络通信将任务分布到其他多个进程。封装很好，不必了解网络通信的细节。
- 例子：通过`Queue`通信，多进程，发送任务的进程和处理任务的进程分布到不同机器上。通过`managers`模块把`Queue`通过网络暴露出去，就可以让其他机器的进程访问`Queue`了。
- 主进程：
```python
# -*- coding: utf-8 -*-
# TaskMaster.py

# distributed multi process, task manager
import random, time, queue
from multiprocessing.managers import BaseManager

# queue that send tasks
task_queue = queue.Queue()
# queue that receive tasks
result_queue = queue.Queue()

class QueueManager(BaseManager):
    pass

def get_task_q():
    return task_queue
def get_result_q():
    return result_queue

if __name__ == '__main__':
    # register two queues to network
    QueueManager.register('get_task_queue', callable=get_task_q)
    QueueManager.register('get_result_queue', callable=get_result_q)
    # bind to port 5000, authentication code abc
    manager = QueueManager(address=('127.0.0.1', 5000), authkey=b'abc')

    # start the manager
    manager.start()
    # get Queue object through network
    task = manager.get_task_queue()
    result = manager.get_result_queue()

    # put some tasks to task queue
    for i in range(10):
        n = random.randint(0, 10000)
        print(f"Put task {n}")
        task.put(n)

    # read result from result queue
    print("Try get results...")
    for i in range(10):
        try:
            r = result.get(timeout=10)
            print(f"Result : {r}")
        except queue.Empty:
            print("The queue is empty...")

    # shudown manager
    manager.shutdown()
    print("Master exit.")
```
- 工作进程；
```python
# -*- coding: utf-8 -*-
# TaskWorker.py

# distributed multi process, task wroker
import time, sys, queue
from multiprocessing.managers import BaseManager

class QueueManager(BaseManager):
    pass

if __name__ == '__main__':
    QueueManager.register('get_task_queue')
    QueueManager.register('get_result_queue')
    server_addr = "127.0.0.1"
    print(f"Connect to server {server_addr}...")
    m = QueueManager(address=(server_addr, 5000), authkey=b'abc')
    # connect to server
    m.connect()
    # get Queue from network
    task = m.get_task_queue()
    result = m.get_result_queue()
    # get task from task queue, calculate and put result to result queue
    for i in range(10):
        try:
            n = task.get(timeout=1)
            print(f"Run task {n} * {n}...")
            r = f"{n} * {n} = {n * n}"
            time.sleep(1)
            result.put(r)
        except queue.Empty:
            print("task queue is empty.")
    
    # end wrok process
    print("Worker exit.")

```
- 加了多余的循环保证5次任务能执行完，执行时在两个终端中分别依次执行`python TaskMaster.py`和`python TaskWorker.py`。将会通过本机的5000端口进行网路交互，完成任务分发、执行和结果获取。修改地址为局域网IP后还可以在虚拟机/WSL和本机中执行。
- 没有对网络连接是否成功做检查，需要在主线程连接还存在时执行工作线程。
- `QueueManager`给任务和结果队列都注册了网络调用接口，在工作进程中调用就能够获取到了。
- `authkey`是校验码，保证两台机器通信不受干扰。如果不一致，网络连接会失败。
- 总结：
    - Python的分布式进程接口简单、封装良好，适合把繁重任务分布到多台机器。
    - 注意`Queue`的作用是用来传递和接收结果，每个任务的描述应该尽量小。比如发送一个处理日志文件的任务，就不要发送几百兆的日志文件本身，而是发送日志文件存放的完整路径，由Worker进程再去共享的磁盘上读取文件。

阅读：
- [搞定python多线程和多进程](https://www.cnblogs.com/whatisfantasy/p/6440585.html)

## 正则表达式

正则表达式：
- 正则表达式是一种用来匹配字符串的强有力的武器。它的设计思想是用一种描述性的语言来给字符串定义一个规则，凡是符合规则的字符串，我们就认为它“匹配”了，否则，该字符串就是不合法的。
- 判断一个字符串是否是合法的正则的方法，创建一个正则表达式，用该正则表达式去匹配用户输入。

规则：
- 正则表达式也是用字符串来表示的，表示规则：
- 直接给出字符则精确匹配字符。
- `\d`匹配数字。
- `\w`匹配数字或者字母。
- `\b`匹配单词的开始或者结束。
- `\s`匹配空白符，Tab空格等。
- 上面几个的大写版本表反义：`\D \W \B \S`。
- `.`匹配除换行符以外的任意字符。
- 变长字符：跟在一个规则后。
    - `*`匹配任意字符，包括0个。
    - `+`匹配至少一个字符。
    - `?`匹配0个或1个字符。
    - `{m}`匹配m个字符。
    - `{n,}`匹配n个或更多个字符。
    - `{n,m}`匹配n到m个（包括m）字符。
- 特殊字符`.*+?,;-\_{}()|^$`需要使用`\`转义。
- 表示范围：`[]`，其中可以使用`-`前后跟数字或字母，表示某个字符到某个字符。
    - 如`[a-zA-Z0-9_]`匹配数字字母和下划线。`[a-z0-9A-Z_]`等价于`\w`
    - 匹配一个范围中的某字符时前面加`^`表反义：`[^a-z]`匹配所有非小写字母的字符。
- 匹配两者中一者`|`，`A|B`。
- `^`表行开头，`^\d`表示以数字开头。
- `$`表行结束，`\d$`表示以数字结束。匹配一整行可以用`^`开头，`$`结尾。

Python中的正则表示式：
- Python字符串中本身存在转义，而正则字符串某些字符也存在转义，为了避免混淆，实践中建议全部使用`r`前缀原始字符串表示正则字符串。如此便只需要考虑`'"`的转义了。
- `import re`
- `re.match(pattern, string)`匹配成功则返回一个`Match`对象，失败返回`None`。
- `re.split()`可以切分字符串，
- 除了简单地判断是否匹配之外，正则表达式还有提取子串的强大功能。用`()`表示的就是要提取的分组（Group）。用`re.Match.group(index)`方法。`group(0)`永远是原始字符串，`group(1)`、`group(2)`、...表示第1、2、...个子串。
- 正则匹配默认是贪婪匹配，也就是匹配尽可能多的字符。为了采用非贪婪匹配，可以在表数量的字符后缀后再加一个`?`。

编译正则表达式：
- 在Python中使用正则表达式时，内部会先编译正则表达式，如果正则表达式本身不合法会报错，然后再用编译后的正则表达式去匹配字符串。
- 如果要匹配一个正则表达式多次，可以编译后再去匹配，提升执行效率。
- 使用`re.compile(pattern)`编译一个正则表达式，会得到一个`re.Pattern`对象，使用这个对象去匹配字符串不需要再传入正则表达式。

更多正则表达式内容：
- 捕获、零宽断言、负向零宽断言、注释、平衡组、递归匹配等有机会接触到再详细了解。

## 常用内建模块

`datetime`
- `from datetime import datetime`，前者是模块，后者是类表示日期和时间。
- 当前时区时间`datetime.now()`，标准时区时间`datetime.utcnow()`。
- 构造指定日期时间：`datetime(year, month, day[, hour[, minute[, second[, microsecond[,tzinfo]]]]])`
- 时间戳：`datetimeInstance.timestamp()`，从UTC+00:00时区的1970年1月1日00:00:00时刻（Epoch Time）到现在的时刻的秒数成为时间戳，单位是秒，浮点数，精确到微妙（小数点后6位）。时间戳和时区、闰年闰秒等无关。
- 时间戳转`datetime`：`datetime.fromtimestamp(stamp)`，结果是本地时区。
- 时间戳转UTC标准时区（UTC+00:00）时间：`datetime.utcfromtimestamp(stamp)`。
- 字符串转`datetime`：`datetime.strptime("2021-1-1 10:00:01", "%Y-%m-%d %H:%M:%S")`，时间字符串和格式化字符串格式要吻合，详见[文档](https://docs.python.org/zh-cn/3/library/datetime.html#strftime-strptime-behavior)。得到的时间没有时区信息。
- `datetime`转字符串：`datetime.now().strftime('%a, %b %d %H:%M')`。格式化字符串同上见文档。
- 表时间间隔的类：`timedelta`，支持加减、正负号绝对值、和`timedelta`比较，与整数做乘除法。构造：`timdelta(days, seconds, microseconds)`。两个`datetime`相减会得到一个`timedelta`。
- 时区信息：`timezone`类。
    - 创建UTC+8:00时区：`timezone(timedelta(hours=8))`
    - `datetime`有`tzinfo`属性，默认是`None`时表示当前时区。
    - 强制替换时区：`datetimeinstance.replace(tzinfo=timezone(timedelta(hours=7)))`，时间日期不会变，只是强制改变时区。
- 时区转换：
    - `astimezone(self, tz=None)`方法切换到某一时区，默认当前时区。
    - 如果以前没有时区信息`None`，那么就是从当前时区转到特定时区。
    - 关键在于要知道拿到一个`datetime`时它的时区，一般比如`datetime.now()`是不包含时区信息的，可以通过`tzinfo`属性设置或者先调用一次加上时区信息。

`collections`
- 命名元组：`namedtuple`函数，用来创建一个命名了的元组，元素个数固定，并可以指定属性名称，除了下标还可以通过属性名称来访问元素。`Point = namedtuple('Point', ['x', 'y'])`。
- 双向列表：`deque`，使用`list`插入删除效率不高，`deque`可以用作队列和栈，提供高效头尾插入和删除元素。方法`append pop appendleft popleft`。
- `defaultdict`：使用`dict`时，如果key不存在，会抛出`KeyError`，如果希望key不存在时返回一个默认值，可以用`defaultdict`。
- `OrderedDict`：有序字典，元素会按照key插入顺序排列。
- `ChainMap`：将多个`dict`有序地组合起来，构成一个逻辑上的字典，查找时会按照顺序依次查找每一个字典，和多个字典取并集有区别。可以实现多个层次优先级查找，比如应用程序往往都需要传入参数，参数可以通过命令行传入，可以通过环境变量传入，还可以有默认参数。我们可以用ChainMap实现参数的优先级查找。
- `Counter`：计数器，`dict`子类，value类型是整数，用来计数。
- Python命名感觉有点混乱，有时大驼峰有时全小写。

`base64`
- Base64编码是一种用64个字符来编码任意二进制数据的方法。
- 众所周知文本编辑器无法处理二进制文件，因为编码不一致，用ASCII的话可能存在非ASCII的字符，其他编码字符编码也不一定符合。为了能用文本字符串来表示二进制数据，就可以将二进制数据用Base64进行编码。
- 原理：准备64个字符的数组，将二进制数据按照每6位编码为一个8位的字符（这6位的值作为数组下标的数组元素），每3个字节就会编码为4个字节的字符串，体积膨胀33%。如果二进制数据长度不是3个倍数，用`\x00`字节在二进制数据末尾补足，再在编码末尾添加`=`或`==`表示补了多少字节。
- 这个字符数组是：`['A', 'B', ..., 'Z', 'a', 'b', ..., 'z', '0', ..., '9', '+', '/']` 字母数字加上加减号共64个字符。
- 编码解码都非常简单，编码就查表替换就行，解码则反推索引，恢复二进制数据即可。
- Python内置`base64`模块提供Base64编解码功能。
- 编码：`base64.b64encode(b'helloworld')`
- 解码：`base64.b64decode(b'aGVsbG93b3JsZA==')`
- 编解码是可以提供一个长度为2的字节序列关键字参数`altchars`用来替换`+/`以获得合法的url或者文件系统路径字符串。
- 内置的用`-`和`_`来替换`+/`的编解码方法：`urlsafe_b64encode urlsafe_b64decode`。
- 还可以自定义64个字符的排列顺序，这样就可以自定义Base64编码，不过通常情况下完全没有必要。
- Base64可以用以编解码，不能用于加密，即使使用自定义编码表（太过原始，不安全）。
- Base64适用于小段内容的编码，比如数字证书签名、Cookie的内容等。
- 但`=`用在URL、Cookie里面会造成歧义，所以，很多Base64编码后会把`=`去掉。因为Base64是把3字节变4字节，所以解码前只需要在Base64字符串后加上`=`使长度变成4个整数倍即可。

`struct`
- `struct`模块提供`bytes`和其他二进制数据类型比如整数浮点数之类的转换。
- `import struct`。
- `strcut.pack(format, *args)`将多个数据打包成一个二进制序列，格式字符见[文档](https://docs.python.org/zh-cn/3/library/struct.html#format-characters)，比如`>I`就表示用大端序编码一个4字节无符号整数。
- Python不适合编写底层操作字节流的代码，但在对性能要求不高的地方，可以使用`struct`。
- 解析二进制序列：`struct.unpack(format, bytes)`，得到元组。
- 使用场景：一些特定的二进制文件格式（比如图片BMP、JPG等）都会有特定结构，此时读入二进制流，然后使用`struct`解析或者打包文件头就可以很方便。

`hashlib`
- `hashlib`提供了常见的摘要算法，比如MD5，SHA1等。
- 摘要算法的目的主要是通过摘要函数对任意长度的数据计算出固定长度的摘要`digest`，可以用以确认原始数据是否被人篡改过。
```python
import hashlib
md5 = hashlib.md5()
md5.update('how to use md5 in '.encode('utf-8'))
md5.update('python hashlib?'.encode('utf-8'))
print(md5.hexdigest())
```
- 其他比如`sha1 sha256 sha512`用法类似，对较长数据做哈希时可以分多次传入`update`，和一次传入计算结果一致。
- MD5生成128位的字节，通常用长度32的16进制字符串表示。SHA1生成160位的字节，通常用长度40的字符串表示。比SHA1更安全的算法是SHA256和SHA512，分别生成256和512位，摘要长度越长越安全，计算起来越慢。
- 通常在很多网站下载文件时都会给一个SHA256检验码，可以拿到文件后计算文件的SHA256是否吻合以确保文件在网络上传输过程中没有被篡改。
- 应用：在保存用户密码时保存经过摘要之后的哈希，而不是原始的密码字符串，用户输入密码后计算出哈希然后对比哈希，这样即使运维人员能访问数据库、数据库被黑客攻击窃取，也无法知道用户输入的密码明文，从而防止撞库等攻击手段。当然这一定程度上也是取决于摘要算法本身是否能够被破解的，这就是另一个问题了。摘要并不一定就是唯一的，做哈希那很显然对不同数据做哈希得到的哈希值可能是相同的，只是在实践中这种情况发生概率是非常非常小的。
- 采用MD5等哈希存储密码是否一定安全呢？也不一定，因为用户极有可能使用很简单的密码比如123456，qwerty等这种常用密码，从哈希值反推密文是非常费劲的，但黑客可以维护一个常见密码到哈希值的数据库（彩虹表），如果用户密码很简单在库中，那么就可以通过哈希反推出密码。所以作为用户来说，为了防止这种攻击，一般不要使用太简单的密码。
- 为了保护较为简单的密码被反推，也可以对原始密文字符串加上一个复杂字符串之后再做哈希，俗称“加盐”。经过加盐之后，只要Salt不被黑客知道，就无法推出原始密文。甚至计算哈希时将密码加上用户名和盐一起计算。
- 哈希算法无法用于加密，因为信息是有损的且无法反推明文，只能用于防篡改。它的单向计算特性决定了可以在不存储明文口令的情况下验证用户口令。


`hmac`
- 上述计算哈希时如果Salt是我们随机生成的，那么计算MD5通常采用`md5(message+salt)`，如果把盐看做口令，计算消息的哈希时需要提供这个口令，验证时也必须要提供正确的口令。
- 这实际上就是Hmac算法：Keyed-Hashing for Message Authentication。它通过一个标准算法，在计算哈希的过程中，把key混入计算过程中。不同于我们自己计算MD5加盐，Hmac算法对所有哈希算法都适用，无论MD5还是SHA1，采用Hmac算法代替自己编写加盐代码，可以使程序更加标准化也更安全。
- Python的`hmac`模块可以做这件事情。
```python
import hmac
message = b"hello,world!"
key = b"sercet"
h = hmac.new(key, message, digestmod="MD5")
print(h.hexdigest())

h = hmac.new(key, message, digestmod="SHA1") # SHA256, SHA512, ...
print(h.hexdigest())
```
- 需要注意的是，如果黑客知道了用户的盐，那么还是可以通过已知密码列表和这个盐算出一个库，最后和哈希值对比，如果有那么就破解成功了。实践中一般会给每个用户生成一个随机的盐，保存在服务端，这样黑客就无法通过每次计算一个盐得到一个库来尝试撞出所有用户的密码，而是要对每一个盐都对密码表中所有密码生成一个库，极大地增大了黑客的计算成本，使拿到数据库的黑客批量计算出密码这件事情变得几乎不可行了。但黑客还是可以针对一个特定的用户去尝试，这时候还是需要用户设置更加复杂的密码，以及不在不同网站使用同样的密码才可以很好地避免。一般人其实也不具备被黑客攻击的价值，但还是要有最基本的安全意识。
- 摘要算法的输入是字节序列。

`itertools`
- 其中提供了一些用于迭代的有用的函数。
- 比如Map/Reduce相关操作的补充。
- 几个无限迭代器：
    - `count(start, step = 1)`从n开始的无限迭代器。
    - `cycle(iterator)`循环迭代一个迭代器，结束后又从头开始。
    - `repeat(elem, times)`迭代一个元素指定次数，不传次数则是无数次。
    - 迭代时才回去访问元素，不会事先创建无限的元素。
- 串联多个迭代器，形成一个更大的迭代器：`chain(*iters)`。
- 把迭代器中相邻的重复元素挑出来放在一起：`groupby(iterable, grouprule)`，挑选规则为传入的函数，只要作用于两个元素返回的值相等就被放到一组。
- 还有很多有用的函数。

`contextlib`
- Python中读写文件这种资源处理需要特别注意，需要确保关闭，一个方法是使用`try...finally`，不过很繁琐，更常见的是使用`with`语句。
- 除了`open()`函数打开文件对象，其实对于任何对象，只要正确实现了上下文管理，都能用于`with`语句。
- 实现上下文管理是通过`__enter__`和`__exit__`这两个方法实现的。
```python
class Query(object):
    def __init__(self, name) -> None:
        self.name = name
    def __enter__(self):
        print('Begin')
        return self
    def __exit__(self, exc_type, exc_value, traceback):
        if exc_type:
            print('Error')
        else:
            print('End')
    def query(self):
        print(f"Query info about {self.name}")

with Query('Bob') as q:
    q.query()
```
- 因为是鸭子类型的，所以不需要继承什么类，只需要实现这两个方法，就可以在`with`语句中使用。
- 使用`__enter__ __exit__`依然比较繁琐，Python标准库`contextlib`提供了更简单的写法。上面的代码可以改写为：
```python
from contextlib import contextmanager

class Query2(object):
    def __init__(self, name):
        self.name = name
    def query(self):
        print(f"Query info about {self.name}")

@contextmanager
def create_query(name):
    print("Begin")
    q = Query2(name)
    yield q
    print('End')

with create_query('Bob') as q:
    q.query()
```
- 使用`@contextmanager`装饰器，定义函数，执行要执行的操作，将要放在`with`语句中的对象`yield`出去，将进入和离开释放资源的逻辑写在其中即可。
- 执行顺序：`yield`前的语句，`with`块中语句，然后是`yield`后的语句。
- 很多时候，希望在某段代码执行前后自动执行特定代码，也可以用`@contextmanager`实现。
- 比如输出xml时输出内容后自动输出元素的结束标记。
```python
@contextmanager
def tag(name):
    print(f"<{name}>")
    yield
    print(f"</{name}>")

with tag("h1"):
    print("hello")
```
- 如果一个对象没有实现上下文，我们就不能把它用于with语句。这个时候，可以用`closing()`来把该对象变为上下文对象。
- 效果类似于：结束后自动调用`close`方法。
```python
@contextmanager
def closing(thing):
    try:
        yield thing
    finally:
        thing.close()
```
- 这个库中还有许多用于上下文管理的装饰器，见[文档](https://docs.python.org/zh-cn/3/library/contextlib.html)。

`urllib`
- 提供了一系列操作URL的功能，`urllib`模块的`request`模块可以方便的抓取URL内容，也就是发送一个GET请求到指定的页面，然后返回HTTP的响应。
```python
from urllib import request

with request.urlopen('https://baidu.com') as f:
    data = f.read()
    print('Status:', f.status, f.reason)
    for k, v in f.getheaders():
        print('%s: %s' % (k, v))
    print('Data:', data.decode('utf-8'))
```
- 如果要模拟浏览器发送GET请求，就需要使用`Request`对象，添加HTTP头，就可以把请求伪装成浏览器：
```python
req = request.Request('http://www.douban.com/')
req.add_header('User-Agent', 'Mozilla/6.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/8.0 Mobile/10A5376e Safari/8536.25')
with request.urlopen(req) as f:
    print('Status:', f.status, f.reason)
    for k, v in f.getheaders():
        print('%s: %s' % (k, v))
    print('Data:', f.read().decode('utf-8'))
```
- 如果要发送POST请求，就需要把参数`data`以bytes形式传入
- 还有更复杂的控制，比如通过一个代理去访问网站，可以利用`ProxyHandler`来处理。
- `urlopen`得到的对象是一个file-like对象，可以像文件一样通过`read`读取。

`XML`
- XML比JSON更复杂，不过依然还有许多地方在使用。
- XML有两种操作方法：DOM(Document Object Model)和SAX(Simple API for XML)。DOM会把整个XML读入内存，解析为树，因此占用内存大，解析慢，优点是可以任意遍历树的节点。SAX是流模式，边读边解析，占用内存小，解析快，缺点是我们需要自己处理事件。
- 正常情况下优先考虑SAX，因为DOM太占用内存。
- Python使用SAX，通常我们关心的事件是`start_element`，`end_element`和`char_data`，准备好这3个函数，然后就可以解析xml了。
```python
from xml.parsers.expat import ParserCreate

class DefaultSaxHandler(object):
    def start_element(self, name, attrs):
        print('sax:start_element: %s, attrs: %s' % (name, str(attrs)))

    def end_element(self, name):
        print('sax:end_element: %s' % name)

    def char_data(self, text):
        print('sax:char_data: %s' % text)

xml = r'''<?xml version="1.0"?>
<ol>
    <li><a href="/python">Python</a></li>
    <li><a href="/ruby">Ruby</a></li>
</ol>
'''

handler = DefaultSaxHandler()
parser = ParserCreate()
parser.StartElementHandler = handler.start_element
parser.EndElementHandler = handler.end_element
parser.CharacterDataHandler = handler.char_data
parser.Parse(xml)
```
- 除了解析字符串之外，生成字符串可以直接使用简单的字符串拼接完成。不太建议生成大段的XML，最好使用JSON。


`HTMLParser`
- 如果要实现一个浏览器，假设html页面已经已经爬取到了，下一步就是解析HTML。
- HTML本质上是XML的子集，但是HTML的语法没有XML那么严格，所以不能用标准的DOM或SAX来解析HTML。
- Python提供了`HTMLParser`来解析HTML，只需要简单几行代码。
```python
from html.parser import HTMLParser
from html.entities import name2codepoint

class MyHTMLParser(HTMLParser):

    def handle_starttag(self, tag, attrs):
        print('<%s>' % tag)

    def handle_endtag(self, tag):
        print('</%s>' % tag)

    def handle_startendtag(self, tag, attrs):
        print('<%s/>' % tag)

    def handle_data(self, data):
        print(data)

    def handle_comment(self, data):
        print('<!--', data, '-->')

    def handle_entityref(self, name):
        print('&%s;' % name)

    def handle_charref(self, name):
        print('&#%s;' % name)

parser = MyHTMLParser()
parser.feed('''<html>
<head></head>
<body>
<!-- test html parser -->
    <p>Some <a href=\"#\">html</a> HTML&nbsp;tutorial...<br>END</p>
</body></html>''')
```
- 基本逻辑是从`HTMLParser`派生，实现对应方法即可解析。

## 常用第三方模块

除了内建模块，Python还有数量众多的第三方模块。所有的第三方模块都会在[PyPI - the Python Package Index](https://pypi.python.org/)上注册，只要找到对应的模块名字，即可用pip安装。

`Pillow`
- PIL：Python Imaging Library，已经是Python平台事实上的图像处理标准库了。但PIL仅支持到Python2.7，后续由一群志愿者在PIL的基础上创建了兼容的版本，名字叫Pillow，支持最新Python 3.x，又加入了许多新特性。
- 安装：`pip install pillow`。
- 下面的代码可以完成缩放和模糊的操作：
```python
from PIL import Image, ImageFilter

# open an image
im = Image.open('nephren.png')
# get image size
w, h = im.size
print('Original image size: %sx%s' % (w, h))
# resize to 50%
im.thumbnail((w//2, h//2))
print('Resize image to: %sx%s' % (w//2, h//2))
# save scaled image
im.save('thumbnail.png', 'png')

# blur an iamge
im = Image.open('nephren.png')
im2 = im.filter(ImageFilter.BLUR)
im2.save('blur.png', 'png')
```
- `PIL`的`ImageDraw`提供了一系列绘图方法让我们可以直接绘图。
- 更多用法详见[文档](https://pillow.readthedocs.io/en/stable/)

`requests`
- Python内置的`urllib`可以用于访问网络资源，但是用起来很麻烦。而且缺少高级一点的功能。
- 更好的方案是使用`requests`第三方库，处理URL资源特别方便。
- 安装`pip install requests`
- 发送GET请求：
```python
import requests
r = requests.get('https://baidu.com')
print(r.status_code)
print(r.text)
```
- 对于带参数的URL，传入一个`dict`作为`params`参数。
- `requests`会自动检测编码，使用`encoding`属性查看。
- 无论响应时文本还是二进制内容，都可以使用`content`属性获取`bytes`对象。
- 对于特定类型响应，比如JSON可以直接通过`json()`方法获取到json对象。
- 需要传入HTTP头时，可以通过`headers`参数传入。
- 发送POST请求，只需要把`get()`方法保存`post()`，传入`data`参数作为请求数据即可。
- requests默认使用`application/x-www-form-urlencoded`对POST数据编码。如果要传递JSON数据，可以直接传入json参数。
- 上传文件需要更复杂的编码格式，但是requests把它简化成files参数。读取文件时，注意务必使用'rb'即二进制模式读取，这样获取的bytes长度才是文件的长度。
- 同样还可以`put() delete()`方法请求资源。
- 除了获取响应内容，获取响应的其他信息也很轻松，比如响应头`r.headers['Content-Type']`。
- requests对Cookie做了特殊处理，使得我们不必解析Cookie就可以轻松获取指定的Cookie。`r.cookies['ts']`。
- 要在请求中传入Cookie，只需准备一个dict传入`cookies`参数。
- 要指定超时，传入以秒为单位的`timeout`参数。
- 更多内容详见[文档](https://docs.python-requests.org/zh_CN/latest/)。

`chardet`
- 作用：检测编码。
- 安装：`pip install chardet`。
- 拿到一个`bytes`检测它的编码：`chardet.detect(b'Hello, world!')`。
- 支持编码见[文档](https://chardet.readthedocs.io/en/latest/supported-encodings.html)。

`psutil`
- 在Linux下，有许多系统命令可以让我们时刻监控系统运行的状态，如ps，top，free等等。要获取这些系统信息，Python可以通过subprocess模块调用并获取结果。但这样做显得很麻烦，尤其是要写很多解析代码。
- 在Python中获取系统信息的另一个好办法是使用psutil这个第三方模块。顾名思义，psutil = process and system utilities，它不仅可以通过一两行代码实现系统监控，还可以跨平台使用，支持Linux／UNIX／OSX／Windows等，是系统管理员和运维小伙伴不可或缺的必备模块。
- 使用`psutil`可以获取CPU信息、内存信息、磁盘信息、进程信息、用户信息、Windows服务等诸多有用的系统信息。
- [文档](https://psutil.readthedocs.io/en/latest/)。
- 示例：
```python
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
```

## virtualenv & pipenv

virtualenv可以用来在一台机器上创建多个隔离的Python运行环境，比如一个应用需要某个包的一个特定版本，而另一个应用需要另一个版本，而这两个包可能又依赖另一个包的不同版本，将这两个版本放到同一个环境中势必会造成冲突，那么此时就可以使用virtualenv。
- [官方文档](https://virtualenv.pypa.io/en/latest/)。
- 安装：`pip install virtualenv`
- 使用：`python -m virtualenv [options] [args]`
- 创建一个新环境：在一个目录中`python -m virtualenv venv`，`venv`就是这个新环境的名称，并且会在目录中创建一个`venv/`目录，其中存放了Python可执行文件以及`pip`库的一份拷贝。省略名字将会把文件直接放在当前目录。
- 使用虚拟环境前，需要先激活：
    - Unix中：`source venv/bin/activate`
    - Windows中执行：`.\venv\Scripts\activate.bat`
    - 激活成功后命令行提示符前会出现`(venv)`，即表示进入虚拟环境。
    - 直接执行`deactivate`可以停用虚拟环境（可以不用显式指明脚本路径），在虚拟环境中暂时完成了工作后离开时就可以停用它，这是会回到系统默认的Python解释器和安装的库。
- 删除一个虚拟环境，只需要删除其目录。
- 记得将虚拟环境的目录添加到版本控制的忽略文件中。
- 在虚拟环境中安装第三方库将会保留在这个环境中，不会和系统默认环境发生冲突。
- 运行原理：在执行了`activate`后，会修改相关环境变量，让Python和pip指向当前虚拟环境。

另一种管理虚拟环境的工具Pipenv：
- 结合了`pip`和`virtualenv`，侧重点是包环境管理。
- 安装：`pip install pipenv`
- Pipenv 管理每个项目的依赖关系。要安装软件包时，更改到项目目录，为项目安装一个包：`pipenv install package`。不加某一个具体的包的话就是安装`Pipfile`中所有包。
- 卸载：`pipenv uninstall package`
- 使用`pipenv`后会生成一个`Pipfile`，其中有最新安装的包文件的信息，如名称、版本等，用来在重新安装项目依赖或与他人共享项目时，你可以用 `Pipfile` 来跟踪项目依赖，这个文件就是`pipenv`用来替代`pip`的`requirements.txt`的文件。还会有一个`Pipfile.lock`包含你的系统信息，所有已安装包的依赖包及其版本信息，以及所有安装包及其依赖包的 Hash 校验信息。
- 使用时可以通过`pipenv run python main.py`可以确保你的安装包可以用于你的脚本，就是说只会使用`Pipfile`中的依赖，如果没有在目录中用`pipenv install`安装的包将无法使用。
- 还可以使用`pipenv shell`来生成一个新的shell，就像进入虚拟环境那样，就不用执行前都加一个`pipenv run`了。
- 使用`pipenv run pip list`将会得到使用`pipenv run`执行时可用的包列表。
- 其实`pipenv`也类似于`virtualenv`，只不过虚拟环境的文件不在当前目录下，而是在家目录下的`./virtualenvs`下的目录中。`pipenv --venv`可以查看其虚拟环境所在目录。
- 更多命令：
    - `pipenv update packge`更新第三方包。
    - `pipenv --where` 查看项目根目录。
    - `pipenv check` 检查第三方包的完整性。
    - `pipenv graph` 查看依赖树。
- `pipenv`换源：
    - 新建系统变量`PIPENV_PYPI_MIRROR`为`https://pypi.tuna.tsinghua.edu.cn/simple`（或其他源）。对所有`pipenv`环境生效。
    - 修改`Pipfile`中的`url`可以更改这个项目安装时的源。


安装与生成依赖：
- 如果你的程序和开发环境高度相关，就需要生成依赖文件`requirements.txt`。
- 使用`pip freeze`可以得到当前环境所有的包，直接执行会得到当前安装的所有包，如果`virtualenv`或者`pipenv run`下执行，那么只会得到虚拟环境中可用的包。
- 使用`pip freeze > requirements.txt`即可生成依赖文件。
- 重新创建这样的环境：`pip install -r requirements.txt`。帮助确保安装、部署和开发者之间的一致性。
- 如果没有使用虚拟环境，所有包都使用系统的Python包，那么`pip freeze`就会得到所有包，当发布项目时仅需要项目的依赖，可以使用包`pipreqs`来查找当前项目的依赖并自动生成`requirements.txt`。
    - `pip install pipreqs`
    - `pipreqs ./`

另外还有`pyenv`可以用来管理多个版本的Python，这点Pipenv也可以做到，此处不详述`pyenv`。

扩展阅读：
- [Pipenv & 虚拟环境](https://pythonguidecn.readthedocs.io/zh/latest/dev/virtualenvs.html)，更多关于项目依赖于虚拟环境的说明。

## 图形界面

Python支持多种图形界面的第三方库：Tk、wxWidgets、Qt、GTK。

Tkinter：
- Python自带的库是支持Tk的Tkinter，使用Tkinter，无需安装任何包，就可以直接使用。
- 第一个Tkinter的GUI程序：
```python
from tkinter import *

class Application(Frame):
    def __init__(self, master = None):
        Frame.__init__(self, master)
        self.pack()
        self.createWidgets()
    def createWidgets(self):
        self.helloLabel = Label(self, text='Hello, world!')
        self.helloLabel.pack()
        self.quitButton = Button(self, text='Quit', command=self.quit)
        self.quitButton.pack()

app = Application()
app.master.title('hello,world')
app.mainloop()
```
- 和其他语言的GUI程序差不多，派生Frame，其中创建各种Widget，实例化后启动消息循环。
- GUI程序的主线程负责监听来自操作系统的消息，并依次处理每一条消息。如果消息处理非常耗时，就需要在新线程中处理。
- ython内置的Tkinter可以满足基本的GUI程序的要求，如果是非常复杂的GUI程序，建议用操作系统原生支持的语言和库来编写。

海龟绘图`turtle`库：
- 简单来说就是指挥一个海龟前进转向以此来绘图的API，移植到Python上之后就是这个库，作用有限，可以用来体验GUI的乐趣。内置不需要安装。
- [文档](https://docs.python.org/3.3/library/turtle.html)。

## 网路编程

TCP/IP协议就不多介绍了，IPv4就是一个32位整数，一般用4个0-255的十进制用`.`分隔来表示。IPv6是128位整数，用8个4位十六进制整数`:`分隔表示。
- TCP是可靠传输，会进行三次握手，四次挥手，UDP是不可靠传输。其他应用层的协议建立在TCP协议之上，比如浏览器的HTTP协议、邮件协议SMTP。
- TCP协议使用一个一个的数据包传输数据，一个TCP报文除了包含要传输的数据外，还包含源IP地址和目标IP地址，源端口和目标端口。
- 端口的作用是在机器上区分应用，Ip则用来区分机器，一个IP:端口的组合被称为一个套接字，用来唯一标识一个连接。

TCP编程：
- Socket是网络编程的一个抽象概念，用一个Socket表示打开了一个网络链接，打开一个Socket需要知道目标计算机的IP地址和端口号，再指定协议类型即可。
- 大多数连接都是可靠的TCP连接，创建TCP连接时，发起连接的叫**客户端**，被动响应连接的叫**服务器**。

客户端：
- 创建一个基于TCP的连接：
```python
import socket

# create a socket: AF_INET -> ipv4, SOCK_STREAM -> TCP
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('www.baidu.com', 80))
```
- 作为服务器，提供什么服务，使用什么端口号必须固定下来，80端口是Web服务的标准端口。其他服务都有对应的标准端口号，例如SMTP服务是25端口，FTP服务是21端口，等等。端口号小于1024的是Internet标准服务的端口，端口号大于1024的，可以任意使用。
- 建立连接之后，可以发送请求：
```python
s.send(b'GET / HTTP/1.1\r\nHost: www.baidu.com\r\nConnection: close\r\n\r\n')
```
- TCP连接创建的是双向通道，双方都可以同时给对方发数据。但是谁先发谁后发，怎么协调，要根据具体的协议来决定。例如HTTP协议规定客户端必须先发请求给服务器，服务器收到后才发数据给客户端。
- 接下里就可以接收数据了：
```python
# receive data
buffer = []
while True:
    # 1 KB every time
    d = s.recv(1024)
    if d:
        buffer.append(d)
    else:
        break
data = b''.join(buffer)
```
- 数据接收完毕之后，调用`close`方法关闭Socket，一次完整的网络通信就结束了。
```python
s.close()
```
- 接收到的数据包括HTTP头和网页本身，我们只需要把HTTP头和网页分离一下，把HTTP头打印出来，网页内容保存到文件，在浏览器中打开这个`html`文件就可以看到百度的首页了。
```python
header, html = data.split(b'\r\n\r\n')
print(header.decode('utf-8'))
with open('baidu.html', 'wb') as f:
    f.write(html)
```

服务器端：
- 服务器编程比客户端要复杂一点。
- 服务器进程需要绑定一个端口来监听其他客户端的连接，如果某个客户端连接过来，服务器就与该客户端建立Socket连接，随后的通信就依靠这个Socket连接。
- 服务器可能会有大量客户端连接，由服务器地址、服务器端口、客户端地址、客户端端口唯一确定一个Socket。
- 每个连接创建一个新线程进行处理。
```python
if __name__ == "__main__":
    # create a socket: Ipv4, TCP
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # bind a port
    s.bind(('127.0.0.1', 9999))

    # listen a port, argument is max connection count
    s.listen(5)
    print("waiting for connection...")
    # accept connection from client
    while True:
        # accept a new conection
        sock, addr = s.accept()
        # create a new thread to handle TCP connection
        t = threading.Thread(target=tcplink, args=(sock, addr))
        t.start()
```
- 处理逻辑：首先发送欢迎消息，然后接受客户端消息，如果是`exit`字符串就关闭连接，否则就发送消息到客户端。
```python
def tcplink(sock, addr):
    print('Accept new connection from %s:%s...' % addr)
    sock.send(b"Welcome!")
    while True:
        data = sock.recv(1024)
        time.sleep(1)
        if not data or data.decode('utf-8') == 'exit':
            break
        sock.send((f"hello {data.decode('utf-8')}").encode('utf-8'))
    sock.close()
    print("Connection from %s:%s closed." % addr)
```
- 在客户端，同样处理：
```python
# create a socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 9999))

# send requests
print(s.recv(1024).decode('utf-8'))
for data in [b"Alice", b"Bob", b"Mary"]:
    s.send(data)
    print(s.recv(1024).decode('utf-8'))
s.send(b'exit')
s.close()
```
- 执行结果：在服务器端先执行，会等待客户端来连接，执行客户端代码后连接成功服务端新建线程处理，客户端收到欢迎消息，客户端依次发送并接受消息，服务端依次接受并发送消息，直到收到`exit`关闭连接。服务端处理线程结束，主线程依然处于等待连接状态。

UDP编程：
- UDP是不可靠传输，不需要建立连接，只需要直到对方的IP地址和端口号，就可以直接发送数据包。但是能不能到达是不知道的。
- 虽然传输不可靠，但优点是相比TCP更快。
- 服务端：不需要监听，发送之前也不需要连接，这里比较简单，也不用多线程处理。
```python
import socket

# create a socket: IPv4, UDP
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
# bind to port
s.bind(('127.0.0.1', 9999))
print("Bind UDP on 9999...")

# do not need listen, just receive
while True:
    data, addr = s.recvfrom(1024)
    print("Received from %s:%s" % addr)
    s.sendto(b'hello, %s' % data, addr)
```
- 客户端：不需要连接，直接给服务器发送数据。
```python
import socket

# IPv4, UDP
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
for data in [b"Alice", b"Bob", b"Mary"]:
    s.sendto(data, ('127.0.0.1', 9999))
    print(s.recv(1024).decode('utf-8'))
s.close()
```
- 服务器绑定UDP端口和TCP端口互不冲突，也就是说，UDP的9999端口与TCP的9999端口可以各自绑定。

## 电子邮件

电子邮件的传递流程：
- 写好一封邮件之后，从邮件软件（称之为MUA：Mail User Agent，邮件用户代理）发送。
- 从MUA发出后，不是直接送达对方电脑，而是先送到MTA：Mail Transfer Agent，邮件传输代理，也就是自己用的什么邮件服务商提供的邮件就到哪儿。比如`163.com`那就先投递到网易的MTA。
- 然后从自己的MTA对方的MTA（中间可能还会经过其他MTA），然后而对方的MTA会把邮件投递到最终目的地：MDA，Mail Delivery Agent，邮件投递代理。
- 因为对方不一定在线，所以某个时刻在MUA上登录邮箱之后需要从MDA上把邮件取到自己的电脑上。
- 所以大概的流程是：`发件人 -> MUA -> MTA -> MTA -> 若干个MTA -> MDA <- MUA <- 收件人`
- 要编写程序来发送接收邮件，本质上就是：
    - 编写MUA把邮件发到MTA。
    - 编写MUA从MDA上收邮件。

邮件协议：
- 发邮件时，MUA和MTA使用的协议是**SMTP**：Simple Mail Transfer Protocol，MTA到另一个MTA也是SMTP。
- 收邮件时，MUA和MDA使用的协议有两种。第一种POP：Post Office Protocol，目前版本是3，俗称**POP3**。第二种**IMAP**：Internet Message Access Protocol，目前版本是4，不但能取邮件，还可以直接操作MDA上存储的邮件，比如从收件箱移到垃圾箱等。
- 目前大多数邮件服务商都需要手动打开SMTP发信和POP收信功能，否则只允许网页登录使用。

SMTP发送邮件：
- Python内置对SMTP的支持，可以发送纯文本邮件、HTML邮件、带附件的邮件。
- 两个模块`smtplib`和`email`，前者构造邮件，后者发送邮件。
```python
from email.mime.text import MIMEText
from email.header import Header
from email.utils import parseaddr, formataddr

def _format_addr(s):
    name, addr = parseaddr(s)
    return formataddr((Header(name, 'utf-8').encode(), addr))

# input email and passwd
from_addr = input('From: ')
password = input('password: ')
to_addr = input('To: ')

# input SMTP server address
smtp_server = input('SMTP server: ')

# plain text email
msg = MIMEText("hello, send by Python...", 'Plain', 'utf-8')
msg['From'] = _format_addr('暗之恶魔 <%s>' % from_addr) # 发件人
msg['To'] = _format_addr('光之使者 <%s>' % to_addr) # 收件人
msg['Subject'] = Header("接受地狱的审判吧！", 'utf-8').encode() # 主题

# send to MTA
import smtplib
server = smtplib.SMTP(smtp_server, 25)
server.set_debuglevel(1) # print interactive info with the server
server.login(from_addr, password)
server.sendmail(from_addr, [to_addr], msg.as_string())
server.quit()
```
- 发件人和收件人格式时`name <xxx@xxx.com>`，不能直接发中文，需要使用`Header`进行编码。
- 密码并不一定就是邮箱密码，比如QQ邮箱就是其生成的一个用于第三方登录的授权码。
- 上述代码输入信息时可以使用文件输入重定向，不必每一次都重新输入。
- 要有发件人、收件人、主题才是一封完整的邮件，没有也可以发。
- 如果要发送附件，可以构造一个`MIMEMultipart`，在其中添加一个`MIMEText`作为正文，在继续加上表示附加的`MIMEBase`对象即可。
- 除了发送纯文本，也可以发送html邮件，邮件内容就是一个网页，如果要在其中嵌入图片，由于大部分邮件服务商会自动屏蔽带有外链的图片，因为不知道是否指向恶意网站。可以在HTML中通过引用`src="cid:x"`（x为图片编号）就可以把附加作为图片插入了。
- 更多信息查看文档获取。

POP3收取邮件：
- 分两步：用`poplib`把邮件原始文本下载到本地，第二步，用`email`解析原始文本，还原为邮件对象。
```python
# input email
email = input('Email: ')
password = input('Password: ')
pop3_server = input('POP3 server: ')

# connect to POP3 server
server = poplib.POP3(pop3_server)
server.set_debuglevel(1)
print(server.getwelcome().decode('utf-8'))

# authentication
server.user(email)
server.pass_(password)

# email number and space
print('Message: %s, Size: %s', server.stat())

# get numbers of all mails
resp, mails, octets = server.list()
print(mails)

# get newest mail
index = len(mails)
resp, lines, octets = server.retr(index)

# get raw content of mail
msg_content = b'\r\n'.join(lines).decode('utf-8')
# parse mail content
msg = Parser().parsestr(msg_content)

server.quit()
```
- 后续的解析逻辑就省略了，可查看Python分支或者[廖雪峰的教程](https://www.liaoxuefeng.com/wiki/1016959663602400/1017800447489504)获取。

## 数据库

程序在运行时，数据存在于内存中，但当程序结束后，数据无论以何种形式最终都会保存到磁盘上，如何定义存储格式就成为了问题，可以是标准化的格式，也可以是自定义格式。当再次运行程序需要读入文件时，就需要将数据全部读入内存，如果数据远超内存大小，就根本无法全部读入内存。
- 此背景下，为了便于数据的保存、读取和方便的查询，就出现了数据库（Database）这种专门用于集中存储和查询的软件。
- 数据库诞生历史很久远，早于1950年就诞生了，经历了网状数据库，层次数据库，我们现在广泛使用的关系数据库是20世纪70年代基于关系模型的基础上诞生的。
- 关系模型有一套复杂的数学理论。
- 关系数据库中，基于表的一对多关系是基础。一个表中的一行记录就某一项而言可能对应于另一张表的多行记录。
- 关系数据库有访问和处理的领域特定语言SQL。无论什么编程语言，涉及到操作数据库，基本都是通过SQL来完成，[廖雪峰教程](https://www.liaoxuefeng.com/wiki/1177760294764384)。
- 目前使用广泛的商用闭源付费关系数据库：Oracle，微软的SQL Server，IBM的DB2等。
- 开源数据库相对来说使用更为广泛：使用广泛的MySQL，学术气息挺重的PostgreSQL，适合桌面和移动应用的嵌入式数据库sqlite。
- MySQL使用最多，一般作为首选，[MySQL Community Server免费下载](https://dev.mysql.com/downloads/mysql/)。更多MySQL与SQL语言的东西可以看[SQL.md](SQL.md)。


使用SQLite：
- SQLite是一种嵌入式数据库，它的数据库就是一个文件。由于SQLite本身是C写的，而且体积很小，所以，经常被集成到各种应用程序中，甚至在iOS和Android的App中都可以集成。
- Python就内置了SQLite3，所以，在Python中使用SQLite，不需要安装任何东西，直接使用。
- [sqlite3库文档](https://docs.python.org/zh-cn/3/library/sqlite3.html)。
- 访问[SQLite主页](https://www.sqlite.org/index.html)查询支持的SQL方言语法与可用数据类型。
- 首先要明确的概念：
    - 要操作关系数据库，首先需要连接到数据库，一个数据库连接称为`Connection`。
    - 连接到数据库后，需要打开游标，称之为`Cursor`，通过`Cursor`执行SQL语句，然后，获得执行结果。
    - Python定义了一套操作数据库的API接口，任何数据库要连接到Python，只需要提供符合Python标准的数据库驱动即可。
    - 由于SQLite的驱动内置在Python标准库中，所以我们可以直接来操作SQLite数据库。
```python
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
```
- 使用Python的DB-API时，只要搞清楚`Connection`和`Cursor`对象，打开后一定记得关闭，就可以放心地使用。
- 使用`Cursor`对象执行`insert update delete`语句，执行结果由`rowcount`返回影响的行数。
- 使用`Cursor`执行`select`时，使用`fetchall`拿到结果集。结果集是一个列表，元素是元组，对应于每一行记录。
- SQL语句带有参数时使用`?`作为占位符，第二个参数元组元素对应传入，有几个占位符就需要几个参数。而不应该使用Python自带的字符串参数，这样会有SQL注入的风险。
- 需要确保打开的`Connection`对象能够正确关闭。可以使用`try...except..finally`或者`with`。

使用MySQL：
- 确保本地安装的MySQL配置支持utf-8。
- `show variables like '%char%';`，其中有很多项，如果登录`mysql`的终端修改了字符页为65001，那么按道理来说应该是全都是utf-8。具体编码问题这里不细究，确保支持中文就行。
```shell
mysql> show variables like 'char%';
+--------------------------+---------------------------------------------------------+
| Variable_name            | Value                                                   |
+--------------------------+---------------------------------------------------------+
| character_set_client     | utf8mb4                                                 |
| character_set_connection | utf8mb4                                                 |
| character_set_database   | utf8mb4                                                 |
| character_set_filesystem | binary                                                  |
| character_set_results    | utf8mb4                                                 |
| character_set_server     | utf8mb4                                                 |
| character_set_system     | utf8mb3                                                 |
| character_sets_dir       | C:\Program Files\MySQL\MySQL Server 8.0\share\charsets\ |
+--------------------------+---------------------------------------------------------+
```
- MySQL的utf-8并不是完整的utf-8，最多只支持3个字节编码，不支持4个字节编码，最新的utfmb4则是完整的utf-8。
- 安装[MySQL官方驱动](https://www.mysql.com/products/connector/)：
```shell
pip install mysql-connector
```
- 使用：同样通过Python的DB API使用，使用`mysql.connector.connect()`获取连接之后即可使用。
```python
import mysql.connector

conn = mysql.connector.connect(user = 'root', password = 'password', database = 'test')
```
- 连接时可能出现`mysql.connector.errors.NotSupportedError: Authentication plugin 'caching_sha2_password' is not supported`错误，可以[参考这里](https://www.runoob.com/note/45833):
    - 原因就是MySQL8.0中验证插件和密码加密的方式发生了变化，由之前版本的`mysql_native_password`变更为了`caching_sha2_password`。
    - 解决方案1是安装`mysql-connector-python`插件。
    - 2是修改MySQL配置`my.ini`中验证方式改回以前的，并且在`connect`时添加参数`auth_plugin='mysql_native_password'`。
    - 能解决即可，这里选择1。
- 可以使用`fetchall fetchmany`等接口获取`cursor`执行结果，也可以直接对`cursor`进行迭代。

- 也可以使用[pymysql](https://github.com/PyMySQL/PyMySQL)模块，[文档](https://pymysql.readthedocs.io/en/latest/index.html)，同样使用DB API：
```python
import pymysql
conn = pymysql.connect(user = 'root', password = 'password', database = 'test')
```

使用[SQLAlchemy](https://www.sqlalchemy.org/)：
- 安装：`pip install SQLAlchemy`
- 前面的使用Python DB API操作结果都是返回一个`list`，每一条记录是一个`tuple`作为元素。使用元组很难看出表的结构，如果将一个记录作为一个对象表示出来，会更加直观一些。也就是传说中的ORM技术（Object-Relational Mapping，对象关系映射）。这个转换由ORM框架来做。
- Python中最有名的ORM框架就是`SQLAlchemy`。
- 基本使用：
```python
from sqlalchemy import Column, String, create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.sql.ddl import DDLBase

# create a base class
Base = declarative_base()

# define ORM class
class User(Base):
    # table name
    __tablename__ = 'user'
    # table structrue
    di = Column(String(20), primary_key=True)
    name = Column(String(20))

# initialize database connection
# databse+connector://user:password@host:port/database
engine = create_engine('mysql+mysqlconnector://root:password@localhost:3306/test')
# create DBSession object
DDSession = sessionmaker(bind=engine)
```
- 上面代码完成SQLAlchemy初始化和具体表的定义，有多个表就从`Base`派生其他类。
- `create_engine`初始化数据库连接。用以字符串表示连接信息：
```python
'数据库类型+数据库驱动名称://用户名:口令@机器地址:端口号/数据库名'
```
- 有了ORM，我们向数据库表中添加一行记录，可以视为添加一个User对象。
- 添加记录的话，通过像会话中添加对象即可：
```python
# create DbSession object
session = DBSession()
# create new User object
new_user = User(id = '5', name = 'Bob')
# add to session
session.add(new_user)
# commit to database
session.commit()
session.close()
```
- 查询使用`session.query()`：
```python
session = DBSession()
user = session.query(User).filter(User.id == 5).one()
print('type: ', type(user))
print('name: ', user.name)
session.close()
```
- 如果还没有表的话，可以先创建表，会创建所有从`Base`派生的类对应的表：
```python
Base.metadata.create_all(engine)
```
- 可以配合另一个库[SQLAlchemy-utils](https://github.com/kvesteri/sqlalchemy-utils)使用，为SQLAlchemy提供了一些自定义数据类型和库，[文档](https://sqlalchemy-utils.readthedocs.io/en/latest/index.html)。
- 更多操作还需要看文档研究。
- ORM框架的作用就是把数据库表的一行记录与一个对象互相做自动转换。
- 正确使用ORM的前提是了解关系数据库的原理。

TODO：
- 每个库的使用都不能说简单，都使用DB API的操作还还说，但SqlAlchemy要使用时需要下功夫的。这里只是最基本操作，要熟练在项目中使用都需要阅读文档踩坑。具体有实践需求时再来做这些事情。

## Web开发

Web应用：
- 软件运行在桌面客户端上，而数据库这种服务型的软件运行在服务器端，这种Client/Server模式称为CS架构。
- 互联网兴起后，Web应用程序因为要快速迭代修改和升级，如果使用桌面客户端就需要逐个频繁升级，因此流行起了将客户端运行在浏览器上的Browser/Server模式，称BS架构。
- Web应用的几个阶段：
    - 静态Web页面，静态HTML页面，修改页面内容就需要编辑HTML源文件。早期的互联网Web页面就是静态的。
    - CGI：静态Web页面无法与用户交互，如果用户填了一个注册表单，静态Web页面就无法处理。要处理用户发送的动态数据，出现了Common Gateway Interface，简称CGI，用C/C++编写。
    - ASP/JSP/PHP：Web应用由于修改频繁，用C/C++这种更偏底层的语言非常不适合Web开发，而脚本语言由于开发效率高，与HTML结合紧密，因此，迅速取代了CGI模式。ASP是微软推出的用VBScript脚本编程的Web开发技术，而JSP用Java来编写脚本，PHP本身则是开源的脚本语言。
    - MVC：为了解决直接用脚本语言嵌入HTML导致的可维护性差的问题，Web应用也引入了Model-View-Controller的模式，来简化Web开发。ASP发展为ASP.Net，JSP和PHP也有一大堆MVC框架。
- Python有很多Web框架，有很多成熟的模板技术，选择Python开发应用，开发效率高，运行速度快。

HTML:
- 超文本标记语言。
- HTML定义了页面的内容，CSS来控制页面元素的样式，而JavaScript负责页面的交互逻辑。
- 对于优秀的Web开发人员来说，精通HTML、CSS和JavaScript是必须的。
- 学习网站：https://www.w3school.com.cn/
- 当我们用Python或者其他语言开发Web应用时，我们就是要在服务器端动态创建出HTML，这样，浏览器就会向不同的用户显示出不同的Web页面。
- 示例：
```html
<html>
<head>
  <title>Hello</title>
  <style>
    h1 {
      color: #333333;
      font-size: 48px;
      text-shadow: 3px 3px 3px #666666;
    }
  </style>
  <script>
    function change() {
      document.getElementsByTagName('h1')[0].style.color = '#ff0000';
    }
  </script>
</head>
<body>
  <h1 onclick="change()">Hello, world!</h1>
</body>
</html>
```

WSGI接口：
- Web应用的本质：
    - 浏览器发送一个HTTP请求；
    - 服务器收到请求，生成一个HTML文档；
    - 服务器把HTML文档作为HTTP响应的Body发送给浏览器；
    - 浏览器收到HTTP响应，从HTTP Body取出HTML文档并显示。
- 最简单的静态Web应用就是将HTML文件保存好，用现成的HTTP服务器软件，接受用户请求，从文件中取出HTML返回。比如Apache、Nginx、Lighttpd等常见的静态服务器。
- 而要动态生成HTML，就需要自己实现生成HTML的步骤。接受HTTP请求、解析HTTP请求、发送HTTP响应都是苦力活。正确的做法是底层代码由专门的服务器软件实现，我们用Python专注于生成HTML文档。因为我们不希望接触到TCP连接、HTTP原始请求和响应格式，所以，需要一个统一的接口，让我们专心用Python编写Web业务。
- 这个接口就是WSGI：Web Server Gateway Interface。用来接收并响应HTTP请求。
- 定义一个最简单的WSGI接口：
```python
def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')]) # header, response code and header content
    return [b'<h1>Hello, web!</h1>'] # body
```
- 我们只需要关系从参数`environ`字典中拿到HTTP请求信息，然后构造HTML，通过`start_response`发送Header，然后返回Body。底层解析HTTP请求或者构造HTTP响应头的操作不需要自己来做。
- Python内置了一个WSGI服务器，这个模块叫`wsgiref`，它是用纯Python编写的WSGI服务器的参考实现。
```python
from wsgiref.simple_server import make_server

# create a http server
httpd = make_server('', 8000, application)
print("Serving HTTP on port 8000...")
httpd.serve_forever()
```
- 启动后，打开浏览器输入`http://localhost:8000/`即可访问。命令行可以看到`wsgiref`打印的日志信息。
- 使用WSGI服务器，无论是多么复杂的Web应用程序，入口都是一个WSGI处理函数。HTTP请求的所有输入信息都可以通过`environ`获得，HTTP响应的输出都可以通过`start_response()`加上函数返回值作为Body。
- 对于复杂的应用程序来说，光靠WSGI函数还是太底层了，需要在WSGI之上再抽象出Web框架。进一步简化Web开发。
- Python的WSGI接口可以看这里：[PEP 333 - Python Web Server Gateway Interface v1.0 中文版](https://github.com/mainframer/PEP333-zh-CN)。

Web框架：
- 使用[Flask](https://flask.palletsprojects.com/en/2.0.x/)：`pip install flask`。
```python
from flask import Flask
from flask import request

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def home():
    return '<h1>Home</h1>'

@app.route('/signin', methods=['GET'])
def signin_form():
    return '''<form action="/signin" method="post">
              <p><input name="username"></p>
              <p><input name="password" type="password"></p>
              <p><button type="submit">Sign In</button></p>
              </form>'''

@app.route('/signin', methods=['POST'])
def signin():
    # 需要从request对象读取表单内容：
    if request.form['username']=='admin' and request.form['password']=='password':
        return '<h3>Hello, admin!</h3>'
    return '<h3>Bad username or password.</h3>'

if __name__ == '__main__':
    app.run()
```
- 处理三个请求：
    - `GET /`
    - `GET /signin`，登录页，显示登录表单。
    - `POST /signin`，处理登录表单，显示登录结果。
    - 同一个URL/signin分别有GET和POST两种请求，映射到两个处理函数中
- Flask通过装饰器在内部自动地把URL函数关联起来。
- 运行之后可以在`http://127.0.0.1:5000/`访问。
- 实际应用的话，需要配合上数据库，拿到用户名和口令之后应该去数据库中查询对比来判定用户登录状态。
- 除了Flask还有其他Web框架：
    - [Django](https://www.djangoproject.com/)：全能型Web框架。
    - [Web.py](https://webpy.org/)：小巧Web框架。
    - [Bottle](http://bottlepy.org/docs/dev/)：类似于Flask。
    - [Tornado](http://www.tornadoweb.org/)：Facebook的开源异步框架。
- 有了Web框架，我们在编写Web应用时，注意力就从WSGI处理函数转移到URL+对应的处理函数，这样，编写Web App就更加简单了。
- 在编写URL处理函数时，除了配置URL外，从HTTP请求拿到用户数据也是非常重要的。Web框架都提供了自己的API来实现这些功能。Flask通过request.form['name']来获取表单的内容。


使用模板：
- 有了Web框架就不需要在WSGI函数中编写整个网站的逻辑，但依然需要提供页面HTML，但对于一个复杂的页面来说将所有HTML以字符串方式写在源码中是不现实也不合理的。
- 所以有了模板技术，准备一个HTML文档，其中潜入了一些变量和指令，根据传入的指令和数据，经过程序逻辑替换后得到最终的HTML，发送给用户。
- 这就是MVC：Model-View-Controller，即模型-视图-控制器。
- 在这里，模型就是要传递给HTML的数据，视图就是HTML模板最终输出用户看到的HTML，控制器则是Python代码中将模型数据传递给HTML的逻辑。
- 模板中大多是留下由变量表示的空位，由框架将数据通过关键字参数或者字典传递给模板得到最终的HTML。
- 比如Flask：
```python
from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('home.html')

@app.route('/singin', methods=['GET'])
def signin_form():
    return render_template('form.html')

@app.route('/signin', methods=['POST'])
def  signin():
    username = request.form['username'] 
    password = request.form['password']
    if username == 'admin' and password == 'password':
        return render_template('signin-ok.html', username=username)
    return render_template('form.html', message='Bad username or password', username=username)

if __name__ == '__main__':
    app.run()
```
- 和上面的例子一样，不过换成了使用模板，Flask默认的模板是Jinja2，安装Flask时会安装。
- 模板文件需要放在`templates`目录下。
- `Jinja2`模板中使用`{{ name }}`表示要替换的变量，很多时候，还需要循环、条件判断等指令语句，在Jinja2中，用`{% ... %}`表示指令。
- 除了Jinja2，常见的模板还有：
    - [Mako](https://www.makotemplates.org/)：用`<% ... %>`和`${xxx}`的一个模板；
    - [Cheetah](http://www.cheetahtemplate.org/)：也是用`<% ... %>`和`${xxx}`的一个模板；
    - [Django](https://www.djangoproject.com/)：Django是一站式框架，内置一个用`{% ... %}`和`{{ xxx }}`的模板。
- 目前前后端分离，已经没有人用模板了。

## 异步IO

异步IO：
- 要解决CPU的高速和IO的低速不匹配的问题，避免CPU暂停等待IO完成，就需要使用多线程或者多进程将IO任务分配到其他线程或者进程去做，也就是异步IO。
- 当代码要执行IO操作时，只发出IO指令，并不等待IO结果，然后执行其他代码。一段时间后当IO执行完成，再通知CPU进行处理。
- 普通同步IO代码：
```python
# things before

f = open('test.txt', 'r')
text = f.read() # thread wait here
f.close()
print(text)

# other things
```
- 同步IO模型代码无法实现异步IO模型。
- 异步IO模型需要一个消息循环，消息循环中，主线程不断重复读取消息-处理消息这个循环，就像所有GUI程序做的那样。
```python
loop = get_event_loop()
while True:
    event = loop.get_event()
    process_event(event)
```
- 消息模型其实早在应用在桌面应用程序中了。一个GUI程序的主线程就负责不停地读取消息并处理消息。所有的键盘、鼠标等消息都被发送到GUI程序的消息队列中，然后由GUI程序的主线程处理。
- 在消息模型中，处理一个消息必须非常迅速，否则，主线程将无法及时处理消息队列中的其他消息，导致程序看上去停止响应。
- 消息模型中的的异步IO：遇到IO操作时，代码只发出IO请求，不等待IO结果，直接结束本轮消息处理，进入下一轮消息处理。IO操作完成后，收到IO完成的消息，处理该消息时获得IO操作的结果。
- 同步IO模型中，处理IO过程中主线程只能挂起，异步IO模型中，主线程继续执行，由IO线程处理IO，一个主线程可以同时处理多个IO请求，并且没有切换线程的操作。对于IO密集型应用程序，使用异步IO将大大提升系统的多任务处理能力。

**协程**：
- 又名微线程，Coroutine。
- 提出很早，但直到最近几年才在某些语言中广泛应用。
- 子程序又称函数，基本在所有语言中都是通过栈实现的层级调用，一个线程就是执行一个子程序。子程序调用总是一个入口，一次返回，调用顺序是明确的。
- 协程看上去也是子程序，但执行过程中，子程序内部可中断，然后转去执行别的子程序，适当的时候在回来执行。中断执行其他子程序不是通过函数调用去执行，而是类似于CPU的中断，就像线程切换一样，但多个协程其实是一个线程在执行。
- 协程的优势：
    - 相对线程而言极高的执行效率，子程序切换而不是线程切换，没有线程切换的开销，由程序自身控制而不是操作系统调度。和多线程比，线程数量越多，协程性能优势就越明显，体现在子程序的切换上。
    - 第二优势就是不需要多线程的锁机制，因为只有一个线程，不存在同时写变量冲突，在协程中控制共享资源不加锁，只需要判断状态就好了，所以执行效率比多线程高很多。
- 协程是一个线程执行，如果要利用多核CPU，最简单的方法是通过多进程+协程实现。
- Python中对协程的支持是通过`generator`实现的。生成器同时也是一个迭代器，可以用`for`来迭代，也可以用`next()`获取下一个`yield`出来的值。
- Python的`yield`不但可以返回一个值，还可以用来接受调用者发出的参数，调用生成器的`send(arg)`函数发送消息。
- 使用Python的协程实现生产者消费者模型：
```python
def consumer():
    r = ''
    while True:
        n = yield r
        if not n:
            return
        print('[CONSUMER] Consuming %s...' % n)
        r = '200 OK'

def produce(c):
    c.send(None)
    n = 0
    while n < 5:
        n = n + 1
        print('[PRODUCER] Producing %s...' % n)
        r = c.send(n)
        print('[PRODUCER] Consumer return: %s' % r)
    c.close()

c = consumer()
produce(c)
```
- `c.send(None)`启动生成器。最后通过`close()`关闭生成器。
- 整个流程无锁，有一个线程执行，`produce`和`consumer`协作完成任务，所以称为“协程”，而非线程的抢占式多任务。
- “子程序就是协程的一种特例”。
- 对生成器调用`next()`时，`yield`语句将得到`None`。


**asyncio**:
- `asyncio`是Python3.4引入的标准库支持了异步IO。
- 例：
```python
import asyncio
import threading

@asyncio.coroutine
def hello(n):
    print(f'hello,world! from {threading.currentThread()}, n = {n}')
    r = yield from asyncio.sleep(1)
    print(f'hello,again! from {threading.currentThread()}, n = {n}')

loop = asyncio.get_event_loop()
# execute coroutine
tasks = [hello(1), hello(2)]
loop.run_until_complete(asyncio.wait(tasks))
loop.close()
```
- 执行结果：
```
hello,world! from <_MainThread(MainThread, started 7600)>, n = 2
hello,world! from <_MainThread(MainThread, started 7600)>, n = 1
hello,again! from <_MainThread(MainThread, started 7600)>, n = 2
hello,again! from <_MainThread(MainThread, started 7600)>, n = 1
```
- `@asyncio.coroutine`把一个生成器标记为`coroutine`类型，然后将这个协程放到执行协程的事件循环中就行。就实现了异步IO。
- `asyncio.sleep()`也是一个`coroutine`，线程不会等待`asyncio.sleep()`，而是直接中断并执行下一个消息循环，当`asyncio.sleep()`返回时，从`yield from`拿到返回值，然后接着执行下一语句。
- 两个`coroutine`在同一线程中执行。
- 例子：异步连接获取三个网站的响应，打印响应头：
```python
import asyncio

@asyncio.coroutine
def wget(host):
    print('wget %s...' % host)
    connect = asyncio.open_connection(host, 80) # connect is a coroutine
    reader, writer = yield from connect
    header = 'GET / HTTP/1.0\r\nHost: %s\r\n\r\n' % host
    writer.write(header.encode('utf-8'))
    yield from writer.drain()
    while True:
        line = yield from reader.readline()
        if line == b'\r\n':
            break
        print('%s header > %s' % (host, line.decode('utf-8').rstrip()))
    # Ignore the body, close the socket
    writer.close()

loop = asyncio.get_event_loop()
tasks = [wget(host) for host in ['www.sina.com.cn', 'www.sohu.com', 'www.163.com']]
loop.run_until_complete(asyncio.wait(tasks))
loop.close()
```
- 执行结果中可以看到，在去连接前一个网站的过程中，协程让出了时间片，事件循环中断并执行了其他协程。
- 多个协程可以封装成一组Task并发执行。
- 阅读：
    - [Async IO in Python: A Complete Walkthrough](https://realpython.com/async-io-python/)

**async/await**:
- `asyncio`提供的语法是：`@asyncio.coroutine`包装一个生成器为协程，然后在内部可以使用`yield from`调用另一个协程实现异步。当然也可以包装一个普通函数为协程。
- Python3.5引入了新语法`async`和`await`，用以替代`@asyncio.coroutine`和`yield from`。旧语法在Python3.8版本废弃，并计划于Python3.10中移除。
- 不要与普通的生成器混淆，`async`用来定义协程，`await`用来调用协程（不能用来调用一个普通的生成器）。

**aiohttp**:
- `asyncio`可以实现单线程并发IO操作。如果仅用在客户端，发挥的威力不大。
- 如果把`asyncio`用在服务器端，例如Web服务器，由于HTTP连接就是IO操作，因此可以用单线程加上协程实现多用户的高并发支持。
- `asyncio`实现了TCP、UDP、SSL等协议，`aiohttp`则是基于`asyncio`实现的HTTP框架。
- 例子：
```python
'''
async web application.
'''

import asyncio

from aiohttp import web

async def index(request):
    await asyncio.sleep(0.5)
    return web.Response(body=b'<h1>Index</h1>', content_type='text/html')

async def hello(request):
    await asyncio.sleep(0.5)
    text = '<h1>hello, %s!</h1>' % request.match_info['name']
    return web.Response(body=text.encode('utf-8'), content_type='text/html')

async def init(loop):
    app = web.Application(loop=loop)
    app.router.add_route('GET', '/', index)
    app.router.add_route('GET', '/hello/{name}', hello)
    srv = await loop.create_server(app.make_handler(), '127.0.0.1', 8000)
    print('Server started at http://127.0.0.1:8000...')
    return srv

loop = asyncio.get_event_loop()
loop.run_until_complete(init(loop))
loop.run_forever()
```

## 总结

- 动态类型代码确实太难以读代码了，虽然语法简单，但是类型会令人纠结。
- 某些时候缺失了类型信息，补全都难以进行，也许类型标注会是一个好的手段。
- 函数式编程支持有限，不过任何手段都只是手段而不是目的，如果达成目的有唯一的最佳方式，那使用最佳实践就好了，还降低了选择成本。
- 各种库功能完善，细节略多，基本有了一个大概印象，具体使用则基本都是走马观花，还需要具体用到时才好深入。
- 简单入门了网络编程、HTTP编程、异步编程、SQL编程，但具体实用还远远不够，还需要更多的理论与实践。比如HTTP、协程、WSGI等。
- 更多高级的用法，更多细节，更多具体库的使用，待实践后深入。