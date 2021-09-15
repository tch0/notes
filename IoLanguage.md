<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Io](#io)
  - [环境配置](#%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE)
  - [介绍](#%E4%BB%8B%E7%BB%8D)
  - [基本要素](#%E5%9F%BA%E6%9C%AC%E8%A6%81%E7%B4%A0)
  - [基于原型](#%E5%9F%BA%E4%BA%8E%E5%8E%9F%E5%9E%8B)
  - [运行环境](#%E8%BF%90%E8%A1%8C%E7%8E%AF%E5%A2%83)
  - [面向对象](#%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1)
  - [消息](#%E6%B6%88%E6%81%AF)
  - [控制流](#%E6%8E%A7%E5%88%B6%E6%B5%81)
  - [DSL](#dsl)
  - [forward](#forward)
  - [并发](#%E5%B9%B6%E5%8F%91)
  - [总结](#%E6%80%BB%E7%BB%93)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Io

书籍[七周七语言：理解多种编程范型](https://book.douban.com/subject/10555435/)的第二门编程语言。

2002年，Steve Dekorte发明了Io语言，看起来这语言非常年轻，并且非常小众，小众到浏览器搜索除了官网和百科只有极少其他的文章。

Io语言机器精简与小巧，一刻钟学会语法，半小时学会基本原理。只是需要多花些心思在Io的库上，因为这门语言的复杂性和丰富性，统统来自于库的设计。

如今的大多数Io社区，都致力于把Io作为带有微型虚拟机和丰富并发特性的可嵌入语言来推广。Io的核心优势是拥有大量可定制语法和函数，以及强有力的并发模型。它的简单语法和原型编程模型都值得我们重点关注。

资料阅读：
- [官网的英文入门Guide](https://iolanguage.org/guide/guide.html)
- [找到一个入门Guide的中文翻译，并且作者配套还写了教程](https://github.com/sluke/learn-io-language-the-hard-way/blob/master/io-guide-cn.md)，练习和翻译的教程看完就可以入门io语言了，7周7语言这本书中介绍得还是有点太简单了。
- [源码仓库](https://github.com/IoLanguage/io)，最近有一定活跃。

提前抓一下重点：
- 基于原型的面向对象设计。
- 万物皆对象，甚至上下文、方法、命名空间、代码块都是可以动态赋值并进行传递的对象。
- 代码由表达式构成，所有表达式都蕴含了一个动态的信息发送，槽和消息也是关注重点。
- 库、基本数据结构。
- 并发模型：actors和coroutine。
- 嵌入和扩展到其他语言中，作为可选内容。
- 理解清楚这几点才算是入门了Io。
- 这里只阐述核心思想，不详细介绍语法细节。

观前提示：
- 这是一门纯粹面向对象的语言，任何东西都是对象。
- 这是一门很能套娃的语言。
- 这是很自由的语言。

## 环境配置

搜索Io语言或者Io Language找到官网，下载Windows二进制和适合的Linux包。包装管理没有这个包，需要手动安装。

Windows：
- 执行exe将文件提取到要安装的目录。
- 添加`bin\`目录到path环境变量。

Linux：
- Ubuntu为例，下载deb包。
```shell
wget https://iobin.suspended-chord.info/linux/iobin-linux-x64-deb-current.zip
unzip iobin-linux-x64-deb-current.zip
sudo dpkg -i ./IoLanguage-2013.11.04-Linux-x64.deb
```
按照README中说的需要先安装依赖（有点老了，有的已经废弃过时了），我这里估计都有不需要也能安装成功：
```shell
sudo apt-get install build-essential cmake libreadline-dev libssl-dev ncurses-dev libffi-dev zlib1g-dev libpcre3-dev libpng-dev libtiff4-dev libjpeg62-dev python-dev libpng-dev libtiff4-dev libjpeg62-dev libmysqlclient-dev libmemcached-dev libtokyocabinet-dev libsqlite3-dev libdbi0-dev libpq-dev libgmp3-dev libogg-dev libvorbis-dev libtaglib-cil-dev libtag1-dev libtheora-dev libsamplerate0-dev libloudmouth1-dev libsndfile1-dev libflac-dev libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev libxmu-dev libxi-dev libxml2-dev libyajl-dev uuid-dev liblzo2-dev zlib1g-dev libevent-de
```

包的更新时间是2013年，如果要最新版本估计还得去找源码编译，这里就免了。

VSCode搭建执行环境：
- 无论Windows，WSL，Linux都可以用。
- 安装插件，还是有3款插件的，能高亮，好像都没有补全，只能凑合着用了。比如名为io的插件就行。
- 运行的话使用Code-Runner插件为`.io`后缀配置执行命令，`".io": "io $fileName"`就可以执行了。或者直接在命令行`io file.io`执行。
- 调试暂时忽略。

进入交互式执行环境：
```shell
io
```

执行文件：
```shell
io hello.io
```

HelloWorld：
```io
"hello,world!" println
```

作为脚本执行：
```io
#!/usr/bin/env io
```

在文件或者交互环境中执行源文件，自己执行自己会死循环：
```io
doFile("file.io")
```

执行字符串：
```io
doString("xxx")
```

## 介绍

官网的介绍：
```
Io is a programming language focused on expressiveness through simplicity.

inspirations 
Self, Lua, Smalltalk, NewtonScript, Act1, LISP

pure 
minimal syntax
all values are objects
prototype-based object model
everything is a message, even assignment
no keywords, no globals

dynamic
all messages are dynamic
code is a runtime modifiable tree of messages
arguments passed by expression, receiver controls eval
differential inheritance
become, transparent proxies, weak links

concurrent
coroutine based actors
transparent futures
automatic lock detection

implementation
small
open source
embeddable
multi-state
incremental collector
```

需要关注的点：动态类型、纯粹面向对象、基于原型、消息机制、并发模型。

语言文法：
```BNF
messages
expression ::= { message | sctpad }
message ::= [wcpad] symbol [scpad] [arguments]
arguments ::= Open [argument [ { Comma argument } ]] Close
argument ::= [wcpad] expression [wcpad]

symbols
symbol ::= Identifier | number | Operator | quote
Identifier ::= { letter | digit | "_" }
Operator ::= { ":" | "." | "'" | "~" | "!" | "@" | "$" | 
"%" | "^" | "&" | "*" | "-" | "+" | "/" | "=" | "{" | "}" | 
"[" | "]" | "|" | "\" | "<" | ">" | "?" }

quotes
quote ::= MonoQuote | TriQuote
MonoQuote ::= """ [ "\"" | not(""")] """
TriQuote ::= """"" [ not(""""")] """""

spans
Terminator ::= { [separator] ";" | "\n" | "\r" [separator] }
separator ::= { " " | "\f" | "\t" | "\v" }
whitespace ::= { " " | "\f" | "\r" | "\t" | "\v" | "\n" }
sctpad ::= { separator | Comment | Terminator }
scpad ::= { separator | Comment }
wcpad ::= { whitespace | Comment }

comments
Comment ::= slashStarComment | slashSlashComment | poundComment
slashStarComment ::= "/*" [not("*/")] "*/"
slashSlashComment ::= "//" [not("\n")] "\n"
poundComment ::= "#" [not("\n")] "\n"

numbers
number ::= HexNumber | Decimal
HexNumber ::= "0" anyCase("x") { [ digit | hexLetter ] }
hexLetter ::= "a" | "b" | "c" | "d" | "e" | "f"
Decimal ::= digits | "." digits | 
digits "." digits ["e" [-] digits]

characters
Comma ::= ","
Open ::= "(" | "[" | "{"
Close ::= ")" | "]" | "}"
letter ::= "a" ... "z" | "A" ... "Z"
digit ::= "0" ... "9"
digits ::= { digit }
The uppercase words above designate elements the lexer treats as tokens.
```

## 基本要素

注释：
```io
# comment
// single line comment
/*
multi line comment
*/
```
运算符表与优先级：
```
  0   ? @ @@
  1   **
  2   % * /
  3   + -
  4   << >>
  5   < <= > >=
  6   != ==
  7   &
  8   ^
  9   |
  10  && and
  11  or ||
  12  ..
  13  %= &= *= += -= /= <<= >>= ^= |=
  14  return
```
赋值运算符：
```
  ::= newSlot       Creates slot, creates setter, assigns value
  :=  setSlot       Creates slot, assigns value
  =   updateSlot    Assigns value to slot if it exists, otherwise raises exception
```
和C语言中没有太大区别，多了`**`支持浮点数的求幂运算，`%`支持浮点数，`/`统一执行浮点除法，字符串字面值使用`""`运算符，浮点数采用IEEE754 64位浮点数，浮点数字面值同C不支持任何类型后缀，`..`为字符串连接运算符，`&& ||`同样短路求值，运算符基本上和C语言语义、优先级都一致。C中没有的`? @ @@`后续详述。

赋值运算符自成一组。

变量：Io是动态语言，不需要先声明后使用，但也不能直接赋值，如果没有定义过第一次需要使用`::=`或者`:=`进行创建，前者还会创建一个setter。已经定义的话`:= =`等价，`::=`创建一个setter。Io将变量称作**槽(slot)**。

赋值运算符编译后：可以直接等价替换。
```
source     compiles to
a ::= 1    newSlot("a", 1)
a := 1     setSlot("a", 1)
a = 1      updateSlot("a", 1)
```

字符串：转义和C语言差不多，具体细节暂时不多研究，`\t \r \n \\ \"`等都是支持的，ASCII值转义好像不支持，使用一对`"""`包起来表示原始字符串不进行转义。拼接两个字符串用`..`，字面值也需要，字面值在Io中一样是对象。

除去这些东西外，Io语言并没有关键字，所有的内容都定义在库中，包括控制结构、循环一个原因的基本要素在内的所有东西。

`true false nil`：分别表示逻辑真、逻辑假、对象为空，同样也都是对象而不是关键字，这三个对象是单例的对象，也就是调用克隆还是返回自己而不是克隆一个新的对象，后面会说怎么实现。和Ruby一样，0用在条件中时是true，而不是false。

## 基于原型

Io的面向对象系统是基于原型的，也就是说Io中并没有类这个概念。维基百科中的定义：
>基于原型编程（英语：prototype-based programming）或称为原型程序设计、原型编程，是面向对象编程的一种风格和方式。在原型编程中，行为重用（在基于类的语言通常称为继承）是通过复制已经存在的原型对象的过程实现的。这个模型一般被认为是无类的、面向原型、或者是基于实例的编程。

基于原型的语言最初的例子是Self，后续有很多语言采取这种方式：JavaScript、Cecil、NewtonScript、Io、REBOL等。其中使用最广泛的是JavaScript。

Io中的原型：
- 最初的原型：`Object`，是一个根对象。
- 创建新的对象的方式：克隆`clone`，从另一个对象（原型对象或普通对象）。
- 获取到一个对象的原型：`proto`。
- 约定：大写字母开头的是新的原型对象，而小写字母开头的不是，只是一个普通的对象。这是一个惯例，但同时也作为了一个语法。
- Io中叫对象的成员（也就是面向对象语言中说的方法或者字段，方法和字段还是有区分的）称为**槽（slot）**。
- 对象就是**槽的容器**。
- 原型和普通的对象的区别仅仅在于：原型多一个自己的`type`槽（可以理解为字符串类型的一个字段），用来表示类型。而普通对象则不会有这个`type`槽，所以调用时会调用它的原型的`type`槽，得到和它的原型调用`type`相同的结果。除此之外，无其他区别。它只是帮助程序员更好地组织的代码的工具，也可以理解为原型对象时一个实例的同时也是一个类型，普通对象则仅仅是实例。
- 前面所说的`::=`会多生成一个setter，这个setter就是一个槽（方法），比如如果`age`字段就会生成一个`setAge`方法。
- 重复一遍，在这里**没有类的概念**，可以往任何对象上添加任何槽，修改原型上、原型的原型上或者自己已经定义的槽。获取槽时对象上找不到槽会到它的原型上去找（就像子类和基类一样）。
- 也就是说槽在某种程度是有数据依赖的，如果你不在克隆的对象上修改继承自原型的槽，那么修改了原型的槽后在克隆对象上获取该槽会获取到原型的数据。
- 所以应该从原型对象克隆（作为类型使用），并且不修改已知的原型对象，而不应该从普通对象克隆，这样数据会依赖，除非你的目的就是要依赖，否则不太建议这样做。如果在克隆对象中赋值覆盖掉了那些槽，那么和从原型克隆最终行为上来说是一样的。
- 使用`print println`的打印一个对象时只会打印在这个对象自己覆盖了原型中或者新添加的槽，`slotNames`槽获取到的列表同理。
- 可以预见地对象最终会组织成一棵树数的形式，根节点是`Object`，更多时候应该是一个沿着叶子节点向上遍历的过程。
- 注意一个对象的原型(指克隆的源对象)不一定要是原型对象(指大写字母开头，`type`得到自己名称的对象)，也可以是一个普通对象。有点小抽象，这是什么阅读理解啊！
```io
Io> Person := Object clone # new proto object
==>  Person_0x2c6c700:
  type             = "Person"

Io> Person type
==> Person
Io> p := Person clone # just object
==>  Person_0x2bb6a20:

Io> p type
==> Person
Io> p type type # type return a string(Sequecne)
==> Sequence
Io> p proto type
==> Person
Io> p proto proto type
==> Object
Io> Object type
==> Object
Io> p proto == Person
==> true
Io> Person proto == Object
==> true
```

往对象上动态添加槽：
```io
Person := Object clone
Person name ::= nil # also create setter
Person age := nil
Person address := nil
Person println

mary := Person clone
mary hash := 0 # new slot
mary setName("mary") # use setter
mary age = 13
mary println

Student := Person clone do(
    class := nil
    grade := nil
)

lily := Student clone do(
    name = "lily"
    age ::= 13 # create setter
    setAge(14) # use setter
    class = "6-1"
    grade = 4.0
    hobby := "chess" # new slot
    getDescription := method( # new method slot
        name .. " " .. age .. " " .. address .. " " .. class # return this string
    )
)

lily println
lily getDescription println
```
从这个例子就可以看出每个对象都可以不一样，太自由了，原型对象和普通对象用起来没有任何区别。

## 运行环境

当前的运行环境：交互环境或文件的执行环境是一个命名空间`namespace`，名为`Lobby`也是一个对象，`type`是`Object`，看来这是一个特例（大写字母开头但是自己并不是原型？）。

常见类型：
```io
Io> 1 type 
==> Number
Io> 1.0 type
==> Number
Io> "hello" type
==> Sequence
Io> true type
==> true
Io> nil type
==> nil
Io> Lobby type
==> Object
Io> Lobby
==>  Object_0x7e1cf0:
  Lobby            = Object_0x7e1cf0
  Protos           = Object_0x7e1ba0
  _                = Object_0x7e1cf0
  exit             = method(...)
  forward          = method(...)
  set_             = method(...)

Io> Protos == Lobby proto
==> true
Io> Protos proto == Object
==> false
Io> Protos proto proto == Object 
==> true
Io> Protos
==>  Object_0x7e1ba0:
  Addons           = Object_0x7e1a20
  Core             = Object_0x7e1960

Io> Protos proto == Protos Core
==> true
Io> Protos Core proto == Object
==> true
```

- `Lobby`是当前命名空间，同时它也是一个对象，在当前命名空间定义的对象都是它的槽。在命名空间内打印`println`就是直接打印`Lobby`对象。
- 所以可以通过`Lobby`引用已经定义在Lobby内的槽，当然`Lobby`是可以被省略的，也就是我们通常的引用方式。
- `Lobby`内已经预先定义了一些符号：
    - `Lobby`就是自己。
    - `_`值也是自己，而且包含它的setter。
    - `exit`是退出方法。交互环境下执行会退出交互环境，文件执行环境好像什么都不会发生。
    - `Protos`类型是`Object`，其中包含两个槽，具体是什么作用暂时不清楚。这个对象也是`Lobby`的原型（和`Lobby`一样，大写开头，但是不做为原型）。上面还有一层原型`Protos Core`，然后原型的原型就是`Object`。
    ```
    Lobby ---> Lobby Protos ---> Lobby Protos Core ---> Object
    ```
    - `forward`方法不知道是做什么的，调用不了。
- 可以看到中间有一些对象都是大写开头的，都不是新的原型，而是`Object`。
- 再次注意一个对象的原型并不一定要是原型对象，也可以是普通对象。从谁克隆，谁就是它的原型。
- 你甚至可以改变`Lobby`的值，但是这个命名空间对象还是存在的，只是`Lobby`不再指向它了而已。新创建的槽也还是在这个命名空间内。
- 你可以改变几乎任意对象的任意一个槽，自由度很高，但太过放纵未必是件好事。

## 面向对象

添加槽前面已经说过了，用`:= ::=`。

其中方法使用`Object method`方法（`method`本身是方法吗？）创建（套娃了属于是），得到一个匿名函数，因为在`Lobby`中，而`Lobby`又是一个`Object`，所以`Object`可以省略。
```io
method((2+2) println)
```
确实无时无刻任何东西都是对象的感觉了，剩下唯一的疑问就是方法是什么，方法放在槽里面这毋庸置疑，但方法的类型是什么呢？（不能通过type获得，因为会执行方法，从而得到返回值的类型）

方法定义的形式：
```io
method(<arg name 0>, <arg name 1>, ..., <do message>)
```

例：
```io
fibonacci := method(n, do(
    return if (n <= 0, 0, if (n == 1, 1, fibonacci(n-1) + fibonacci(n-2)))
))

fibonacci2 := method(n, do(
    if(n <= 0) then(return 0
    ) elseif(n == 1) then(return 1) 
    return fibonacci2(n-1) + fibonacci2(n-2)
))

fibonacci3 := method(n, do(
    if (n <= 0) then (return 0) elseif (n == 1) then(return 1)
    a := 0
    b := 1
    n repeat (
        tmp := a
        a = b
        b = tmp + a
    )
    return a
))
```

单例的`true false nil`：通过修改`clone`字段，将其改为自己就可以实现。
```io
Person := Object clone
Person clone := Person
```
原始的`clone`槽定义在`Object`上：应该是调用一个本地的C函数来克隆并返回新对象，`Object`中很多方法都是这样的。既可以理解为方法（克隆并返回一个新对象）也可以理解为字段（每次获取都得到一个克隆后的新对象），都统一称为槽，调用方式本就没有区别。
```io
Io> Object getSlot("clone") 
==> Object_clone()
Io> Object getSlot("clone") type
==> CFunction
```

## 消息

对象有槽，槽中存放了对象（包括方法对象）。Io中所有与对象的交互都是**消息**，通过向对象传递消息会返回槽的值或者调用槽中的方法，传递的消息就是槽的名称。

前面一直没有提过，其实就是面向对象中的获取字段和调用方法，这里换了个说法并统一起来了而已。但在机制上来说这是Io的核心机制之一。

一个消息由三个部分组成：
- 发送者（`sender`）
- 目标（`target`）
- 参数（`arguments`）

特点：
- 消息由发送者发送至目标，然后由目标执行消息（获取字段或执行方法）。
- 可以用`call`方法访问任何消息的元消息，称之为消息反射。
  - `call sender` 发送者
  - `call target` 发送目标
  - `call message arguments` 发送消息的参数列表
  - `call message argAt(n)` 消息参数
  - `call message name` 消息名称
- 大部分语言将参数作为栈上的值传递，都会先计算每个参数的值，然后再传递给函数。Io不是这样，**Io传递的是消息本身和上下文，由接收者对消息求值**。


任何程序结构都通过消息实现，包括创建对象、控制流、函数调用、定义新类型。

通过元消息实现一个`unless`方法，仅仅是`if(<condition>, <do message>, <else do message>)`结构的反义：
```io
unless := method(
    (call sender doMessage(call message argAt(0)) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2))))
)

unless(1 == 2, write("hello"), write("world"))
```
这里是由发送目标`sender`调用`doMessage`来执行消息的参数，也就是由调用方来求值。注意`ifFalse`和`ifTrue`前的空格，写在一行是必须的。

## 控制流

```io
# if
if(<condition>, <do message>, <else do message>)
if(condition) then (operations) elseif(condition) then (operations) else (operations)

# for
for(counter, initial_val, finalize_val, optional increment, body, extra argument); message with sender
list() foreach(count, value, <do message>) # list method

# while
while(condition, body); message with sender
```

## DSL

通过添加运算符将特定的文件格式解析为Io的新增语法可以方便地实现DSL。

比如要将这个文件解析为电话本：
```io
// book.txt
// parsing target:
{
    "peter" : "2134213412",
    "yes" : "1234"
}
```
实现：确实方便，但也是真的晦涩。
```io
/*
parsing target: book.txt
{
    "peter" : "2134213412",
    "yes" : "1234"
}
*/

OperatorTable addAssignOperator(":", "atPutNumber") # make "key" : value to be atPutNumber("key", value)
curlyBrackets := method( # override curlyBrackets
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r # return map
)

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), // key
        call evalArgAt(1) // value
    )
)

s := File with("book.txt") openForReading contents
phoneNumbers := doString(s)
# or just phoneNumbers := doFile("book.txt")
phoneNumbers keys println
phoneNumbers values println
```
直接就将这个文件变成了语法的一部分，用Io的语法来解析，没有一定熟悉程度谁能写出这种代码啊！

## forward

重写`forward`方法使用消息反射可以实现Ruby中的`method_missing`类似的功能。

## 并发

协程是并发的基础。它提供了进程的自动挂起和恢复执行的机制。你可以把协程想象为带有多个入口和出口的函数。每次yield都会自动挂起当前进程，并把控制权转到另一进程当中。

通过在消息前加上@或@@，你可以异步触发消息，前者将返回future，后者会返回nil，并在其自身线程中触发消息。

Io就到这儿把，不详述了。


## 总结

- 同样是动态类型、鸭子类型的。
- 基于原型很有趣，万物皆对象并且可以动态增改对象的槽很自由。
- 语法有点让人摸不着头脑，只能说勉强能用。具体体现在返回值，各种操作的优先级，括号应该怎么加，什么时候加。
- 消息这个点有点无法评价，搞不懂为什么要这样设计。
- 健壮的并发模型，暂未理解。
- 语法糖太太太少了，做事情很费劲。
- 任何结构都是消息（其实也就是函数调用），很多代码依赖返回值，而又是动态类型，搞得读代码和查错很头疼，需要精心设计程序才能work，心智负担感觉也太严重了。
- 也许去学一下JavaScript是一个不错的选择。
- 仅看书是完全不够的，7周7语言中Io篇幅不长，我并不认为它讲得很清楚。
- 以后有空再来详细学习一下。


