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
- [廖雪峰Python教程](https://www.liaoxuefeng.com/wiki/1016959663602400)

## 环境配置

Python3和Python2不兼容，Python2已经停止维护，原则上不应再使用。时下（2021.10.1）最新版本3.9.7。

- 官方解释器CPython，下载安装配置环境变量。
- VSCode安装Python插件。
- 推荐IDE：PyCharm。

```python
print("hello,world!")
```

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



