<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [TCC学习](#tcc%E5%AD%A6%E4%B9%A0)
  - [0. 特点](#0-%E7%89%B9%E7%82%B9)
  - [1. 安装与使用](#1-%E5%AE%89%E8%A3%85%E4%B8%8E%E4%BD%BF%E7%94%A8)
  - [2. C语言特性支持](#2-c%E8%AF%AD%E8%A8%80%E7%89%B9%E6%80%A7%E6%94%AF%E6%8C%81)
    - [2.1 ISO C99扩展](#21-iso-c99%E6%89%A9%E5%B1%95)
    - [2.2 GNU C扩展](#22-gnu-c%E6%89%A9%E5%B1%95)
    - [2.3 TinyCC 自己的扩展](#23-tinycc-%E8%87%AA%E5%B7%B1%E7%9A%84%E6%89%A9%E5%B1%95)
  - [3. TinyCC的汇编器](#3-tinycc%E7%9A%84%E6%B1%87%E7%BC%96%E5%99%A8)
    - [3.1 语法](#31-%E8%AF%AD%E6%B3%95)
    - [3.2 表达式](#32-%E8%A1%A8%E8%BE%BE%E5%BC%8F)
    - [3.3 标号](#33-%E6%A0%87%E5%8F%B7)
    - [3.4 指令](#34-%E6%8C%87%E4%BB%A4)
    - [3.5 x86汇编器](#35-x86%E6%B1%87%E7%BC%96%E5%99%A8)
  - [4. 链接器](#4-%E9%93%BE%E6%8E%A5%E5%99%A8)
    - [4.1 ELF文件生成](#41-elf%E6%96%87%E4%BB%B6%E7%94%9F%E6%88%90)
    - [4.2 加载ELF文件](#42-%E5%8A%A0%E8%BD%BDelf%E6%96%87%E4%BB%B6)
    - [4.3 PE-i386文件生成](#43-pe-i386%E6%96%87%E4%BB%B6%E7%94%9F%E6%88%90)
    - [4.4 GNU 链接脚本文件](#44-gnu-%E9%93%BE%E6%8E%A5%E8%84%9A%E6%9C%AC%E6%96%87%E4%BB%B6)
    - [4.5 TCC内存和边界检查](#45-tcc%E5%86%85%E5%AD%98%E5%92%8C%E8%BE%B9%E7%95%8C%E6%A3%80%E6%9F%A5)
  - [5. libtcc库](#5-libtcc%E5%BA%93)
  - [6. 开发者指南](#6-%E5%BC%80%E5%8F%91%E8%80%85%E6%8C%87%E5%8D%97)
    - [6.1 文件读取](#61-%E6%96%87%E4%BB%B6%E8%AF%BB%E5%8F%96)
    - [6.2 词法分析](#62-%E8%AF%8D%E6%B3%95%E5%88%86%E6%9E%90)
    - [6.3 语法分析](#63-%E8%AF%AD%E6%B3%95%E5%88%86%E6%9E%90)
    - [6.4 类型系统](#64-%E7%B1%BB%E5%9E%8B%E7%B3%BB%E7%BB%9F)
    - [6.5 符号表](#65-%E7%AC%A6%E5%8F%B7%E8%A1%A8)
    - [6.6 Sections](#66-sections)
    - [6.7 代码生成](#67-%E4%BB%A3%E7%A0%81%E7%94%9F%E6%88%90)
      - [6.7.1 The Vlaue Stack](#671-the-vlaue-stack)
      - [6.7.2 操作表达式求值栈](#672-%E6%93%8D%E4%BD%9C%E8%A1%A8%E8%BE%BE%E5%BC%8F%E6%B1%82%E5%80%BC%E6%A0%88)
      - [6.7.3 依赖CPU的代码生成](#673-%E4%BE%9D%E8%B5%96cpu%E7%9A%84%E4%BB%A3%E7%A0%81%E7%94%9F%E6%88%90)
    - [6.8 编译优化](#68-%E7%BC%96%E8%AF%91%E4%BC%98%E5%8C%96)
  - [7. 编译源码](#7-%E7%BC%96%E8%AF%91%E6%BA%90%E7%A0%81)
  - [8. 使用libtcc](#8-%E4%BD%BF%E7%94%A8libtcc)
    - [8.1 使用libtcc来编译一个源码](#81-%E4%BD%BF%E7%94%A8libtcc%E6%9D%A5%E7%BC%96%E8%AF%91%E4%B8%80%E4%B8%AA%E6%BA%90%E7%A0%81)
    - [8.2 libtcc使用示例](#82-libtcc%E4%BD%BF%E7%94%A8%E7%A4%BA%E4%BE%8B)
    - [8.3 调试测试程序](#83-%E8%B0%83%E8%AF%95%E6%B5%8B%E8%AF%95%E7%A8%8B%E5%BA%8F)
    - [8.4 编译过程](#84-%E7%BC%96%E8%AF%91%E8%BF%87%E7%A8%8B)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# TCC学习

Tiny CC，简称TCC，是Fabrice Bellard大神和伙伴们写的小型C编译器。是一个小型、快速的编译器。

- 首页：https://bellard.org/tcc/
- 文档：https://bellard.org/tcc/tcc-doc.html
- Git仓库：https://repo.or.cz/w/tinycc.git 
- 最新发布版本：2017年12月17日发布的0.9.27版本，https://repo.or.cz/tinycc.git/shortlog/refs/tags/release_0_9_27
- Fabrice Bellard已经不再维护TCC了，但是依然有不少爱好者还在维护，尽管后续没有发布正式版本。
- 下载地址：http://download.savannah.gnu.org/releases/tinycc/

这里来了解一下TCC，学习一下源码，主要基于0.9.27版本。

为什么要学习了解一下TCC，是因为最近了解了c4，重构了一下并加了一点功能之后对编译器有了一点了解。但
c4就算扩展了一点语法，因为运行在虚拟机上、不支持预处理、不支持完整的标准C语法、不支持多文件编译、不能编译库，注定了就只能是一个玩具。有点意犹未尽，相比而言TCC支持标准C、预处理编译链接过程完善，基本可以用来编译小型的C项目了，完善了很多，项目大小也正合适。

下面在编译源码前的部分几乎都是翻译自官方文档，作为学习源码前的了解。

## 0. 特点

- 小而快，生成代码质量一般。
- 包含完整的汇编器和链接器，可以直接生成可执行文件。
- 支持ANSI C标准，并且几乎支持所有ISO C99标准，支持许多GNUC扩展包括内联汇编。
- 可以使用TCC来制作C脚本，在C源文件第一行添加`#!/usr/local/bin/tcc -run`，像使用脚本语言一样使用C。
- 安全，TCC会进行内存边界检查，边界检查的代码可以和生成代码自由地混合在一起。
- 使用libtcc，你可以将TCC作为编译器后端来使用，为你生成代码。
- TCC支持生成Linux和Windows上的i386目标文件。也有arm和其他架构的版本，当然这里只关注x86版本。

## 1. 安装与使用

Linux上可以通过包管理器直接安装，最新版本还是0.9.27：
```shell
sudo apt install tcc
```

帮助：
```
Tiny C Compiler 0.9.27 - Copyright (C) 2001-2006 Fabrice Bellard
Usage: tcc [options...] [-o outfile] [-c] infile(s)...
       tcc [options...] -run infile [arguments...]
General options:
  -c          compile only - generate an object file
  -o outfile  set output filename
  -run        run compiled source
  -fflag      set or reset (with 'no-' prefix) 'flag' (see tcc -hh)
  -Wwarning   set or reset (with 'no-' prefix) 'warning' (see tcc -hh)
  -w          disable all warnings
  -v -vv      show version, show search paths or loaded files
  -h -hh      show this, show more help
  -bench      show compilation statistics
  -           use stdin pipe as infile
  @listfile   read arguments from listfile
Preprocessor options:
  -Idir       add include path 'dir'
  -Dsym[=val] define 'sym' with value 'val'
  -Usym       undefine 'sym'
  -E          preprocess only
Linker options:
  -Ldir       add library path 'dir'
  -llib       link with dynamic or static library 'lib'
  -r          generate (relocatable) object file
  -shared     generate a shared library/dll
  -rdynamic   export all global symbols to dynamic linker
  -soname     set name for shared library to be used at runtime
  -Wl,-opt[=val]  set linker option (see tcc -hh)
Debugger options:
  -g          generate runtime debug info
  -b          compile with built-in memory and bounds checker (implies -g)
  -bt N       show N callers in stack traces
Misc. options:
  -x[c|a|n]   specify type of the next infile
  -nostdinc   do not use standard system include paths
  -nostdlib   do not link with standard crt and libraries
  -Bdir       set tcc's private include/library dir
  -MD         generate dependency file for make
  -MF file    specify dependency file name
  -m32/64     defer to i386/x86_64 cross compiler
Tools:
  create library  : tcc -ar [rcsv] lib.a files
```


TCC的选项和GCC很像，主要的区别就是TCC可以直接加`-run`选项给参数直接执行C程序。

不生成目标文件直接执行：
```shell
tcc -run a.c
tcc -run a.c arg1
tcc a.c -run b.c arg1 # 编译a.c和b.c，链接，并传递arg1给main执行
tcc -o myprog a.c b.c # 编译链接a.c和b.c为可执行文件myprog
tcc -o myprog a.o b.o # 链接目标文件a.o和b.o为可执行文件myprog
tcc -c a.c # 编译生成目标文件a.o
tcc -c asmfile.S # 预处理并汇编得到目标文件asmfile.o
tcc -c asmfile.s # 汇编得到目标文件asmfile.o
tcc -r -o ab.o a.c b.c # 编译并链接a.c和b.c到目标文件ab.o
```

从脚本调用TCC：加上执行权限之后就可以从命令行直接执行了。
```C
#!/usr/bin/tcc -run
#include <stdio.h>
int main() 
{
    printf("Hello World\n");
    return 0;
}
```

从标准输入调用TCC：一般应该不会这么干。
```shell
echo 'main(){puts("hello");}' | tcc -run -
```

就选项来说，相比GCC，少了`-S`编译为汇编源文件这个选项，因为是直接生成机器码。预处理`-E`，编译到目标文件`-c`，不加选项直接编译为可执行文件都是一样的。

系统变量：
```
CPATH
C_INCLUDE_PATH
```
冒号分隔的头文件目录，`-I`指定的目录会先搜索。

```
LIBRARY_PATH
```
冒号分隔的库文件目录，`-l`选项指定的库的搜索目录，`-L`指定的目录会先搜索。


## 2. C语言特性支持

- 实现了所有ANSI C标准，包括结构体位于声明和浮点数，完全支持`long double double float `。

### 2.1 ISO C99扩展

实现的特性有：
- VLA。
- 64位`long long`类型完全支持。
- `_Bool`类型支持。
- `__func__`宏名支持，当前函数名称。
- 可变参数宏`__VA_ARGS__`可以用在带参宏里面：
    ```C
    #define dprintf(level, __VA_ARGS__) printf(__VA_ARGS__)
    ```
- 声明可以出现在块的任何位置。
- 可以使用指派符初始化结构、联合、数组中的元素：
    ```C
    struct { int x, y; } st[10] = { [0].x = 1, [0].y = 2 };
    int tab[10] = { 1, 2, [5] = 5, [9] = 9};
    ```
- 支持复合初始化：结构或字符串也支持。
    ```C
    int *p = (int []){ 1, 2, 3 };
    ```
- 十六进制浮点数常量。
    ```C
    double d = 0x1234p10;
    ```
- `inline` 关键字被忽略。
- `restrict` 关键字被忽略。


### 2.2 GNU C扩展

实现的GNU C特性有：
- 数组指派符初始化可以没有赋值号。
    ```C
    int a[10] = { [0] 1, [5] 2, 3, 4 };
    ```
- 结构指派符初始化可以用像标号一样的语法：
    ```C
    struct { int x, y; } st = { x: 1, y: 1}
    ```
- `\e` 被视作ASCII字符27。
- `case`标签支持范围：
    ```C
    switch(a) {
    case 1 … 9:
          printf("range 1 to 9\n");
          break;
    default:
          printf("unexpected\n");
          break;
    }
    ```
- `__attribute__` 关键字指定变量或者函数属性，支持下列属性：
    - `aligned(n)` 结构体域对齐的字节大小。
    - `packed` 强制结构体域的对齐大小为1。
    - `section(name)` 将函数代码生成在名称为name的节，而不是默认。
    - `unused` 指明变量或函数未使用。
    - `cdecl` 使用标准C的调用约定。
    - `stdcall` 类Pascal调用约定。
    - `regparm(n)` 使用x86的快速调用约定，n在1到3，函数的前3个参数分别放入`%eax` `%edx` `%ecx`。
    - `dllexport` 在dll或者可执行文件中导出一个函数，仅在Win32中使用。
    - 例：
    ```C
    int a __attribute__ ((aligned(8), section(".mysection")));
    int my_add(int a, int b) __attribute__ ((section(".mycodesection"))) 
    {
        return a + b;
    }
    ```
- GNU 风格的可变参数。
    ```C
    #define dprintf(fmt, args...) printf(fmt, ## args)

    dprintf("no arg\n");
    dprintf("one arg %d\n", 1);
    ```
- `__FUNCTION__` 宏被解释为`__func__`。和GNUC不完全是同一个语义。
- `__alignof__` 可以像`sizeof`一样使用，用来获取一个类型或者表达式的对齐字节大小。
- `typeof(x)` 得到x的类型，x是表达式或类型。
- 可计算的goto：`&&label` 返回一个void*类型指向标号`label`的指针，`goto *expr`跳转到`expr`的结果表示的指针保存的地址。
- 内联汇编：
    ```C
    static inline void * my_memcpy(void * to, const void * from, size_t n)
    {
    int d0, d1, d2;
    __asm__ __volatile__(
            "rep ; movsl\n\t"
            "testb $2,%b4\n\t"
            "je 1f\n\t"
            "movsw\n"
            "1:\ttestb $1,%b4\n\t"
            "je 2f\n\t"
            "movsb\n"
            "2:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            :"0" (n/4), "q" (n),"1" ((long) to),"2" ((long) from)
            : "memory");
    return (to);
    }
    ```
- 支持`__builtin_types_compatible_p()`和`__builtin_constant_p()`。
- 为了Win32的兼容性支持`#pragma pack`。

### 2.3 TinyCC 自己的扩展

- `__TINYC__` 预定义宏表明在使用TCC。
- 行首的`#!`被忽略以支持脚本。
- 可以使用二进制整数字面值，`0b101`表示5。
- `__BOUNDS_CHECKING_ON` 宏被定义，如果开了边界检查的话。


## 3. TinyCC的汇编器

0.9.16版本开始TCC实现了自己的汇编器，汇编器用来处理GNU汇编器风格的`.s` `.S`源文件，汇编器也被用来处理`asm`关键字指定的GNU内联汇编。

- TCC的C编译器不依赖汇编器，可以停用以减小TCC的体积。
- TCC的编译过程中没有生成汇编这个步骤，而是直接生成二进制机器码。

### 3.1 语法

TCC的汇编器支持大部分的GAS（[GNU Assembler](https://en.wikipedia.org/wiki/GNU_Assembler)）语法（也就是被熟知的AT&T风格的汇编）。
- 支持C/C++注释。
- 标识符同C，不能使用`. $`。
- 仅支持32位整数。

### 3.2 表达式

- 支持十进制、八进制、十六进制整数。
- 一元运算符：`+ - ~`。
- 二元运算符优先级降序排列：同C有区别。
    - `* / %`
    - `& | ^`
    - `+ -`
- 一个值要么是立即数，要么是一个标号加上一个偏移。所有的操作符都支持立即数除了`+`和`-`，`+`和`-`可以用来将一个偏移加到标号上。`-`支持标号相减，仅当他们在同一个section。

### 3.3 标号

- 标号都被视为局部的，除非是未定义的。
- 数值标号可以用作GAS风格的标号，可以在同一个源中定义多次。使用后缀b(backward)或者f(forward)作为前缀来引用。
    ```x86asm
    1:
      jmp 1b /* jump to '1' label before */
      jmp 1f /* jump to '1' label after */
    1:
    ```

### 3.4 指令

所有指令均已`.`开头，支持下列指令：

```x86asm
.align n[,value]
.skip n[,value]
.space n[,value]
.byte value1[,...]
.word value1[,...]
.short value1[,...]
.int value1[,...]
.long value1[,...]
.quad immediate_value1[,...]
.globl symbol
.global symbol
.section section
.text
.data
.bss
.fill repeat[,size[,value]]
.org n
.previous
.string string[,...]
.asciz string[,...]
.ascii string[,...]
```

### 3.5 x86汇编器

支持所有x86操作码，仅支持AT&T风格汇编（源操作数在前，目标操作数在后）。如果前缀没有给定大小，TCC会尝试从操作数的大小猜测。

当前支持MMX操作码，但是不支持SSE。

## 4. 链接器

### 4.1 ELF文件生成

TCC可以在不依赖外部链接器的情况下生成可重定位的ELF文件（目标文件），可执行的ELF文件和动态ELF库。

可以输出动态ELF库，但是C编译器不生成位置无关代码（PIC, position independent code），这意味着TCC生成的动态库不能在进程间共用。

链接器会删掉库中未被引用的目标代码，对目标文件和库的单趟操作做这个事情。所以目标文件和库的顺序很重要（和GNU ld的约束一样）。不支持组选项`--start-group` `--end-group`。

### 4.2 加载ELF文件

TCC可以加载ELF对象文件，包括静态库`.a`和动态库`.so`。

### 4.3 PE-i386文件生成

TCC支持生成Win32的可执行文件格式，可以生成exe（控制台和GUI）和DLL文件。

Windows详细使用说明可以参见tcc-win32.txt。

### 4.4 GNU 链接脚本文件

因为在许多Linux系统上，一些动态链接库（比如`/usr/lib/libc.so`）世界上是GNN链接脚本文件（这很糟糕！），所以TCC同样支持一个GNU ld链接脚本的子集。

- 支持`GROUP`和`FILE`命令，忽略`OUTPUT_FORMAT`和`TARGET`命令。

`/usr/lib/libc.so`的例子：
```
/* GNU ld script
   Use the shared library, but some functions are only in
   the static library, so try that secondarily.  */
GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a )
```

### 4.5 TCC内存和边界检查

使用`-b`选项开启。

开启与未开启，指针长度不会发生变化，未进行边界检查和进行了的完全二进制兼容。未检查的代码中的指针会被假定为有效的。即是非常模糊的C代码的指针转换都会正确工作。更多内容看这里：http://www.doc.ic.ac.uk/~phjk/BoundsChecking.html

内存边界检查会检查出来错误举例：

标准C字符串函数的非法范围：
```C
{
    char tab[10];
    memset(tab, 0, 11);
}
```

全局或者局部数组中的下标越界：
```C
{
    int tab[10];
    for(i=0;i<11;i++) {
        sum += tab[i];
    }
}
```
malloc分配的内存越界访问：
```C
{
    int *tab;
    tab = malloc(20 * sizeof(int));
    for(i=0;i<21;i++) {
        sum += tab4[i];
    }
    free(tab);
}
```
访问已释放内存：
```C
{
    int *tab;
    tab = malloc(20 * sizeof(int));
    free(tab);
    for(i=0;i<20;i++) {
        sum += tab4[i];
    }
}
```
多次释放内存：
```C
{
    int *tab;
    tab = malloc(20 * sizeof(int));
    free(tab);
    free(tab);
}
```

## 5. libtcc库

你可以使用libtcc作为动态代码生成的后端来使用。

`libtcc.h`中的声明了API，`libtcc_test.c`有基本的使用示例。

比如传递一个想编译的C源码的字符串到libtcc，然后可以获得文件中的全局符号和函数定义。


## 6. 开发者指南

TCC源码指南，如果想要读懂甚至修改TCC可以看一看。

### 6.1 文件读取

`BufferedFile` 结构包含了读取一个文件所需要的上下文，包括当前行号。
- `tcc_open()`打开文件。
- `tcc_close()`关闭文件。
- `inp()`返回下一个字符。

### 6.2 词法分析

- `next()`读取当前文件的下一个token。
- `next_nomacro()`读取未进行宏展开的下一个token。
- `tok`是当前的token，`TOK_xxx`定义了token。
- 标识符和关键字都是关键字。
- `tokc`包含了当前token的额外信息，比如常数或者字符串token的值。

### 6.3 语法分析

语法分析是硬编码的（没有必要使用yacc），仅执行单趟。除非对以下情况：
- 为给定大小的初始化了的数组，第一趟会计算数组元素个数。
- 对于实参按照逆序求值的目标架构中，第一趟会将参数顺序翻转过来。

### 6.4 类型系统

类型存储在一个`int`变量中，在tcc开发早期就这样做了选择，现在来看，可能并不是最好的选择。

相关常量：
```C
#define VT_INT        0  /* integer type */
#define VT_BYTE       1  /* signed byte type */
#define VT_SHORT      2  /* short type */
#define VT_VOID       3  /* void type */
#define VT_PTR        4  /* pointer */
#define VT_ENUM       5  /* enum definition */
#define VT_FUNC       6  /* function type */
#define VT_STRUCT     7  /* struct/union definition */
#define VT_FLOAT      8  /* IEEE float */
#define VT_DOUBLE     9  /* IEEE double */
#define VT_LDOUBLE   10  /* IEEE long double */
#define VT_BOOL      11  /* ISOC99 boolean type */
#define VT_LLONG     12  /* 64 bit integer */
#define VT_LONG      13  /* long integer (NEVER USED as type, only
                            during parsing) */
#define VT_BTYPE      0x000f /* mask for basic type */
#define VT_UNSIGNED   0x0010  /* unsigned type */
#define VT_ARRAY      0x0020  /* array type (also has VT_PTR) */
#define VT_VLA        0x20000 /* VLA type (also has VT_PTR and VT_ARRAY) */
#define VT_BITFIELD   0x0040  /* bitfield modifier */
#define VT_CONSTANT   0x0800  /* const modifier */
#define VT_VOLATILE   0x1000  /* volatile modifier */
#define VT_DEFSIGN    0x2000  /* signed type */

#define VT_STRUCT_SHIFT 18   /* structure/enum name shift (14 bits left) */
```

- 当需要引用其他类型时（指针、函数、结构），`32-VT_STRUCT_SHIFT`位（14位）的高位被用来存储引用的类型。
- `VT_UNSIGNED`可以设置给`char` `short` `int` `long long`
- 数组被视为指针`VT_PTR`并且同时设置了`VT_ARRAY`标记。变长数组VLA被视为特殊数组，设置`VT_VLA`标记。
- `VT_BITFIELD`可以被设置给`char` `short` `int` `long long`。如果被设置了，那么位于的位置存储在`VT_STRUCT_SHIFT`到`VT_STRUCT_SHIFT + 5`的位中，位域大小被存储在`VT_STRUCT_SHIFT + 6`到`VT_STRUCT_SHIFT + 11`位。
- `VT_LONG`除了在解析时，其他时候都不用。
- 解析时，一个对象的Storage(这怎么翻译啊？)同样被存储在这个表示类型的整数中。
```C
#define VT_EXTERN  0x00000080  /* extern definition */
#define VT_STATIC  0x00000100  /* static variable */
#define VT_TYPEDEF 0x00000200  /* typedef definition */
#define VT_INLINE  0x00000400  /* inline definition */
#define VT_IMPORT  0x00004000  /* win32: extern data imported from dll */
#define VT_EXPORT  0x00008000  /* win32: data exported from dll */
#define VT_WEAK    0x00010000  /* win32: data exported from dll */
```

### 6.5 符号表

所有的符号都被存储在哈希符号栈中，符号栈中的元素是`Sym`结构。

- Sym.v保存符号名称。
- Sym.t表示符号的类型。
- Sym.r是这个变量存储的寄存器。
- Sym.c通常是符号对相应的常量，比如一个常规符号的地址，数组长度。VLA用使用这个域存储栈上的一个保存了VLA大小的位置。

四个主要的符号栈：
- `define_stack` 保存宏。
- `global_stack` 全局变量函数和类型。
- `local_stack` 局部变量函数和类型。
- `global_label_stack` 局部的goto的标号。
- `label_stack` GCC块中的局部标号，见`__label__`关键字。

函数：
- `sym_push()` 添加一个新的符号到当前局部符号栈，如果没有局部的符号栈活跃，那么添加到全局。
- `sym_pop(st, b)` 从符号栈`st`中依次出栈，知道`b`位于栈顶。如果`b`为空，那么`st`直接置空。
- `sym_find(v)` 得到和标识符`v`关联的符号。先自栈顶向下搜索局部符号栈，然后是全局符号栈。

### 6.6 Sections

这个应该怎么翻译？节？部分？段？就叫section吧。段应该是比较符合含义的，但段其实一般说的segment。

生成的代码和数据被写到一个个的section中，`Section`结构包含了一个section需要的所有信息。`new_section()`函数创建一个新的section。每个节都假定拥有ELF文件语义（什么意思？）

预定义了下面的sections：

- `text_section` 保存生成代码，`ind`保存代码段中当前位置。
- `data_section` 保存初始化了的数据。
- `bss_section` 保存未初始化的数据。
- `bounds_section` `lbounds_section` 开启了内存边界检查才用。
- `stab_section` `stabstr_section` 调试模式下用来存储调试信息。
- `symtab_section` `strtab_section` 保存导出符号，当前只用于调试。

### 6.7 代码生成

TCC的代码生成在一趟过程中直接生成二进制代码，放到现在来说并不是通常的做法（比如GCC会生成汇编源文件，TCC没有这一步），这样实现执行速度很快，而且令人意外地会有一点复杂。

TCC的代码生成器是基于寄存器的，仅仅有一些表达式级别的优化，除了保存在一个栈（原文Value Stack）中的值之外没有中间表示。【这个栈应该是语法分析时用来辅助解析表达式的栈，而不是指运行时栈】

在x86的代码生成中，使用了3个临时寄存器，当需要更多寄存器时，其中一个寄存器上的值会被转移到栈上的临时变量中。

#### 6.7.1 The Vlaue Stack

姑且将其称作**表达式求值栈**，解析完一个表达式后，它的值被压到栈(`vstack`)顶，栈顶用`vtop`表示。每一个条目用一个结构`SValue`表示。

- `SValue.t` 表示类型。
- `SValue.r` 表示这个值在生成代码中怎样存储。通常使用一个CPU寄存器索引，和一些值和额外的标记组成。
    ```C
    #define VT_CONST     0x00f0
    #define VT_LLOCAL    0x00f1
    #define VT_LOCAL     0x00f2
    #define VT_CMP       0x00f3
    #define VT_JMP       0x00f4
    #define VT_JMPI      0x00f5
    #define VT_LVAL      0x0100
    #define VT_SYM       0x0200
    #define VT_MUSTCAST  0x0400
    #define VT_MUSTBOUND 0x0800
    #define VT_BOUNDED   0x8000
    #define VT_LVAL_BYTE     0x1000
    #define VT_LVAL_SHORT    0x2000
    #define VT_LVAL_UNSIGNED 0x4000
    #define VT_LVAL_TYPE     (VT_LVAL_BYTE | VT_LVAL_SHORT | VT_LVAL_UNSIGNED)
    ```
- `VT_CONST` 值是常量，存储在`SVlue.c`中，是一个联合体，具体哪个域看类型。
- `VT_LOCAL` 局部变量，在运行时栈中的指针偏移存储在`SValue.c.i`。
- `VT_CMP` 表示值存储在CPU的标志寄存器中（CPU flags），值为0或者1，使用了哪个CPU标志寄存器保存在`SValue.c.i`中。如果生成了会改变CPU标志的指令，那么这个值必须被移到一个通用寄存器中。
- `VT_JMP` `VT_JMPI` 表示这个值是一个有条件跳转的结果。对于`VT_JMP`类型，如果执行了跳转，值为1，未执行为0，`VT_JMPI`则反过过来。
    - 这些值被用来编译`||`和`&&`运算符。
    - 如果中间生成了任何代码，那么这些值必须被放到一个通用寄存器。否则，如果执行了跳转生成的代码就不会被执行。意义不明！
- `VT_LVAL` 表明这个值是一个左值的标记，表明这个值存储的实际上是想要的值的指针。理解`VT_LVAL`的使用对理解TCC的工作方式非常重要。**重要！**
- `VT_LVAL_BYTE` `VT_LVAL_SHORT` `VT_LVAL_UNSIGNED` 如果一个左值是整型，这些标记表明了它的真实类型，仅有类型在类型转换的优化时是不够的。
- `VT_LLOCAL` 栈上已保存的左值，`VT_LLOCAL`必须和`VT_LVAL`一同被设置。当一个寄存器中的`VT_LVAL`被存到栈里面时`VT_LLOCAL`就会被设置，或者某种特定于架构的调用约定中。
- `VT_MUSTCAST` 表明如果这个值被使用的话应该进行类型转换（lazy casting）。
- `VT_SYM` 表明符号`SValue.sym`需要被添加到常量中。
- `VT_MUSTBOUND` `VT_BOUNDED`内存边界检查时使用。

#### 6.7.2 操作表达式求值栈

- `vsetc()` `vset()` 将一个新值压到表达式求值栈中，如果上一个栈顶`vtop`存储在一个非常不安全的位置，比如CPU标志寄存器，那么就会生成将上一个`vtop`存到安全位置的代码。
- `vpop()` 将`vtop`出栈。某些情况也会生成清理代码，比如使用了x86上的浮点寄存器栈(stacked floating point registers)。
- `gv(rc)` 生成对栈顶`vtop`求值到寄存器中的代码，`rc`是选择的寄存器，`gv()`是代码生成器中最重要的函数。
- `gv2()` 功能同`gv()`，但是对栈顶的两个栈帧求值。


#### 6.7.3 依赖CPU的代码生成

以x86的代码生成`i386-gen.c`文件为例：
- `load()` 生成需要的代码将一个栈中的值加载到寄存器。
- `store()` 生成将寄存器中的值保存到一个栈中的左值的代码。
- `gfunc_start() gfunc_param() gfunc_call()` 生成函数调用代码。
- `gfunc_prolog() gfunc_epilog()` 生成函数的[prolog/epilog](https://docs.microsoft.com/zh-cn/cpp/build/prolog-and-epilog?view=msvc-160)。
- `gen_opi(op)` 为表达式求值栈的保证是整数的栈顶两个栈帧，生成操作`op`对应运算的代码。结果应该存到表达式求值栈里面。
- `gen_opf(op)` 和上一个类似，只不过为浮点数，保证栈顶两个栈帧是浮点数。
- `gen_cvt_itof()` 整数到浮点数转换。
- `gen_cvt_ftoi()` 浮点数到整数转换。
- `gen_cvt_ftof()` 不同长度的浮点数到浮点数转换。
- `gen_bounded_ptr_add() gen_bounded_ptr_deref()` 仅用在内存边界检查中。

### 6.8 编译优化

- [常量折叠/常量传播](https://en.wikipedia.org/wiki/Constant_folding)（Constant folding/constant propagation）：所有的运算都会进行常量折叠，常量表达式编译期计算、未修改的变量会在编译期被替代为常数，以简化计算过程。
    - 常量折叠是指将一个常量表达式在编译期计算出来。
    - 常量传播是指将一个被初始化为常数的变量在它真正被修改之前使用的地方都替换为常量。
    - 交替进行这两个过程，直到没有必要再优化。
    - 例：
    ```C
    int a = 30;
    int b = 9 - a / 5;
    int c;
    c = b * 4;
    if (c > 10) {
        c = c - 10;
    }
    return c * (60 / a);
    ```
    - 例子中最终结果是确定的，借由不段地常量折叠和传播。最终可以优化为：
    ```C
    return 4;
    ```
- 除法和乘法在合适的时候会被优化为移位。
- 比较操作的结果通过维护处理器标志寄存器的缓存来优化。
- `&& || !`通过维护一个特殊的跳转目标来优化。
- 目前没有其他的JUMP优化，因为那需要以更抽象的方式保存代码，比如中间代码、AST这种。
- 找到一个简要描述编译优化的网站：https://compileroptimizations.com/index.html


至此TCC文档就结束了，TCC的使用，结构，一些具体的实现点都了解了，TCC有什么东西，没有什么基本了解了。下面会逐步编译、阅读、理解源码。

## 7. 编译源码

将仓库检出到本地：
```shell
git clone https://repo.or.cz/tinycc.git ./TCC
```

文件结构：
```
.
├── COPYING
├── Changelog
├── CodingStyle
├── Makefile
├── README
├── RELICENSING
├── TODO
├── USES
├── VERSION
├── arm-asm.c
├── arm-gen.c
├── arm-link.c
├── arm-tok.h
├── arm64-asm.c
├── arm64-gen.c
├── arm64-link.c
├── c67-gen.c
├── c67-link.c
├── coff.h
├── configure*
├── conftest.c
├── elf.h
├── examples/
├── i386-asm.c
├── i386-asm.h
├── i386-gen.c
├── i386-link.c
├── i386-tok.h
├── il-gen.c
├── il-opcodes.h
├── include/
├── lib/
├── libtcc.c
├── libtcc.h
├── riscv64-asm.c
├── riscv64-gen.c
├── riscv64-link.c
├── riscv64-tok.h
├── stab.def
├── stab.h
├── tcc-doc.texi
├── tcc.c
├── tcc.h
├── tccasm.c
├── tcccoff.c
├── tccelf.c
├── tccgen.c
├── tcclib.h
├── tccmacho.c
├── tccpe.c
├── tccpp.c
├── tccrun.c
├── tcctok.h
├── tcctools.c
├── tests/
├── texi2pod.pl*
├── win32/
├── x86_64-asm.h
├── x86_64-gen.c
└── x86_64-link.c
```

编译：
```shell
./configure
make [CONFIG_debug=yes]
```

运行`./configure`之后生成了`config.mak`文件，包含当前的配置信息，系统、架构、编译器、版本等信息，被`Makefile`包含：
```make
# Automatically generated by configure - do not modify
prefix=/usr/local
bindir=$(DESTDIR)/usr/local/bin
tccdir=$(DESTDIR)/usr/local/lib/tcc
libdir=$(DESTDIR)/usr/local/lib
includedir=$(DESTDIR)/usr/local/include
mandir=$(DESTDIR)/usr/local/share/man
infodir=$(DESTDIR)/usr/local/share/info
docdir=$(DESTDIR)/usr/local/share/doc
CC=gcc
CC_NAME=gcc
GCC_MAJOR=9
GCC_MINOR=3
AR=ar
CFLAGS=-Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation
LDFLAGS=
LIBSUF=.a
EXESUF=
DLLSUF=.so
NATIVE_DEFINES+=-DCONFIG_TRIPLET="\"x86_64-linux-gnu\""
ARCH=x86_64
TARGETOS=Linux
VERSION = 0.9.27
TOPSRC=$(TOP)
```

看一下`make`后执行的命令，如果需要调试就定义变量`CONFIG_debug=yes`，然后编译链接时会加上`-g`选项：
```shell
gcc -o tcc.o -c tcc.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -DTCC_GITHASH="\"mob:c7a57bf\"" -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
gcc -o libtcc.o -c libtcc.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
gcc -DC2STR conftest.c -o c2str.exe && ./c2str.exe include/tccdefs.h tccdefs_.h
gcc -o tccpp.o -c tccpp.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
gcc -o tccgen.o -c tccgen.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
gcc -o tccelf.o -c tccelf.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
gcc -o tccasm.o -c tccasm.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
gcc -o tccrun.o -c tccrun.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
gcc -o x86_64-gen.o -c x86_64-gen.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
gcc -o x86_64-link.o -c x86_64-link.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
gcc -o i386-asm.o -c i386-asm.c -DCONFIG_TRIPLET="\"x86_64-linux-gnu\"" -DTCC_TARGET_X86_64        -DONE_SOURCE=0 -Wall -O2 -Wdeclaration-after-statement -fno-strict-aliasing -Wno-pointer-sign -Wno-sign-compare -Wno-unused-result -Wno-format-truncation -I. 
ar rcs libtcc.a libtcc.o tccpp.o tccgen.o tccelf.o tccasm.o tccrun.o x86_64-gen.o x86_64-link.o i386-asm.o
gcc -o tcc tcc.o libtcc.a -lm -lpthread -ldl  -s 
make[1]: Entering directory '/home/tch/Compiler/tcc/lib'
../tcc -c libtcc1.c -o libtcc1.o -B.. -I..
../tcc -c alloca.S -o alloca.o -B.. -I..
../tcc -c alloca-bt.S -o alloca-bt.o -B.. -I..
../tcc -c tcov.c -o tcov.o -B.. -I..
../tcc -c stdatomic.c -o stdatomic.o -B.. -I..
../tcc -c va_list.c -o va_list.o -B.. -I..
../tcc -c dsohandle.c -o dsohandle.o -B.. -I..
../tcc -ar rcs ../libtcc1.a libtcc1.o alloca.o alloca-bt.o tcov.o stdatomic.o va_list.o dsohandle.o
../tcc -c bt-exe.c -o ../bt-exe.o -B.. -I..
../tcc -c bt-log.c -o ../bt-log.o -B.. -I..
../tcc -c bcheck.c -o ../bcheck.o -B.. -I.. -g 
make[1]: Leaving directory '/home/tch/Compiler/tcc/lib'
perl ./texi2pod.pl tcc-doc.texi tcc-doc.pod
pod2man --section=1 --center="Tiny C Compiler" --release="0.9.27" tcc-doc.pod >tcc.1 && rm -f tcc-doc.pod
```

编译了哪些文件：
```
tcc.c
libtcc.c
conftest.c
tccpp.c
tccgen.c
tccelf.c
tccasm.c
tccrun.c
x86_64-gen.c
x86_64-link.c
i386-asm.c
```
链接：
```shell
ar rcs libtcc.a libtcc.o tccpp.o tccgen.o tccelf.o tccasm.o tccrun.o x86_64-gen.o x86_64-link.o i386-asm.o
gcc -o tcc tcc.o libtcc.a -lm -lpthread -ldl  -s 
```
后面的所有C文件打包为静态库`libtcc.a`，链接`tcc.o`后生成`tcc`。

然后嵌套执行了`./lib/`目录中的Makefile。

仅看编译了的这部分代码的话，代码量在2W行左右，加上其他架构ARM、RISCV64等全部接近4W行。

## 8. 使用libtcc

先不关注`tcc`的对与命令行选项的处理。从编译相关的接口入手，或者说先写一个程序调用libtcc中的接口进行编译，来搞清编译主要流程之后再看其他的处理。

### 8.1 使用libtcc来编译一个源码

先看一下`libtcc.h`中定义的接口：
```c++
#ifndef LIBTCC_H
#define LIBTCC_H

#ifndef LIBTCCAPI
# define LIBTCCAPI
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*compilation context*/
struct TCCState;

typedef struct TCCState TCCState;

typedef void (*TCCErrorFunc)(void *opaque, const char *msg);

/* create a new TCC compilation context */
LIBTCCAPI TCCState *tcc_new(void);

/* free a TCC compilation context */
LIBTCCAPI void tcc_delete(TCCState *s);

/* set CONFIG_TCCDIR at runtime */
LIBTCCAPI void tcc_set_lib_path(TCCState *s, const char *path);

/* set error/warning display callback */
LIBTCCAPI void tcc_set_error_func(TCCState *s, void *error_opaque, TCCErrorFunc error_func);

/* return error/warning callback */
LIBTCCAPI TCCErrorFunc tcc_get_error_func(TCCState *s);

/* return error/warning callback opaque pointer */
LIBTCCAPI void *tcc_get_error_opaque(TCCState *s);

/* set options as from command line (multiple supported) */
LIBTCCAPI void tcc_set_options(TCCState *s, const char *str);

/*****************************/
/* preprocessor */

/* add include path */
LIBTCCAPI int tcc_add_include_path(TCCState *s, const char *pathname);

/* add in system include path */
LIBTCCAPI int tcc_add_sysinclude_path(TCCState *s, const char *pathname);

/* define preprocessor symbol 'sym'. value can be NULL, sym can be "sym=val" */
LIBTCCAPI void tcc_define_symbol(TCCState *s, const char *sym, const char *value);

/* undefine preprocess symbol 'sym' */
LIBTCCAPI void tcc_undefine_symbol(TCCState *s, const char *sym);

/*****************************/
/* compiling */

/* add a file (C file, dll, object, library, ld script). Return -1 if error. */
LIBTCCAPI int tcc_add_file(TCCState *s, const char *filename);

/* compile a string containing a C source. Return -1 if error. */
LIBTCCAPI int tcc_compile_string(TCCState *s, const char *buf);

/*****************************/
/* linking commands */

/* set output type. MUST BE CALLED before any compilation */
LIBTCCAPI int tcc_set_output_type(TCCState *s, int output_type);
#define TCC_OUTPUT_MEMORY   1 /* output will be run in memory (default) */
#define TCC_OUTPUT_EXE      2 /* executable file */
#define TCC_OUTPUT_DLL      3 /* dynamic library */
#define TCC_OUTPUT_OBJ      4 /* object file */
#define TCC_OUTPUT_PREPROCESS 5 /* only preprocess (used internally) */

/* equivalent to -Lpath option */
LIBTCCAPI int tcc_add_library_path(TCCState *s, const char *pathname);

/* the library name is the same as the argument of the '-l' option */
LIBTCCAPI int tcc_add_library(TCCState *s, const char *libraryname);

/* add a symbol to the compiled program */
LIBTCCAPI int tcc_add_symbol(TCCState *s, const char *name, const void *val);

/* output an executable, library or object file. DO NOT call
   tcc_relocate() before. */
LIBTCCAPI int tcc_output_file(TCCState *s, const char *filename);

/* link and run main() function and return its value. DO NOT call
   tcc_relocate() before. */
LIBTCCAPI int tcc_run(TCCState *s, int argc, char **argv);

/* do all relocations (needed before using tcc_get_symbol()) */
LIBTCCAPI int tcc_relocate(TCCState *s1, void *ptr);
/* possible values for 'ptr':
   - TCC_RELOCATE_AUTO : Allocate and manage memory internally
   - NULL              : return required memory size for the step below
   - memory address    : copy code to memory passed by the caller
   returns -1 if error. */
#define TCC_RELOCATE_AUTO (void*)1

/* return symbol value or NULL if not found */
LIBTCCAPI void *tcc_get_symbol(TCCState *s, const char *name);

/* return symbol value or NULL if not found */
LIBTCCAPI void tcc_list_symbols(TCCState *s, void *ctx,
    void (*symbol_cb)(void *ctx, const char *name, const void *val));

#ifdef __cplusplus
}
#endif

#endif

```
包含了以下接口：
- 编译环境设置。
    - `TCCState`结构就是编译的上下文，贯穿始终。
- 预处理
    - 添加头文件路径。
    - 添加系统头文件路径。
    - 处理宏定义符号。
- 编译
    - 添加以文件：c文件、dll文件、对象文件、库文件、链接脚本。
    - 编译一个包含C源代码的字符串。
- 链接
    - 设置输出文件类型：输出在内存中、可执行文件、对象文件、动态/静态链接库、预处理文件。
    - 添加库目录。
    - 添加一个符号。
    - 输出文件。
- 运行
    - 从`main`函数入口运行编译好的文件。
    - 重定位。

定义都在

### 8.2 libtcc使用示例

`./tests/libtcc_test.c`展示了libtcc的使用示例：
```c++
/*
 * Simple Test program for libtcc
 *
 * libtcc can be useful to use tcc as a "backend" for a code generator.
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "libtcc.h"

void handle_error(void *opaque, const char *msg)
{
    fprintf(opaque, "%s\n", msg);
}

/* this function is called by the generated code */
int add(int a, int b)
{
    return a + b;
}

/* this strinc is referenced by the generated code */
const char hello[] = "Hello World!";

char my_program[] =
"#include <tcclib.h>\n" /* include the "Simple libc header for TCC" */
"extern int add(int a, int b);\n"
"#ifdef _WIN32\n" /* dynamically linked data needs 'dllimport' */
" __attribute__((dllimport))\n"
"#endif\n"
"extern const char hello[];\n"
"int fib(int n)\n"
"{\n"
"    if (n <= 2)\n"
"        return 1;\n"
"    else\n"
"        return fib(n-1) + fib(n-2);\n"
"}\n"
"\n"
"int foo(int n)\n"
"{\n"
"    printf(\"%s\\n\", hello);\n"
"    printf(\"fib(%d) = %d\\n\", n, fib(n));\n"
"    printf(\"add(%d, %d) = %d\\n\", n, 2 * n, add(n, 2 * n));\n"
"    return 0;\n"
"}\n";

int main(int argc, char **argv)
{
    TCCState *s;
    int i;
    int (*func)(int);

    s = tcc_new();
    if (!s) {
        fprintf(stderr, "Could not create tcc state\n");
        exit(1);
    }

    assert(tcc_get_error_func(s) == NULL);
    assert(tcc_get_error_opaque(s) == NULL);

    tcc_set_error_func(s, stderr, handle_error);

    assert(tcc_get_error_func(s) == handle_error);
    assert(tcc_get_error_opaque(s) == stderr);

    /* if tcclib.h and libtcc1.a are not installed, where can we find them */
    for (i = 1; i < argc; ++i) {
        char *a = argv[i];
        if (a[0] == '-') {
            if (a[1] == 'B')
                tcc_set_lib_path(s, a+2);
            else if (a[1] == 'I')
                tcc_add_include_path(s, a+2);
            else if (a[1] == 'L')
                tcc_add_library_path(s, a+2);
        }
    }

    /* MUST BE CALLED before any compilation */
    tcc_set_output_type(s, TCC_OUTPUT_MEMORY);

    if (tcc_compile_string(s, my_program) == -1)
        return 1;

    /* as a test, we add symbols that the compiled program can use.
       You may also open a dll with tcc_add_dll() and use symbols from that */
    tcc_add_symbol(s, "add", add);
    tcc_add_symbol(s, "hello", hello);

    /* relocate the code */
    if (tcc_relocate(s, TCC_RELOCATE_AUTO) < 0)
        return 1;

    /* get entry symbol */
    func = tcc_get_symbol(s, "foo");
    if (!func)
        return 1;

    /* run the code */
    func(32);

    /* delete the state */
    tcc_delete(s);

    return 0;
}
```

步骤：
- tcc_new新建一个编译环境，最后需要调用tcc_delete释放。
- 设置错误输出设备和错误处理函数。
- 通过选项设置了包含目录和库目录。
- 设置输出类型。
- 编译字符串。
- 甚至中间添加符号到编译的程序中，可以获取到编译后的程序的符号。
- 重定位。
- 执行获取到的函数。


编译这个测试程序：
```shell
make libtcc_test
```
执行了命令：
```
gcc -o libtcc_test libtcc_test.c ../libtcc.a -fno-strict-aliasing -I.. -I..  -lm -lpthread -ldl
```
执行测试：
```shell
./libtcc_test -I.. -I../include -B..
```
执行结果
```
Hello World!
fib(32) = 2178309
add(32, 64) = 96
```

其中实时了编译了一个字符串，加载到了内存，取到了其中的一个函数的函数指针并进行了调用。

编译链接加载的过程都有了，可以先从这个流程入手。

### 8.3 调试测试程序

编译调试版本的libtcc_test，进行调试。
```
gcc -o libtcc_test libtcc_test.c ../libtcc.a -fno-strict-aliasing -I.. -I..  -lm -lpthread -ldl -g
```

编译环境：
```c++
struct TCCState {
    unsigned char verbose; /* if true, display some information during compilation */
    unsigned char nostdinc; /* if true, no standard headers are added */
    unsigned char nostdlib; /* if true, no standard libraries are added */
    unsigned char nocommon; /* if true, do not use common symbols for .bss data */
    unsigned char static_link; /* if true, static linking is performed */
    unsigned char rdynamic; /* if true, all symbols are exported */
    unsigned char symbolic; /* if true, resolve symbols in the current module first */
    unsigned char filetype; /* file type for compilation (NONE,C,ASM) */
    unsigned char optimize; /* only to #define __OPTIMIZE__ */
    unsigned char option_pthread; /* -pthread option */
    unsigned char enable_new_dtags; /* -Wl,--enable-new-dtags */
    unsigned int  cversion; /* supported C ISO version, 199901 (the default), 201112, ... */

    /* C language options */
    unsigned char char_is_unsigned;
    unsigned char leading_underscore;
    unsigned char ms_extensions; /* allow nested named struct w/o identifier behave like unnamed */
    unsigned char dollars_in_identifiers;  /* allows '$' char in identifiers */
    unsigned char ms_bitfields; /* if true, emulate MS algorithm for aligning bitfields */

    /* warning switches */
    unsigned char warn_none;
    unsigned char warn_all;
    unsigned char warn_error;
    unsigned char warn_write_strings;
    unsigned char warn_unsupported;
    unsigned char warn_implicit_function_declaration;
    unsigned char warn_discarded_qualifiers;
    #define WARN_ON  1 /* warning is on (-Woption) */
    unsigned char warn_num; /* temp var for tcc_warning_c() */

    unsigned char option_r; /* option -r */
    unsigned char do_bench; /* option -bench */
    unsigned char just_deps; /* option -M  */
    unsigned char gen_deps; /* option -MD  */
    unsigned char include_sys_deps; /* option -MD  */

    /* compile with debug symbol (and use them if error during execution) */
    unsigned char do_debug;
    unsigned char do_backtrace;
#ifdef CONFIG_TCC_BCHECK
    /* compile with built-in memory and bounds checker */
    unsigned char do_bounds_check;
#endif
    unsigned char test_coverage;  /* generate test coverage code */

    /* use GNU C extensions */
    unsigned char gnu_ext;
    /* use TinyCC extensions */
    unsigned char tcc_ext;

    unsigned char dflag; /* -dX value */
    unsigned char Pflag; /* -P switch (LINE_MACRO_OUTPUT_FORMAT) */

#ifdef TCC_TARGET_X86_64
    unsigned char nosse; /* For -mno-sse support. */
#endif
#ifdef TCC_TARGET_ARM
    unsigned char float_abi; /* float ABI of the generated code*/
#endif

    unsigned char has_text_addr;
    addr_t text_addr; /* address of text section */
    unsigned section_align; /* section alignment */
#ifdef TCC_TARGET_I386
    int seg_size; /* 32. Can be 16 with i386 assembler (.code16) */
#endif

    char *tcc_lib_path; /* CONFIG_TCCDIR or -B option */
    char *soname; /* as specified on the command line (-soname) */
    char *rpath; /* as specified on the command line (-Wl,-rpath=) */

    char *init_symbol; /* symbols to call at load-time (not used currently) */
    char *fini_symbol; /* symbols to call at unload-time (not used currently) */

    /* output type, see TCC_OUTPUT_XXX */
    int output_type;
    /* output format, see TCC_OUTPUT_FORMAT_xxx */
    int output_format;
    /* nth test to run with -dt -run */
    int run_test;

    /* array of all loaded dlls (including those referenced by loaded dlls) */
    DLLReference **loaded_dlls;
    int nb_loaded_dlls;

    /* include paths */
    char **include_paths;
    int nb_include_paths;

    char **sysinclude_paths;
    int nb_sysinclude_paths;

    /* library paths */
    char **library_paths;
    int nb_library_paths;

    /* crt?.o object path */
    char **crt_paths;
    int nb_crt_paths;

    /* -D / -U options */
    CString cmdline_defs;
    /* -include options */
    CString cmdline_incl;

    /* error handling */
    void *error_opaque;
    void (*error_func)(void *opaque, const char *msg);
    int error_set_jmp_enabled;
    jmp_buf error_jmp_buf;
    int nb_errors;

    /* output file for preprocessing (-E) */
    FILE *ppfp;

    /* for -MD/-MF: collected dependencies for this compilation */
    char **target_deps;
    int nb_target_deps;

    /* compilation */
    BufferedFile *include_stack[INCLUDE_STACK_SIZE];
    BufferedFile **include_stack_ptr;

    int ifdef_stack[IFDEF_STACK_SIZE];
    int *ifdef_stack_ptr;

    /* included files enclosed with #ifndef MACRO */
    int cached_includes_hash[CACHED_INCLUDES_HASH_SIZE];
    CachedInclude **cached_includes;
    int nb_cached_includes;

    /* #pragma pack stack */
    int pack_stack[PACK_STACK_SIZE];
    int *pack_stack_ptr;
    char **pragma_libs;
    int nb_pragma_libs;

    /* inline functions are stored as token lists and compiled last
       only if referenced */
    struct InlineFunc **inline_fns;
    int nb_inline_fns;

    /* sections */
    Section **sections;
    int nb_sections; /* number of sections, including first dummy section */

    Section **priv_sections;
    int nb_priv_sections; /* number of private sections */

    /* got & plt handling */
    Section *got;
    Section *plt;

    /* predefined sections */
    Section *text_section, *data_section, *rodata_section, *bss_section;
    Section *common_section;
    Section *cur_text_section; /* current section where function code is generated */
#ifdef CONFIG_TCC_BCHECK
    /* bound check related sections */
    Section *bounds_section; /* contains global data bound description */
    Section *lbounds_section; /* contains local data bound description */
#endif
    /* test coverage */
    Section *tcov_section;
    /* symbol sections */
    Section *symtab_section;
    /* debug sections */
    Section *stab_section;
    /* Is there a new undefined sym since last new_undef_sym() */
    int new_undef_sym;

    /* temporary dynamic symbol sections (for dll loading) */
    Section *dynsymtab_section;
    /* exported dynamic symbol section */
    Section *dynsym;
    /* copy of the global symtab_section variable */
    Section *symtab;
    /* extra attributes (eg. GOT/PLT value) for symtab symbols */
    struct sym_attr *sym_attrs;
    int nb_sym_attrs;
    /* ptr to next reloc entry reused */
    ElfW_Rel *qrel;
    #define qrel s1->qrel

#ifdef TCC_TARGET_RISCV64
    struct pcrel_hi { addr_t addr, val; } last_hi;
    #define last_hi s1->last_hi
#endif

#ifdef TCC_TARGET_PE
    /* PE info */
    int pe_subsystem;
    unsigned pe_characteristics;
    unsigned pe_file_align;
    unsigned pe_stack_size;
    addr_t pe_imagebase;
# ifdef TCC_TARGET_X86_64
    Section *uw_pdata;
    int uw_sym;
    unsigned uw_offs;
# endif
#endif

#ifndef ELF_OBJ_ONLY
    int nb_sym_versions;
    struct sym_version *sym_versions;
    int nb_sym_to_version;
    int *sym_to_version;
    int dt_verneednum;
    Section *versym_section;
    Section *verneed_section;
#endif

#ifdef TCC_IS_NATIVE
    const char *runtime_main;
    void **runtime_mem;
    int nb_runtime_mem;
#endif

#ifdef CONFIG_TCC_BACKTRACE
    int rt_num_callers;
#endif

    /* benchmark info */
    int total_idents;
    int total_lines;
    int total_bytes;
    int total_output[4];

    /* option -dnum (for general development purposes) */
    int g_debug;

    /* used by tcc_load_ldscript */
    int fd, cc;

    /* for warnings/errors for object files */
    const char *current_filename;

    /* used by main and tcc_parse_args only */
    struct filespec **files; /* files seen on command line */
    int nb_files; /* number thereof */
    int nb_libraries; /* number of libs thereof */
    char *outfile; /* output filename */
    char *deps_outfile; /* option -MF */
    int argc;
    char **argv;
};
```

编译的选项配置、C语言选项、内存边界检查、编译后生成的各个段全都在这里了，贯穿整个编译链接加载到执行过程的始终。

Section定义：看不懂，暂时不管。
```c++
/* section definition */
typedef struct Section {
    unsigned long data_offset; /* current data offset */
    unsigned char *data;       /* section data */
    unsigned long data_allocated; /* used for realloc() handling */
    TCCState *s1;
    int sh_name;             /* elf section name (only used during output) */
    int sh_num;              /* elf section number */
    int sh_type;             /* elf section type */
    int sh_flags;            /* elf section flags */
    int sh_info;             /* elf section info */
    int sh_addralign;        /* elf section alignment */
    int sh_entsize;          /* elf entry size */
    unsigned long sh_size;   /* section size (only used during output) */
    addr_t sh_addr;          /* address at which the section is relocated */
    unsigned long sh_offset; /* file offset */
    int nb_hashed_syms;      /* used to resize the hash table */
    struct Section *link;    /* link to another section */
    struct Section *reloc;   /* corresponding section for relocation, if any */
    struct Section *hash;    /* hash table for symbols */
    struct Section *prev;    /* previous section on section stack */
    char name[1];           /* section name */
} Section;
```
熟悉的`.text` `.data` `.bss`等段都会在`tcc_new`中调用`tccelf_new`创建。


### 8.4 编译过程

入口：`tcc_compile_string`直接调用`tcc_compile`

传入编译环境和源码字符串。

```c++
/* compile the file opened in 'file'. Return non zero if errors. */
static int tcc_compile(TCCState *s1, int filetype, const char *str, int fd)
{
    /* Here we enter the code section where we use the global variables for
       parsing and code generation (tccpp.c, tccgen.c, <target>-gen.c).
       Other threads need to wait until we're done.

       Alternatively we could use thread local storage for those global
       variables, which may or may not have advantages */

    tcc_enter_state(s1);
    s1->error_set_jmp_enabled = 1;

    if (setjmp(s1->error_jmp_buf) == 0) {
        s1->nb_errors = 0;

        if (fd == -1) {
            int len = strlen(str);
            tcc_open_bf(s1, "<string>", len);
            memcpy(file->buffer, str, len);
        } else {
            tcc_open_bf(s1, str, 0);
            file->fd = fd;
        }

        tccelf_begin_file(s1);
        preprocess_start(s1, filetype);
        tccgen_init(s1);
        if (s1->output_type == TCC_OUTPUT_PREPROCESS) {
            tcc_preprocess(s1);
        } else if (filetype & (AFF_TYPE_ASM | AFF_TYPE_ASMPP)) {
            tcc_assemble(s1, !!(filetype & AFF_TYPE_ASMPP));
        } else {
            tccgen_compile(s1);
        }
    }
    tccgen_finish(s1);
    preprocess_end(s1);

    s1->error_set_jmp_enabled = 0;
    tcc_exit_state(s1);

    tccelf_end_file(s1);
    return s1->nb_errors != 0 ? -1 : 0;
}
```

主要步骤：
- `tcc_enter_state`
- `tccelf_begin_file`
- `preprocess_start`
- `tccgen_compile`
- `tccgen_finish`
- `preprocess_end`
- `tcc_exit_state`
- `tccelf_end_file`

感觉代码风格太C了，读起来真的那叫一个晦涩，太难懂了，TODO。


