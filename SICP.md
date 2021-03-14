<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [学习SICP的笔记](#%E5%AD%A6%E4%B9%A0sicp%E7%9A%84%E7%AC%94%E8%AE%B0)
  - [0. 事前准备](#0-%E4%BA%8B%E5%89%8D%E5%87%86%E5%A4%87)
    - [0.1 什么是Lisp](#01-%E4%BB%80%E4%B9%88%E6%98%AFlisp)
    - [0.2 环境搭建](#02-%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA)
  - [1.0 构造过程抽象](#10-%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1)
    - [1.1 程序设计的基本要素](#11-%E7%A8%8B%E5%BA%8F%E8%AE%BE%E8%AE%A1%E7%9A%84%E5%9F%BA%E6%9C%AC%E8%A6%81%E7%B4%A0)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 学习SICP的笔记

![SICP](./Images/SICP_book_cover.jpg)

写在前面：

本来我的打算是直接动手学Lisp并尝试从0开始写一个解释器，但是明明有好的老师就在手边，明明就可以站在巨人肩膀上，那为什么要去闭门造车浪费时间制造垃圾呢？突然想起了第一章都还未看完的SICP。于是决定学习一下并结合实践完成以下目标：
1. 学懂Lisp语言，当然这里指的是Scheme。
2. 使用Scheme实现一个Scheme解释器。
3. 用C++实现Scheme解释器。
4. 用Python实现Scheme解释器，可选。
5. 理解所谓的抽象。

SICP，Structure and Interpretation of Computer Programs，中文译为[计算及程序的构造和解释](https://book.douban.com/subject/1148282/)。MIT20年来的经典教材，以Lisp方言Scheme为教学语言，现在好像换成了Python。

首先搜集足够的资料，供不时查阅参考以补充自己思考的漏洞：
- [SICP Solutions](http://community.schemewiki.org/?SICP-Solutions)：SICP的课后习题解答。下方同时也列出了许多老哥自己的解答。
- [中文SICP题解](https://sicp.readthedocs.io/en/latest/)
- [MIT的SICP公开课](https://www.bilibili.com/video/BV1Xx41117tr) bilibili搬运。
- [MIT的SICP课程主页](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/)
- [SICP英文版全文](https://sarabander.github.io/sicp/html/index.xhtml)
- [*Yet Another Scheme Tutorial*](http://deathking.github.io/yast-cn/): 一本Scheme入门教程的中文版翻译。
- [一个SICP开发环境配置教程](https://zhuanlan.zhihu.com/p/37056659)

粗略的将SICP前三章讲软件工程(较为简单)，后两章讲编译原理（解释器）(略难)。Scheme语言简洁而简单，完全不需要惧怕一门新的编程语言而畏惧这本书。如果只用两个字来概括整本书，那么一定就是“抽象”。笔记的结构编排将会与SICP书籍完全一致。

## 0. 事前准备

### 0.1 什么是Lisp

- 一门古老的编程语言，由John McCarthy创造于1959年，是Fortran(诞于1957)之后第二古老的高级编程语言。全称是LISt Processor，也就是表处理语言。
- 当今最广为人知的是它的两大方言：Common Lisp和Scheme。其中Scheme被人熟知是作为MIT的编程入门语言以及许多人推荐的儿童编程语言。SICP中使用Scheme语言进行教学。

### 0.2 环境搭建

## 1.0 构造过程抽象

### 1.1 程序设计的基本要素

将以Scheme为例说明。

- 程序设计的两类要素：
    - 数据：我们希望去操作的东西。
    - 过程：操作数据的规则的描述。

- 表达式：
    - 最基本的表达式：数，如114514。
    - 组合式：表示一个过程，使用运算符将各个表达式组合起来。放在一个`()`中，运算符位于最左端`(* 114514 (+ (*1919 1000) 810))`。可以嵌套。
- 环境/上下文：保存名称-值的词典，为符号和名称提供定义。一个计算过程完全可能涉及多个环境，全局和局部。
- 统一的规则：波兰/前缀表达式。
    - 组合式：简单的通用规则，将运算符运用到每一个参数。如`(* 1 2)`。
    - 特殊形式：一组针对不多的特殊形式的专门规则，但并不使用新的语法糖而是使用统一的语法规则。如`(define x 1)`就是在环境中为`x`关键一个值1。
- 复合过程：
    - 数是基本的数据。
    - 算术运算是基本的过程。
    - 组合式的嵌套提供了组织起多个操作的手段。
    - 定义是一种抽象手段，为名字关联对应的值。形式`(define x 1)`。
    - 过程定义为复合操作提供定义。也就是定义函数/定义的自己的过程。
- 过程定义：
    - 形式：`(define (<name> <formal parameters>) <body>)`
    - `<name>`是过程的符号。
    - `<formal parameters>`形式参数，是一些名字。对应调用过程时的实际参数。
    - `<body>`是一个表达式，调用过程时用实际参数取代形式参数，由这个表达式产生过程的值。更一般的情况是，过程体(函数体)是多个表达式，解释器顺序求值，返回值最后一个表达式的值给过程调用。
    - 这里的过程也就是编程语言中的函数。
    - 一个过程调用也是一个组合式，将参数运用到过程，只不过这个过程不是解释器内置的运算符或函数，而是我们通过`define`自己定义出来的，它同样被保存到环境中。
- 应用过程(也就是函数调用)的代换模型：
    - 当实际参数是组合式时，是先对组合式求值还是用组合式运用到过程就有了区别。
    - **应用序**：首先对组合式中的运算符和运算对象求值，然后将得到的过程应用于得到的实际参数。即先求参数值，而后应用。这样的话每个组合式的参数只会被计算一次。
    - **正则序**：先不求出运算对象的值，直到实际需要时才去做，也就是将所有代换都展开，知道没有过程调用时再做计算。即完全展开后归约。这样可能会重复计算过程调用中组合式参数的值。
    - 如果过程调用无法直接用替换模拟，那么正则序的处理可能会出现问题。所以Lisp采用应用序求值。但在另一方面，正则序也可以成为有价值的工具，后续会探究。
- 条件表达式和谓词：
    - `cond`条件表达式：`(cond (<p> <e>))`，由`cond`和多个谓词——表达式对，直到某一个谓词`<p>`为真时才返回对应`<e>`，如果没有找到真值的`<p>`，那么没有`cond`值没有定义。
    - 绝对值函数的定义
    ```scheme
    (define (abs x)
        (cond ((> x 0) x)
              ((= x 0) 0)
              ((< x 0) (- x))
        )
    )
    ```
    - Scheme中的逻辑真与假用常量`#t`和`#f`来表示，Scheme将`#f`解释为假，将其他所有值解释为真。
    - 用**谓词**这个术语表示那些返回真或假的过程。
    - 特殊形式`if`：`(if <predicate> <consequent> <alternative>)`，条件表达式的一种受限形式，`<predicate>`为真值求值并返回`<consequent>`，否则求值并返回`<alternative>`。
    - 基本谓词：`<` `=` `>`
    - 构造复合谓词的逻辑复合运算符：`(and <e1> ... <en>)`, `(or <e1> ... <en>)`, `(not <e>)`，含义不言自明，需要指出的是`not`是一个普通的过程，而`and`和`or`具有短路求值特性，都是特殊形式，并不是每个子表达式都会被求值。

