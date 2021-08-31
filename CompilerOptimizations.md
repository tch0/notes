<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [主流编译优化方法一览](#%E4%B8%BB%E6%B5%81%E7%BC%96%E8%AF%91%E4%BC%98%E5%8C%96%E6%96%B9%E6%B3%95%E4%B8%80%E8%A7%88)
  - [地址优化(Address Optimization)](#%E5%9C%B0%E5%9D%80%E4%BC%98%E5%8C%96address-optimization)
  - [通过地址的别名优化(Alias Optimization by address)](#%E9%80%9A%E8%BF%87%E5%9C%B0%E5%9D%80%E7%9A%84%E5%88%AB%E5%90%8D%E4%BC%98%E5%8C%96alias-optimization-by-address)
  - [通过const限定的别名优化(Alias Optimization (const qualified))](#%E9%80%9A%E8%BF%87const%E9%99%90%E5%AE%9A%E7%9A%84%E5%88%AB%E5%90%8D%E4%BC%98%E5%8C%96alias-optimization-const-qualified)
  - [通过类型的别名优化(Alias Optimization (by type))](#%E9%80%9A%E8%BF%87%E7%B1%BB%E5%9E%8B%E7%9A%84%E5%88%AB%E5%90%8D%E4%BC%98%E5%8C%96alias-optimization-by-type)
  - [数组边界优化(Array Bounds Optimization)](#%E6%95%B0%E7%BB%84%E8%BE%B9%E7%95%8C%E4%BC%98%E5%8C%96array-bounds-optimization)
  - [位域优化(Bitfield Optimization)](#%E4%BD%8D%E5%9F%9F%E4%BC%98%E5%8C%96bitfield-optimization)
  - [分支消除(Branch Elimination)](#%E5%88%86%E6%94%AF%E6%B6%88%E9%99%A4branch-elimination)
  - [循环折叠与展开(Loop Collapsing/Unrolling)](#%E5%BE%AA%E7%8E%AF%E6%8A%98%E5%8F%A0%E4%B8%8E%E5%B1%95%E5%BC%80loop-collapsingunrolling)
  - [指令组合(Instruction Combining)](#%E6%8C%87%E4%BB%A4%E7%BB%84%E5%90%88instruction-combining)
  - [常量折叠(Constant Folding)](#%E5%B8%B8%E9%87%8F%E6%8A%98%E5%8F%A0constant-folding)
  - [常量传播(Constant Propagation)](#%E5%B8%B8%E9%87%8F%E4%BC%A0%E6%92%ADconstant-propagation)
  - [公共子表达式消除(Common Subexpression Elimination)](#%E5%85%AC%E5%85%B1%E5%AD%90%E8%A1%A8%E8%BE%BE%E5%BC%8F%E6%B6%88%E9%99%A4common-subexpression-elimination)
  - [死代码消除(Dead Code Elimination)](#%E6%AD%BB%E4%BB%A3%E7%A0%81%E6%B6%88%E9%99%A4dead-code-elimination)
  - [整数乘除法优化(Integer Mutiply/Divide Optimization)](#%E6%95%B4%E6%95%B0%E4%B9%98%E9%99%A4%E6%B3%95%E4%BC%98%E5%8C%96integer-mutiplydivide-optimization)
  - [整数取模优化(Integer Mod Optimization)](#%E6%95%B4%E6%95%B0%E5%8F%96%E6%A8%A1%E4%BC%98%E5%8C%96integer-mod-optimization)
  - [表达式简化(Expression Simplification)](#%E8%A1%A8%E8%BE%BE%E5%BC%8F%E7%AE%80%E5%8C%96expression-simplification)
  - [Forward Store](#forward-store)
  - [循环裂变和融合(Loop fission and fusion)](#%E5%BE%AA%E7%8E%AF%E8%A3%82%E5%8F%98%E5%92%8C%E8%9E%8D%E5%90%88loop-fission-and-fusion)
  - [垃圾收集优化(Garbage Collection Optimization)](#%E5%9E%83%E5%9C%BE%E6%94%B6%E9%9B%86%E4%BC%98%E5%8C%96garbage-collection-optimization)
  - [分离循环中不变部分(Hoisting)](#%E5%88%86%E7%A6%BB%E5%BE%AA%E7%8E%AF%E4%B8%AD%E4%B8%8D%E5%8F%98%E9%83%A8%E5%88%86hoisting)
  - [If优化(If Optimization)](#if%E4%BC%98%E5%8C%96if-optimization)
  - [函数内联(Function Inlining)](#%E5%87%BD%E6%95%B0%E5%86%85%E8%81%94function-inlining)
  - [循环变量消除(Induction Variable Elimination)](#%E5%BE%AA%E7%8E%AF%E5%8F%98%E9%87%8F%E6%B6%88%E9%99%A4induction-variable-elimination)
  - [合并块(Block Merging)](#%E5%90%88%E5%B9%B6%E5%9D%97block-merging)
  - [窄化转换优化(Narrowing)](#%E7%AA%84%E5%8C%96%E8%BD%AC%E6%8D%A2%E4%BC%98%E5%8C%96narrowing)
  - [New表达式优化(New Expression Optimization)](#new%E8%A1%A8%E8%BE%BE%E5%BC%8F%E4%BC%98%E5%8C%96new-expression-optimization)
  - [Printf优化(Printf Optimization)](#printf%E4%BC%98%E5%8C%96printf-optimization)
  - [快速优化(Quick Optimization)](#%E5%BF%AB%E9%80%9F%E4%BC%98%E5%8C%96quick-optimization)
  - [基于值范围的优化(Value Range Optimization)](#%E5%9F%BA%E4%BA%8E%E5%80%BC%E8%8C%83%E5%9B%B4%E7%9A%84%E4%BC%98%E5%8C%96value-range-optimization)
  - [静态变量优化(Static Optimization)](#%E9%9D%99%E6%80%81%E5%8F%98%E9%87%8F%E4%BC%98%E5%8C%96static-optimization)
  - [尾递归优化(Tail Recursion Optimization)](#%E5%B0%BE%E9%80%92%E5%BD%92%E4%BC%98%E5%8C%96tail-recursion-optimization)
  - [Try/Catch块优化(Try/Catch Block Optimization)](#trycatch%E5%9D%97%E4%BC%98%E5%8C%96trycatch-block-optimization)
  - [Unswitching](#unswitching)
  - [虚函数优化(Virtual Function Optimization)](#%E8%99%9A%E5%87%BD%E6%95%B0%E4%BC%98%E5%8C%96virtual-function-optimization)
  - [结语](#%E7%BB%93%E8%AF%AD)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 主流编译优化方法一览

主要参考自：[Compiler Optimizations](https://compileroptimizations.com/index.html)，基本都是直接翻译过来的。

各种编译优化方法的简要描述，示例和优化后的等效代码转换。普及总览作用，不深入，有的话附对应wiki链接。

不深入了解编译原理看这些东西的话，总有种雾里看花，不学走先学跑的感觉。

名词解释：
- 架构一般说的是处理器硬件架构，比如x86，arm等。

## 地址优化(Address Optimization)

一些架构中，引用一个保存在常量地址的全局变量一般需要两条指令，而通过指针引用只要一条。一般来说使用指针和偏移比使用变量快。

许多程序里的全局变量数量相对来说不多，经常可以放在一个全局变量池中。对这些程序来说，这些全局的变量和尺寸比较小的全局数组可以通过一个指针可一个偏移来访问，以避免代价更高的加载保存指令序列并且可以减少生成代码长度。

例：这个三个全局变量就可以被放到连续的内存区域，然后通过一个指针和偏移来引用。
```C
int a;
int b;
int c;

void f (void)
{
    a = 3;
    b = 5;
    c = 7;
    return;
}
```
优化后等效C代码：放到全局内存池。
```C
int __t1[3];               /* global pool for a, b, c */
int *__t2 = &__t1[0];      /* pointer to global pool */

void f (void)
{
    *__t2 = 3;               /* a = 3; */
    *(__t2 + 1) = 5;         /* b = 5; */
    *(__t2 + 2) = 7;         /* c = 7; */
    return;
}
```

说明：
- 这个优化通常要求编译器和链接器合作能够更加有效。特别是，编译时全局变量的数量和偏移还未确定。
- 一些编译器支持命令行选项控制全局变量的最大数量然后以此来分配全局内存池。
- 一些ABI定义了寄存器保存全局内存池的指针。
- 如果ABI没有定义全局内存池指针，那么加载一个指针可能相比直接加载全局变量来说代价更高。
- 这个优化应该被启发式的控制，比如一个函数中访问全局变量的次数。次数很多的话可以优化，次数很少则没必要。

## 通过地址的别名优化(Alias Optimization by address)

保存了指向不同数组成员的指针不可能冲突，即是不知道具体的偏移。

例：p和q是不同数组的成员指针，不可能是同一个。
```C
int a[], b[];

void f (int i, int j)
{
    int *p, *q;
    int x, y;
    p = &a[i];
    q = &b[j];
    x = *(q + 3);
    *p = 5;
    y = *(q + 3);
    g (x, y);
}
```
那么y就可以优化掉，因为知道是不同数组，改变`*p`不可能会影响x。
```C
int a[], b[];

void f(int i, int j)
{
    int *p, *q;
    int x, y;
    p = &a[i];
    q = &b[j];
    x = *(q + 3);
    *p = 5;
    g (x, x);
}
```

## 通过const限定的别名优化(Alias Optimization (const qualified))

const修饰的对象不能修改，因此在显式通过赋值修改一个变量的表达式中不可能是一个左值的别名。

```C
const int const_array[];

void f (int *p, int i)
{
    int x, y;
    const int *q = &const_array[i];
    x = *q;
    *p = 5;
    y = *q;
    g (x, y);
}
```

其中`p`不可能是`q`的别名，所以可以这样优化：
```C
const int const_array[];

void f (int *p, int i)
{
    int x, y;
    const int *q = &const_array[i];
    x = *q;
    *p = 5;
    g (x, x);
}
```

说明：
- 仅仅只有`q`是一个`const int *`是不充分的，因为标准ANSI C允许其指向非const对象。这种情况下没有多余信息的情况下就不能实施这个优化。
- 这个优化并不常见，尽管有一些编译器支持。

## 通过类型的别名优化(Alias Optimization (by type))

简单而言就是通过语言规定通过判断类型不同假定了两个变量不会是同一个变量的别名，基于这个假定来做一些别名优化。也就是重复操作的优化。

例：
```c
void f (short *ps, int *pi)
{
  int i, j;
  i = *pi;
  *ps = 3;
  j = *pi;
  g (i, j);
}
```

优化后：
```c
void f (short *ps, int *pi)
{
  int i, j;
  i = *pi;
  *ps = 3;
  g (i, i);
}
```

## 数组边界优化(Array Bounds Optimization)

也可以叫边界检查消除，在强制检查数组下标的运行时系统中将一部分可能的检查分配到编译期可以获得可观的性能提升，比如Java。

例：下列代码中，`a[0],a[1]...`等的下标检查可以在编译时进行。
```java
{
    int a[], notused;
    a = new int[100];
    notused = a[0]; notused = a[1]; ...
}
```
再经过一些其他优化：
```java
{
    // Once Array Bounds Optimization is performed, all other
    // statements can be optimized away.
}
```

说明：
- 数组边界优化可以在常量传播的过程中轻易实现，更高级的数组边界优化需要范围分析。
- 数组边界优化是任何Java优化器中最重要的优化之一，某些时候编译器甚至不得不重排控制结构来确保数组边界检查。

Wiki: https://en.wikipedia.org/wiki/Bounds-checking_elimination

## 位域优化(Bitfield Optimization)

存储和读取具体的比特位代价通常比较高，大部分架构都不支持内存比特操作，而是需要一系列加载、移位、掩码、存储指令才能做到。通过各种各样位域优化可以提升运行时性能：将位域保存在寄存器中、位域级别的常量传播，组合相邻的位域的存储为一次存储等。


例：两次位域赋值可以被组合为一次，减少相应的加载、移位、掩码、存储操作。
```c
struct
{
    int bit1 : 1;
    int bit2 : 1;
} bits;

bits.bit1 = 1;
bits.bit2 = 1;
```

优化后：将两个二进制位的赋值组合到一次整数赋值。
```c
struct
{
    int t : 2;   /* compiler-generated alias for bit1 and bit2 */
} bits;

bits.t = 3;
```

## 分支消除(Branch Elimination)

消除仅仅到另一个分支的分支，消除中间过程，直接到目标分支。

例：
```C
    goto L1;
    /* other code */
L1:
    goto L2;
```
优化后：
```C
    goto L2;
    /* other code */
L1:
    goto L2;
```

## 循环折叠与展开(Loop Collapsing/Unrolling)

折叠：某些嵌套循环可以被折叠到单循环以减少循环的性能，提高运行时性能。

展开：将多次循环合并到一次，减少循环次数。


循环折叠例：
```C
int a[100][300];

for (i = 0; i < 300; i++)
    for (j = 0; j < 100; j++)
        a[j][i] = 0;
```
优化后：
```c
int a[100][300];
int *p = &a[0][0];

for (i = 0; i < 30000; i++)
    *p++ = 0;
```

循环展开：
```c
for (i = 0; i < 100; i++)
    g ();
```
优化后：
```c
for (i = 0; i < 100; i += 2)
{
    g ();
    g ();
}
```

说明：
- 循环折叠可以提升进行其他优化比如循环展开的机会。
- 在一般C编译器可能并不常见，但在一些科学计算，GPU编程之类可能比较常见。

## 指令组合(Instruction Combining)

在源码级别，将两条可能的语句组合成一条等效语句。在IL（中间语言）级别，将两条指令组合为一条。

例：
```C
int i;

void f (void)
{
    i++;
    i++;
}
```

优化后：
```c
int i;

void f (void)
{
    i += 2;
}
```

说明：
- 许多指令都是指令组合的候选，比如`+-*<<>>&^|`。
- 指令组合可以在块内部做，也可以横跨块作用域，前者较多，后者较少。
- 循环展开可以为指令组合提供额外的机会。

## 常量折叠(Constant Folding)

编译期计算常量表达式。

例：
```c
int f (void)
{
    return 3 + 5;
}
```

```c
int f (void)
{
    return 8;
}
```

说明：
- 相对来说容易做。
- 一般程序员不太会直接写一个常量表达式出来，但比较常见于宏展开和常量传播后。
- 所有的C编译器都可以折叠宏展开后的常量表达式，大部分C编译器也可以折叠经过其他优化后的常量表达式。
- 浮点数可能需要留到运行时计算，如果舍入模式在编译期没有确定的话。

Wiki: https://en.wikipedia.org/wiki/Constant_folding

## 常量传播(Constant Propagation)

替代表达式中已知常数，被初始化为常数的变量在它真正被修改之前使用的地方都替换为常量。

例：
```c
x = 3;
y = x + 4;
```

优化后：
```c
x = 3;
y = 7;
```

说明：
- 可以在基本块也可以在更复杂的控制流中做常量传播。
- 一些编译器为整型做，但不为浮点数做。
- 和常量折叠交替使用，直到不能优化。
- 很少有编译器在位域赋值时也进行常量传播。

Wiki: https://en.wikipedia.org/wiki/Constant_folding


## 公共子表达式消除(Common Subexpression Elimination)

CSE，编译器会视情况将多个相同的表达式替换成一个变量，这个变量存储着计算该表达式后所得到的值。

例：
```c
i = x + y + 1;
j = x + y;
```

优化后：
```c
t1 = x + y;
i = t1 + 1;
j = t1;
```

- 各大编译器都有实现。

Wiki: https://en.wikipedia.org/wiki/Common_subexpression_elimination

## 死代码消除(Dead Code Elimination)

消除执行不到、无意义、对结果无影响的代码，DCE。包括：
- unreachable code
- Dead Variables

例：
```c
int global;
void f ()
{
    int i;
    i = 1;          /* dead store */
    global = 1;     /* dead store */
    global = 2;
    return;
    global = 3;     /* unreachable */
}
```

优化后：
```c
int global;
void f ()
{
    global = 2;
    return;
}
```
Wiki: https://en.wikipedia.org/wiki/Dead_code_elimination


## 整数乘除法优化(Integer Mutiply/Divide Optimization)

对2的幂的整数乘除法可以优化为移位。

例：
```c
int f (unsigned int i)
{
    return i / 2;
}

int f2 (int i)
{
    return i * 4;
}
```

优化后：
```c
int f (unsigned int i)
{
    return i >> 1;
}

int f2 (int i)
{
  return i << 2;
}
```

说明：
- 需要考虑是否结果是否一定正确。
- 除法：对有符号、无符号，正数、负数被除数，四种排列组合都可以优化，但需要考虑正确性。
- 乘法一般各种情况都不会有问题。

## 整数取模优化(Integer Mod Optimization)

整数对2的幂取模，可以用移位和条件替代。

例：
```c
int f (int x)
{
    return x % 8;
}
```

优化后：
```c
int f (int x)
{
    int temp = x & 7;
    return (x < 0) ? ((temp == 0) ? 0 : (temp | ~7)) : temp;
}
```

## 表达式简化(Expression Simplification)

一些表达式可以被等价的更简单的表达式替代。

例：
```c
void f (int i)
{
    a[0] = i + 0;
    a[1] = i * 0;
    a[2] = i - i;
    a[3] = 1 + i + 1;
}
```

优化后：
```c
void f (int i)
{
    a[0] = i;
    a[1] = 0;
    a[2] = 0;
    a[3] = 2 + i;
}
```

说明：
- 这种优化其实应该程序员来做。
- 不过可能会常见宏展开后的表达式、数组下标计算等，还是有必要的。

## Forward Store

存储循环中的全局变量访问到寄存器，减少加载保存次数。

例：
```c
int sum;

void f (void)
{
    int i;
    sum = 0;
    for (i = 0; i < 100; i++)
        sum += a[i];
}
```

优化后：这里的意思是将sum的中间结果保存到寄存器中。
```c
int sum;

void f (void)
{
    int i;
    register int t;
    t = 0;
    for (i = 0; i < 100; i++)
        t += a[i];
    sum = t;
}
```

## 循环裂变和融合(Loop fission and fusion)

循环裂变是指将一个循环，其中有多个互不相干的步骤分解成多个循环，在多核处理器中并行执行，以此来加快执行速度。

反过来来，循环融合则是将多个循环条件一致互不相关的循环融合为一个，减少条件和迭代部分的消耗，减少总体指令数量。

融合的例子：
```c
for (i = 0; i < 300; i++)
    a[i] = a[i] + 3;

for (i = 0; i < 300; i++)
    b[i] = b[i] + 4;
```
融合后：
```c
for (i = 0; i < 300; i++)
{
    a[i] = a[i] + 3;
    b[i] = b[i] + 4;
}
  
```
裂变就是反过来。

说明：
- 需要循环条件和迭代情况完全一致，而且要循环体没有依赖关系。
- 循环融合不一定就能提升速度，一般来说单一循环比如上述例子，融合前有更好的空间局部性。导致最终可能会有更好的缓存命中率。
- 这两个过程都可以是编译优化的方法，条件也很苛刻，一般可能用不上，都可能负优化。
- 但可能会用于那种大量计算，数据没有依赖，并行度可以很高的程序可能会非常需要这种优化。对那种问题而言，编程语言层面的设计可能就会考虑这种问题。

Wiki: https://en.wikipedia.org/wiki/Loop_fission_and_fusion

## 垃圾收集优化(Garbage Collection Optimization)

不必要的垃圾收集器的调用调用成本不应该比空函数高太多。高效率的内存分配也是编译优化的一部分？

例：
```java
System.gc() ; // First call to the garbage collector
System.gc() ;
System.gc() ;
System.gc() ;
System.gc() ; // Fifth call to the garbage collector
```

优化后：
```java
System.gc() ; // First call to the garbage collector
emptyFunction() ; 
emptyFunction() ;
emptyFunction() ;
emptyFunction() ;
```

说明：
- 垃圾收集会自动回收堆内存，通过一个守护线程实现垃圾收集。可以通过显式调用`System.gc()`回收垃圾。
- 一般程序员不会手动回收内存，垃圾收集器会自动在合适的时间点回收内存。这种调用可能会使其他优化的结果。

## 分离循环中不变部分(Hoisting)

将循环中进行的重复计算中不依赖于循环的部分剥离到循环外做。

例：
```c
void f (int x, int y)
{
    int i;
    for (i = 0; i < 100; i++)
    {
        a[i] = x + y;
    }
}
```
优化后：x+y的结果与循环变量、中间结果没有任何关系，可以剥离出来计算。
```c
void f (int x, int y)
{
    int i;
    int t;
    t = x + y;
    for (i = 0; i < 100; i++)
    {
        a[i] = t;
    }
}
```

## If优化(If Optimization)

if条件块中if的条件一定是true，else块中if中的条件一定是false，如果其中还有同样的条件判断，那么则可以优化。前提是中间没有可能修改了条件的结果的语句。

例：
```c
void f (int *p)
{
    if (p)
    {
        g(1);
        if (p) g(2);
        g(3);
    }
    return;
}

void f2 (int *p)
{
    if (p) g(1);
    if (p) g(2);
    return;
}
```

优化后：
```c
void f (int *p)
{
    if (p)
    {
        g(1);
        g(2);
        g(3);
    }
    return;
}

void f2 (int *p)
{
    if (p)
    {
        g(1);
        g(2);
    }
    return;
}
```

## 函数内联(Function Inlining)

消除比较简单的函数调用开销。

例：
```c
int add (int x, int y)
{
    return x + y;
}

int sub (int x, int y)
{
    return add (x, -y);
}
```

优化后：
```c
int sub (int x, int y)
{
    return x + -y;
}
```
进一步优化：
```c
int sub (int x, int y)
{
    return x - y;
}
```

- 内联的函数一般比较简单，否则函数调用很多时可能会增加代码体积。
- C/C++中有inline关键字指导内联。

看一下C的内联优化：
```c
// inline.c
int add (int x, int y)
{
    return x + y;
}

int sub (int x, int y)
{
    return add (x, -y);
}
```
```shell
gcc -S inline.c
```
```x86asm
	.file	"inline.c"
	.text
	.globl	_add
	.def	_add;	.scl	2;	.type	32;	.endef
_add:
LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE0:
	.globl	_sub
	.def	_sub;	.scl	2;	.type	32;	.endef
_sub:
LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	12(%ebp), %eax
	negl	%eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_add
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1:
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
```
add函数加了inline之后：
```x86asm
	.file	"inline.c"
	.text
	.globl	_sub
	.def	_sub;	.scl	2;	.type	32;	.endef
_sub:
LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	negl	%eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_add
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1:
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
	.def	_add;	.scl	2;	.type	32;	.endef
```

## 循环变量消除(Induction Variable Elimination)

对于有多个循环变量（并不一定要在条件中，指每次迭代都会累加、累减做同样的变化的变量）的循环，合适的话可以消除到仅剩一个循环变量。

例：
```c
int a[SIZE];
int b[SIZE];

void f (void)
{
    int i1, i2, i3;
    for (i1 = 0, i2 = 0, i3 = 0; i1 < SIZE; i1++)
        a[i2++] = b[i3++];
    return;
}
```

优化后：
```c
int a[SIZE];
int b[SIZE];

void f (void)
{
    int i1;
    for (i1 = 0; i1 < SIZE; i1++)
        a[i1] = b[i1];
    return;
}
```

说明：
- 用于减少循环中累加累减的次数。

Wiki: https://en.wikipedia.org/wiki/Induction_variable

## 合并块(Block Merging)

合并多个小块为更大的块。

例：
```c
int a;
int b;

void f (int x, int y)
{
    goto L1;                 /* basic block 1 */

L2:                          /* basic block 2 */
    b = x + y;
    goto L3;

L1:                          /* basic block 3 */
    a = x + y;
    goto L2;

L3:                          /* basic block 4 */
    return;
}
```
重新组织后为一个大的基本块之后：
```c
int a;
int b;

void f (int x, int y)
{
    a = x + y;                 /* basic block 1 */
    b = x + y;
    return;
}
```

再做一个CSE：
```c
int a;
int b;

void f (int x, int y)
{
    register int __t;          /* compiler generated temp */
    __t = x + y;               /* assign CSE to temp */
    a = __t;
    b = __t;
    return;
}
```

说明：
- 这个例子中的代码并不具有代表性，一般不会再源码级别这么写。
- 但是这种代码可能常见于经过其他转换之后的编译器中间语言表示。


## 窄化转换优化(Narrowing)

一些范围比较小的整数在某些表达式中可以优化。

例：下面的表示式结果都是0，即是不知道值。
```c
unsigned short int s;

(s >> 20)      /* all bits of precision have been shifted out, thus 0 */
(s > 0x10000)  /* 16 bit value can't be greater than 17 bit, thus 0 */
(s == -1)      /* can't be negative, thus 0 */
```

说明：
- 这种类型的表达式可能说明程序中出现了错误。编译器甚至可能发出警告。
- 程序员可能不会这样写，但是可能出现在宏展开或者某些优化后。

## New表达式优化(New Expression Optimization)

对于有垃圾收集的语言，通过new分配内存，垃圾收集器会自动回收，比如java。如果一个分配了的内存从未使用，那么可以直接不分配。以减少内存分配和默认初始化的消耗。


例：
```java
{
    int a[];
    a = new int[100];
}
```

优化后：
```java
{
    // a not used and hence not allocated/initialized
}
```

说明：
- 这是非常重要的优化。某些程序可能不需要默认初始化。
- 检测这种情况可以避免大数组的默认初始化造成的性能损耗。

## Printf优化(Printf Optimization)

C语言中，编译时解析printf的格式字符串，并用合适的调用替代，可以优化运行时性能。

例：
```c
#include <stdio.h>

void f (char *s)
{
    printf ("%s", s);
}
```
优化后：
```c
#include <stdio.h>

void f (char *s)
{
    fputs (s, stdout);
}
```

## 快速优化(Quick Optimization)

Java字节码可以在运行时修改以获得更好的性能。动态的替换某些特定的JVM指令，比如连续地使用某个变量，中间没有改。每次使用都需要去解析这个变量的入口。那么第一次解析后，后续都不需要了。

例：
```java
{
    for(i = 0; i < 10; i++)
        arr[i] = obj.i + volatile_var;
}
```

优化后：优化后的字节码的逻辑类似于这个样子。
```java
{
    t = obj.i;
    for(i = 0; i < 10; i++)
        arr[i] = t + volatile_var;
}
```

说明：
- 运行时的优化。
- 不必要对常量池中变量的引用可以不用去真正访问到变量。
- 一些编程语言提供特性让程序员控制是否执行这种优化，比如C++的`volatile`关键字修饰的变量，要求执行到时一定要去访问这个变量的内存。主要用于看起来没有变但是可能在运行时通过其他方式同时修改的变量，比如在其他的线程中可能进行修改的变量。用于抑制某些编译器优化。

## 基于值范围的优化(Value Range Optimization)

一些值可能是变化的，但是范围是确定的，基于这个范围可能可以进行某些优化。

例：
```c
for (i = 1; i < 100; i++)
{
    if (i)
        g ();
}
```

优化后：
```c
for (i = 1; i < 100; i++)
{
    g ();
}
```

说明：
- 没有在各种编译器产品中得到普遍支持。


## 静态变量优化(Static Optimization)

如果循环中使用静态变量，可能的话可以将其保存到寄存器优化。

例：每次都要去获取变量i代价太大了。
```c
int a[SIZE];

void f (void)
{
    static int i;

    for (i = 0; i < SIZE; i++)
        a[i] = i;
}
```
优化后：
```c
int a[SIZE];

void f (void)
{
    register int i;
    for (i = 0; i < SIZE; i++)
        a[i] = i;
}
```

循环中频繁使用的貌似都可以这种思路，无论全局、静态还是局部变量，用寄存器缓存之后访问会快很多。前提是有多余的寄存器来存。


## 尾递归优化(Tail Recursion Optimization)

尾递归可以被循环替代，减少了递归调用中函数调用的消耗。高级编程语言中都会提，尾递归更应该在源码级别由程序员来优化。

例：
```c
int f (int i)
{
    if (i > 0)
    {
        g (i);
        return f (i - 1);
    }
    else
        return 0;
}
```

优化后：优化后中间语言、汇编语言等价代码。
```c
int f (int i)
{
    entry:
    if (i > 0)
    {
        g (i);
        i--;
        goto entry;
    }
    else
        return 0;
}
```

## Try/Catch块优化(Try/Catch Block Optimization)

不可能抛出异常的try/catch块不进行try/catch。

例：
```c++
try {
    a = 1;
} catch (Exception e) 
    //...
}
```
优化后：
```c++
a = 1;
```

## Unswitching

与循环变量无关的判断移到循环外做。源码层面就可以做。

例：
```c
for (i = 0; i < N; i++)
    if (x)
        a[i] = 0;
    else
        b[i] = 0;
```

优化后：
```c
if (x)
    for (i = 0; i < N; i++)
        a[i] = 0;
    else
        for (i = 0; i < N; i++)
            b[i] = 0;
```

## 虚函数优化(Virtual Function Optimization)

面向对象的编程语言中，虚函数的调用因为晚绑定都会比正常非虚函数调用成本更高。如果编译时能确定对象类型，能确定最终调哪个类的函数，那么就可以进行优化。

```java
class TestClass {
    public void VirtualGetOne() { return ; }
    public final void GetOne() { return ; }
}
class myclass {
    public void myfunction() {
        TestClass c1 = new TestClass() ;
        c1.VirtualGetOne() ;
    }
}
```

优化后：
```java
class TestClass {
    public void VirtualGetOne() { return ; }
    public final void GetOne() { return ; }
}
class myclass {
    public void myfunction() {
        TestClass c1 = new TestClass() ;
        c1.GetOne() ;
    }
}
```


## 结语

作为了解之用，并不细节，也并没有实现方式，有个印象就行，如果以后写编译器或者阅读编译器实现时思考一下可不可以实现、有没有这些东西就行。

很多优化还是很简单的，比如：
- 常量折叠传播。
- 公共子表达式消除。
- 死代码剔除。
- 2的幂次整数乘除法优化。

某些优化感觉局限性很大，只能用于很少的场合。