<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Makefile](#makefile)
  - [0. Make介绍](#0-make%E4%BB%8B%E7%BB%8D)
  - [1. Makefile介绍](#1-makefile%E4%BB%8B%E7%BB%8D)
    - [1.1 Makefile的规则](#11-makefile%E7%9A%84%E8%A7%84%E5%88%99)
    - [1.2 Make如何工作](#12-make%E5%A6%82%E4%BD%95%E5%B7%A5%E4%BD%9C)
    - [1.3 使用变量](#13-%E4%BD%BF%E7%94%A8%E5%8F%98%E9%87%8F)
    - [1.4 Make自动推导](#14-make%E8%87%AA%E5%8A%A8%E6%8E%A8%E5%AF%BC)
    - [1.5 新风格的Makefile](#15-%E6%96%B0%E9%A3%8E%E6%A0%BC%E7%9A%84makefile)
    - [1.5 伪目标](#15-%E4%BC%AA%E7%9B%AE%E6%A0%87)
    - [1.6 Makefile里面有什么](#16-makefile%E9%87%8C%E9%9D%A2%E6%9C%89%E4%BB%80%E4%B9%88)
    - [1.7 Makefile文件名](#17-makefile%E6%96%87%E4%BB%B6%E5%90%8D)
    - [1.8 引用其他Makefile](#18-%E5%BC%95%E7%94%A8%E5%85%B6%E4%BB%96makefile)
    - [1.9 环境变量MAKEFILES](#19-%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8Fmakefiles)
    - [1.10 Make的工作步骤](#110-make%E7%9A%84%E5%B7%A5%E4%BD%9C%E6%AD%A5%E9%AA%A4)
  - [2. 规则](#2-%E8%A7%84%E5%88%99)
    - [2.1 规则语法](#21-%E8%A7%84%E5%88%99%E8%AF%AD%E6%B3%95)
    - [2.2 规则中使用通配符](#22-%E8%A7%84%E5%88%99%E4%B8%AD%E4%BD%BF%E7%94%A8%E9%80%9A%E9%85%8D%E7%AC%A6)
    - [2.3 文件搜寻](#23-%E6%96%87%E4%BB%B6%E6%90%9C%E5%AF%BB)
    - [2.4 伪目标](#24-%E4%BC%AA%E7%9B%AE%E6%A0%87)
    - [2.5 多目标](#25-%E5%A4%9A%E7%9B%AE%E6%A0%87)
    - [2.6 静态模式](#26-%E9%9D%99%E6%80%81%E6%A8%A1%E5%BC%8F)
    - [2.7 自动生成依赖](#27-%E8%87%AA%E5%8A%A8%E7%94%9F%E6%88%90%E4%BE%9D%E8%B5%96)
  - [3. 命令](#3-%E5%91%BD%E4%BB%A4)
    - [3.1 显示命令](#31-%E6%98%BE%E7%A4%BA%E5%91%BD%E4%BB%A4)
    - [3.2 命令执行](#32-%E5%91%BD%E4%BB%A4%E6%89%A7%E8%A1%8C)
    - [3.3 命令出错](#33-%E5%91%BD%E4%BB%A4%E5%87%BA%E9%94%99)
    - [3.4 嵌套执行make](#34-%E5%B5%8C%E5%A5%97%E6%89%A7%E8%A1%8Cmake)
    - [3.5 命令包](#35-%E5%91%BD%E4%BB%A4%E5%8C%85)
  - [4. 变量](#4-%E5%8F%98%E9%87%8F)
    - [4.1 使用变量](#41-%E4%BD%BF%E7%94%A8%E5%8F%98%E9%87%8F)
    - [4.2 变量中的变量](#42-%E5%8F%98%E9%87%8F%E4%B8%AD%E7%9A%84%E5%8F%98%E9%87%8F)
    - [4.3 高级用法](#43-%E9%AB%98%E7%BA%A7%E7%94%A8%E6%B3%95)
    - [4.4 追加变量值](#44-%E8%BF%BD%E5%8A%A0%E5%8F%98%E9%87%8F%E5%80%BC)
    - [4.5 override指示符](#45-override%E6%8C%87%E7%A4%BA%E7%AC%A6)
    - [4.6 多行变量](#46-%E5%A4%9A%E8%A1%8C%E5%8F%98%E9%87%8F)
    - [4.7 环境变量](#47-%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F)
    - [4.8 目标变量](#48-%E7%9B%AE%E6%A0%87%E5%8F%98%E9%87%8F)
    - [4.9 模式变量](#49-%E6%A8%A1%E5%BC%8F%E5%8F%98%E9%87%8F)
  - [5. 使用条件判断](#5-%E4%BD%BF%E7%94%A8%E6%9D%A1%E4%BB%B6%E5%88%A4%E6%96%AD)
  - [6. 函数](#6-%E5%87%BD%E6%95%B0)
    - [6.1 函数调用语法](#61-%E5%87%BD%E6%95%B0%E8%B0%83%E7%94%A8%E8%AF%AD%E6%B3%95)
    - [6.2 字符串处理函数](#62-%E5%AD%97%E7%AC%A6%E4%B8%B2%E5%A4%84%E7%90%86%E5%87%BD%E6%95%B0)
    - [6.3 文件名操作函数](#63-%E6%96%87%E4%BB%B6%E5%90%8D%E6%93%8D%E4%BD%9C%E5%87%BD%E6%95%B0)
    - [6.4 foreach函数](#64-foreach%E5%87%BD%E6%95%B0)
    - [6.5 if函数](#65-if%E5%87%BD%E6%95%B0)
    - [6.6 call函数](#66-call%E5%87%BD%E6%95%B0)
    - [6.7 origin函数](#67-origin%E5%87%BD%E6%95%B0)
    - [6.8 shell函数](#68-shell%E5%87%BD%E6%95%B0)
    - [6.9 error & warning](#69-error--warning)
  - [7. make的运行](#7-make%E7%9A%84%E8%BF%90%E8%A1%8C)
    - [7.1 退出码](#71-%E9%80%80%E5%87%BA%E7%A0%81)
    - [7.2 指定Makefile](#72-%E6%8C%87%E5%AE%9Amakefile)
    - [7.3 指定目标](#73-%E6%8C%87%E5%AE%9A%E7%9B%AE%E6%A0%87)
    - [7.4 检查规则](#74-%E6%A3%80%E6%9F%A5%E8%A7%84%E5%88%99)
  - [8. 隐含规则](#8-%E9%9A%90%E5%90%AB%E8%A7%84%E5%88%99)
    - [8.1 使用隐含规则](#81-%E4%BD%BF%E7%94%A8%E9%9A%90%E5%90%AB%E8%A7%84%E5%88%99)
    - [8.2 隐含规则一览](#82-%E9%9A%90%E5%90%AB%E8%A7%84%E5%88%99%E4%B8%80%E8%A7%88)
    - [8.3 隐含规则中的变量](#83-%E9%9A%90%E5%90%AB%E8%A7%84%E5%88%99%E4%B8%AD%E7%9A%84%E5%8F%98%E9%87%8F)
    - [8.4 隐含规则链](#84-%E9%9A%90%E5%90%AB%E8%A7%84%E5%88%99%E9%93%BE)
    - [8.5 定义模式规则](#85-%E5%AE%9A%E4%B9%89%E6%A8%A1%E5%BC%8F%E8%A7%84%E5%88%99)
    - [8.6 老式风格的后缀规则](#86-%E8%80%81%E5%BC%8F%E9%A3%8E%E6%A0%BC%E7%9A%84%E5%90%8E%E7%BC%80%E8%A7%84%E5%88%99)
    - [8.6 隐含规则搜索算法](#86-%E9%9A%90%E5%90%AB%E8%A7%84%E5%88%99%E6%90%9C%E7%B4%A2%E7%AE%97%E6%B3%95)
  - [9. 使用make更新函数库文件](#9-%E4%BD%BF%E7%94%A8make%E6%9B%B4%E6%96%B0%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E4%BB%B6)
    - [9.1 函数库文件的成员](#91-%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E4%BB%B6%E7%9A%84%E6%88%90%E5%91%98)
    - [9.2 函数库成员的隐含规则](#92-%E5%87%BD%E6%95%B0%E5%BA%93%E6%88%90%E5%91%98%E7%9A%84%E9%9A%90%E5%90%AB%E8%A7%84%E5%88%99)
  - [10. 总结](#10-%E6%80%BB%E7%BB%93)
  - [11. 结语](#11-%E7%BB%93%E8%AF%AD)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Makefile

- [GUN Make 首页](http://www.gnu.org/software/make/)
- [GUN Make 文档](https://www.gnu.org/software/make/manual/html_node/index.html)
- [跟我一起写Makefile](https://seisman.github.io/how-to-write-makefile/index.html)

测试环境：WSL Ubuntu 20.04 LTS
make版本：GNU Make 4.2.1

## 0. Make介绍

在Windows上写程序时，因为有了IDE来帮助我们编译构建项目，通常来说都不会使用Make，但人人都说作为Pro的程序员，Makefile必须要懂。如果是在Unix系统下编译构建程序，Make是必不可少的。

Make是一个解释Makefile文件来实现自动化编译的工具，不同厂商的Make各不相同，也有不同的语法。这里的Make特指应用最广泛的[GNU Make](http://www.gnu.org/software/make/)，这里也同[跟我一起写Makefile](https://seisman.github.io/how-to-write-makefile/index.html)一致，使用C/C++源码，GCC/G++编译器来学习。

在C/C++中，一般来说无论是C还是C++，都是先把源文件**编译**为中间代码文件（Unix中`.o`，Windows中`.obj`），即对象文件。然后再把对象文件**链接**为可执行文件。编译时需要语法正确，函数变量声明的正确，通常编译文件很多，需要给对象文件打包以方便链接（Windows下的`.lib`库文件，Unix下的`.a`Archive file）。链接时会寻找检查函数的实现，变量的定义等。

## 1. Makefile介绍

make执行时需要一个Makefile文件，以告诉make如何进行编译和链接程序。执行`make`就是执行`Makefile`中指定的命令序列，就像Shell脚本那样。使用`Makefile`的好处在于：
- 告诉make如何去编译和链接。
- 处理文件之间的依赖关系，编译完成后如果只修改了部分文件，那么只需要重新编译链接有必要的文件，不需要全部编译，对大型项目来说这是必须的。

这些事情在成熟的IDE中都会由IDE来做。

### 1.1 Makefile的规则

```Makefile
target ... : prerequisites ...
	command
	...
	...
```

- `target` 可以是一个目标文件(Object file)，也可以是可执行文件，也可以是一个标签(伪目标)。
- `prerequisites` 生成该`target`所依赖的文件或者`target`。
- `command` 该`target`所执行的命令，任意的Shell命令序列。
- `command` 缩进只能够使用`Tab`而不能使用空格。

以上`Makefile`确定了文件的依赖关系与生成规则，如果`prerequisites`中的任意一个文件发生了更改，那么都会重新执行`command`定义的命令以重新生成`target`。

示例：编译文件`hello.c`
```Makefile
hello : hello.o
	gcc -o hello hello.o

hello.o : hello.c
	gcc -c hello.c

clean:
	rm -rf hello.o hello
```

- 其中`clean`就是一个标签，没有依赖，它代表一个动作，而不是具体的文件。执行`make clean`是就会执行`clean`下的命令也就是清除生成的文件，执行`make hello.o`也会只执行`hello.o` 目标下的命令。
- 使用标签可以定义一些编译链接之外的动作，比如程序的打包，备份等。
- 可以使用`\`进行换行，逻辑上与写在一行一致。
- `make`并不会管命令如何工作，它只负责按照`Makefile`的规则去依次执行目标下的命令。

### 1.2 Make如何工作

输入`make`之后的执行逻辑：

1. `make` 会在当前目录下按照优先级茶找名称为`GNUmakefile`/`makefile`/`Makefile`的文件。
2. 在`Makefile`中找到第一个目标。
3. 如果第一个目标的文件不存在，或者是目标后依赖的文件(GCC的话通常就是`.o`文件)的文件修改时间比目标文件新，那么会执行第一个目标后的命令来生成目标。
4. 如果第一个目标依赖的文件不存在，那么会找到以这个文件为目标的命令来按照同样逻辑执行。就像一个有条件的函数调用的压栈出栈过程那样，直到最终依赖的文件被找到生成之后，再返回回来执行更上层的生成命令。
5. 如果执行`make`是带了标签，那就是同样原理执行那个标签，而不是第一个标签。

在寻找与生成过程中，如果出现错误：
- 被依赖的文件找不到时该目标无法生成，那么`make`就会直接退出并报错。
- 如果是定义的命令执行错误，比如编译失败，那么`make`不会理会，只管文件的依赖性。即如果执行了后面的命令但目标文件还是不在，那么就直接退出。

### 1.3 使用变量

如果多加了一个文件`comamnd.c`，并且hello.c通过`extern`调用了其中定义的函数或者变量。那么`Makefile`就需要改为：

```Makefile
hello : hello.o command.o
	gcc -o hello hello.o command.o

hello.o : hello.c
	gcc -c hello.c

command.o : command.c
	gcc -c command.c

clean:
	rm -rf hello.o hello \
		command.o
```

其中`.o`相关字符串被重复了多次。可以使用变量来减少重复：
```Makefile
objects = hello.o command.o

hello : $(objects)
	gcc -o hello $(objects)

hello.o : hello.c
	gcc -c hello.c

command.o : command.c
	gcc -c command.c

clean:
	rm hello $(objects)
```

- 定义时使用`varName = xxx`。
- 通过`$(varName)`引用。
- 变量的含义就是简单的字符串替换。

后续详细解释。

### 1.4 Make自动推导

GNU的make很强大，可以自动推导文件以及文件依赖关系的命令，上面的例子可以简化为下面这样：
```Makefile
objects = hello.o command.o

hello : $(objects)
	cc -o hello $(objects)

hello.o : hello.c
command.o : command.c

clean:
	rm hello $(objects)
```
执行`make`时的命令序列是：
```shell
cc    -c -o hello.o hello.c
cc    -c -o command.o command.c
cc -o hello hello.o command.o
```

Linux中`cc`就是一个指向`gcc`的符号链接。

### 1.5 新风格的Makefile

一个`.o`可能会依赖于多个文件，多个`.o`也可能依赖同一个源文件，最新风格的`Makefile`可以让我们将多个`.o`写在一起：
```Makefile
target1.o target2.o : source1.h
target2.o : source2.h
```
这样和:
```
target1.o : source1.h source2.h
target2.o : source2.h
```
等价，区别是目标文件和源文件写哪一个的问题。在我看来，虽然都可以描述依赖关系，但后者可能更清晰一些。

### 1.5 伪目标

使用`.PHONY target`可以将一个目标声明为伪目标，伪目标应该定义一个操作，而不生成一个文件。如果不声明为伪目标的话，会默认为文件目标，那么如果在目录下定义了同名的文件，像`clean`这种伪目标通常又没有依赖，只是执行操作，而不生成文件，就会被认为已经是最新，而不会执行目标后的命令。所以如果是伪目标，就应该使用`.PHONY`声明。

```Makfile
.PHONY clean
clean:
	rm hello $(objects)
```

### 1.6 Makefile里面有什么

Makefile主要有5个东西：显示规则、隐晦规则、变量定义、文件指示、注释。
- 显示规则：说明如何生成一个或多个目标文件。由`Makefile`作者明显指出生成文件、依赖文件、生成命令。
- 隐晦规则：自动推导，可以简写生成的命令。
- 变量定义：变量一般都是字符串，就像C语言中的宏。
- 文件指示：包括三个部分，一个Makefile引用另一个Makefile；根据某些情况指定Makefile中的有效部分，就像C中的#if等预编译指令一样；还有就是定义多行命令。
- 注释：Makefile只有行注释，和Unix的Shell脚本一样，使用`#`号注释。要使用`#`号时则需要使用`\#`转义。

还需要注意所有`Makefile`中的命令必须以`Tab`开始，这应该也基本可以说是唯一的要求缩进一定使用`Tab`而不能使用空格的场景。请注意编辑器设置或者`.editorconfig`配置。

### 1.7 Makefile文件名

前面提到，GNU Make是按照`GNUmakefile` `makefile` `Makefile`的优先级顺序查找识别的。一般来说最好使用`Makefile`这个文件名，大写开头更为醒目，也用得最多。

当然也可能指定别的文件名作为`Makefile`，只需要执行时添加`-f`/`--file`/`--makefile`选项，指定文件作为参数即可同样执行。


### 1.8 引用其他Makefile

```Makefile
include <filename>
```
- 使用`include` 关键字，同C语言的`#include`很像，被包含的文件会原模原样的被放在包含的位置。
- `include`前可以有空格，但不能是`Tab`，可以同时包含多个文件，文件也可以使用变量来定义之后再进行包含，可以使用通配符。
- 一般以`.mk`作为文件后缀。

例：
```Makefile
commandfile = command.make

include *.mk hello.make $(commandfile)

.PHONY : clean
clean:
	rm hello $(objects)
```

make命令开始时就会做引用文件内容的替换，找不到文件则会报错。引用文件查找顺序：
- 绝对或相对路径的话就去该路径查找
- 不是绝对或相对路径的话在当前目录查找
- 当前目录找不到，则会在下面的目录查找：
    - 在传入`make`命令的`-I DIRECTORY, --include-dir=DIRECTORY`选项的目录中查找。
    - 目录`<prefix>/include`存在也会去查找(一般是`usr/local/include`或者`/usr/include`)。

如果有文件没有找到的话，make会生成一条警告信息，但不会马上出现致命错误。它会继续载入其它的文件，一旦完成makefile的读取，make会再重试这些没有找到，或是不能读取的文件，如果还是不行，make才会出现一条致命信息。如果你想让make不理那些无法读取的文件，而继续执行，你可以在include前加一个减号“-”。
```Makefile
-include <filename>
```

### 1.9 环境变量MAKEFILES

如果当前环境中定义了环境变量，那么make执行时就会把这个变量中的值做一个类似`include`的动作。这个变量的值就是其他`Makefile`，用空格分隔。同`include`不同的是，从这个环境变量中引入的Makefile的“目标”不会起作用，如果环境变量中定义的文件发现错误，make也会不理。

一般来说不建议使用，因为会造成所有的`Makefile`执行都收到影响，也许有时候你的Makefile出现了怪事，那么你可以看看当前环境中有没有定义这个变量。

### 1.10 Make的工作步骤

GNU Make的执行步骤：

1. 读入Makefile内容。
2. 读入被`include`的其它Makefile。
3. 初始化文件中的变量。
4. 推导隐晦规则，并分析所有规则。
5. 为所有的目标文件创建依赖关系链。
6. 根据依赖关系和时间戳，决定哪些目标要重新生成。
7. 执行生成命令。

1-5步为第一个阶段，6-7为第二个阶段。


## 2. 规则

### 2.1 规则语法

```Makefile
targets : prerequisites
	command
	...
```
或者是这样：
```Makefile
targets : prerequisites ; command
	command
	...
```

- `targets`是文件名，以空格分开，可以使用通配符。一般来说，我们的目标基本上是一个文件，但也有可能是多个文件。
- `command`是命令行，如果不与`targets : prerequisites`在一行，那么必须以`Tab`开头，如果与`targets : prerequisites`在一行，可以用`;`隔开。
- 命令太长时可以用`\`分开。
- 规则告诉make两件事：文件依赖关系和如何生成目标。
- 一般来说会以Unix标准Shell执行命令，也就是`/bin/sh`。

### 2.2 规则中使用通配符

make支持三个通配符：`*` `?` `~`

- `~`在文件名中特殊用法，与Shell中相同，表示当前用户家目录`$HOME`，如`~usrname/test`表示用户`usrname`的家目录下的`test`目录。Windows中视环境变量`$HOME`确定，比如在Git Bash中就是当前用户的用户目录`C:\Users\username`。
- `*`匹配一系列文件，比如`*.c`匹配所有`.c`后缀的源文件。如果文件名含有`*`号，那么需要使用`\*`转义，这与在Shell中一致，Windows中则不支持含`*`好的文件名。
- `$?`是一个自动变量，后续详解。

如果这样使用：
```Makefile
objects = *.o
```
那么`objects`的值就是`*.o`，最后直接用`*.o`去替换使用`$(objects)`的地方。如果需要将通配符展开，可以使用:
```Makefile
obejcts := $(wildcard *.o)
```

### 2.3 文件搜寻

在一些大的工程中，会有大量的源文件，通常会将这些源文件分类存放在不同目录中。所以当`make`寻找文件依赖关系时，可以在文件前面加上路径。但最好的方法是告诉`make`路径，让`make`自己去找。

Makefile中的特书变量`VPATH`就是完成这个功能，如果没有定义这个变量，则只会在当前目录中寻找，依赖文件和目标文件。如果定义了，那么会在当前目录找不到的情况下，到所指定的目录中去找。

```Makefile
VPATH = src:../headers
```

多个目录使用`:`分隔，当前目录永远是最高优先级最先去寻找的地方。

另一个设置文件搜索路径的方法，使用全小写的`vpath`**关键字**。作用类似于`VPATH`变量，但更为灵活，使用方法：
```Makefile
vpath <pattern> <directories>
# 为符合模式<pattern>的文件指定搜索目录<directories>

vpath <pattern>
# 清除符合模式<pattern>的文件的搜索目录

vpath
# 清除所有已被设置好了的文件搜索目录。
```

其中的`<pattern>`指定文件的模式，需要使用`%`字符。`%`的意思是匹配零或者若干字符，引用原始的`%`字符需要用`\%`转义。如`%.h`表示所有`.h`结尾的文件。`<pattern>`指定要搜索的文件集，而`<directories>`指定`<pattern>`的文件集的搜索的目录。

可以连续使用`vpath`语句指定不同的搜索策略，但是如果连续的`vpath`中出现了相同的`<pattern>`或者被重复了的`<pattern>`，那么`make`按照`vpath`语句先后顺序执行搜索。

示例：
```Makefile
vpath %.h inc
vpath %   thirdparty
vpath %.c src
```
其中`%`匹配所有文件，所以所有`.h`头文件都会先去`inc`中再去`thridparty`中找，`.c`源文件会先去`thridparty`中再去`src`中找。

### 2.4 伪目标

`clean`是经常需要在`Makefile`中定义的一个伪目标，用来清理生成的文件，以备完整的重编译。为了避免和文件重名所以需要使用`.PHONY`。

伪目标一般没有依赖文件，但是我们也可以给伪目标指定依赖文件，伪目标同样可以作为默认目标放在第一个。常见的就是需要生成多个可执行文件：
```Makefile
executable = hello world

.PHONY : all
all : $(executable)

hello : hello.c
	cc -o hello hello.c command.c
world : world.c
	cc -o world world.c
```

前面也说了，`.PHONY`不写但是没有生成`all`文件，也不会有问题，但目录下存在同名的`all`文件时就会就会被认为是已经存在了文件，显示地用`.PHONY`声明伪目标是一个好习惯。

伪目标同样可以成为依赖，如：
```Makefile
.PHONY : clean cleanobj cleanexe
clean : cleanobj cleanexe
cleanobj :
	rm *.o
cleanexe:
	rm $(executable)
```

### 2.5 多目标

Makefile规则中的目标可以有多个，有可能多个目标依赖于同一个文件，并且生成命令类似，就能够合并起来。多个目标的生成规则的执行命令不是同一个，可能会有问题，好在可以使用自动化变量`$@`来表示目标规则中所有目标的集合。

例：
```Makefile
bigoutput littleoutput : text.g
	generate text.g -$(subst output,,$@) > $@
```
等价于：
```Makefile
bigoutput : text.g
	generate text.g -big > bigoutput
littleoutput : text.g
	generate text.g -little > littleoutput
```
其中的`$(subst output,,$@)`表示执行函数`subst`，后面的为参数。关于函数后续详述。


### 2.6 静态模式

静态模式可以更加容易地定义多目标的规则，可以让我们的规则变得更加的有弹性和灵活。语法：
```Makefile
<targets ...> : <target-pattern> : <prereq-patterns ...>
	<commands>
	...
```
- `targets` 定义目标文件集合，可以有通配符。
- `target-pattern` 指明目标文件集合模式。
- `prereq-patterns` 目标的依赖模式，对`target-pattern`形成的模式再进行一次依赖目标的定义。

例如目标文件是多个`.o`集合，目标文件集合模式是`%.o`，依赖模式是`%.c`，那么就是对目标文件集合模式进行二次定义，也就是依赖文件集合是取`%.o`中所有文件去掉`.o`换为`.c`之后构成的集合。同理`%`字符本身由`\%`进行转义。

例子，还是最开始的`hello.c` `command.c`：
```Makefile
objects = hello.o command.o
executable = hello
CC = cc

$(executable) : $(objects)
	$(CC) -o $(executable) $(objects)

$(objects) : %.o : %.c
	$(CC) -c $< -o $@

.PHONY : clean
clean :
	rm $(objects) $(executable)
```

对于由`.c`生成`.o`一对一生成，且生成文件名都相同的情况，使用一个静态模式即可生成所有的对象文件，无论是几十还是几百个。

`$<`和`$@`是自动化变量，`$<`表示第一个依赖文件，`$@`表示目标集中的目标文件。

还可以配合函数对目标集做筛选过滤操作。

### 2.7 自动生成依赖

`Makefile`中依赖关系可能需要包含一系列头文件。虽然编译时没有必要将头文件放到源文件中，因为预编译时会处理文件包含，但是为了使头文件的修改反馈到`make`的重新编译上，头文件也需要加到依赖列表中（上面的例子并没有加，所以头文件改变时执行make不能重新编译）。这样添加删除了工程文件，新增头文件包含等都需要维护`Makefile`，这会是一个可维护性非常差非常繁琐的事情。为了避免这样的事情，大多数C/C++编译器都提供了一个`-M`选项，即自动寻找源文件中包含的头文件，并生成一个依赖关系。例如：
```shell
cc -M hello.c
```
就可以得到结果：
```Makefile
hello.o: hello.c command.h
```
注意要在`gcc/g++`编译器下得到上述结果，应该使用`-MM`选项，`-M`选项会连标准库中的头文件也一并列出。

如何将这个功能与`Makefile`结合起来呢？`Makefile`不应该依赖于源文件，我们应该在`Makefile`中自己根据`gcc -MM`选项做到这件事情。GNU组织建议把编译器为每一个源文件的自动生成的依赖关系放到一个文件中，为每一个 `name.c` 的文件都生成一个 `name.d` 的`Makefile`文件， `.d` 文件中就存放对应 `.c` 文件的依赖关系。

然后`%.d`依赖`%.c`，写出这个生成规则就是：
```Makefile
%.d : %.c
	@set -e; rm -rf $@;\
	$(CC) -M $< > $@.$$$$;\
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
```

- `@set -e` 表示后续命令只要有执行失败就退出。
- `rm -rf $@` 表示生成每个目标时先删除原来的`.d`文件。
- 然后使用`cc -M`生成依赖，重定向到`name.d.XXXX`中，`$$$$`意为一个编号，类似`name.d.1234`。
- 调用`sed`命令对`name.d.XXXX`做了一个字符串操作，结果保存在`name.d`中。
- 最后删除临时文件。

`sed`命令执行后将生成的依赖文件：
```Makefile
hello.o : hello.c command.h
```
添加了`.d`文件的目标：
```Makefile
hello.o hello.d : hello.c command.h
```
就可以同步更新`.d`文件了。接下来将生成的规则`include`到主`Makefile`中:
```Makefile
soruces = hello.c command.c
include $(soruces:.c=.d)
```

`$(soruces:.c=.d)`表示将`$(sources)`中的所有`.c`字符串替换为`.d`。如果`include`在开头，因为`include`是按照默认顺序的，那么第一个就会变成默认目标。

最终例子，3个源文件`hello.c` `command.h` `command.c`，`hello.c`包含了`command.h`:
```Makefile
sources = $(wildcard *.c)
objects = $(sources:.c=.o)
executable = hello
CC = cc

$(executable) : $(objects)
	$(CC) -o $(executable) $(objects)

include $(sources:.c=.d)

%.d : %.c
	@set -e; rm -rf $@;\
	$(CC) -MM $< > $@.$$$$;\
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

.PHONY : clean
clean :
	rm $(objects) $(executable) *.d
```

可以看到`include`同样会造成依赖，然后就会执行`.d`文件的生成规则。上述例子的Makefile大概就可以解决同目录下大量C源文件生成一个可执行文件的编译问题了。

## 3. 命令

生成命令的书写规则与Shell命令行行为一致，`make`会按照顺序一条一条执行。每条命令必须以`Tab`开头，除非命令紧跟在命令规则的`;`后。命令行之间的空格或者空行会被忽略，如果这个空格或者空行以`Tab`开头就会被认为是一个空命令。

### 3.1 显示命令

通常，make会把要执行的命令显示在屏幕上，当用`@`放在命令前时，则不会显示出来。
比如生成依赖文件时
```Makefile
%.d : %.c
	@echo 正在生成依赖文件 $@
	@set -e; rm -rf $@;\
	$(CC) -MM $< > $@
```
将会在生成每个依赖文件是显示，如果不加`@`，那么执行的命令本身就会被显示出来。生成正在编译的信息时很常用。

如果执行`make`时制定了`-n, --just-print, --dry-run, --recon`选项，那么就只是显示命令，但不会执行命令，这个功能很有利于我们调试我们的Makefile，看看我们书写的命令是执行起来是什么样子的或是什么顺序的。

而`make`选项 `-s` 或 `--silent` 或 `--quiet` 则是全面禁止命令的显示。

### 3.2 命令执行

当依赖文件新于目标时，目标就需要被更新，`make`会一条条执行后面的命令。如果希望前一条命令的结果作用于第二条命令时，也就是第二条在第一条基础上运行，需要用`;`分隔这两条命令。

如第一条是`cd`切换了目录：
```Makefile
.PHONY : test
test :
	cd ~
	pwd
```
此时`pwd`得到的目录还是`Makefile`所在目录。

修改后：
```Makefile
.PHONY : test
test :
	@cd ~;pwd
```
则能够得到当前用户家目录。并且用`;`分隔之后加`@`就只需要在第一个命令前写一次，就可以作用于所有命令。

`make`一般使用环境变量`$SHELL`所定义的系统Shell来执行命令，我的Linux环境中默认情况是`/bin/bash`。MS-DOS中则比较特殊，如果`$SHELL`找不到，则会在当前目录和环境变量中去找，并且会添加`.exe` `.com` `.bat`等可执行文件后缀去找。

### 3.3 命令出错

命令执行完后`make`会检查命令返回码，0代表成功，非零代表出错，如果成功则会执行下一条，失败则会终止当前规则执行，这有可能终止所有规则执行。

有些时候可能命令失败对规则执行并不影响，比如`mkdir`已经存在目录时失败。就可以在命令前加一个`-`号标记命令无论出不出错都算执行成功，都继续往下执行。

```Makefile
clean:
	-rm -f *.o
```

另外还有全局方法：给`make`加上 `-i` 或是 `--ignore-errors` 参数，那么，Makefile中所有命令都会忽略错误。如果一个规则是以 `.IGNORE` 作为目标的，那么这个规则中的所有命令将会忽略错误。这些是不同级别的防止命令出错的方法，你可以根据你的不同喜欢设置。

```Makefile
.PHONY .IGNORE : clean
clean :
	-rm $(objects) $(executable) *.d
	rm hello.d
	rm world.d
```

还有一个选项 `-k` 或是 `--keep-going` ，这个参数的意思是，如果某规则中的命令出错了，那么就终止该规则的执行，但继续执行其它规则。

### 3.4 嵌套执行make

在大的工程里面，不同的模块或者不同功能的源码会放在不同目录中，可以在每个目录中编写该目录的Makefile，这有利于使Makefile变得简洁，所有东西都写在一起的话，会很难维护。例如有一个子目录`subdir`，那么执行这个目录下的Makefile就可以这样写：
```Makefile
.PHONY : world
world :
	@cd ./world && $(MAKE)
```
等价于：
```Makefile
.PHONY : world
world :
	@cd $(MAKE) -C ./world
```

变量`$(MAKE)`表示当前`Makefile`执行时的`make`命令行，也可以在当前`Makefile`重新定义，也许需要一些参数，使用变量更易维护。

最顶层的Makefile称作总控Makefile，总控Makefile的变量可以传递到下级的Makefile中，但不会覆盖下层定义的变量，除非指定了`-e, --environment-overrides`参数。

要传递变量或者不想传递变量到下层可以这样写：
```Makefile
export <variable ...>;
unexport <variable ...>;

# 例
export variable = value

variable = value
export variable

export variable := value

variable := value
export variable
```

注意两个变量，`$SHELL`和`$MAKEFLAGS`，这两个无论是否`export`，总是传递到下层。`MAKEFALGS`中包含了`make`的参数信息，执行时给了参数或者在上层定义了这个变量，那么就会传递到下层，这是一个系统级的系统变量。如果你定义了`MAKEFLAGS`，请确保是下层都会使用的，不然可能会有意想不到的问题。

如果使用了`-w`或`--print-directory`选项，那么进入子目录时会打印，退出是也会打印，这个选项默认开启，如果使用了`-s`或`--no-print-directory`选项，那么则会关闭。
```
make[1]: Entering directory '/home/tch/LearnMake/started/world'
gcc    -c -o world.o world.c
gcc -o world world.o
make[1]: Leaving directory '/home/tch/LearnMake/started/world'
```

系统变量`$(MAKELEVEL)`表示嵌套的调用层数，顶层`Makefile`其值为0，每向下调用一层就加1。

### 3.5 命令包

语法：
```Makefile
define generateDependency
@set -e; rm -rf $@;\
$(CC) -MM $< > $@
endef

%.d : %.c
	$(generateDependency)
```

使用`define`和`endef`将多条命令包起来即可，调用时使用`$(youCmdPakName)`。


## 4. 变量

在Makefile中定义变量，就像在C中定义宏一样，在执行时会自动替换为展开为表示的字符串，与宏不同的是，你可以在Makefile中修改变量的值。变量可以使用在目标、依赖、命令或者其他部分中。

变量命名：可以包含字符、数字、下划线，可以是数字开头，不能有其他字符，大小写敏感，推荐使用大小写搭配的驼峰法来命名。


### 4.1 使用变量

声明时要给予初值，使用时前面需要加上`$`，最好用小括号`()`或者大括号`{}`将变量名包起来，使用`$`字符本身则需要使用`$$`转义。

变量可以用于目标、依赖、命令中等，会像宏一样精确展开。
```Makefile
objects = program.o foo.o utils.o
program : $(objects)
	cc -o program $(objects)

$(objects) : defs.h
```

给变量加上括号`()` `{}`是为了安全地使用它。

### 4.2 变量中的变量

可以用变量的值来初始化其他变量，变量可以使用后面的变量来定义：
```Makefile
var1 = $(var2)
var2 = hello

.PHONY : test
test :
	echo $(var1)
```

这个功能有好的地方，就是我们可以把真实的变量值推到后面来定义。不好的地方就是可能造成递归定义：
```Makefile
A = $(B)
B = $(A)
```
make会检测出这种递归定义并报错。

为了避免递归定义，可以使用另一个种方式：`:=`操作符。
```Makefile
x := test
y := $(x) bar
x := lter
```
这里的结果`x`是`test bar`。

使用`:=`操作符定义的变量只能使用前面已经定义好的变量，如果前面没有定义，那么对应的值就是空的。

注意定义变量时从第一个有效字符开始后面的所有空格也会算在变量中。如果是定义目录之类的变量，后续要进行拼接的话需要额外注意：
```Makefile
pwd = $(shell pwd)    # four spaces ahead
subdir = $(pwd)/subdir
```
则得到的`$(subdir)`中会包含四个空格。

还有一个操作符：`?=` 表示如果前面有定义过该变量就什么也不做，没有定义过则定义它。
```Makefile
var ?= val
```

注意使用没有定义的变量不会报错，只是它的的值是空的，定义了变量没有显示赋值它也是空的，可以使用一个空变量来**定义一个空格**：
```Makefile
foo = 
space = $(foo) # a space ahead
```

### 4.3 高级用法

变量值的替换，前面也有用到：
```Makefile
sources = a.c b.c
objects = $(sources:.c=.o)
```

变量值的替换也可以使用静态模式：
```Makefile
sources = a.c b.c
objects = $(sources:%.c=%.o)
```

另一种是把变量值再当成一个变量：
```Makefile
z = hello
x = y
y = z
a := $($($(x)))
```
这种方式中可以使用多个变量来组合成另一个变量的名字，也可以把这种组合放到`=`左边，因为本质其实就是字符串替换。


### 4.4 追加变量值

使用`+=`运算符给变量追加值。
```Makefile
variable := value
variable += more
```
等价于：
```Makefile
variable := value
variable := $(variable) more
```

如果变量之前没有定义过，那么`+=`自动变成`=`，如果定义过，那么`+=`的操作符就继承于上一次赋值的操作符：`=`或者`:=`。中间会加一个空格，不能用这种方式拼接路径。

例：
```Makefile
sources = $(wildcard *.c)
testSrc = $(wildcard test/*.c)
sources += testSrc
```
则`sources`的值是当前目录和`test`目录下所有`.c`源文件。


### 4.5 override指示符

如果有变量是使用`make`命令行参数设置的，那么Makefile中对其的赋值会被忽略，如果要在Makefile中对其赋值，需要使用`override`关键字。

```Makefile
override <var> = <val>
override <var> := <val>
override <var> += <val>
```

多行变量定义`define`前也可以加`override`：
```Makefile
override define var
val
endef
```

### 4.6 多行变量

可以使用`define`和`endef`来定义多行变量：
```Makefile
define two-lines
echo foo
echo $(bar)
endef
```

### 4.7 环境变量

make运行时的系统环境变量会在make开始运行时被载入到Makefile中，如果Makefile中已经定义了这个变量，或者这个变量由make命令行带入，那么系统变量的值会被覆盖。

如果make执行时指定了`-e, --environment-overrides`选项，那么系统变量会覆盖Makefile中定义变量。

当make嵌套调用时，上层Makefile中定义的变量会以系统变量的方式传递到下层的Makefile中。当然，默认情况下只有通过命令行设置的变量会出传递，定义在文件中的变量需要传递则需要使用`export`声明。

并不推荐把太多变量定义在环境中，执行环境变了或者执行不同Makefile都可能出问题。

### 4.8 目标变量

前面定义的变量都类似于全局变量，在整个文件中都可以访问。当然也可以定义针对特定目标的变量，称之为"Target-specific Variable"，可以和全局变量同名，因为在规则中会覆盖全局变量定义，其值只在定义的规则及其下的连带规则中有效。

语法，当然后者是针对需要覆盖的make命令行带入的变量，或是系统环境变量。
```Makefile
<target> : var = XXX
<target> : override var = XXX
```

例：
```Makefile
prog : CFLAGS = -g
prog : prog.o foo.o bar.o
	$(CC) $(CFLAGS) prog.o foo.o bar.o

prog.o : prog.c
	$(CC) $(CFLAGS) prog.c

foo.o : foo.c
	$(CC) $(CFLAGS) foo.c

bar.o : bar.c
	$(CC) $(CFLAGS) bar.c
```
上述例子中，在所有由prog目标引发的规则中`$(CFLAGS)`都是`-g`。


### 4.9 模式变量

GNU make中还支持模式变量（Pattern-specific Variable），也就是针对特定模式指定变量，和文件搜寻`vpath`有点类似。

```Makefile
%.o : CFLAGS = -O
```
含义是针对所有`.o`文件为目标的规则，`$(CFLAGS)`值为`-O`。

语法：
```Makefile
<pattern ...> : var = XXX
<pattern ...> : override var = XXX
```

## 5. 使用条件判断

语法：
```Makefile
<conditional-directive>
<text-if-true>
endif
```
或者
```Makefile
<conditional-directive>
<text-if-true>
else
<text-if-false>
endif
```

其中表条件的指令可以是：
- `ifeq` 判等
- `ifneq` 判不等
- `ifdef` 条件定义判断变量是否定义
- `ifndef` 条件定义判断变量是否未定义

`ifeq`和`ifneq`语法：
```Makefile
ifneq (<arg1>, <arg2>)
ifeq '<arg1>' '<arg2>'
```
用引号包起来的话可以用单引号`'`可以用双引号`"`，无要求。

`ifdef`和`ifndef`语法：
```Makefile
ifdef <variable-name>
```
注意`ifdef`含义其实是判断**是否非空**，因为使用一个没有定义的变量不会报错，只是变量值是空的。那么一个定义为空的变量和没有定义就是一样的。

```Makefile
foo = 
ifdef foo
	foodef = yes
else
	foodef = no
endif
```
得到的值是`no`。如果变量有值，就算是一个空格，条件也会为真。

值得注意的是make是在**读取Makefile时就计算条件表达式的值**，并根据条件的值来选择语句，所以最好不要把自动化变量如`$<` `$^` `$@`等放在条件表达式中，自动化变量要运行时才能确定。

## 6. 函数

make支持的函数不多，但足够使用。函数调用后，返回值可以作为变量来用。函数调用都不修改参数，将结果作为返回值返回。

### 6.1 函数调用语法

```Makefile
$(<func> <args>)
${<func> <args>}
```
函数名与参数之间用空格分隔，多个参数之间用逗号`,`分隔。

**注意**：如果在参数与逗号之间添加了空格，空格也会被算到参数中。一般来说不要在参数列表中加空格。

示例：
```Makefile
comma := ,
empty := 
space := $(empty) $(empty)
foo = a b c
bar = $(subst $(space),$(comma),$(foo))
```
其中`subst`接受三个参数，将最后一个参数中出现的第一个参数值全部替换为第二个，结果是`a,b,c`。


### 6.2 字符串处理函数

术语及共识：
- 字符串：即一个变量表示的字符串或者就是能够用来初始化一个变量的字符串。
- 单词：字符串内部被空格、Tab、回车、换行隔开来的一个个单词。
- 模式：可以有通配符`%`表任意字符串，也可以是单词用来精确匹配。
- 多个模式间可以用空格分隔。
- 字符串的值是大小写敏感的。

#### subst

```Makefile
$(subst <from>,<to>,<text>)
```
将 `text` 中所有 `from` 子串替换为 `to`，返回替换后的字符串。

#### patsubst

```Makefile
$(patsubst <pattern>,<replacement>,<text>)
```

模式字符串替换函数，查找 `<text>` 中的单词（单词以“空格”、“Tab”或“回车”“换行”分隔）是否符合模式 `<pattern>` ，如果匹配的话，则以 `<replacement>` 替换。返回替换后字符串。

这里的`<pattern>`可以包含通配符`%`，表示任意长度字串。如果`<replacement>`也包含`%`，那么它就是`<pattern>`中的那个`%`代表字符串。`%`字符使用`\%`转义。

前面提到的`$(var:<pattern>=<replacement>)`其实就是`$(patsubst <pattern>,<replacement>,$(var))`，而`$(var: <suffix>=<replacement>)`就相当于`$(patsubst %<suffix>,%<replacement>,$(var))`。

例，这三个例子是等价的：
```Makefile
foo = a.c b.c c.c
bar = $(patsubst %.o,%.c,$(foo))
bar = $(foo:.c=.o)
bar = $(foo:%.o=%.o)
```

#### strip

```Makefile
$(strip <string>)
```

去掉`<string>`两端的空字符，返回结果。

#### findstring

```Makefile
$(findstring <find>,<in>)
```
在`<in>`中查找`<find>`，找到则返回`<find>`，否则返回空字符串。

#### filter

```Makefile
$(filter <pattern...>,<text>)
```
以 `<pattern>` 模式过滤 `<text>` 字符串中的单词，保留符合模式 `<pattern>` 的单词。可以有多个模式，用空格分隔。

例：
```Makefile
sources := foo.c bar.c baz.s ugh.h
filterRes := $(filter %.c %.s,$(sources)) # foo.c bar.c baz.s
```

#### filter-out

```Makefile
$(filter-out <pattern...>,<text>)
```
`filter`结果的补集，去除符合模式 `<pattern>` 的单词，可以有多个模式，用空格分隔。模式不一定非得有通配符，可以是具体的单词的集合。

#### sort

```Makefile
$(sort <list>)
```
将`<list>`中的单词升序排列，会去掉重复单词，字符串大小写敏感，比较依据当然是ASCII码值。

#### word

```Makefile
$(word <n>,<text>)
```
取字符串 `<text>` 中第 `<n>` 个单词。从`1`开始，超过了最大单词数返回空字符串。

#### wordlist

```Makefile
$(wordlist <ss>,<e>,<text>)
```

从字符串 `<text>` 中取从 `<ss>` 开始到 `<e>` (闭区间)的单词串， `<ss>` 和 `<e>` 是一个数字。单词之间的空字符会被保留，比如多个空格，结果字符串前后空字符不会保留。

#### words

```Makefile
$(words <text>)
```
统计 `<text>` 中字符串中的单词个数。

例，取字符中最后一个单词：
```Makefile
$(word $(words <text>),<text>)
```

#### firstword

```Makefile
$(firstword <text>)
```

取字符串 `<text>` 中的第一个单词。等价于`$(word 1,<text>)`。

#### 例子

例：make使用`VPATH`变量指定依赖文件搜索路径，路径用`:`分割，可以利用这个变量来指定编译器对头文件的搜索路径：
```Makefile
override CFLAGS += $(patsubst %,-I%,$(subst :, ,$(VPATH)))
```


### 6.3 文件名操作函数

下面的函数主要是处理文件名的。每个函数的参数字符串都会被当做一个或是一系列的文件名来对待。

#### dir

```Makefile
$(dir <names...>)
```

从文件名序列 `<names>` 中取出目录部分。目录部分是指最后一个斜杠 `/` 之前的部分。如果没有反斜杠，那么返回 `./`

例：`$(dir src/src.c test/ bar.c)`结果是`src/ test/ ./`。

#### notdir

```Makefile

```
从文件名序列 `<names>` 中取出非目录部分。非目录部分是指最後一个反斜杠 `/` 之后的部分，没有非目录部分则为空。

例：`echo $(notdir src/src.c test/ bar.c)`返回`src.c bar.c`。

#### suffix

```Makefile
$(suffix <names...>)
```
从文件名序列 `<names>` 中取出各个文件名的后缀，没有后缀或者为目录则为空。

#### basename

```Makefile
$(basename <names...>)
```
从文件名序列 `<names>` 中取出各个文件名的前缀部分，没有前缀返回目录，没有目录返回空。

#### addsuffix

```Makefile
$(addsuffix <suffix>,<names...>)
```

把后缀 `<suffix>` 加到 `<names>` 中的每个单词后面。

#### addprefix

```Makefile
$(addprefix <prefix>,<names...>)
```

把前缀 `<prefix>` 加到 `<names>` 中的每个单词后面。

#### join

```Makefile
$(join <list1>,<list2>)
```

把 `<list2>` 中的单词对应地加到 `<list1>` 的单词后面。`<list1>` 更长的话多出来的保持不变，`<list2>`更长的话，扩展 `<list1>`，`<list2>` 中多出来的单词被复制到对应位置。返回结果`<list1>`。

### 6.4 foreach函数

毫无疑问`foreach`是用来循环的。Makefile中的`foreach`几乎就是仿照Unix标准Shell中的`for`语句。语法：
```Makefile
$(foreach <var>,<list>,<text>)
```

将`<list>`中的单词取出来放到`<var>`中，然后执行`<text>` 包含的表达式，每一次`<text>`会得到一个字符串，最终结果就是每次循环得到的结果用空格分隔之后的整个字符串。

也就是循环遍历列表`<list>`，循环变量是`<var>`，然后对每个变量执行操作`<text>`，由每轮循环结果组成最终结果。`<text>`中一般会使用定义的变量`<var>`。

`foreach`中定义的变量只是一个临时变量，像C++的循环一样，作用域只在`foreach`内部。

例：给多个文件名排列组合添加多个后缀。
```Makefile
foo = .a .b .c
bar = test src inc
res = $(foreach name,$(bar),$(foreach ext,$(foo),$(name)$(ext)))
```

### 6.5 if函数

`if` 语句很像`ifeq`，只是语法有不同：
```Makefile
$(if <condition>,<then-part>)
```
或者
```Makefile
$(if <condition>,<then-part>,<else-part>)
```

只是将条件语句用一个函数的形式表达。其中的条件`<condition>`如果返回非空字符串，那么相当于返回真，如果是空串则是假。返回值为`condition`对应的语句的执行结果，如果`<condition>`为空，又没有`<else-part>`那么返回空。

当然`<then-part>`和`<else-part>`只会有一个被计算。

### 6.6 call函数

call函数是唯一一个可以用来创建新的参数化的函数。你可以写一个非常复杂的表达式，这个表达式中，你可以定义许多参数，然后你可以call函数来向这个表达式传递参数。

当make执行这个函数时， `<expression>` 参数中的变量，如 `$(1)` 、 `$(2)` 等，会被参数 `<parm1>` 、 `<parm2>` 、 `<parm3>` 依次取代。而 `<expression>` 的返回值就是 `call` 函数的返回值。

例：反转参数1和2。
```Makefile
reverse = $(2) $(1)
foo = $(call reverse,a,b)
```

函数其实也是一个变量，参数中`$(0)`表示了函数名称。需要注意`call`调用中第二个及以后的参数中的空格会被保留，就像所有函数调用那样。最好的方式是`,`之间不要添加空格。

### 6.7 origin函数

```Makefile
$(origin <variable>)
```
注意， `<variable>` 是变量的名字，不应该是变量引用。所以你最好不要在 `<variable>` 中使用 `$` 字符。

`origin`函数不操作变量的值，只是返回这个变量的来源，一个字符串。可能结果如下：

|结果|含义|
|:-|:-|
|`undefined`|从来没有定义过|
|`default`|默认的定义，比如`CC`这个变量|
|`environment`|环境变量，并且当Makefile被执行时， `-e` 参数没有被打开|
|`file`|定义在Makefile中|
|`command line`|被命令行定义的|
|`override`|被`override`指示符重新定义的|
|`automatic`|命令运行中的自动化变量|

函数参数`$(1)`或者`foreach`中的临时变量都是自动化变量。


### 6.8 shell函数

参数就是操作系统Shell的命令，把执行操作系统命令后的输出作为函数返回。

```Makefile
curDir = $(shell pwd)
```

`shell`函数会新生成一个Shell来执行命令，所以需要注意性能，如果定义了复杂规则并大量使用了`shell`函数，那么可能会有性能问题。

### 6.9 error & warning

make提供了`error`函数来控制make的运行，你需要检测一些运行Makefile时的运行时信息，并且根据这些信息来决定，你是让make继续执行，还是停止。

```Makefile
$(error <text ...>)
```
`error`函数产生一个致命错误，参数是信息。不会一开始就产生，所以可以定义定义在一个变量中，后续的脚本中来使用这个变量。

```Makefile
$(warning <text ...>)
```
而`warning`函数不会退出，只是输出警告信息，而make继续执行。

## 7. make的运行

一般来说直接键入`make`就可以执行默认目标，但有些时候可能只需要编译部分文件，Makefile定义了多套编译规则需要选择等。这里介绍如何使用make命令。

### 7.1 退出码

- 0 表示成功执行
- 1 运行时出现错误
- 2 使用了`-q`选项，并且make使得一些目标不需要更新，那么返回2

### 7.2 指定Makefile

`-f FILE, --file=FILE, --makefile=FILE`参数，多次指定的话会连在一起传递给make执行。

### 7.3 指定目标

在执行make时指定终极目标，如果不指定则会是第一个目标。有一个make的环境变量叫 `MAKECMDGOALS` ，这个变量中会存放你所指定的终极目标的列表，如果在命令行上，你没有指定目标，那么，这个变量是空值。

GNU的开源软件发布时，Makefile中都包含了如下目标，包含了编译、安装、打包等功能，可以参照来写我们自己的Makefile的目标以显得更专业：

- `all`:这个伪目标是所有目标的目标，其功能一般是编译所有的目标。
- `clean`:这个伪目标功能是删除所有被make创建的文件。
- `install`:这个伪目标功能是安装已编译好的程序，其实就是把目标执行文件拷贝到指定的目标中去。
- `print`:这个伪目标的功能是列出改变过的源文件。
- `tar`:这个伪目标功能是把源程序打包备份。也就是一个tar文件。
- `dist`:这个伪目标功能是创建一个压缩文件，一般是把tar文件压成Z文件。或是gz文件。
- `TAGS`:这个伪目标功能是更新所有的目标，以备完整地重编译使用。
- `check`和`test`:这两个伪目标一般用来测试makefile的流程。

也不必刻板遵循，只是一种软件工程实践，作为了解。

### 7.4 检查规则

有时候，并不想规则执行起来，只想检查一下命令，或者执行序列，可以使用如下参数：

- `-n`, `--just-print`, `--dry-run`, `--recon` 不执行参数，只打印命令，不管命令是否更新，把规则和连带规则下的命令打印出来，但不执行。用于调试Makefile。
- `-t`, `--touch`，没有目标的话touch一个空文件出来，有目标的话只更新时间戳而不重新按照规则生成。也就是假装编译了目标，把目标更新到最新状态，但其实并没有真正地编译目标。
- `-q`, `--question` 如果目标存在，那么其什么也不会输出，当然也不会执行编译，如果目标不存在，其会打印出一条出错信息。
- `-W <file>, --what-if=<file>, --assume-new=<file>, --new-file=<file>` 这个参数需要指定一个文件。一般是是源文件（或依赖文件），Make会根据规则推导来运行依赖于这个文件的命令，一般来说，可以和“-n”参数一同使用，来查看这个依赖文件所发生的规则命令。

常用的选项还有很多：`-e` `-f` `-f` `-i` `-I` `-k` `-r` `-s` `-w`可查看手册和帮助了解更多，具体使用时再详细了解。

## 8. 隐含规则

“隐含规则”(隐含规则)也就是一种惯例，make会按照这种“惯例”心照不喧地来运行，那怕我们的Makefile中没有书写这样的规则。

例如由`.c`生成`.o`。

“隐含规则”会使用一些我们系统变量，我们可以改变这些系统变量的值来定制隐含规则的运行时的参数。如系统变量 CFLAGS 可以控制编译时的编译器参数。

使用“模式规则”会更加得智能和清楚，但“后缀规则”可以用来保证我们Makefile的兼容性。有时候“隐含规则”也会给我们造成不小的麻烦，所以需要搞清楚。



### 8.1 使用隐含规则

如果要使用隐含规则生成你需要的目标，你所需要做的就是不要写出这个目标的规则。make会试图去自动推导产生这个目标的规则和命令，如果 make可以自动推导生成这个目标的规则和命令，那么这个行为就是隐含规则的自动推导。

make会在自己的“隐含规则”库中寻找可以用的规则，如果找到，那么就会使用。如果找不到，那么就会报错。

make和我们约定好了用C编译器 `cc` 生成 `.o` 文件的规则，这就是隐含规则。
```Makefile
foo.o : foo.c
	cc –c foo.c $(CFLAGS)
```
当然，如果我们为 .o 文件书写了自己的规则，那么make就不会自动推导并调用隐含规则，它会按照我们写好的规则忠实地执行。

还有，在make的“隐含规则库”中，每一条隐含规则都在库中有其顺序，越靠前的则是越被经常使用的，所以，这会导致我们有些时候即使我们显示地指定了目标依赖，make也不会管。

如果确实不希望任何隐含规则推导，那么，就不要只写出“依赖规则”，而要把生成命令一并写出来。

### 8.2 隐含规则一览

使用`-r, --no-builtin-rules`选项来取消所有预设值的隐含规则。当然，即使指定了`-r`还是会有一些隐含规则生效，因为许多隐含规则都是使用了“后缀规则”来定义的。

常用隐含规则：
1. 编译C程序的隐含规则。
`<n>.o` 的目标的依赖目标会自动推导为 `<n>.c` ，并且其生成命令是 `$(CC) –c $(CPPFLAGS) $(CFLAGS)`。
2. 编译C++程序的隐含规则。
`<n>.o` 的目标的依赖目标会自动推导为 `<n>.cc` 或是 `<n>.C` (那`.cpp`呢？)，并且其生成命令是 `$(CXX) –c $(CPPFLAGS) $(CFLAGS)` 。（建议使用 `.cc` 作为C++源文件的后缀，而不是 `.C` ）
3. 编译Pascal程序的隐含规则。
`<n>.o` 的目标的依赖目标会自动推导为 `<n>.p` ，并且其生成命令是 `$(PC) –c  $(PFLAGS)` 
4. 编译Fortran/Ratfor程序的隐含规则。
`<n>.o` 的目标的依赖目标会自动推导为 `<n>.r` 或 `<n>.F` 或 `<n>.f` ，并且其生成命令是:
    - `.f` `$(FC) –c  $(FFLAGS)`
    - `.F` `$(FC) –c  $(FFLAGS) $(CPPFLAGS)`
    - `.f` `$(FC) –c  $(FFLAGS) $(RFLAGS)`
5. 预处理Fortran/Ratfor程序的隐含规则。
`<n>.f` 的目标的依赖目标会自动推导为 `<n>.r` 或 `<n>.F` 。这个规则只是转换 Ratfor 或有预处理的Fortran程序到一个标准的Fortran程序。其使用的命令是：
    - `.F` `$(FC) –F $(CPPFLAGS) $(FFLAGS)`
    - `.r` `$(FC) –F $(FFLAGS) $(RFLAGS)`
6. 编译Modula-2程序的隐含规则。
`<n>.sym` 的目标的依赖目标会自动推导为 `<n>.def` ，并且其生成命令是： `$(M2C) $(M2FLAGS) $(DEFFLAGS)` 。 `<n>.o` 的目标的依赖目标会自动推导为 `<n>.mod` ，并且其生成命令是： `$(M2C) $(M2FLAGS) $(MODFLAGS)` 。
7. 汇编和汇编预处理的隐含规则。
`<n>.o` 的目标的依赖目标会自动推导为 `<n>.s` ，默认使用编译器 `as` ，并且其生成命令是： $ `(AS) $(ASFLAGS)` 。 `<n>.s` 的目标的依赖目标会自动推导为 `<n>.S` ，默认使用C预编译器 `cpp` ，并且其生成命令是： `$(AS) $(ASFLAGS)` 。
8. 链接Object文件的隐含规则。
`<n>` 目标依赖于 `<n>.o` ，通过运行C的编译器来运行链接程序生成（一般是 `ld` ），其生成命令是： `$(CC) $(LDFLAGS) <n>.o $(LOADLIBES) $(LDLIBS)` 。这个规则对于只有一个源文件的工程有效，同时也对多个Object文件（由不同的源文件生成）的也有效。
9. Yacc C程序时的隐含规则。
`<n>.c` 的依赖文件被自动推导为 `n.y` （Yacc生成的文件），其生成命令是： `$(YACC) $(YFALGS)` 。（“Yacc”是一个语法分析器，关于其细节请查看相关资料）
10. Lex C程序时的隐含规则。
`<n>.c` 的依赖文件被自动推导为 `n.l` （Lex生成的文件），其生成命令是： `$(LEX) $(LFALGS)` 。（关于“Lex”的细节请查看相关资料）
11. Lex Ratfor程序时的隐含规则。
`<n>.r` 的依赖文件被自动推导为 `n.l` （Lex生成的文件），其生成命令是： `$(LEX) $(LFALGS)` 。
12. 从C程序、Yacc文件或Lex文件创建Lint库的隐含规则。
`<n>.ln` （lint生成的文件）的依赖文件被自动推导为 `n.c` ，其生成命令是： `$(LINT) $(LINTFALGS) $(CPPFLAGS) -i` 。对于 `<n>.y` 和 `<n>.l` 也是同样的规则。

Pascal/Fortran/Rational Fortran/Modula-2语言，Yacc和Lex，Lint相关的程序目前没用过可以不用管，知道基本的C/C++编译、汇编、链接规则即可。重点关注1,2,7,8条。

### 8.3 隐含规则中的变量

隐含规则中都使用了预先定义的变量，可以在Makefile中改变这些值，或者在make命令行传入这些值。无论如何，只要设置了就对隐含规则起作用。可以使用make的`-R, --no-builtin-variables`选项来取消文件中定义变量对隐含规则的作用。

隐含规则使用的变量有两种，命令相关和规则相关。

#### 命令相关变量

- `AR` : 函数库打包程序。默认命令是 `ar`
- `AS` : 汇编语言编译程序。默认命令是 `as`
- `CC` : C语言编译程序。默认命令是 `cc`
- `CXX` : C++语言编译程序。默认命令是 `g++`
- `CO` : 从 RCS文件中扩展文件程序。默认命令是 `co`
- `CPP` : C程序的预处理器（输出是标准输出设备）。默认命令是 `$(CC) –E`
- `FC` : Fortran 和 Ratfor 的编译器和预处理程序。默认命令是 `f77`
- `GET` : 从SCCS文件中扩展文件的程序。默认命令是 `get`
- `LEX` : Lex方法分析器程序（针对于C或Ratfor）。默认命令是 `lex`
- `PC` : Pascal语言编译程序。默认命令是 `pc`
- `YACC` : Yacc文法分析器（针对于C程序）。默认命令是 `yacc`
- `YACCR` : Yacc文法分析器（针对于Ratfor程序）。默认命令是 `yacc –r`
- `MAKEINFO` : 转换Texinfo源文件（.texi）到Info文件程序。默认命令是 `makeinfo`
- `TEX` : 从TeX源文件创建TeX DVI文件的程序。默认命令是 `tex`
- `TEXI2DVI` : 从Texinfo源文件创建军TeX DVI 文件的程序。默认命令是 `texi2dvi`
- `WEAVE` : 转换Web到TeX的程序。默认命令是 `weave`
- `CWEAVE` : 转换C Web 到 TeX的程序。默认命令是 `cweave`
- `TANGLE` : 转换Web到Pascal语言的程序。默认命令是 `tangle`
- `CTANGLE` : 转换C Web 到 C。默认命令是 `ctangle`
- `RM` : 删除文件命令。默认命令是 `rm –f`

#### 参数相关变量

下面的这些变量都是相关上面的命令的参数。如果没有指明其默认值，那么其默认值都是空。

- `ARFLAGS` : 函数库打包程序AR命令的参数。默认值是 `rv`
- `ASFLAGS` : 汇编语言编译器参数。（当明显地调用 `.s` 或 `.S` 文件时）
- `CFLAGS` : C语言编译器参数。
- `CXXFLAGS` : C++语言编译器参数。
- `COFLAGS` : RCS命令参数。
- `CPPFLAGS` : C预处理器参数。（ C 和 Fortran 编译器也会用到）。
- `FFLAGS` : Fortran语言编译器参数。
- `GFLAGS` : SCCS “get”程序参数。
- `LDFLAGS` : 链接器参数。（如： `ld` ）
- `LFLAGS` : Lex文法分析器参数。
- `PFLAGS` : Pascal语言编译器参数。
- `RFLAGS` : Ratfor 程序的Fortran 编译器参数。
- `YFLAGS` : Yacc文法分析器参数。

### 8.4 隐含规则链

有的时候一个目标可能被一系列规则作用，比如`.o`可能先由Yacc的`.y`生成`.c`，再被C编译器生成。这一系列隐含规则称为隐含规则链。

上面例子中的`.c`叫做中间目标，对于中间目标，make会努力自动推导，但和一般目标有两个不同：
- 除非中间目标不存在，才会引发中间规则。
- 只要最终目标成功生成，那么在产生过程中，所产生的中间目标会被`rm -f`删除。

通常，一个Makefile指定为目标或者依赖目标的文件不能作为中介，但是可以使用`.INTERMEDIATE : target`强制声明一个目标是中介，然后将其放在依赖中就可以执行隐式规则。

可以阻止make删除中间目标，只需要使用`.SECONDARY : sec`来声明，或者使用模式声明`.PRECIOUS : %.o`。

隐含规则链中会禁止一个目标出现两次，为了防止无限递归。

### 8.5 定义模式规则

可以使用模式规则来定义一个自己的隐含规则。模式规则和一般的区别就是，目标的定义需要有`%`字符，依赖中同样可以有`%`，其值就是目标中`%`代表的值。

值得注意的是：`%`的展开在运行时，不像变量和函数的展开在载入Makefile时。

#### 模式规则

目标中`%`表任意长的字符串，用来匹配文件名，如`%.c`表示`.c`后缀的文件(文件名至少三个字符长)，`s.%.c`表示`s.`开头`.c`结尾的文件(至少5个字符)。

例，将`.c`编译为`.o`的规则(其实前面介绍过)
```Makefile
%.o : %.c
	%(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
```
#### 自动化变量

自动化变量，就是这种变量会把模式中所定义的一系列的文件自动地挨个取出，直至所有的符合模式的文件都取完了。这种自动化变量只应出现在规则的命令中。

- `$@`: 规则中的目标文件集合。如果有多个目标，那么， `$@` 就是匹配于目标中模式定义的集合。
- `$%`: 仅当目标是函数库文件中，表示规则中的目标成员名。如果目标不是函数库文件（Unix下是 `.a` ，Windows下是 `.lib` ），那么，其值为空。比如如果目标时`foo.a(foo.o)`则`$%`为`foo.o`，`$@`是`foo.a`。
- `$<`: 依赖中的第一个名字。如果依赖目标是以模式（即 `%` ）定义的，那么 `$<` 将是符合模式的一系列的文件集。
- `$?`: 所有比目标新的依赖目标的集合。以空格分隔。
- `$^`: 所有的依赖目标的集合。以空格分隔。如果在依赖目标中有多个重复的，那么这个变量会去除重复的依赖目标，只保留一份。
- `$+`: 这个变量很像 `$^` ，也是所有依赖目标的集合。只是它不去除重复的依赖目标。
- `$*`: 这个变量表示目标模式中 `%` 及其之前的部分。这个特性是GNU make的，很有可能不兼容于其它版本的make，所以，你应该尽量避免使用 `$*` ，除非是在隐含规则或是静态模式中。如果目标中的后缀是make所不能识别的，那么 `$*` 就是空值。

当你希望只对更新过的依赖文件进行操作时， `$?` 在显式规则中很有用。

上述变量中：四个变量(`$@` 、 `$<` 、 `$%` 、` $*`)在扩展时只会有一个文件，而另三个的值是一个文件列表。

上述自动变量只需要搭配上 `D` 或 `F` 字样就可以实现取目录或者文件，同样功能也可以用`dir`和`notdir`实现。

这些变量都是使用在显示规则或者静态模式规则的命令中。

#### 模式的匹配

一般来说，一个目标的模式有一个有前缀或是后缀的 `%` ，或是没有前后缀，直接就是一个 `%`。们把 `%` 所匹配的内容叫做“茎”。

当一个模式匹配包含有斜杠（实际也不经常包含）的文件时，那么在进行模式匹配时，目录部分会首先被移开，然后进行匹配，成功后，再把目录加回去。在进行“茎”的传递时，我们需要知道这个步骤。

比如：规则`e%t : c%r`中，一个模式`e%t`匹配了`src/eat`那么，茎就是`src/a`，如果把茎传递给`c%r`，那么就匹配`src/car`。

#### 重载内建的隐含规则

通过模式规则，可以重新构建与内建隐含规则不同的骨子额：
```Makefile
%.o : %.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) -D$(date)
```

也可以取消内建的隐含规则，只要不在后面写命令就行
```Makefile
%.o : %.s
```

### 8.6 老式风格的后缀规则

老版本的用法，新版本都应该使用模式规则：
```Makefile
# 后缀规则
.c.o:
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
# 等价于
%.o : %.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) -D$(date)
```
后缀规则不允许任何的依赖文件，如果有依赖文件的话，那就不是后缀规则，那些后缀统统被认为是文件名。

而要让make知道一些特定的后缀，我们可以使用伪目标 `.SUFFIXES` 来定义或是删除。

make的参数 `-r` 或 `-no-builtin-rules` 也会使用得默认的后缀列表为空。而变量 `SUFFIXE` 被用来定义默认的后缀列表，你可以用 `.SUFFIXES` 来改变后缀列表，但请不要改变变量 `SUFFIXE` 的值。

新编写的Makefile不要使用后缀规则，知道是何含义即可。所有的后缀规则在Makefile被载入内存时，会被转换成模式规则。

### 8.6 隐含规则搜索算法

1. 把T的目录部分分离出来。叫D，而剩余部分叫N。（如：如果T是 src/foo.o ，那么，D就是 src/ ，N就是 foo.o ）
2. 创建所有匹配于T或是N的模式规则列表。
3. 如果在模式规则列表中有匹配所有文件的模式，如 % ，那么从列表中移除其它的模式。
4. 移除列表中没有命令的规则。
5. 对于第一个在列表中的模式规则：
    1. 推导其“茎”S，S应该是T或是N匹配于模式中 % 非空的部分。
    2. 计算依赖文件。把依赖文件中的 % 都替换成“茎”S。如果目标模式中没有包含斜框字符，而把D加在第一个依赖文件的开头。
    3. 测试是否所有的依赖文件都存在或是理当存在。（如果有一个文件被定义成另外一个规则的目标文件，或者是一个显式规则的依赖文件，那么这个文件就叫“理当存在”）
    4. 如果所有的依赖文件存在或是理当存在，或是就没有依赖文件。那么这条规则将被采用，退出该算法。
6. 如果经过第5步，没有模式规则被找到，那么就做更进一步的搜索。对于存在于列表中的第一个模式规则：
    1. 如果规则是终止规则，那就忽略它，继续下一条模式规则。
    2. 计算依赖文件。（同第5步）
    3. 测试所有的依赖文件是否存在或是理当存在。
    4. 对于不存在的依赖文件，递归调用这个算法查找他是否可以被隐含规则找到。
    5. 如果所有的依赖文件存在或是理当存在，或是就根本没有依赖文件。那么这条规则被采用，退出该算法。
    6. 如果没有隐含规则可以使用，查看 .DEFAULT 规则，如果有，采用，把 .DEFAULT 的命令给T使用。

一旦规则被找到，就会执行其相当的命令，而此时，我们的自动化变量的值才会生成。

## 9. 使用make更新函数库文件

函数库文件也就是对Object文件（程序编译的中间文件）的打包文件。在Unix下，一般是由命令 `ar` 来完成打包工作。

### 9.1 函数库文件的成员

一个函数库由多个文件组成，可以由如下格式指定：
```Makefile
archive(member)
```

这个不是一个命令，而一个目标和依赖的定义。一般来说，这种用法基本上就是为了 `ar` 命令来服务的。
```Makefile
foolib(hack.o) : hack.o
    ar cr foolib hack.o
```

如果有多个成员，可以用空格隔开。
```Makefile
foolib(hack.o kludge.o)
```
等价于：
```Makefile
foolib(hack.o) foolib(kludge.o)
```
还可以使用Shell的文件通配符：
```Makefile
foolib(*.o)
```

### 9.2 函数库成员的隐含规则

当make搜索一个目标的隐含规则时，一个特殊的特性是，如果这个目标是 `a(m)` 形式的，其会把目标变成 `(m)`。比如使用 `make foo.a(bar.o)` 的形式调用Makefile时，隐含规则会去找 `bar.o` 的规则，如果没有定义 `bar.o` 的规则，那么内建隐含规则生效，make会去找 `bar.c` 文件来生成 `bar.o`，如果找到了，那么大致的执行命令如下：
```Makefile
cc -c bar.c -o bar.o
ar r foo.a bar.o
rm -f bar.o
```

`$%`是专属库文件的自动化变量。

在进行函数库打包文件生成时，请小心使用make的并行机制（ `-j` 参数）。如果多个 `ar` 命令在同一时间运行在同一个函数库打包文件上，就很有可以损坏这个函数库文件。目前而言，尽量不要使用 `-j` 参数。

## 10. 总结

重点：
- 规则：目标、依赖和命令。
- 善用`%`静态模式、`gcc -MM`自动生成依赖。
- 变量：`=` `:=` `+=` `?=` `override` 多行、目标与模式变量。变量都是字符串。
- make相关环境变量，嵌套执行时的变量传递。
- 条件：`ifeq` `ifneq` `ifdef` `ifndef`。
- 函数：
    - 字符串处理：替换、模式替换、查找、筛选、排序、字符串取单词。
    - 文件名操作：目录、文件名、前缀、后缀、连接。
    - `foreach`循环、`if`条件、`origin`变量来源、`shell`。
    - `error` & `warning`。
- make的调试相关参数。
- 隐含规则：各种自动化变量：`$@` `$<` `$^` `$?` `$%` `$+` `$*`。

## 11. 结语

花了两天多时间，看了一遍，本文主要来源于[跟我一起写Makefile](https://seisman.github.io/how-to-write-makefile/index.html)，可以理解为简略的摘抄和实践总结，最终来源应该还是[GNU Make文档](https://www.gnu.org/software/make/manual/html_node/index.html)。理解还很浅，还需要后续多读多写结合实践加深理解。

术语 `foobar` , `foo` , `bar` , `baz` 和 `qux` 经常在计算机编程或计算机相关的文档中被用作 占位符 的名字。当变量、函数、或命令本身不太重要的时候， `foobar` , `foo` , `bar` ,`baz` 和 `qux` 就被用来充当这些实体的名字，这样做的目的仅仅是阐述一个概念，说明一个想法。这些术语本身相对于使用的场景来说没有任何意义。就像我们写一个没有具体含义的示例时经常使用hello,world一样。
