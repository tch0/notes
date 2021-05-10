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

然后将:
```Makefile
hello.o : hello.c command.h
```
改为
```Makefile
hello.d hello.o : hello.c command.h
```
就可以同步更新`.d`文件了。接下来将生成的规则`include`到主`Makefile`中:
```Makefile
soruces = hello.c command.c
include $(soruces:.c=.d)
```

`$(soruces:.c=.d)`表示将`$(sources)`中的所有`.c`字符串替换为`.d`。如果`include`在开头，因为`include`是按照默认顺序的，那么第一个就会变成默认目标。

最终例子，3个源文件`hello.c` `command.h` `command.c`，`hello.c`包含了`command.h`:
```Makefile
soruces = hello.c command.c
objects = $(soruces:.c=.o)
executable = hello
CC = cc

$(executable) : $(objects)
	$(CC) -o $(executable) $(objects)

include $(soruces:.c=.d)

%.d : %.c
	@set -e; rm -rf $@;\
	$(CC) -MM $< > $@

.PHONY : clean
clean :
	rm $(objects) $(executable) *.d
```

可以看到`include`同样会造成依赖，然后就会执行`.d`文件的生成规则。

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


