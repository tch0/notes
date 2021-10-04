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
  - [virtualenv](#virtualenv)
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
- [廖雪峰Python教程](https://www.liaoxuefeng.com/wiki/1016959663602400)（本文主要参考）

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

## IO

## 并发编程

## 正则表达式

## 常用内建模块

## virtualenv

## 图形界面

## 网路编程

## 电子邮件

## 数据库

## Web开发

## 异步IO

## 总结

