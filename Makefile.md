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
- 通用`$(varName)`引用。
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



