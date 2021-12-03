<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Haskell语言入门](#haskell%E8%AF%AD%E8%A8%80%E5%85%A5%E9%97%A8)
  - [关于Haskell](#%E5%85%B3%E4%BA%8Ehaskell)
  - [Haskell与函数式编程](#haskell%E4%B8%8E%E5%87%BD%E6%95%B0%E5%BC%8F%E7%BC%96%E7%A8%8B)
  - [环境搭建](#%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA)
    - [使用GHCup安装](#%E4%BD%BF%E7%94%A8ghcup%E5%AE%89%E8%A3%85)
    - [安装stack](#%E5%AE%89%E8%A3%85stack)
    - [使用stack安装GHC](#%E4%BD%BF%E7%94%A8stack%E5%AE%89%E8%A3%85ghc)
    - [关于Cabal和stack](#%E5%85%B3%E4%BA%8Ecabal%E5%92%8Cstack)
    - [GHC基本使用](#ghc%E5%9F%BA%E6%9C%AC%E4%BD%BF%E7%94%A8)
  - [Stack使用指南](#stack%E4%BD%BF%E7%94%A8%E6%8C%87%E5%8D%97)
    - [关于Stack](#%E5%85%B3%E4%BA%8Estack)
    - [开始使用](#%E5%BC%80%E5%A7%8B%E4%BD%BF%E7%94%A8)
    - [基本命令](#%E5%9F%BA%E6%9C%AC%E5%91%BD%E4%BB%A4)
    - [项目配置](#%E9%A1%B9%E7%9B%AE%E9%85%8D%E7%BD%AE)
    - [运行现有的项目](#%E8%BF%90%E8%A1%8C%E7%8E%B0%E6%9C%89%E7%9A%84%E9%A1%B9%E7%9B%AE)
    - [编译选项](#%E7%BC%96%E8%AF%91%E9%80%89%E9%A1%B9)
    - [路径](#%E8%B7%AF%E5%BE%84)
    - [exec](#exec)
    - [ghci](#ghci)
    - [脚本](#%E8%84%9A%E6%9C%AC)
  - [编辑器集成](#%E7%BC%96%E8%BE%91%E5%99%A8%E9%9B%86%E6%88%90)
    - [VsCode环境配置](#vscode%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE)
  - [感受一下Haskell](#%E6%84%9F%E5%8F%97%E4%B8%80%E4%B8%8Bhaskell)
  - [基本要素](#%E5%9F%BA%E6%9C%AC%E8%A6%81%E7%B4%A0)
    - [基本内容](#%E5%9F%BA%E6%9C%AC%E5%86%85%E5%AE%B9)
    - [运算符](#%E8%BF%90%E7%AE%97%E7%AC%A6)
    - [基本类型类](#%E5%9F%BA%E6%9C%AC%E7%B1%BB%E5%9E%8B%E7%B1%BB)
  - [函数](#%E5%87%BD%E6%95%B0)
    - [定义函数](#%E5%AE%9A%E4%B9%89%E5%87%BD%E6%95%B0)
    - [使用List](#%E4%BD%BF%E7%94%A8list)
    - [使用Range](#%E4%BD%BF%E7%94%A8range)
    - [List Comprehension](#list-comprehension)
    - [元组](#%E5%85%83%E7%BB%84)
  - [Type & Typeclass](#type--typeclass)
    - [类型](#%E7%B1%BB%E5%9E%8B)
    - [类型变量](#%E7%B1%BB%E5%9E%8B%E5%8F%98%E9%87%8F)
    - [Typeclass](#typeclass)
  - [函数相关语法](#%E5%87%BD%E6%95%B0%E7%9B%B8%E5%85%B3%E8%AF%AD%E6%B3%95)
    - [模式匹配(Pattern matching)](#%E6%A8%A1%E5%BC%8F%E5%8C%B9%E9%85%8Dpattern-matching)
    - [守卫](#%E5%AE%88%E5%8D%AB)
    - [where关键字](#where%E5%85%B3%E9%94%AE%E5%AD%97)
    - [let关键字](#let%E5%85%B3%E9%94%AE%E5%AD%97)
    - [case表达式](#case%E8%A1%A8%E8%BE%BE%E5%BC%8F)
  - [递归](#%E9%80%92%E5%BD%92)
  - [高阶函数](#%E9%AB%98%E9%98%B6%E5%87%BD%E6%95%B0)
    - [柯里化](#%E6%9F%AF%E9%87%8C%E5%8C%96)
    - [函数作为参数](#%E5%87%BD%E6%95%B0%E4%BD%9C%E4%B8%BA%E5%8F%82%E6%95%B0)
    - [常用高阶函数](#%E5%B8%B8%E7%94%A8%E9%AB%98%E9%98%B6%E5%87%BD%E6%95%B0)
    - [lambda](#lambda)
    - [fold & scan](#fold--scan)
    - [$函数调用符](#%E5%87%BD%E6%95%B0%E8%B0%83%E7%94%A8%E7%AC%A6)
    - [函数复合(Function Composition)](#%E5%87%BD%E6%95%B0%E5%A4%8D%E5%90%88function-composition)
  - [模块](#%E6%A8%A1%E5%9D%97)
    - [引入模块](#%E5%BC%95%E5%85%A5%E6%A8%A1%E5%9D%97)
    - [常用库](#%E5%B8%B8%E7%94%A8%E5%BA%93)
    - [编写自己的模块](#%E7%BC%96%E5%86%99%E8%87%AA%E5%B7%B1%E7%9A%84%E6%A8%A1%E5%9D%97)
  - [定义类型和类型类](#%E5%AE%9A%E4%B9%89%E7%B1%BB%E5%9E%8B%E5%92%8C%E7%B1%BB%E5%9E%8B%E7%B1%BB)
    - [定义新类型](#%E5%AE%9A%E4%B9%89%E6%96%B0%E7%B1%BB%E5%9E%8B)
    - [Record Syntax](#record-syntax)
    - [类型参数](#%E7%B1%BB%E5%9E%8B%E5%8F%82%E6%95%B0)
    - [派生标准类型类](#%E6%B4%BE%E7%94%9F%E6%A0%87%E5%87%86%E7%B1%BB%E5%9E%8B%E7%B1%BB)
    - [类型别名](#%E7%B1%BB%E5%9E%8B%E5%88%AB%E5%90%8D)
    - [递归定义数据结构](#%E9%80%92%E5%BD%92%E5%AE%9A%E4%B9%89%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84)
    - [自定义类型类](#%E8%87%AA%E5%AE%9A%E4%B9%89%E7%B1%BB%E5%9E%8B%E7%B1%BB)
    - [Functor/函子](#functor%E5%87%BD%E5%AD%90)
    - [Kind](#kind)
  - [输入与输出](#%E8%BE%93%E5%85%A5%E4%B8%8E%E8%BE%93%E5%87%BA)
    - [IO动作](#io%E5%8A%A8%E4%BD%9C)
    - [输入与输出函数](#%E8%BE%93%E5%85%A5%E4%B8%8E%E8%BE%93%E5%87%BA%E5%87%BD%E6%95%B0)
    - [文件与字符流](#%E6%96%87%E4%BB%B6%E4%B8%8E%E5%AD%97%E7%AC%A6%E6%B5%81)
    - [命令行参数](#%E5%91%BD%E4%BB%A4%E8%A1%8C%E5%8F%82%E6%95%B0)
    - [随机数](#%E9%9A%8F%E6%9C%BA%E6%95%B0)
    - [ByteString](#bytestring)
    - [异常(Exceptions)](#%E5%BC%82%E5%B8%B8exceptions)
  - [问题解决实例](#%E9%97%AE%E9%A2%98%E8%A7%A3%E5%86%B3%E5%AE%9E%E4%BE%8B)
    - [逆波兰表达式](#%E9%80%86%E6%B3%A2%E5%85%B0%E8%A1%A8%E8%BE%BE%E5%BC%8F)
    - [路径规划问题](#%E8%B7%AF%E5%BE%84%E8%A7%84%E5%88%92%E9%97%AE%E9%A2%98)
  - [函子、应用函子与幺半群](#%E5%87%BD%E5%AD%90%E5%BA%94%E7%94%A8%E5%87%BD%E5%AD%90%E4%B8%8E%E5%B9%BA%E5%8D%8A%E7%BE%A4)
    - [函子](#%E5%87%BD%E5%AD%90)
    - [应用函子](#%E5%BA%94%E7%94%A8%E5%87%BD%E5%AD%90)
    - [newtype](#newtype)
    - [Monoid](#monoid)
  - [Monad](#monad)
    - [Monad类型类](#monad%E7%B1%BB%E5%9E%8B%E7%B1%BB)
    - [Monad应用](#monad%E5%BA%94%E7%94%A8)
    - [do表示法](#do%E8%A1%A8%E7%A4%BA%E6%B3%95)
    - [Monad实例](#monad%E5%AE%9E%E4%BE%8B)
    - [Monad Law](#monad-law)
  - [More Monad](#more-monad)
    - [Writer](#writer)
    - [Reader Monad](#reader-monad)
    - [State Monad](#state-monad)
    - [常用的操作Monad的函数](#%E5%B8%B8%E7%94%A8%E7%9A%84%E6%93%8D%E4%BD%9Cmonad%E7%9A%84%E5%87%BD%E6%95%B0)
  - [Zippers](#zippers)
    - [定义一个树](#%E5%AE%9A%E4%B9%89%E4%B8%80%E4%B8%AA%E6%A0%91)
    - [Zipper](#zipper)
    - [Zipper of List](#zipper-of-list)
  - [总结](#%E6%80%BB%E7%BB%93)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Haskell语言入门

提示：本文含有少量公式，可安装[MathJax Plugin for Github](https://github.com/orsharir/github-mathjax)浏览器插件提供公式渲染，或者Clone到本地查看。

## 关于Haskell

关于Haskell：
>[Haskell](https://zh.wikipedia.org/wiki/Haskell)（发音为/ˈhæskəl/）是一种标准化的，通用的纯函数式编程语言，有惰性求值和强静态类型。它的命名源自美国逻辑学家哈斯凯尔·加里，他在数理逻辑方面上的工作使得函数式编程语言有了广泛的基础。在Haskell中，“函数是第一类对象”。作为一门函数编程语言，主要控制结构是函数。Haskell语言是1990年在编程语言Miranda的基础上标准化的，并且以λ演算为基础发展而来。这也是为什么Haskell语言以希腊字母“λ”（Lambda）作为自己的标志。Haskell具有“证明即程序、命题为类型”的特征。

首先需要明确的是：
- Haskell是一门纯函数式编程语言，学习曲线非常陡峭，收获同样会很丰富。
- 不要在没有任何编程基础的情况下学习Haskell，至少先学习一些过程式和支持函数式编程的语言，有一定数据结构和算法基础。
- Haskell非常注重理论，范畴论是支持函数式编程的理论基础之一，作为一门数学分支理论，学习Haskell将会深入范畴论的内容，也就是说不可避免地需要了解很多数学概念和定理，将会时刻与抽象作伴。
- 不要期待几天几个月就学懂并深入Haskell，这将会是一条艰涩的道路。
- 不要期待通过一本书或者一门课程就学到Haskell的全部，从不同的教程和书籍不同的视角思考是必要的。
- 相教传统的命令式编程而言，需要换一种方式来思考，否则永远学不好Haskell。
- 入门至少要了解一定的范畴论概念，理解函子、应用函子、单子等概念，理解清楚“**单子是自函子范畴上的幺半群**”这句话。
- 学习不害怕没有基础，没有老师，怕的是没有热情。

学习一门新的语言，收集资料是必不可少的：
- [怎么学习Haskell-github.com/bitemyapp/learnhaskell](https://github.com/bitemyapp/learnhaskell/blob/master/guide-zh_CN.md)，入门现代Haskell的最好材料。
- 书籍：现有的书籍屈指可数。
    - [Learn You a Haskell for Great Good](http://learnyouahaskell.com/)，中译[Haskell趣学指南](https://book.douban.com/subject/25803388/)，入门书，据评价前面很轻松，但后面会难度陡增让人不知所云，而且不够现代，覆盖的东西不足以写出实用的代码。[在线阅读](http://learnyouahaskell.com/chapters)。
    - [HaskellBook](https://haskellbook.com/)，第一个链接learnhaskell仓库作者写的书籍，英文版书籍很贵，但很靠谱，尚无中译版本出版，所以说暂无法阅读到。
    - [Real World Haskell](https://book.douban.com/subject/3134515/)，中译在译中，尚未出版。成书有点早，有些库可能已经用不了了，但绝对还可以读，初学有难度。[中译的仓库](https://github.com/huangz1990/real-world-haskell-cn)，[在线阅读](https://rwh.readthedocs.io/en/latest/)。
    - [Haskell并行与并发编程](https://book.douban.com/subject/26256849/)，如其名，进阶书籍，内容全面，翻译有些瑕疵但都有勘误。
    - 更多。
- 一些课程：
    - [诺丁汉大学——函数式编程范式入门课程](https://www.bilibili.com/video/BV1ti4y1P7TF?p=1)
    - 待补充。

资料选择：
- [Learn You a Haskell for Great Good](https://www.bookstack.cn/read/learnyouahaskell-zh-cn/README.md) 目前在看，本文理论部分的最主要参考，台湾人翻译的某些名词会有一些差异，比如实现称为实作、类型称为型别、参数称为引数、随机数称为乱数等，需要留意，不是很影响阅读。
- [Real World Haskell](http://cnhaskell.com/index.html)
- [Haskell 2010 Report](https://www.haskell.org/definition/haskell2010.pdf) 没有什么比标准更准确，进阶的话必须要看，还没有到这一步。

语言相关链接：
- [haskell主页](https://www.haskell.org/)，[Wiki](https://wiki.haskell.org/Haskell)
- [GHC文档](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/index.html)
- [stack文档](https://docs.haskellstack.org/en/stable/README/)
- [Cabal文档](https://cabal.readthedocs.io/en/3.6/)
- [Stackage首页](https://www.stackage.org/)
- [Hackage首页](https://hackage.haskell.org/)
- [Hoogle API Search](https://hoogle.haskell.org/)


课外阅读：
- [一个很全面的Haskell笔记](https://blog.tonycrane.cc/p/b3ca5c18.html)
- [School of Haskell](https://www.schoolofhaskell.com/)，一个学习Haskell的网站。

## Haskell与函数式编程

函数式（functional languages）与命令式（imperative languages）：
- 不同于命令式编程语言，程序是描述要怎么做，要做什么，函数式编程需要通过函数描述出问题**是什么**，比如「阶乘就是只从1到某个数的乘积」，而命令式编程语言则会用程序描述出阶乘的计算过程：定义结果的初值为1，然后从1一直累乘到某个数的计算过程。
- 在函数式编程语言中，变量一旦指定就不可以更改了，在命令式编程语言中，变量表示状态，如果状态不可变，那么能做的事情将非常有限。而函数式编程语言中，变量的含义更接近数学中的变量，`x=5`表示`x`就是`5`，而不是`x`处于`5`这个状态。
- 所以在纯粹的函数式编程语言中，函数唯一能做的事情就是利用参数计算结果，不会产生副作用（side effect），副作用的含义是改变非函数内部的状态，这在命令式编程中是非常常见的。在函数式编程语言中，若以同样的参数调用一个函数两次，结果必定相同，也就是说函数都是**可重入**的。在命令式编程语言中，则需要函数实现时进行非常严格的限定才能做到。没有副作用的函数实现对于并发非常有用，因为没有副作用，并行执行的正确性就能够得到保证。

Haskell的特点：
- Haskell是惰性的，如非特殊说明，函数真正需要结果以前不会被求值，加上引用透明，可以把程序看做数据的一系列变形。也就是说惰性语言中的计算只是一组初始数据和变换公式。
- Haskell是静态强类型的，拥有一套强大的类型系统，支持自动类型推导（type inference），比如`a = 5+4`编译器能自动推导出`a`是整数。
- Haskell 采纳了很多高端编程语言的概念，因而它的代码优雅且简练。与同层次的命令式语言相比，Haskell 的代码往往会更短，更短就意味着更容易理解，bug 也就更少。

Haskell语言发展：
- 始于1987年。
- 1997年底，该系列形成了Haskell 98，旨在定义一个稳定、最小化、可移植的语言版本以及相应的标准库，以用于教学和作为将来扩展的基础。委员会明确欢迎创建各种增加或集成实验性特性的Haskell 98的扩展和变种。
- 1999年2月，Haskell 98语言标准公布，名为《The Haskell 98 Report》。2003年1月，《Haskell 98 Language and Libraries: The Revised Report》公布。接着，Glasgow Haskell Compiler (GHC)实现了当时的事实标准，Haskell快速发展。
- Haskell 2010加入了外部函数接口（Foreign Function Interface，FFI）允许绑定到其它编程语言，修正了一些语法问题（在正式语法中的改动）并废除了称为“n加k模式”（换言之，不再允许形如fact (n+1) = (n+1) * fact n的定义）。引入了语言级编译选项语法扩展（Language-Pragma-Syntax-Extension），使得在Haskell源代码中可以明确要求一些扩展功能。

## 环境搭建

使用目前最流行的haskell编译器GHC（The Glasgow Haskell Compiler），是当前最先进的开源的Haskell编译器和交互式执行环境。
- 支持整个Haskell 2010标准和一大堆扩展。
- 并行和并发的良好支持，包括STM。
- 跨平台，Windows、Mac、Linux、大部分Unix等平台。
- GHC编译器可以直接编译为本地代码或者使用LLVM作为后端，可以生成C代码作为中间目标以支持扩展到新的平台。在交互式环境中将Haskell编译到字节码，并支持字节码和编译程序的混合执行。
- 支持Profiling（性能分析），时间、内存、多种堆分析。
- GHC包含多个库，更多库还可以到Hackage（[The Haskell Package Repository](https://hackage.haskell.org/)）上寻找。

安装：
- 当前时刻最新版本2021年10月29日发布的是9.2.1，[GHC首页](https://www.haskell.org/ghc/)。
- 一般不直接安装GHC，而是通过cabal或者Stack安装GHC，这样可以管理项目并且管理第三方库从Hackage或者Stackage的安装。只安装GHC的话不是很方便。

### 使用GHCup安装

- 使用[GHCup](https://www.haskell.org/ghcup/install/)，GHCup是一个帮助安装Haskell GHC工具链的工具。支持安装的工具链：
    - GHC
    - cabal-install
    - haskell-language-server
    - stack
- GHCup提供了详细的安装文档：
- Linux下运行：
```shell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```
- Windows下PowerShell中运行：
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true
```
- 因为网络原因，Linux上和Windows上都没有安装成功。
- 好像可以换源解决，参考[这里](https://zh.z.haskell.world/guide01)，尝试结果是换源之后仅GHCup是从镜像下载，stack和GHC还是从Github上下载，啊这。
- GHCup只是一个安装工具，不是一定需要，转为直接安装stack。

### 安装stack

特性与文档：
- [一个视频教程](https://www.youtube.com/watch?v=sRonIB8ZStw)。
- [stack](https://github.com/commercialhaskell/stack)是一个跨平台的Haskell项目管理、环境管理工具。
- [stack文档](https://docs.haskellstack.org/en/stable/README/)。
- 特性：
    - 安装GHC到一个独立位置。
    - 为项目安装需要的包。
    - 构建、测试项目。
    - 为项目做Benchmark。

Windows环境：
- Windows中：下载[Windows 64-bit Installer.](https://get.haskellstack.org/stable/windows-x86_64-installer.exe)。默认会添加用户path环境变量，并设置了用户环境变量`STACK_ROOT=C:\sr`表示使用stack安装程序的位置。由于Windows下默认由260字节的路径长度限制，且stack管理的文件通常具有较深的目录层次，所以这里的目录名很短，也可以设置为其他盘或者其他路径。
- 升级stack：
```shell
stack upgrade
```

换源：
- [更换stack的源为清华源](https://mirrors.tuna.tsinghua.edu.cn/help/stackage/)，注意其中给出的配置文件目录为`%APPDATA%\stack\config.yaml`，但由于我们修改了`%STACK_ROOT%`，需要修改的配置文件其实在`%STACK_ROOT%\config.yaml`。
- 清华的源存在一定问题，有一些东西没有镜像过来，配置也有问题，安装GHC时会有问题。提了[Issue](https://github.com/tuna/issues/issues/1379)，不过一直没解决。
- 建议[更换为中科大的源](https://mirrors.ustc.edu.cn/help/stackage.html)，则没有这个问题。
- 注意配置文件位置
    - windows中在`%STACK_ROOT%\config.yaml`。
    - Linux中在`~/.stack/config.yaml`。

Linux环境：
- 途径一：官网安装方法，网络原因失败。
```shell
curl -sSL https://get.haskellstack.org/ | sh
wget -qO- https://get.haskellstack.org/ | sh
```
- 途径二：包管理器，版本有点低。不过可以安装，可以安装之后再换源然后更新，注意不同版本的`config.yaml`文件配置方式存在差异，参见镜像的配置指导。尝试过，但低版本的Stack更新还是从Github，这。
```shell
sudo apt install haskell-stack
```
- 途径三：由于网络原因是在难搞，可以使用代理，或者直接从下载压缩包解压，从中科大源找到最新版本stack的压缩包。
```shell
wget https://mirrors.ustc.edu.cn/stackage/stack/stack-2.7.3-linux-x86_64-static.tar.gz
```
- 解压后将单个二进制拷贝到`/usr/bin/stack`，创建`~/.stack/`就OK了，`stack`安装之后就只有这两个东西，卸载的话直接把二进制和`.stack/`目录删掉就足够了。
```shell
tar -zxvf stack-2.7.3-linux-x86_64-static.tar.gz
cd stack-2.7.3-linux-x86_64-static/
sudo cp stack /usr/bin/stack
```

### 使用stack安装GHC

- 到[Stackage](https://www.stackage.org/)找到最新的LTS版本，当前是18.17，然后安装GHC，[文档](https://docs.haskellstack.org/en/stable/GUIDE/#resolvers-and-changing-your-compiler-version)。
- 安装指定LTS版本的GHC，直接`--resolver lts`则安装最新的LTS版本。
```shell
stack --resolver lts-18.17 setup
```
- 也可以安装最新的Nigthly版本，好像是每天发布，一般来说没有必要安装最新版本，安装最新的长期支持版是最好的。
```shell
stack --resolver nigthly setup
```
- 清华源存在问题，解决途径可以参考[这里](https://krantz-xrf.github.io/2020/09/25/windows-install-stack-ghc.html)，使用[中科大的源](https://mirrors.ustc.edu.cn/help/stackage.html)则没有这个问题。
- GHC的安装路径在`stack path`中的`ghc-paths`中。
- GHC版本：
```shell
stack exec -- ghc --version
```
- 进入交互式执行环境：
```shell
stack exec -- ghci
```
- 离开交互式环境：`:q`。
- 如果希望直接`ghci ghc`命令启动编译器或者交互环境，可以将其路径添加到path变量。不过这样是不能使用stack安装的包的，所以仅在非常有限的范围内测试时可以这样做，更建议使用通过stack启动。
- 到这里GHC就安装成功了，和我们手动从GHC的网站上下载解压配置其实是一样的，不过是用stack来管理了。
- stack可以管理多个版本的GHC，为了避免冲突，可以使用命令行来选择版本：`stack --compiler ghc-8.8.4 exec ghci`。

### 关于Cabal和stack

- cabal是另一个包管理和项目工具，和stack有区别有联系，cabal的包管理库是Hackage，stack是Stackage，Stackage官网介绍Stackage是Hackage的子集的分发。
- 都可以管理包，都可以管理项目，使用Stack还可以实现同一个项目兼容两个工具。但stack好像是为了解决cabal的某些痛点，具体还未研究那么深。暂时未安装cabal，仅使用Stack。

### GHC基本使用

编译器使用：
- 新建文件`hello.hs`
```haskell
main = print "hello,world"
```
- 编译执行：
```shell
ghc hello.hs
./hello
```
- 交互式执行环境
```shell
ghci
```
- GHCI中加载加载`hello.hs`文件。
```
Prelude> :l hello.hs
[1 of 1] Compiling Main             ( hello.hs, interpreted )
Ok, one module loaded.
*Main> main
"hello,world"
```
- 学习中的正常工作流程可以是创建修改`hs`文件，ghci中重新加载，执行特定函数。
- GHCI常用命令：
    - `:l :load` 加载
    - `:r :reload` 重载
    - `:t :type` 类型，针对函数
    - `:i :info` 信息，针对函数、类型、类型类等。
    - `:k :kind` 得知一个类型的Kind。

- 更改GHCI的提示符：
```shell
:set prompt "ghci> "
```
- 仅执行haskell脚本不编译：
```shell
runhaskell hello.hs
```
- 列出所有已安装的包，通过stack执行则可以同时列出通过stack安装的所有包：
```shell
ghc-pkg list
stack exec ghc-pkg list
```

VsCode环境配置：
- 安装Haskell扩展。
- 安装Haskell插件后将会自动下载对应版本的Haskell Language Server，也可以在插件设置中语言服务器的路径（只有一个全局设置，无法为项目设置）。启用插件将会自动开始Haskell Language Server子进程，将会吃掉将近1个G内存，提供补全、求值、类型推断等服务。
- 仅仅学习语法的话，如果每次测试都将结果打印出来，会非常冗余，利用VsCode插件和语言服务器提供的功能，可以在注释中进行测试：
```haskell
{-
>>> 1 + 1
2
-}
```
- `{--}`注释中在`>>>`后输入需要测试的表达式，语言服务器会自动求值并将结果填写在注释中，既能保留下测试结果，又不影响主体逻辑，和在`ghci`中运行是一个道理，修改了代码刷新一下便会立即得出测试结果。这样就不需要再写很多冗余的简单测试打印代码了，也不必在每个`.hs`中都定义`main`，如果是单文件编译，和C一样不定义`main`是链接不过的。
- `>>>`测试中不支持标准输入输出，[更多详细信息查看文档](https://github.com/haskell/haskell-language-server/blob/master/plugins/hls-eval-plugin/README.md)。

## Stack使用指南

前期可以使用单文件GHC命令行编译加上GHCI交互环境已经够用了，后面必然需要了解如何组织项目，使用stack管理项目和环境。这节内容基本都翻译自Stack文档。

### 关于Stack

文档：
- [Stack快速入门](https://docs.haskellstack.org/en/stable/README/#quick-start-guide)。
- [Stack User Guide](https://docs.haskellstack.org/en/stable/GUIDE/)。

Stack功能：
- 管理GHC工具链（Windows中还包括MSYS）。
- 构建和注册库。
- 可以说stack管理所有做Haskell开发需要的东西。

Stack的设计：
- 设计哲学是可重用的构建，也就是说今天和明天运行`stack build`应该得到同样的结果。某些情况下可能会有变化，比如修改了操作系统配置，但整体上来说stack基本上是遵循这条设计哲学的。
- 为了简单地实现这一点，stack使用精心选择和组织的包集合称之为**snapshots**（快照）。
- 读完`stack --help`中的帮助就足够开始和运行了。
- 根目录中的`stack.yaml`主要保存项目的环境，称之为**resolver**，根据其中的版本信息来选择要使用哪个版本编译器和库。
- stack是独立的，不会影响和干扰本地独立安装的GHC或者cabal或者其他安装工具安装的包和编译器。
- 更推荐在GNU/Linux上使用stack（特别是64位Ubuntu），stack除了极少数子命令是平台特定的外命令基本是跨平台的。代码如果跨平台的话，那项目就可以轻松跨平台。

### 开始使用

基本命令：
```shell
stack new my-project
cd my-project
stack setup
stack build
stack exec my-project-exe
```
- `stack new`新建项目。
- `stack setup`下载编译器（如果有必要）到一个独立的位置（默认在`~/.stack`），不会干扰系统中已有的安装，`stack path`查看路径。
- `stack build`构建项目。
- `stack exec my-project-exe`执行构建完成的项目，`-exe`加在项目名称后，这是默认的最终生成的可执行文件名称。
- 使用`stack install <package-name>`安装一个包。
- `stack new`创建的项目目录结构：
```haskell
.
├── app
│   └── Main.hs
├── ChangeLog.md
├── LICENSE
├── my-project.cabal
├── package.yaml
├── README.md
├── Setup.hs
├── src
│   └── Lib.hs
├── stack.yaml
└── test
    └── Spec.hs

    3 directories, 10 files
```
- `stack build`会生成`.stack-work/`目录，依赖和生成文件都会被放在这里，默认会添加到`.gitignore`。
- 管理库：编辑`src/`目录。
- `app/`目录中应该仅包含只与可执行文件相关的内容是最完美的。
- 添加依赖：编辑`package.yaml`的`dependencies`域。
- 再次运行`stack build`，`stack`会自动更新`my-project.cabal`，如果想的话，也可以手动编辑`.cabal`然后`stack`为你自动更新`package.yaml`。这两个文件是`stack`和`cabal`的项目文件，`stack`同时提供支持。
- 如果遇到依赖的包不在当前LTS版本中时，可以尝试在`stack.yaml`中的`extra-deps`域中添加新版本。

### 基本命令

新建项目：
- `stack new PACKAGE_NAME [TEMPLATE_NAME]`，不指定模板，则使用默认的模板，更多模板相关信息执行`stack templates`查看，模板也可以是本地文件、远程URL。
- 如果最终会发布的话包的名称就是这个`PACKAGE_NAME`，由字母数字和连字符组成。

构建项目：
- `stack build`会查找本地没有的依赖，然后自动下载，也可以手动`stack setup`做这一步。然后开始构建。
- GHC被下载到全局的stack路径中，Windows中是`%LOCALAPPDATA%\Programs\stack\`，而Linux中是`~/.stack/programs/`。
- `stack ghc`或者`stack exec ghc`执行GHC编译器，还有`runhaskell runghc ghci`等命令。
- 观察`stack build`的输出，会发现同时构建了库和可执行文件，默认模板中创建了模块`Lib Main`，前者是库，后者是可执行文件包含入口`main`，并将其安装到了`./.stack-work/`中。
- 现在在目录内执行`stack exec PACKAGE_NAME-exe`就会执行程序了，stack知道去哪里找这个文件。
- 在目录内执行`stack exec ghci`会直接加载已经编译的所有模块。
- 构建命令是整个stack的核心和灵魂，用以构建、测试、获取依赖等，还可以定制，有许多高级的功能。
- 使用同样的选项运行`stack build`两次，那么第二次应该什么事情也不做，构建运行过程应该是可重复的。
- 后续会更加详细地介绍。

测试项目：
- 仔细看会发现有一个`test/`目录，其中用来编写测试用例。
- 执行`stack test`会先编译其中的程序，然后再执行。对于`build test`子命令，已经构建过的组件不会被再次编译，除非经过了修改。

`stack setup`:
- `stack setup [GHC_VERSION]`可以安装特定版本的GHC，其他选项可以查看帮助。
- `stack exec -- which ghc`可以查看GHC安装路径（Linux），或者`stack path`。

清理项目：
- `stack clean`清理工作目录，清理编译器输出文件，一般是`.stack-work/dist/`。
- `stack clean <specific-package>`为特定的包做清理。
- `stack purge`清理得更彻底，会直接将整个`.stack-work/`删掉，包括exrea-deps，git依赖和包括日志在内的编译器输出。但不会删除已经安装的包的快照，编译器或者使用`stack install`安装的包。让项目回到未进行`stack build`的状态，是`stack clean --full`的别名。

不同的数据库：
- 在项目内执行`stack exec -- ghc-pkg list`，会看到不同层级的包。
- 三个不同位置：
    - GHC安装位置：`.stack/programs/...`(Linux)或者`%LOCALAPPDATA%\programs\stack\...`(Windows)。编译器自带。
    - stack安装新包的位置`.stack/snapshots/`(Linux)或者`%STACK_ROOT%\snapshots\`(Windows)。通过`stack install`安装。
    - 本地项目中生成的。
- 不同的项目使用同一个包是可以复用但又不会互相干扰。

命令别名：
- 一些命令是由别名定义的：
```shell
  build                    Build the package(s) in this directory/configuration
  install                  Shortcut for 'build --copy-bins'
  test                     Shortcut for 'build --test'
  bench                    Shortcut for 'build --bench'
  haddock                  Shortcut for 'build --haddock'
```
- 具体含义可查看帮助，[Haddock](https://github.com/haskell/haddock)是从Haskell源码生成Haskell文档的标准工具。
- `install / --copy-bins`仅做一件事情（并非下载），就是将生成的可执行文件拷贝到本地`bin`路径。可以通过`stack path --local-bin`获取。所有文档中会建议将这个路径添加到`path`环境变量。这个特性很方便，一些包在安装时就会做这样的事情，添加之后就可以使用`executable-name`执行，而不再需要在项目内执行`stack exec executable-name`。

灵活地构建：
- 通过命令参数可以实现非常灵活地构建。
- 指定包名：`stack build package-name`，包不仅可以是本地的，还可以在`extra-deps`中，snapshot中，或者仅仅是在网络的上游。如果在网络上并且没有在本地或者snapshot和extra-deps中，那么会自动添加到`extra-deps`中（试验中好像并不会）。
- 最灵活的地方来自`stack build helloworld:test:helloworld-test`指定组件构造，含义是构建`helloworld`包中`helloworld-test`的测试组件。可以简写为`stack build helloworld:helloworld-test`设置`stack build :helloworld-test`。
- 也可以指定目录构建，只触发该目录和其子目录的构建。仅构建当前所在目录可以用`stack build .`。
- 不指定参数和同时指定所有包名为参数是同一含义。
- 这里说组件其实就是指其中的模块，比如默认模板中就会生成`Lib Main`模块。
- `stack ide targets`可以看到所有目标。

构建测试和Benchmark：
- `stack build`会构建所有库（如果有）、可执行文件但是会忽略Test Suite和Benchmark。
- 如果要构建测试用例和性能测试可以使用`--test` `--bench`参数，加进来之后就会一起构建了`stack build --test helloworld`。
- 直接指定测试组件则不会同时构建可执行文件`stack build :helloworld-test`。（文档中这样说，但是在我本地却同时构建了，尽管并不依赖），构建测试套件之后会执行，benchmark同理，可以使用`--no-run-tests --no-run-benchmarks`来让他们不要运行。
- stack不会为非本地项目构建测试套件和性能测试。

### 项目配置

仔细看目录结构：
- `app/Main.hs src/Lib.hs test/Spec.hs`是源文件，分别是可执行文件、库、测试逻辑的代码，是项目的功能代码。
- `LICENSE README.md ChangeLog.md`是契合开源项目的信息，不参与构建。
- `my-project.cabal`是另一个构建工具Cabal的配置文件，在`stack build`过程中会自动更新，不应该修改。
- 核心项目配置文件是`Setup.hs stack.yaml package.yaml`。
    - `Setup.hs`是Cabal构建系统的一个组件，从技术上来说stack并不需要这个文件，但包含这个文件依然是一个好的实践。
    - `stack.yaml`中信息并不多，但注释很多。目前主要看两个域：`packages`告诉stack构建本地项目中的哪些包，仅有一个包的话，一个`.`就足够。但stack是支持在同一个项目中包含多个包的。另一个域`resolver`，stack按这个域确定构建项目使用的GHC版本和包的依赖，也就是Stackage的版本，比如lts-18.17就对应ghc-8.10.7，`setup`是根据这个信息去下载GHC的，在[Stackage官网](https://www.stackage.org/)上能够看到。
    - `package.yaml`则是关于包的信息，是由内建在stack中的[hpack tool](https://github.com/sol/hpack)提供的。默认行为是从`package.yaml`生成`.cabal`，而不去更改`.cabal`。
- stack是基于Cabal的，Cabal中，每个包使用一个独立的`.cabal`文件描述，其中包含多个组件：库、可执行文件、测试套件、benchmark，还有其他信息，比如库依赖、默认编译选项等。
- 最重要的是需要知道如何修改`package.yaml`中的必要配置。可以在[Hpack 文档](https://github.com/sol/hpack#quick-reference)中找到所有可用选项。

添加依赖：
- `package.yaml`的`dependencies`域：
```yaml
dependencies:
- base >= 4.7 && < 5
- text
- random
# add more dependencies here
```
- 使用了新的包时需要在此处添加依赖，可以指定版本，再次运行`stack build`将会安装。
- 列出所有依赖：`stack ls dependencies`。

**extrs-deps**：
- 如果添加一个依赖:
```haskell
module Lib
    ( someFunc
    ) where

import Acme.Missiles

someFunc :: IO ()
someFunc = launchMissiles
```
```yaml
dependencies:
- base >= 4.7 && < 5
- acme-missiles
```
- 执行`stack build`却报错了。原因就在于[LTS resolver](https://github.com/commercialhaskell/lts-haskell#readme)，`stack new`创建项目时是选择了当前的LTS版本的，每个LTS都有自己的精心维护的包的集合。如果依赖中的包不在这个集合中那么即使添加到了`dependencies`中也会报错。
- 当前版本已经不包含这个包了，所以自然不行，为了解决这个问题，需要使用到`stack.yaml`的`extra-deps`域，用来定义不在当前LTS resolver但是在[Hackage](https://hackage.haskell.org/package/acme-missiles)中的包。添加之后再次`stack build`就会成功。
```yaml
extra-deps: 
- acme-missiles-0.3 # not in the LTS
```
- Stackage是Stable sets of Haskell Packages from Hackage，所以这样的需求可能会常遇到。

关于LTS resolver：
- 在[Stack官网](https://www.stackage.org/lts)可以找到最新的LTS，`resolver`的值是`resolver: lts-18.17`，在`setup`时会用到。其使用的GHC版本，然后其中可用的包的集合（快照，Snapshots），可以通过Hoogle搜索这个快照。
- 点开某一个包，可以看到其中可用的模块，根据这些信息可以确定要将那个包加入到`package.yaml`中。
- 会注意到有[LTS](https://github.com/commercialhaskell/lts-haskell#readme)（Long Term Support）和Nighthly的区分，一般使用长期支持版，stack也会默认使用LTS。

修改编译器版本：
- 当前使用`lts-18.17`如果我想换成Nighthly版本，那么只需要将`stack.yaml`修改一下：可以指定为LTS版本、Nightly或者GHC版本都可以。
```yaml
resolver: nightly-2020-02-08
```
- 运行`stack build`将下载对应的GHC和依赖的库，选这个版本也是因为[最新的Nightly版本](https://github.com/commercialhaskell/stackage-snapshots)TUNA和中科大没有镜像用不了，仅选一个有镜像的版本做测试而已，实践中还是使用LTS最好。
- 在命令中使用`--resolver`选项时，可以用`nightly`参数指代最新Nightly版本，`lts`指代最新LTS版本，`lts-2`指代`lts-2.x.x`的最新版本。不可用于`stack.yaml`。
```shell
stack --resolver lts-2 build
```
- Nightly的版本是按照日期命名的，`nightly-YYYY-MM-DD`，LTS和GHC则是向上走的版本号`lts-X.Y` `ghc-X.Y.Z`。

本地和远程的依赖：
- stack可以管理多个包，如果你将多个包`unpack`到本地，那么`packages`域将会有多个包。
- 需要区分依赖的是本地的包还是上游的包（构建时下载到本地snapshots）。

### 运行现有的项目

来构建一个开源项目，这里选择[yackage](https://www.stackage.org/package/yackage)，为了获取到发布到Stackage的代码，可以使用`stack unpack`：
```
stack unpack yackage-0.8.1 [--to yourDir]
```
- 也可以直接`git clone`，可以看到其中没有`stack.yaml`，可以手动创建，也可以使用`stack init`：
- `stack init`会生成`stack.yaml`，并尝试使用一个最匹配的LTS或者Nightly版本：
- 也可以指定resolver版本：
```shell
stack init --resolver <resolver>
```
- 由于各种原因，本地构建失败了，略过。

### 编译选项

两种方式更改一个包安装的方式：Cabal标志和GHC选项。
- 前者为每一个项目设置，意味着编译`yackage`时`-`关掉`upload`选项，说实话没太搞懂什么意思。
```shell
stack build --flag yackage:-upload
```
- GHC选项和Cabal的标志类似，但有一些改变，[文档](https://docs.haskellstack.org/en/stable/yaml_configuration/#ghc-options)。GHC看来也还是要学习一下，编译选项，基本使用之类的，毕竟stack也是调用的GHC去编译。
- 这一节都尚不是很清楚，需要实践后补充细节。

### 路径

一般来说不需要知道stack存了一些什么文件在什么地方，`stack path`可以很多好的展示这些路径：
```shell
tch@KillingBoat:~$ stack path
snapshot-doc-root: /home/tch/.stack/snapshots/x86_64-linux-tinfo6/92a82299ffe7e01dd411553be385541e3e9cf3a60cd0bd12003f0fa41dfe1b7a/8.10.7/doc
local-doc-root: /home/tch/.stack/global-project/.stack-work/install/x86_64-linux-tinfo6/92a82299ffe7e01dd411553be385541e3e9cf3a60cd0bd12003f0fa41dfe1b7a/8.10.7/doc
local-hoogle-root: /home/tch/.stack/global-project/.stack-work/hoogle/x86_64-linux-tinfo6/92a82299ffe7e01dd411553be385541e3e9cf3a60cd0bd12003f0fa41dfe1b7a/8.10.7
stack-root: /home/tch/.stack
project-root: /home/tch/.stack/global-project
config-location: /home/tch/.stack/global-project/stack.yaml
bin-path: /home/tch/.stack/snapshots/x86_64-linux-tinfo6/82db7b2595a76656db6d1508a5dd57aced5d628188b355b35247c7fd357c1396/8.10.7/bin:/home/tch/.stack/compiler-tools/x86_64-linux-tinfo6/ghc-8.10.7/bin:/home/tch/.stack/programs/x86_64-linux/ghc-tinfo6-8.10.7/bin:/home/tch/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
programs: /home/tch/.stack/programs/x86_64-linux
compiler-exe: /home/tch/.stack/programs/x86_64-linux/ghc-tinfo6-8.10.7/bin/ghc-8.10.7
compiler-bin: /home/tch/.stack/programs/x86_64-linux/ghc-tinfo6-8.10.7/bin
compiler-tools-bin: /home/tch/.stack/compiler-tools/x86_64-linux-tinfo6/ghc-8.10.7/bin
local-bin: /home/tch/.local/bin
extra-include-dirs:
extra-library-dirs:
snapshot-pkg-db: /home/tch/.stack/snapshots/x86_64-linux-tinfo6/82db7b2595a76656db6d1508a5dd57aced5d628188b355b35247c7fd357c1396/8.10.7/pkgdb
local-pkg-db: /home/tch/.stack/global-project/.stack-work/install/x86_64-linux-tinfo6/82db7b2595a76656db6d1508a5dd57aced5d628188b355b35247c7fd357c1396/8.10.7/pkgdb
global-pkg-db: /home/tch/.stack/programs/x86_64-linux/ghc-tinfo6-8.10.7/lib/ghc-8.10.7/package.conf.d
ghc-package-path: /home/tch/.stack/global-project/.stack-work/install/x86_64-linux-tinfo6/82db7b2595a76656db6d1508a5dd57aced5d628188b355b35247c7fd357c1396/8.10.7/pkgdb:/home/tch/.stack/snapshots/x86_64-linux-tinfo6/82db7b2595a76656db6d1508a5dd57aced5d628188b355b35247c7fd357c1396/8.10.7/pkgdb:/home/tch/.stack/programs/x86_64-linux/ghc-tinfo6-8.10.7/lib/ghc-8.10.7/package.conf.d
snapshot-install-root: /home/tch/.stack/snapshots/x86_64-linux-tinfo6/82db7b2595a76656db6d1508a5dd57aced5d628188b355b35247c7fd357c1396/8.10.7
local-install-root: /home/tch/.stack/global-project/.stack-work/install/x86_64-linux-tinfo6/82db7b2595a76656db6d1508a5dd57aced5d628188b355b35247c7fd357c1396/8.10.7
dist-dir: .stack-work/dist/x86_64-linux-tinfo6/Cabal-3.2.1.0
local-hpc-root: /home/tch/.stack/global-project/.stack-work/install/x86_64-linux-tinfo6/82db7b2595a76656db6d1508a5dd57aced5d628188b355b35247c7fd357c1396/8.10.7/hpc
local-bin-path: /home/tch/.local/bin
ghc-paths: /home/tch/.stack/programs/x86_64-linux
```

- 看到名称基本都能知道是干什么的，`ghc-paths`就是编译器安装路径，基本都是在`.stack`中，`local-bin`就是前面提到的`install`的文件复制的目标目录。Windows同理。

移除stack：
- 说到路径要移除stack的话，需要移除的目录或文件有：
    - stack可执行文件本身。
    - `stack path --stack-root`，根目录，Linux中的`~/.stack/`，windows中的`C:\sr\`。
    - `stack path --programs`，Windows中的`%LOCALAPPDATA%\Programs\stack`。
    - 任何项目内的`.stack-work`。

### exec

`stack exec`命令在执行命令时会稍微修改一些环境，查找目录也会额外从stack的二进制路径中查找。然后设置一些额外的环境变量（比如添加一些路径到PATH，设置`GHC_PACKAGE_PATH`环境变量，这个会告诉GHC用哪个包数据库）。

添加到path中的骑士就是`stack path --stack-root`中的一些子目录`bin`和`stack path --programs`中的一些可执行文件目录。
linux中执行可以看到环境：
```shell
stack exec env
```
区分传递给`stack`还是传递给`exec`执行的程序的选项很重要，可以用`--`分隔。要执行命令前加`--`，后面都是该命令的参数，前面则是给`stack`的。

运行`stack exec bash`，那么则可以在这个子Shell中执行那些添加到PATH中的命令。

### ghci

GHCI是GHC的REPL环境，进入GHCI：
```shell
stack exec ghci
```
如果要让本地模块都可以访问，可以在项目内`stack ghci`，会将项目内的包可以被访问。然后使用`:m module`加载模块使用。

对于单文件编译的场合，提供了`stack exec ghc/runghc`命令或者单纯使用`stack ghc/runghc`都可以。

### 脚本

stack还可以作为脚本解释器，用来创建可重用的Haskell脚本，而不像Bash或者Python那样。具体就不展开了。Windows不能直接`./script.hs`执行脚本，可以用`stack script.hs`这样执行。
```haskell
#!/usr/bin/env stack
main = print "hello,world!"
```
这样写脚本需要一些必要的注释说明Resolver（固定resolver之后就能保证可重用）等信息，具体信息不展开。上面的脚本会报警告，但能执行。

更多信息可在查阅文档。

## 编辑器集成

主要讨论VsCode如何搭配Stack和[Haskell Language Server](https://github.com/haskell/haskell-language-server)的问题。

Hakell Language Server是[Ghcide](https://github.com/haskell/ghcide)和[Haskell IDE Engine(HIE)](https://github.com/haskell/haskell-ide-engine)的继任者，由双方的团队合作共同开发。后面两者现已归档，最新的程序应该使用Haskell Language Server。

### VsCode环境配置

插件：
- 使用Haskell官方插件[vscode-haskell](https://github.com/haskell/vscode-haskell)，由Haskell Language Server提供支持。

特性（来自Haskell Language Server）：
- 来自GHC的警告和错误诊断。
- 鼠标悬停类型信息和文档信息，包括本地代码中的注释。
- 本地代码跳转。
- 文档符号。
- 文档高亮。
- 代码补全。
- 代码格式化。
- `>>>`注释中的代码求值，`prop>`注释中的代码测试。
- 继承了retrie，一个强大的代码修改工具。左上角灯泡。
- 提示导入函数列表，就是会提示只导入使用的符号。
- 集成了hlint，分析代码并提供快速修复的选项，下划线。
- 模块名修改建议。
- 调用层次查询，右键菜单Show Call Hierarchy。

插件配置：
- 无需过于关心，修改文档和代码打开行为为本地VsCode而不是Hackage网页更好一些。
- 可能需要手动设置Haskell Language Server的路径，而不是让其自动下载。

依赖：
- 对于单独的`.hs .lhs`文件来说，GHC必须在PATH中。
- 基于Cabal的项目，GHC和cabal-install都要在PATH中。
- 基于stack的项目，stack必须在PATH中。

对stack项目的支持：
- `haskell-language-server`需要编译项目之后才能提供诊断，也就是说它必须知道怎么做。
- 一个叫做[hie-bios](https://github.com/haskell/hie-bios)的项目就是用来处理这个事情的。
- `hie-bios`使用一个项目根目录中的`hie.yaml`来管理这些，显式描述了怎么设置环境来编译项目中的不同组件。为此你需要知道项目中有什么组件（模块）并将它们的路径显式指出来。
- 可以使用[implicit-hie](https://github.com/Avi-D-coder/implicit-hie)项目来从stack或者cabal配置生成这个`hie.yaml`文件。
- 如果stack项目中有多个组件，`hie.yaml`会像是这个样子：
```yaml
cradle:
  stack:
    - path: "./test/functional/"
      component: "haskell-language-server:func-test"
    - path: "./exe/Main.hs"
      component: "haskell-language-server:exe:haskell-language-server"
    - path: "./exe/Wrapper.hs"
      component: "haskell-language-server:exe:haskell-language-server-wrapper"
    - path: "./src"
      component: "haskell-language-server:lib"
    - path: "./ghcide/src"
      component: "ghcide:lib:ghcide"
    - path: "./ghcide/exe"
      component: "ghcide:exe:ghcide"
```
- 最终的配置会是下面的一个子集：
```yaml
cradle:
  cabal:
    component: "optional component name"
  stack:
    component: "optional component name"
  bios:
    program: "program to run"
    dependency-program: "optional program to run"
  direct:
    arguments: ["list","of","ghc","arguments"]
  default:
  none:

dependencies:
  - someDep
```
- 上面是Haksell Language Server文档提供的。

看一下`hie-bios`文档：
- `hie-bios`需要知道传递给GHC的参数，和包的依赖，因为需要先构建依赖。
- 它的设计指导原则是由构建工具负责描述环境，确定要构建哪一个包。
- `hie-bios`既不依赖Cabal也不读取任何编译生成文件。而是仅仅依赖于标准GHC的标志，如果一个构建工具支持`repl`命令，运行`repl`会使用正确的标记调用`ghci`，`hie-bios`需要一个方式来得到这些标记。然后才能正确设置给GHC API session。进一步说任何设置API session的错误都是构建工具的锅，他们需要提供正确的标记以便编辑器对项目提供支持。

`hie-bios`对stack的支持：
- 显式声明想使用stack，那么`hie.yaml`就要像这样：
```yaml
cradle:
  stack:
```
- 如果整个项目能够被`stack repl`载入，那么这样就足够了。这种配置在最简单的仅有一个库、一个可执行文件、一个测试套件时正常工作。
- 一些项目拥有多个`stack-*.yaml`指定了多个版本的GHC编译器。这种情况可以使用`stackYaml`指定要使用哪一个，路径以`hie.yaml`为基准。
```yaml
cradle:
  stack:
    stackYaml: "./stack-8.8.3.yaml"
```
- 如果项目更加复杂，就需要指定想要加载哪一个组件，一个组件简单来说就是stack中的一个库、一个可执行文件、或者一个测试套件、或者benchmark。可以使用命令查看所有组件或者叫目标，至于目标的语法可以参见[stack文档-Traget Syntax](https://docs.haskellstack.org/en/stable/build_command/#target-syntax)。
```shell
stack ide targets
```
- 然后指定组件对应的路径（目录或者文件，当多个组件共用一个目录中文件时指定为文件很有用）：
```yaml
cradle:
  stack:
    - path: "./src"
      component: "hie-bios:lib"
    - path: "./exe"
      component: "hie-bios:exe:hie-bios"
    - path: "./tests/BiosTests.hs"
      component: "hie-bios:test:hie-bios"
    - path: "./tests/ParserTests.hs"
      component: "hie-bios:test:parser-tests"
```
- 如果插件对stack项目未工作，那么可以尝试`stack repl`和`stack repl <component name>`。如果失败了，那么应该就是项目无法构建，当解决之后便能成功加载。

最后便是使用[`implicit-hie`](https://github.com/Avi-D-coder/implicit-hie)自动生成`hie.yaml`：
```shell
cd packageDir
stack install implicit-hie
gen-hie > hie.yaml
```
- 需要在项目根目录运行，根据项目文件识别是使用stack还是cabal，也可以用`--stack --cabal`显式指定。
- 普通的项目是完全能用的，如果使用了更高级的特性，可能还是需要自己来再修改一下`hie.yaml`。

使用感受：
- 感觉使用体验也不是那么完美，速度不算快，先用用看吧。

## 感受一下Haskell

ghci中进行表达式求值：
```
Prelude> 1 + 2
3
Prelude> 5 * -3

<interactive>:2:1: error:
    Precedence parsing error
        cannot mix ‘*’ [infixl 7] and prefix `-' [infixl 6] in the same infix expression
Prelude> 5 * (-3)
-15
Prelude> 1 / 3
0.3333333333333333
Prelude> True
True
Prelude> True && False
False
Prelude> True && True
True
Prelude> False || True
True
Prelude> 5 == 5
True
Prelude> 5 /= 4
True
Prelude> 5 /= 5
False
Prelude> "hello" == "hello"
True
```
- `5 * -3`会有错误，使用负数时最好加上括号。
- 运算符也是函数，`== + * /`等需要两个操作数，运算符放中间，就叫中缀函数，一个操作数运算符放前面叫前缀函数。函数调用就是`funcName arg1 arg2`，函数名加上空格分隔的参数列表。
- 函数`succ`返回一个数的后继：
```
Prelude> succ 1
2
Prelude> succ (succ 2 + 3)
7
```
- 函数调用拥有最高优先级。
```
Prelude> succ 9 + max 5 4 + 1
16
Prelude> succ 8 * 10
90
Prelude> succ (8 * 10)
81
```

## 基本要素

事后补充，要熟悉了解有概念的东西。

### 基本内容

- 单行注释：`--`
- 多行注释：`{- -}`
- 在文件头对GHC声明一些编译参数：`{-# #-}`



### 运算符

基本类似于C语言，但使用`not`表示逻辑非。
- [Haskell运算符全解](https://zhuanlan.zhihu.com/p/263797220)
- 结合性分为左结合、右结合和不结合，优先级越大越高。

优先级|左结合|不结合|右结合
:-:|:-|:-|:-
9|`!!`||`.`
8|||`^` `^^` `**`
7|`*` `/` `` `div` `` `` `mod` `` `` `rem` `` `` `quot` ``||
6|`+` `-`||
5|||`:` `++`
4||`=` `/=` `<` `<=` `>` `>=` `` `elem` `` `` `notElem` ``|
3|||`&&`
2|||`\|\|`
1|`>` `>>=`||
0|||`$` `$!` `seq`

### 基本类型类

基本的Typeclass：
- `Eq` 可判断相等性的类型
- `Ord` 可比较大小的类型
- `Show` 可表示为字符串的类型
- `Read` 可从字符串转换出值的类型
- `Enum` 连续的，也就是可枚举的类型。每个值都有后继 (successer) 和前置 (predecesor)，分别可以通过 `succ` 函数和 `pred` 函数得到。
- `Bounded` 有上限和下限。例如：`maxBound :: Char` 或者 `maxBound :: Bool`
- `Num` 数字
- `Integral` 整数，包括`Int Integer`
- `Floating` 浮点数，包括`Float Double`

## 函数

### 定义函数

定义一个函数：和调用类似，参数列表加上`=`号后跟函数体。
```haskell
doubleMe x = x + x
```
调用：
```haskell
doubleMe 10
```
函数中当然可以调用函数：
```haskell
doubleUs x y = doubleMe x + y + y
```
Haskell中函数不需要先声明或者定义才能使用，可以先定义`doubleUs`再定义`doubleMe`。

Haskell中每个函数或者表达式都要返回一个结果，比如`if`必须要有一个`else`语句。Haskell中的`if`语句其实是一个表达式。
```haskell
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1
```
其中`'`也是函数名的合法字符，常常使用单引号来区分一个稍经修改但差别不大的函数。

没有参数的函数称之为定义或者名字，定义后不可修改。
```haskell
hello = "hello,world!"
```

### 使用List

Haskell中，List是最常用的数据结构，十分强大，可以解决许多问题。List是单类型的数据结构，不能将不同类型数据放到同一个List中。

ghci中可以使用`let a = 1`来定义常量，与脚本中`a = 1`相同。

List列表语法：
- 对于字符串来说，`"hello"`仅仅只是`['h','e','l','l','o']`的语法糖，也就是说字符串就是List。
- 合并两个List，`l1 ++ l2`。实现中会遍历左边的List，对于长字符串或者列表不是很友好。
- 使用`:`可以往列表前插入元素，`elem1 : list`。如果要使用`++`连接单个元素到List可以用`[elem1] ++ list`。
- 实际上`[1, 2, 3]`就是`1:2:3:[]`的语法糖，也就是空列表依次在前面插入元素。
- 按照索引取List元素：`[1, 2, 3] !! 2`，索引从0开始。越界将报错。
- List同样可以存放List，不过List的元素类型是它的类型的一部分，需要类型匹配：`[1]:[[2]]`。
- List内部元素可比较时，可以使用`> >= ==`等运算符比较大小，将会按元素依次比较。
- List常用函数：
    - `head`返回首部，即首元素，结果是元素，列表为空将触发异常。
    - `tail`返回尾部，去掉首个元素后的部分，结果是列表，列表为空将触发异常。
    - `last`返回最后一个元素。
    - `init`返回除去最后一个元素的部分。
    - 上面几个函数用于空列表，将在运行时触发异常，编译时不会检查到。
    - `length`得到列表长度。
    - `null`判断列表是否为空，返回`True False`。相比`list == []`来判断会更好。
    - `reverse`反转列表。
    - `take n list`取前n个元素构成的列表。
    - `drop n list`去掉前n个元素，得到剩余元素构成的列表。
    - `maximum minimum`得到最大和最小的元素。
    - `sum product`返回列表所有元素的和与乘积。
    - `elem`判断一个元素是否包含与一个list，`elem 10 [1, 2, 10]`，通常以中缀形式调用``10 `elem` [1, 2, 10]``（需要加反引号）。

### 使用Range

范围:
- `[1..20]`即表示`[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]`。
- 给出指定第二个元素将使用第一个和第二个元素的间隔作为步长，默认是1`[1,3..20]`表示`[1,3,5,7,9,11,13,15,17,19]`。
- 步长可以为负，到达不了上限则生成列表为空：`[1,0..10]`为`[]`。
- 步长仅能指明一次，`[1,2,4..20]`是非法的。
- 不指定上限则无限长度，步长为0同样也是无限长度。无限长度列表将会在使用到时才求值，因为是懒惰求值脚本中定义后不立即求职，比如取某个元素时才会求值。
- **注意**：如果对无限长度列表求值，在ghci中输入无限长度的列表将会一直打印，在`{--}`注释中`>>>`后的表达式不要写无限长度列表，因为会对列表求值，求值工作由后台的Haskell Language Server来做（比如在VsCode中，点击了提示中的`Evaluate...`），此时后台的语言服务器将陷入无限循环，吃掉大量内存和CPU。需要杀掉子进程才能结束。
- `cycle list`可以生成循环list元素的无限列表。
- `repeat value`生成一个仅包含该值的无限列表。
- `replicate n value`重复一个值n次。
### List Comprehension

也就是列表生成式：
- `[expression | ranges and constrait]`，`|`左侧是表达式，右侧是变量范围和约束条件。
- `[x * 2 | x <- [1..10]]`得到`[2,4,6,8,10,12,14,16,18,20]`。
- 表达式中可以是`if-else`语句，因为其也是一个表达式。
- 作用就是`x`遍历`<-`后列表中所有元素，类似于做了循环，变量可以有多个`[[x, y] | x <- [1..], y <- [10..], x + y == 20]`，可以加条件，就像一个数学中的集合生成式一样。
- 如果不关心从列表中取出的值，可以用`_`，`length' xs = sum [1 | _ <- xs]`。
- 移除所有非大写字符：``removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]``。
- 列表生成式可以拆成多行，比较长的话拆成多行比较合适。

### 元组

一般来说，在Haskell中，列表的元素类型必须相同，而元组Tuple不同，元组可以放入不同类型元素。
- 定义：`(elem1, elem2, ...)`。
- 一般来说基本所有语言中，元组的元素数量和每个元素的类型同样是元组类型的一部分。很多语言中元组列表元素都可变，有的语言中元组不可变列表元素可变，当然Haskell是纯函数式语言，所以都不可变。
- 元组的重点在于类型：`(1, 2)`和`(1, 2, 3)`和`(1, "hello")`自然是不同类型。元组的定位应该更类似于C语言中的结构，但是是匿名的，而列表则类似于数组，不可一概而论。
- `fst snd`用于二元组（pair，序对）上取首和尾元素。不能用于其他长度的元组。
- `zip`拉链，将两个列表对应元素合并起来得到二元组列表。较长的列表中的无对应元素被丢弃。

函数式编程语言的一般思路：先取一个初始集合，对其进行变形、执行过滤条件（map and reduce）得到最终结果。

## Type & Typeclass

一般将其称之为**类型和类型类**。

### 类型

- Haskell是强类型和静态类型的。编译期每个表达式的类型都会被确定下来。类似于Scala，Haskell提供类型推导的能力。
- 在VsCode中编写函数时，Haskell语言服务器会为我们自动推导类型，并作出提示。
- 在ghci交互环境中：使用`:t`命令可以检测出其后跟的表达式的类型。
```
Prelude> :t []
[] :: [a]
Prelude> :t [1]
[1] :: Num a => [a]
Prelude> :t ('a', "hello", 10)
('a', "hello", 10) :: Num c => (Char, [Char], c)
```
- 输出结果为`expression :: type`，`::`读做“类型为”，凡是明确的类型，首字母必须大写。函数名则必须小写字母开头。
- 常见类型：`Int Integer Float Double Bool Char`，`Integer`是高精度大整数，`Int`在32位系统中通常是32整数，在64位系统中是64位整数，`Float Double`分别是IEEE 754单精度和双精度浮点数。
- 元组类型和元素个数和类型相关，比如`(Char, Int)`，数组类型则与元素类型相关，类似于`[Char]`，字符串是`String`等价于`[Char]`。
- 函数的类型使用`->`将参数列表的类型和返回值类型串联起来，比如参数是两个`Int`，返回值类型是`Double`，则函数类型是`Int -> Int -> Double`。最后一个类型表示返回值类型。

### 类型变量

函数`fst`类型：
```
Prelude> :t fst
fst :: (a, b) -> a
```
- 注意到，这里的`a b`表示类型，可以用于任意类型，称之为类型变量。作用类似于其他编程语言中的泛型（Generic），但在Haskell中更为强大。有了类型变量可以轻易写出**类型无关的函数**，使用类型变量的函数称之为**多态函数**。
- 上述的`a b`只是代表一个类型，并不一定要是不同类型，当用于`(Int, Char)`的参数时，`a`是`Int`，`b`是`Char`。

### Typeclass

- Typeclass称之为类型类，定义类型的行为，如果某一个类型属于某一个类型类，那么它必然实现了该类型类描述的方法。就类似于其他语言中纯虚类或者接口类的作用。
```
Prelude> :t (==)
(==) :: Eq a => a -> a -> Bool
Prelude> :t elem
elem :: (Foldable t, Eq a) => a -> t a -> Bool
```
- 其中的`Eq`就是一种类型类。
- 这里有一个符号`=>`，其左边的东西叫**类型约束**（Type constraints ），一个类型声明可以看做两段，`=>`右边的部分是类型，左边的部分约束了类型变量必须属于的类型类。
- 参数和返回值的类型如果属于某一个或几个类型类（也就是只对类型进行约束，不限定具体类型），那么必须放在`=>`前并用类型变量指代，如果是具体类型，必须放在`=>`后。
- 多个类型约束放在括号中，可以用多个类型类约束同一个类型变量，表示一个类型必须同时属于多个类型类。
- 常见类型类：
    - `Eq`是可判断相等性的类型类，提供`== /=`函数，除函数以外所有类型都实现了这个类型类。
    - `Ord`是可比较大小的类型类，提供`< > <= >=`之类用于比较大小的函数。
    - `compare`函数用于两个同类`Ord`的比较，类型是`Ord a => a -> a -> Ordering`，结果是以下三个值之一：`LT EQ GT`，并具有大小关系`LT < EQ < GT`。
    ```
    Prelude> 5 `compare` 3
    GT
    ```
    - `Show`是成员可用字符串表示的类型类。常用函数是`show`，将类型转换为`[Char]/String`。
    ```
    >>> :t show
    show :: Show a => a -> String
    >>> show True
    "True"
    >>> show [1, 2]
    "[1,2]"
    >>> show "hello"
    "\"hello\""
    ```
    - `Read`是`Show`相反的类型类，`read`将一个字符串转换为`Read`的实例类型。作用可能就类似于在代码中这样写差不多。
    ```
    >>> :t read
    read :: Read a => String -> a
    >>> read "1.2" + 3.2
    4.4
    >>> read "1"
    Prelude.read: no parse
    ```
    - 单纯的`read`返回一个`Read a`，无法区分具体类型，可以在调用时后面加上`::`类型注释，以明确类型。
    ```
    >>> read "1.0" :: Double
    1.0
    >>> read "(1.0, \"hello\", 10)" :: (Double, [Char], Int)
    (1.0,"hello",10)
    ```
    - `Enum`的类型类的实例都是可枚举类型，属于`Enum`类型类的类型可以用于`Range`中。每个值都有后继（successer）和前置（predecesor），可分别通过`suc`和`pred`得到。包含类型有：`() Bool Char Ordering Int Integer Float Double`。
    ```
    >>> succ LT
    EQ
    >>> [LT .. GT ]
    [LT,EQ,GT]
    >>> [1 .. 10]
    [1,2,3,4,5,6,7,8,9,10]
    >>> [False ..]
    [False,True]
    >>> succ 1.3
    2.3
    ```
    - `Bounded`类型类都有一个上限和下限。`minBound maxBound`的返回类型是`Bounded a => a`，无参数，得到一个`Bounded`类型的下限和上限。
    ```
    >>> :t minBound
    minBound :: Bounded a => a
    >>> minBound :: Int
    -9223372036854775808
    >>> maxBound :: Int
    9223372036854775807
    >>> minBound :: Ordering
    LT
    >>> minBound :: Char
    '\NUL'
    >>> maxBound :: Char
    '\1114111'
    ```
    - `Num`表示数字。包括所有实数和整数:
    ```
    >>> :t (*)
    (*) :: Num a => a -> a -> a
    >>> :t (+)
    (+) :: Num a => a -> a -> a
    >>> (5 :: Int) * 6.0
    No instance for (Fractional Int) arising from the literal ‘6.0’
    ```
    - `Integral`是表示整数的类型类，包含`Int Integer`。
    - `Floating`表浮点数，包含`Float Double`。
    - `fromIntegral`函数处理数字时很有用，类型是`(Integral a, Num b) => a -> b`从整数提取出一个更通用的`Num`。比如当`length [1, 2] * 5`的`*`类型是`Int -> Int`没有问题，但`length [1, 2] * 5.0`则会类型不匹配。
    ```
    >>> :t fromIntegral
    fromIntegral :: (Integral a, Num b) => a -> b
    >>> length [1, 2, 3] * 5.0
    No instance for (Fractional Int) arising from the literal ‘5.0’
    >>> fromIntegral (length [1, 2, 3]) * 5.0
    15.0
    ```
- 可见Haskell对类型匹配的处理是很严格的，C++模板也可以做到类似的事情，不过对于内置类型来说，因为有整型提升和隐式类型转换的存在，运算符的类型检查其实并没有严格到这种地步。
- 其实只是一种形式，类型类提供的功能，在其他语言中也有提供，java的interface，Python中的`__eq__ __str__`等特殊方法，C++的继承，都异曲同工。

多态函数：
- 多态函数在调用时会隐式地给传入类型参数给类型变量（可以类比C++模板函数调用时给的可以省略的模板类型参数），可以是具体类型那么类型参数就被确定，也可以是类型类那么就添加到约束中。如果类型变量本身就有约束，可以传入约束中类型类本身、子类型类、实现了这个类型类的类型实例。这是由Haskell的类型推导做到的，不用显示传入。
```haskell
>>> :t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
>>> :t sqrt
sqrt :: Floating a => a -> a
>>> :t sqrt . fromIntegral
sqrt . fromIntegral :: (Floating c, Integral a) => a -> c
```
- 记住**类型类是约束而不是一种具体的类型**。

## 函数相关语法

### 模式匹配(Pattern matching)

模式匹配本质上就是提供一种用来简化复杂的判断和比较的语法糖。

模式匹配通过检查数据的特定结构来检查是否匹配，并从模式中提取数据。
- 对于列表可以使用`:`运算符进行匹配，比如判断一个列表是否是递增的函数：
```haskell
increasing :: (Ord a) => [a] -> Bool
increasing xs = 
    if xs == []
    then True
    else if tail xs == []
         then True
         else if head xs <= head (tail xs)
              then increasing (tail xs)
              else False
```
- 如果使用模式匹配：
```haskell
increasing'' :: (Ord a) => [a] -> Bool
increasing'' [] = True
increasing'' [x] = True
increasing'' (x:y:ys) = x <= y && increasing''(y:ys)
-- simplify
increasing''' :: Ord a => [a] -> Bool 
increasing''' (x:y:ys) = x <= y && increasing''' (y:ys)
increasing''' _ = True
```
- 模式匹配是按照定义顺序来的，匹配到就停止。【不像prolog会同时尝试匹配所有模式，不同模式的条件需要互斥】。
- 调用的参数没有匹配到的话会抛出运行时异常，所以匹配应该完备，必须能够匹配所有情况的输入，需要编写一个模式用以匹配剩余的情况，比如使用`_`放到最后。
- 匹配时若不需要接受匹配结果，则可以使用`_`。
- 列表不能使用`++`匹配，`x:xs`常用于匹配不固定长度列表，常见于递归函数中，`[x, y]`直接列出元素用于匹配固定长度列表。
- 列表的`as`模式可以用于获取整个列表，比如`xs@(x:y:ys)`，则`xs`得到整个`x:y:ys`，而不必再将整个`x:y:ys`写一遍。
- 元组的模式匹配仅可以匹配具体的项。如：
```haskell
first :: (a, b, c) -> a
first (x, _, _) = x
second :: (a, b, c) -> b
second (_, y, _) = y
third :: (a, b, c) -> c
third (_, _, z) = z
```

### 守卫

模式用来检查一个值是否可以从中取值，而守卫（Guard）则用来检查一个值的某项属性是否为真，是另一种`if`的语法糖。在多分支条件下守卫的可读性更高，并且和模式匹配可以很好的契合。
- 对于`increasing`函数的例子，可以使用守卫：
```haskell
increasing' :: (Ord a) => [a] -> Bool
increasing' xs
    | null xs = True
    | null (tail xs) = True
    | head xs <= head (tail xs) = increasing' (tail xs)
    | otherwise = False
```
- 可以将其看做`if - else if - else if ... else`结构，最后的`otherwise`是最后的`else`也就是万能匹配，可有可无，如果没有`otherwise`且不满足前面所有条件，则会转入下一个模式进行匹配，所以守卫和模式是完全契合起来的。

### where关键字

在守卫中，可能出现多个条件使用了同一个变量，计算了同一个中间值的情况，如果在每个条件中计算一次就会有重复，而重复是天生就应该被优化的。这时就可以使用`where`，用于计算重复的部分。
```haskell
bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          skinny = 18.5  
          normal = 25.0  
          fat = 30.0
```
- `where`中可以定义多个名字和函数，每个名字对守卫都是可见的，并且仅对本函数可见，不会污染全局和其他函数的名称空间。其中的名字都是一列垂直排开，这是语法规范。
- `where`中也可以使用模式匹配。
```haskell
where bmi = weight / height ^ 2  
      (skinny, normal, fat) = (18.5, 25.0, 30.0)
```
- `where`中可以定义辅助函数，其中又可以使用`where`，其中又可以定义辅助函数，可以多层嵌套。

### let关键字

`where` 绑定是在函数底部定义名字，对包括所有守卫在内的整个函数可见。`let`绑定则是个表达式，允许在任何位置定义局部变量，对不同的守卫不可见。正如Haskell中所有赋值结构一样，`let`绑定也可以使用模式匹配。
- 格式为`let [binding] in [expressions]`，在`binding`中绑定的名字仅在`expressions`中可见。
- `let`将绑定放在前面，`where`放在后面。区别在于`where`是一个语法结构，而`let`是一个表达式。所以和`if`表达式一样，可以放在任何表达式可以放的地方。`let`结构中`expressions`的值就是整个`let`表达式的值。
- 比如用于定义局部函数：
```haskell
>>> [let square x = x * x in (square 1, square 2)]
[(1,4)]
```
- 如果要在一行中绑定多个名字，如果要将多个名字排成一行可以用`;`隔开。
```haskell
>>> let a = 100; b = 20 in a + b
120
```
- 但`let`绑定中也是可以使用模式匹配的，所以用元组匹配显然更好：
```haskell
>>> let (a, b) = (100, 20) in a + b
120
```
- 可以将`let`绑定放在列表生成式中单纯用于定义名字，而没有`in`，此时其中定义的名字对其后的条件和`|`前的表达式可见。如果是用`let`表达式作为条件则可以有`in`，那么就是一个普通的`let`表达式，其中名字不会对列表生成式`|`前的表达式和后续条件可见。
```haskell
calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]
```

### case表达式

语法：
```haskell
case expression of pattern1 -> result1
                   pattern2 -> result2
                   pattern3 -> result3
                   ...
```
- 函数的模式匹配就是`case`表达式的语法糖而已，
- 比如`incresing`的模式匹配就等价于：
```haskell
increasing'''' :: Ord a => [a] -> Bool 
increasing'''' xs = case xs of (x:y:ys) -> x <= y && increasing'''' (y:ys)
                               _        -> True
```
- 函数参数模式匹配只能用于函数定义时，而`case`表达式可以用于任何地方。

究根结底，模式匹配、守卫、case表达式都是条件判断的语法糖，为了更方便地进行分支而产生的语法，在支持函数式编程的语言中，这些都是必不可少的糖，使用多层的`if-else`嵌套会显得很冗余。

## 递归

先来一个传统艺能：
- 斐波那契数列（指数复杂度，避免测试过大的参数）：
```haskell
{- fibonacci sequence
>>> fib 10
55
>>> fib 10
55
-}
fib :: (Integral a) => a -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)
```
- 尾递归版本：
```haskell
{-
>>> fib' 10
55
>>> fib' 100
354224848179261915075
>>> fib' 300
222232244629420445529739893461909967206666939096499764990979600
>>> fib' (50 :: Integer)
12586269025
>>> fib' (100 :: Int)
3736710778780434371
-}

fibonacci :: Integral a => a -> Integer -> Integer -> Integer
fibonacci 0 a b = b
fibonacci n a b = fibonacci (n - 1) (a + b) a
fib' :: Integral a => a -> Integer
fib' n = fibonacci n 1 0
```

因为Haskell是纯函数式编程语言，没有循环，所以要实现循环就只能通过递归，所以递归的重要性又上了一层，不再是仅用于递归性质的数据结构或者递归的表达式求解。最普通的列表集合的操作都需要通过递归来实现，这是函数式编程的特点，从命令式编程语言转换到函数式需要重点熟悉锻炼这一点。
- 求最大值：
```haskell
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum a empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
```
- `replciate`函数：
```haskell
replicate' :: (Ord t, Num t) => t -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x:replicate' (n-1) x
```
- 取列表前n个元素：
```haskell
take' :: (Ord a1, Num a1) => a1 -> [a2] -> [a2]
take' n _
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs
```
- 判断元素是否在列表中：
```haskell
elem' :: Eq t => t -> [t] -> Bool
elem' a [] = False 
elem' a (x:xs)
    | x == a = True 
    | otherwise = a `elem'` xs
```
- 列表相关操作都可以通过递归实现，借助模式匹配实现起来都非常简单。
- 快速排序：就一个字，简单得有点离谱。
```haskell
{- quick sort
>>> quicksort [3, 1, 2, 4, 5, 7, 9, 100, -10]
[-10,1,2,3,4,5,7,9,100]
>>> quicksort "the quick brown fox jumps over the lazy dog's back"
"         'aabbccdeeefghhijkklmnoooopqrrssttuuvwxyz"
-}
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ (x : biggerSorted)
```

递归的书写模式：
- 处理边界条件，如空列表、没有子节点的节点、0、负值等情况，单独定义为一个或多个模式。多个参数的话则需要考虑多种情况，并注意他们的顺序。
- 定义一般处理逻辑，从一系列元素中取出一个，处理完后，将剩余的元素交给这个函数继续处理。

在命令式语言中，为了避免递归带来的栈消耗，能循环肯定是不递归的，递归常用在递归数据结构和特定问题处理中。但在纯函数式编程语言中，递归被用来替代循环。

## 高阶函数

高阶函数：函数可以作为参数、返回值、赋给另一个变量。

### 柯里化

在Haskell中，所有的多参数函数都支持柯里化，所以也可以说本质上Haskell的所有函数都只有一个参数，多参数的调用就是多个一参数函数的调用。
- 比如`max`函数：
```haskell
{- curried functions
>>> :t max
max :: Ord a => a -> a -> a
>>> :t max 4
max 4 :: (Ord a, Num a) => a -> a
>>> :t max4
max4 :: (Ord a, Num a) => a -> a
>>> max4 5.0
5.0
>>> (max 4) 5
5
-}
max4 :: (Ord a, Num a) => a -> a
max4 = max 4
max4' :: (Ord a, Num a) => a -> a
max4' x = max 4 x
```
- `max 4`将得到一个函数，`max4 max4'`从含义是等价的，并且Haskell的hlint会提示后者可以简写为前者。
- 所以在实际上类型`a -> a -> a -> a`和`a -> (a -> (a -> a))`是等价的，从语法上来说这源于运算符`->`是右结合的。
- 当然如果要固定第二个参数，那么还是需要`max4'' x = max x 4`这样的定义方法。
- 中缀函数也可以柯里化，并且可以可以固定第一个或者第二个参数：
```haskell
{- infix functions
>>> :t divBy10
divBy10 :: Double -> Double
>>> divBy10 100
10.0
>>> divX 100
0.1
-}
divBy10 :: Double -> Double
divBy10 = (/10)
divX :: Double -> Double
divX = (10/)
```
- 前缀函数也可以按照这个逻辑转为中缀之后固定第一个或者第二个参数。
- 对于某些一元和二元运算符使用同一个符号的情况，比如`-`用作减号和负号，`(-4)`则表示值-4，而不是接受一个参数将参数减4的函数。属于例外，为了避免冲突的选择，要使用减号含义则可以使用`subtract`，负号含义和`negate`等价。

### 函数作为参数

类型声明中将函数的类型加上括号即可。
- 实现标准库`zipWith`函数，传入接受两个参数得到结果的函数和两个列表，得到对两个列表对应值应用函数后结果的列表，不得不说类型推导确实强大。
```haskell
{- function as arguments
>>> zipWith (+) [1, 2, 3] [4, 5, 6, 7]
[5,7,9]
>>> zipWith' (+) [1, 2, 3] [4, 5, 6, 7]
[5,7,9]
-}
zipWith' :: (t1 -> t2 -> a) -> [t1] -> [t2] -> [a]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
```

而至于函数作为返回值，其实默认就是柯里化的函数本身就已经将函数作为返回值了，也可以显式定义：
```haskell
f :: Num a => a -> a -> a -> a
f x = let tmp1 y = (let tmp2 z = x * y * z in tmp2) in tmp1
```
- 这样和`f' x y z = x * y * z`并没有任何区别，还会显得很呆。

### 常用高阶函数

map（映射）/reduce（规约）是最常用的高阶函数。前者将一个列表映射到另一个列表，后者将一个列表规约为一个值。
- `map :: (a -> b) -> [a] -> [b]` 映射一个列表到另一个列表。
- `filter :: (a -> Bool) -> [a] -> [a]` 筛选符合条件的元素到结果列表。
- `map filter`完全其实可以用列表推导式来代替，或者说本身就是等价的，用什么并不重要，凭个人喜好就好。
- `takeWhile :: (a -> Bool) -> [a] -> [a]` 按顺序取元素直到条件不满足。
- `zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]` 将两个列表的对应元素应用函数后得到新列表。
- `flip :: (a -> b -> c) -> b -> a -> c` 接受一个二元函数，将两个参数翻转并返回新的二元函数。


### lambda

有高阶函数那肯定要有匿名函数了。Haskell用`\`来表示匿名函数，定义方法：`\args -> retval`，用的时候一般用括号将整个匿名函数括起来。
```haskell
>>> zipWith (\x y -> x + y) [1, 2] [10, 100, 1]
[11,102]
>>> map (\x -> x ** x) [1, 2, 3, 4]
[1.0,4.0,27.0,256.0]
```
同普通函数一样可以使用模式匹配，但是无法为匿名函数设置多个模式，所以在匿名函数中要慎用模式匹配。

使用匿名函数来实现`x * y * z`的柯里化会更容易理解一些，当然熟悉了默认柯里化之后，用`\x y z -> x * y * z`更简单直观。
```haskell
f'' :: Num a => a -> a -> a -> a
f'' = \x -> \y -> \z -> x * y * z
```
实现`flip`函数：使用匿名函数实现会更容易让人理解一些，表明其返回一个函数，但两者其实是等价的。
```haskell
flip' :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
flip' f = \x y -> f y x
flip'' :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
flip'' f x y = f y x
```

### fold & scan

折叠：
- 折叠，就是将一个列表规约为一个值：
```haskell
>>> :t foldl
foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
>>> :t foldr
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
```
- `foldl foldr`接受一个函数，一个初值和一个可折叠对象，对初值和起始元素调用函数，然后一次对结果和下一个值调用直接结束，得到结果。`foldl`从左到右，`foldr`从右到左。并且注意传入函数的参数对应关系是不同的，`foldl`第一个参数为初值或者中间结果，第二个参数是可折叠对象元素，而`foldr`是反过来的。当中间结果和可折叠对象元素类型不同时需要特别注意。
```haskell
>>> foldl (-) 0 [1, 2, 3]
-6
>>> 0 - 1 - 2 - 3
-6
>>> foldr (-) 0 [1, 2, 3]
2
>>> 1 - (2 - (3 - 0))
2
```
- `foldl1 foldr1`和`foldl foldr`类似，不过他们使用首或尾元素作为初值而不需要再传入初值。
- 对空列表进行折叠会抛出运行时异常。
- 有个小区别是`foldl`能用于无限列表（但这不是会无限循环吗？），`foldr`不能。经过实测都会进入无限循环？这一条是存在疑问的，应该避免将`fold`用于无限列表。

扫描：
- `scanl scanr`与`foldl foldr`类似，不同的是结果，`scanl scanr`的结果是一个列表，包括初始值和所有中间结果与最终结果。`scanl`是从左往右添加结果，`scanr`则是从右向左。
- `scanl1 scanr1`用首尾元素作为初始值，同理。
```haskell
>>> :t scanl
scanl :: (b -> a -> b) -> b -> [a] -> [b]
>>> :t scanr
scanr :: (a -> b -> b) -> b -> [a] -> [b]
>>> scanl (-) 0 [1, 2, 3, 4]
[0,-1,-3,-6,-10]
>>> scanr (-) 0 [1, 2, 3, 4]
[-2,3,-1,4,0]
>>> :t scanl1
scanl1 :: (a -> a -> a) -> [a] -> [a]
>>> scanl1 (-) [1, 2, 3, 4]
[1,-1,-4,-8]
>>> scanr1 (-) [1, 2, 3, 4]
[-2,3,-1,4]
```

折叠和扫描在一定程度上可以用来替代递归在列表上的使用。

### $函数调用符

`$`被称作函数调用符：
- 定义：接受一个函数和一个参数并返回使用这个函数调用参数的结果，不改变具体逻辑，但使用`$`后，函数调用的优先级被改变了。
```haskell
($) :: (a -> b) -> a -> b
f $ x = f x
```
- 用空格调用的函数调用是左结合的`f x y z`与`((f x) y) z`等价。
- `$`是中缀函数，右结合，最低优先级，其他表达式都会得到优先计算，然后才从右向左执行使用`$`调用的函数。
- `f $ 1 + 1`表示`f (1 + 1)`，作用是降低了函数调用的优先级，减少括号的使用。
- 因为是右结合，并且`$`只接受一个函数参数，所以`f x y z`不能写作`f $ x $ y $ z`（应该在当`x y z`是表达式或者函数调用时才用`$`，不然是没有必要的），因为右结合含义就变成了`f $ (x $ (y $ z))`，这明显不是想要的语义。多个参数可以使用括号指定结合性`((f $ x) $ y) $ z`但这样本质上并没有减少括号，所以对于多参数的函数，还不如`f (x) (y) (z)`，当然最后一个参数永远是可以用的`f (x) (y) $ z`。
- `$ x`可以将数据变成函数，接受一个函数，返回值是将这个数据`x`用于传入的函数后得到的结果。
```haskell
{- ($) operator
>>> :t ($)
($) :: (a -> b) -> a -> b
>>> fn $ 1 + 2
9
>>> :t ($ 1)
($ 1) :: Num a => (a -> b) -> b
-}
fn :: Num a => a -> a
fn x = x * x
```
- 虽然有点魔法的味道，又改优先级又改结合性，但在一定程度上使用可以减少括号，让程序更清晰易读。
- 注意适度，不要滥用，请在充分理解之后再使用。

### 函数复合(Function Composition)

或者叫做函数组合。在数学中，复合函数的定义是$(f \circ g)(x) = f(g(x))$，即将函数$g(x)$的值作为$f(x)$的自变量，既然函数式编程中的函数的含义是数学中的函数而不是一般命令式编程中表是一个计算过程的函数。那么理所应当要支持复合函数（或者叫做函数组合）了，$f(g(x))$的含义就是先调用$g(x)$再对结果调用$f(x)$。
- Haskell中使用`.`运算符定义复合函数。
- 定义：非常直白，中缀，接受两个单参数的函数，先调用后者，再调用前者。
```haskell
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)
```
- 很显然定义函数复合时内层函数`g`的返回值类型必须要和外层函数`f`的参数类型一致。
- `.`优先级低于函数调用，需要将复合函数括起来，配合`$`可以不用括号`f . g $ (expression)`。
```haskell
{- function composition
>>> map (f' . g') [1..20] 
[8,24,48,80,120,168,224,288,360,440,528,624,728,840,960,1088,1224,1368,1520,1680]
>>> map h [1..20] 
[8,24,48,80,120,168,224,288,360,440,528,624,728,840,960,1088,1224,1368,1520,1680]
>>> map (\x -> f' (g' x)) [1..20]
[8,24,48,80,120,168,224,288,360,440,528,624,728,840,960,1088,1224,1368,1520,1680]
-}

-- f(x) = (2*x + 1) ^ 2 - 1
g' :: Num a => a -> a
g' x = 2 * x + 1
f' :: Num a => a -> a
f' x = x ^ 2 - 1

h :: Num a => a -> a
h x = (2 * x + 1) ^ 2 - 1
```
- 实际使用可以用`f . g`这样用，或者直接写成匿名函数`\x -> f (g x)`也很简单和清晰，毕竟是等价的。
- 这里的函数都只包含一个参数，如果是多个参数函数，可以使用不全调用，传入部分参数只剩下最后一个参数，便可以用于复合。
- 比如`sum (replicate 5 (max 6.7 8.9))`可以写作`(sum . replicate 5 . max 6.7) 8.9`（看起来很怪，这样组合意义不明，仅做演示）。
- 使用函数复合配合`$`可以进一步去掉括号，刚开始可能会有点晦涩，但充分理解之后用起来非常舒服。
- 其中一个使用理由就是定义Point free style（Pointless style）的函数，比如：
```haskell
{- point free style function
>>> map func [100..120.0]
[-1,-1,0,1,2,1,0,-1,0,1,2,1,0,-1,0,1,2,1,0,-1,-1]
>>> map func' [100..120.0]
[-1,-1,0,1,2,1,0,-1,0,1,2,1,0,-1,0,1,2,1,0,-1,-1]
-}
func :: (RealFrac a, Integral b, Floating a) => a -> b
func x = ceiling (negate (tan (cos (max 50 x))))
func' :: Double -> Integer
func' = ceiling . negate . tan . cos . max 50
```
- Point free style中函数定义去掉了参数，而是已知的多个简单函数组合形成一个复杂函数。
- 思考如何写出Point free style的函数时，思考的会是函数的组合方式，而不是数据的传递方式。
- 当然如果函数太复杂，硬要写成Point free可能会适得其反，这时候更好的方法可能是用`let`语句给中间结果绑定名字，或者再将问题分割成更小的问题再组合到一起。
- 编码风格是个人选择，Haskell提供了灵活的语法，相信实践时代码的迭代优化过程会很有趣，但如果是项目开发为了风格统一估计也要付出更多代价。
- 趣学指南中给了一个简单例子：实用、好看又清晰，`$`的使用使得所有函数经过复合之后最后再进行调用。
```haskell
oddSquareSum :: Integer  
oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]
```
- 阅读经过复合的函数时应该从里到外去理解。

## 模块

Haskell中模块就是一组相关函数、类型、类型类的组合，Haskell进程本质就是从主模块中引用其他模块调用其中的函数执行操作。如果一个模块足够独立，里面的函数就可以被不同进程共用。

Haskell标准库就是一组模块，每个模块都有一组功能相近或相关的函数和类型。比如处理List的、处理并发的、处理复数的等。目前谈及的所有数据结构、类型、类型类都是`Prelude`模块一部分，默认自动引入。

### 引入模块

引入模块的语句必须在函数定义前，一般都是至于文件顶部。引入后引入模块中所有函数都进入全局命名空间：
```haskell
import module1 module2 module3
```
如果只需要用到某一个模块的两个函数，则可以只引入这两个函数：
```haskell
import module1 (func1, func2)
```
如果想引入某个模块的全部函数和类型但除了其中某个函数可以使用`hiding`，不能和引入部分符号同时使用：
```haskell
import module1 hiding (func)
```
`Prelude`模块虽然已经自动引入，但仍可以手动只引入其中部分符号或者屏蔽其中部分符号：
```haskell
import Prelude hiding (max)
```

某些模块中具有同名的函数，为了避免名称冲突，可以使用`import qualified`，这样使用时必须使用名称`modulename.func`。
```haskell
import qualified modulename
```
给引入的模块定义别名，模块名必须大写字母开头，同样可以隐藏或部分引入：
```haskell
import qualified Data.Map as M hiding (map)
```
在ghci中引入模块：
```
:m module1 module2 module3 ...
```

深入学习可查阅[Haskell标准库](https://downloads.haskell.org/~ghc/latest/docs/html/libraries/)。

检索标准库或者第三方库中的Haskell函数、类型可以上[Hoogle](https://hoogle.haskell.org/)，允许通过函数名模块名甚至近似的函数类型签名并允许指定搜索范围或者库作者来检索Stackage上的Haskell函数库。并且能够直接跳转到库文档或者页面，十分方便。

### 常用库

调用模块中函数类型时使用`module.func`，同样是`.`号，中间不能有空格，区分于函数复合。

`Data.List`：
- List常用操作，`map fileter`便是出自这个库，太过常用所以`Prelude`中将其导出了。
- `intersperse :: a -> [a] -> [a]` 将一个元素穿插到一个列表的每两个元素间。
- `intercalate :: [a] -> [[a]] -> [a]` 将一个列表插入到一个列表中的所有列表间。
- `transpose :: [[a]] -> [[a]]` 翻转一个二维列表的行和列。如果用来存储矩阵，那就表示转置。
- `foldl' :: Foldable t => (b -> a -> b) -> b -> t a -> b` `foldl`的严格（restrict）版本，`foldl`是惰性（lazy）的，不会立即求值，而是做一个”在必要时会取得所需的结果”的承诺。每过一遍累加器，这一行为就重复一次。在列表很大时，这堆承诺可能会塞满堆栈造成栈溢出，此时应改用严格版本，严格版本会直接计算出中间值并继续执行下去。
- `foldl1' :: (a -> a -> a) -> [a] -> a` `foldl1`的严格版本。
- `concat :: Foldable t => t [a] -> [a]` 连接一组列表。
- `concatMap :: Foldable t => (a -> [b]) -> t a -> [b]` 与先`map`再`concat`等价。
- `and :: Foldable t => t Bool -> Bool` 对一组元素求与。
- `or :: Foldable t => t Bool -> Bool` 对一组元素求或。
- `any :: Foldable t => (a -> Bool) -> t a -> Bool` 判断是否存在满足条件的元素。
- `all :: Foldable t => (a -> Bool) -> t a -> Bool` 判断是否所有元素都满足条件。
- `iterate :: (a -> a) -> a -> [a]` 用一个值调用一个函数，并用结果继续调用函数，产生一个无限的列表。
- `splitAt :: Int -> [a] -> ([a], [a])` 将列表从特定位置断开，返回前后两个列表的元组。
- `takeWhile :: (a -> Bool) -> [a] -> [a]` 取元素直到条件不满足。
- `dropWhile :: (a -> Bool) -> [a] -> [a]` 舍弃满足条件的元素直到首个不满足的元素，得到剩余元素的列表，`takeWhile`的补集。
- `span :: (a -> Bool) -> [a] -> ([a], [a])` 得到`takeWhile dropWhile`的列表构成的元组。
- `break :: (a -> Bool) -> [a] -> ([a], [a])` 和`span`条件相反，直到首次满足时断开，等价于`break p`等价于`span (not . p)`。
- `sort :: Ord a => [a] -> [a]` 排序，升序排列。
- `group :: Eq a => [a] -> [[a]]` 归类相邻相等的元素。
- `inits :: [a] -> [[a]] tails :: [a] -> [[a]]` 类似于`init tail`，只是会递归调用直到空，得到子列表构成的列表。
- `isPrefixOf :: Eq a => [a] -> [a] -> Bool` 检查是否是前缀，前者是子列表，常以中缀形式使用。
- `isSuffixOf :: Eq a => [a] -> [a] -> Bool` 检查是否是后缀。
- `elem :: (Foldable t, Eq a) => a -> t a -> Bool`
- `notElem :: (Foldable t, Eq a) => a -> t a -> Bool`
- `partition :: (a -> Bool) -> [a] -> ([a], [a])` 按条件分为满足和不满足的元素构成列表的元组。搜索整个列表，区别于`span break`。
- `find :: Foldable t => (a -> Bool) -> t a -> Maybe a` 查找首个满足的元素，结果是一个`Maybe`，其值是`Just something`或者`Nothing`（单个元素或者空值）。
- `elemIndex :: Eq a => a -> [a] -> Maybe Int` 查找元素并返回下标，`Just index`或者`Nothing`。
- `elemIndices :: Eq a => a -> [a] -> [Int]` 查找元素返回所有下标。
- `findIndex :: (a -> Bool) -> [a] -> Maybe Int` 按条件查找首个满足元素下标。
- `findIndices :: (a -> Bool) -> [a] -> [Int]` 按条件查找所有满足元素，得到所有下标。
- `zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]` `zip`的更多列表版本，同理`zip4 zip5 ... zip7`。
- `zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]` 同理`zipWith4 zipWith5 ...`。
- `lines :: String -> [String]` 按行（依据字符`\n`）切分字符串。
- `unlines :: [String] -> String` `lines`反函数，拼接多个字符串，每个字符串末尾补`\n`。
- `nub :: Eq a => [a] -> [a]` 元素去重，nub意思是一小块一部分，用在这里感觉有点老掉牙不确切。
- `delete :: Eq a => a -> [a] -> [a]` 删除第一次出现的元素。
- `(\\) :: Eq a => [a] -> [a] -> [a]` `\`运算符，计算差集，从前者中减去后者，使用`\`需要转义，所以代码中都是`\\`。
- `union :: Eq a => [a] -> [a] -> [a]` 取并集。
- `intersect :: Eq a => [a] -> [a] -> [a]` 取交集。
- `insert :: Ord a => a -> [a] -> [a]` 插入元素到可排序列表的首个大于等于它的元素前，如果原先是升序排列的，那么插入后仍是。
- 对于更为常用的`length take drop splitAt !! replciate`之类函数的参数类型都是`Int`，按道理来说提供`Integral Num`会更好，但是处于历史原因修改会引起兼容性问题。所以提供了`genericLength genericTake genericDrop genericSplitAt genericIndex genericReplicate`函数提供更通用的类型。
```haskell
length :: Foldable t => t a -> Int
take :: Int -> [a] -> [a]
drop :: Int -> [a] -> [a]
splitAt :: Int -> [a] -> ([a], [a])
(!!) :: [a] -> Int -> a
replicate :: Int -> a -> [a]
genericLength :: Num i => [a] -> i -- for scene like average
genericTake :: Integral i => i -> [a] -> [a]
genericDrop :: Integral i => i -> [a] -> [a]
genericSplitAt :: Integral i => i -> [a] -> ([a], [a])
genericIndex :: Integral i => [a] -> i -> a
genericReplicate :: Integral i => i -> a -> [a]
```
- `sort insert maximum minimum`都有各自更通用的版本，可以传入比较函数。
```haskell
sort :: Ord a => [a] -> [a]
insert :: Ord a => a -> [a] -> [a]
minimum :: (Foldable t, Ord a) => t a -> a
maximum :: (Foldable t, Ord a) => t a -> a
sortBy :: (a -> a -> Ordering) -> [a] -> [a]
insertBy :: (a -> a -> Ordering) -> a -> [a] -> [a]
minimumBy :: Foldable t => (a -> a -> Ordering) -> t a -> a
maximumBy :: Foldable t => (a -> a -> Ordering) -> t a -> a
```
- `nub delete union intersect group`也有通用版本，就是后面加上`By`，他们可以传入一个函数用以替代`(==)`来测试相等。比如`group`等价于`groupBy (==)`。
```haskell
nub :: Eq a => [a] -> [a]
delete :: Eq a => a -> [a] -> [a]
union :: Eq a => [a] -> [a] -> [a]
intersect :: Eq a => [a] -> [a] -> [a]
group :: Eq a => [a] -> [[a]]
nubBy :: (a -> a -> Bool) -> [a] -> [a]
deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a]
unionBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
intersectBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
```
- `Data.Function`模块提供了`on`函数，可以方便地定义这种比较函数：
```haskell
on :: (b -> b -> c) -> (a -> b) -> a -> a -> c  
f `on` g = \x y -> f (g x) (g y)
```
- `on`就相当于对两个自变量的函数做一个复合：$(f\circ g)(x, y) = f(g(x), g(y))$。比如``compare `on` length``用于按照列表长度比较，``(==) `on` (>0)``用于按照是否同为正数判等，非常地灵活。
```haskell
>>> groupBy ((==) `on` (>0)) [-1, -2, 0, 1, 22, 10, -100]
[[-1,-2,0],[1,22,10],[-100]]
>>> sortBy (compare `on` length) $ reverse [[1..x] | x <- [0..5]]
[[],[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]
```
- 通常与`By`结尾函数打交道，如果判断相等性，常用``(==) `on` something``，若判断大小，常用``compare `on` something``。

`Data.Char`：
- 一组用于处理字符的函数，字符串本质是函数，所以在处理字符串的`filter map`时会比较常用到。
- 类型都是`Char -> Bool`。
- `isControl` 判断一个字符是否是控制字符。
- `isSpace` 判断一个字符是否是空格字符，包括空格，tab，换行符等.
- `isLower` 判断一个字符是否为小写.
- `isUper` 判断一个字符是否为大写。
- `isAlpha` 判断一个字符是否为字母.
- `isAlphaNum` 判断一个字符是否为字母或数字.
- `isPrint` 判断一个字符是否是可打印的.
- `isDigit` 判断一个字符是否为数字.
- `isOctDigit` 判断一个字符是否为八进制数字.
- `isHexDigit` 判断一个字符是否为十六进制数字.
- `isLetter` 判断一个字符是否为字母.
- `isMark` 判断是否为 unicode 注音字符，你如果是法国人就会经常用到的.
- `isNumber` 判断一个字符是否为数字.
- `isPunctuation` 判断一个字符是否为标点符号.
- `isSymbol` 判断一个字符是否为货币符号.
- `isSeperater` 判断一个字符是否为 unicode 空格或分隔符.
- `isAscii` 判断一个字符是否在 unicode 字母表的前 128 位。
- `isLatin1` 判断一个字符是否在 unicode 字母表的前 256 位.
- `isAsciiUpper` 判断一个字符是否为大写的 ascii 字符.
- `isAsciiLower` 判断一个字符是否为小写的 ascii 字符.
- `GeneralCategory` 是一个类型类，同时是一个枚举用来表示字符的分类，共有31个分类。
```haskell
>>> map generalCategory "\r\nab\t A?[%#@!"
[Control,Control,LowercaseLetter,LowercaseLetter,Control,Space,UppercaseLetter,OtherPunctuation,OpenPunctuation,OtherPunctuation,OtherPunctuation,OtherPunctuation,OtherPunctuation]
>>> [(minBound :: GeneralCategory) .. (maxBound :: GeneralCategory)]
[UppercaseLetter,LowercaseLetter,TitlecaseLetter,ModifierLetter,OtherLetter,NonSpacingMark,SpacingCombiningMark,EnclosingMark,DecimalNumber,LetterNumber,OtherNumber,ConnectorPunctuation,DashPunctuation,OpenPunctuation,ClosePunctuation,InitialQuote,FinalQuote,OtherPunctuation,MathSymbol,CurrencySymbol,ModifierSymbol,OtherSymbol,Space,LineSeparator,ParagraphSeparator,Control,Format,Surrogate,PrivateUse,NotAssigned]
```
- `toUpper` 将一个字符转为大写字母，若该字符不是小写字母，就按原值返回。
- `toLower` 将一个字符转为小写字母，若该字符不是大写字母，就按原值返回。
- `toTitle` 将一个字符转为 title-case，对大多数字元而言，title-case 就是大写。
- `digitToInt` 将一个字符转为 Int 值，而这一字符必须得在 '1'..'9','a'..'f'或'A'..'F' 的范围之内。
- `ord :: Char -> Int` 字符转Unicode码点。
- `chr :: Int -> Char` Unicode码点转字符。
- 一个原始的加密算法，仅仅偏移字符串：
```haskell
encode :: Int -> String -> String
encode shift = map (chr . (+shift) . ord)

decode :: Int -> String -> String
decode shift = encode (-shift)
```

`Data.Map`：
- 关联列表或者叫字典，元素是键值对，没有特定顺序。如果要实现类似功能，可以使用键值二元组的List。
- 其中有部分和`Data.List`中重名的函数，注意`import qualified Data.Map as M`。
- `Data.Map.fromList :: Ord k => [(k, a)] -> Map k a` 从列表创建字典，对关键字去重。
```haskell
>>> :t M.fromList
M.fromList :: Ord k => [(k, a)] -> Map k a
>>> M.fromList [(1,'a'), (1, 'z'), (2, 'B')]
fromList [(1,'z'),(2,'B')]
```
- 对于普通列表，只需要元素能够判等，而对于字典，需要可排序，实现使用平衡树。处理键值对时，如果键属于`Ord`类型类，就应该尽量用`Data.Map`。
- `Data.Map.empty :: Map k a` 创建空字典。
- `Data.Map.insert :: Ord k => k -> a -> Map k a -> Map k a` 插入元素。
- 利用`empty insert`创建自己的`fromList`，（类型推导不是万能的，需要自己明确类型）。
```haskell
fromList' :: Ord k => [(k, a)] -> M.Map k a
fromList' = foldr (\(k, v) acc -> M.insert k v acc) M.empty

fromList'' :: Ord k => [(k, a)] -> M.Map k a
fromList'' = foldl (\acc (k, v) -> M.insert k v acc) M.empty
```
- `Data.Map.null :: Map k a -> Bool` 判空。
- `Data.Map.size :: Map k a -> Int` 大小。
- `Data.Map.singleton :: k -> a -> Map k a` 构建单元素字典。
- `Data.Map.lookup :: Ord k => k -> Map k a -> Maybe a` 查找键对应值。
- `Data.Map.member :: Ord k => k -> Map k a -> Bool` 判断键是否存在。
- `Data.Map.map :: (a -> b) -> Map k a -> Map k b` 字典版本`map`。
- `Data.Map.filter :: (a -> Bool) -> Map k a -> Map k a` 字典版本的`filter`。
- `Data.Map.toList :: Map k a -> [(k, a)]` 字典到列表。
- `Data.Map.keys :: Map k a -> [k]` 键列表，等价于`map fst . Data.Map.toList`。
- `Data.Map.elems :: Map k a -> [a]` 值列表，等价于`map snd . Data.Map.toList`。
- `Data.Map.fromListWith :: Ord k => (a -> a -> a) -> [(k, a)] -> Map k a` 和`fromList`很像，但不会直接忽略重复键，而是交给一个函数处理重复键的值。可以组合多个值、选最大值、累加到一起等，由传入函数决定。
```haskell
>>> M.fromListWith (\v1 v2 -> v1 ++ ", " ++ v2) [(1, "hello"), (1, "world")]
fromList [(1,"world, hello")]
>>> M.fromListWith (+) [(1, 2), (1, 3)]
fromList [(1,5)]
```
- `Data.Map.insertWith :: Ord k => (a -> a -> a) -> k -> a -> Map k a -> Map k a` 插入元素，重复键交给传入函数处理。
- 更多函数查看[文档](https://downloads.haskell.org/~ghc/latest/docs/html/libraries/containers-0.6.5.1/Data-Map.html)。

`Data.Set`：
- `import qualified Data.Set as Set`。
- 常用函数：
```haskell
Data.Set.fromList :: Ord a => [a] -> Set a
Data.Set.difference :: Ord a => Set a -> Set a -> Set a
Data.Set.null :: Set a -> Bool
Data.Set.size :: Set a -> Int
Data.Set.member :: Ord a => a -> Set a -> Bool
Data.Set.empty :: Set a
Data.Set.singleton :: a -> Set a
Data.Set.insert :: Ord a => a -> Set a -> Set a
Data.Set.delete :: Ord a => a -> Set a -> Set a
Data.Set.map :: Ord b => (a -> b) -> Set a -> Set b
Data.Set.filter :: (a -> Bool) -> Set a -> Set a
```
- 其中`difference`是求差集：
```haskell
>>> Set.difference (Set.fromList [1, 2, 3]) $ Set.fromList [2, 100]
fromList [1,3]
```
- 集合的一个常见用途时，列表转集合再转列表去重，要求元素是`Ord`，比`nub`更快，但不保留列表中元素的顺序。
```haskell
setNub :: Ord a => [a] -> [a]
setNub = Set.toList . Set.fromList
```

### 编写自己的模块

单个文件：
```haskell
module Geometry
( sphereVolume
, sphereArea
, cubeVolume
, cubeArea
, cuboidVolume
, cuboidArea
) where


sphereVolume :: Floating a => a -> a
sphereVolume radius = (4.0 / 3.0) * pi * (radius ^ 3)

sphereArea :: Floating a => a -> a
sphereArea radius = 4 * pi * (radius ^ 2)

cubeVolume :: Floating a => a -> a
cubeVolume side = cuboidVolume side side side

cubeArea :: Floating a => a -> a
cubeArea side = cuboidArea side side side

cuboidVolume :: Floating a => a -> a -> a -> a
cuboidVolume a b c  = a * b * c

cuboidArea :: Floating a => a -> a -> a -> a
cuboidArea a b c = (rectangleArea a b + rectangleArea b c + rectangleArea a c) * 2

rectangleArea :: Floating a => a -> a -> a
rectangleArea a b = a * b
```
- 要导出的函数放到`()`中，没有导出的是模块内部函数。
- 便可以在同级目录下的`.hs`中进行导入，使用由导入的模块导出的函数。

多个文件：
- 新建目录`Geometry`，并在其中添加文件`Sphere.hs`：
```haskell
module Geometry.Sphere 
( volume
, area
) where

volume :: Floating a => a -> a
volume radius = (4.0 / 3.0) * pi * (radius ^ 3)

area :: Floating a => a -> a
area radius = 4 * pi * (radius ^ 2)
```
- 在`Geometry`同级目录下的`.hs`文件中可以引入。

更多细节待挖掘。


## 定义类型和类型类

### 定义新类型

使用`data`关键字，标准库中`Bool`类型的定义：
```haskell
data Bool = False | True
```
语法：
```haskell
data NameOfType = ValueConstructor1 TypesOfParams1 | ... deriving (Typeclass1, Typeclass2, ...)
```
- `=`右侧称之为**值构造器**（Value Constructor），其中明确了类型所有可能的值，`|`读作或，类型和值构造器中的m名称都必须首字母大写。
- 值构造器也是函数，可以有参数，按照参数调用某个值构造器就会返回一个类型实例，和普通函数的区别就是首字母是否大写。
- 类型名称可以和某个值构造器相同，在一个类型只有一个值构造器时很常见。
- 使用`deriving`从其他类型类派生。
- 例子：
```haskell
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
```
- 则调用`Circle f1 f2 f3`或者`Rectangle f1 f2 f3 f4`会得到一个新的`Shape`，`Circle Rectangle`不是类型，只是一个函数，他们的返回类型都是`Shape`。对于`Bool`，`True False`没有参数，所以不需要传入参数`True False`就是`Bool`的不同取值。
- 需要一个类型能够在控制台输出为字符串，则需要派生自`Show`类型类。
- 导出类型和构造器：在要导出的类型后加`()`，其中加入要导出的值构造器，使用`(..)`可以导出全部值构造器。
```haskell
module Shapes
( Shape(Circle, Rectangle)
) where
```
- 值构造器也只是函数，如果不导出，只是拒绝外部使用这些值构造器而已，仍然可以提供其他函数用于构造类型，比如`Data.Map.fromList`这种，返回一个`Data.Map`。
- 类型的值构造器可以用于模式匹配，还可以嵌套匹配。

### Record Syntax

仅仅使用上面的值构造器的话，每个类型的成员都没有名字，如果要获取就必须通过模式匹配定义类似这样的函数：
```haskell
{-
>>> kim = Person "kim" "Possible" 20 160 "Call me later!"
>>> firstName kim
>>> lastName kim
>>> age kim
>>> height kim
"kim"
"Possible"
20
160.0
-}
data Person = Person String String Int Float String deriving (Show)
firstName :: Person -> String
firstName (Person firstname _ _ _ _) = firstname
lastName :: Person -> String
lastName (Person _ lastname _ _ _ ) = lastname
age :: Person -> Int
age (Person _ _ age _ _ ) = age
height :: Person -> Float
height (Person _ _ _ height _) = height
phoneNumber :: Person -> String
phoneNumber (Person _ _ _ _ number) = number
```
有用，但非常无趣，所以有了Record 语法：
```haskell
{- Record Syntax
>>> kim = Person' "kim" "Possible" 20 160 "Call me later!"
>>> firstName' kim
>>> lastName' kim
>>> age' kim
>>> height' kim
"kim"
"Possible"
20
160.0
>>> :t firstName'
firstName' :: Person' -> String
>>> kim
Person' {firstName' = "kim", lastName' = "Possible", age' = 20, height' = 160.0, phoneNumber' = "Call me later!"}
-}

data Person' = Person' {
    firstName' :: String,
    lastName' :: String,
    age' :: Int,
    height' :: Float,
    phoneNumber' :: String
} deriving(Show)
```
- 加了`{}`，写出了项名字，跟上类型标记，用`,`分隔。通过Record语法就会自动生成这些函数，不能再定义同名函数。
- Record语法调用`show`得到字符串是不同的，信息会更详细。
- 如果是定义简单类型，可能不需要Recrod语法，如果要定义复杂类型，一个类型有多个项且不易区分，则应该使用Record语法，在其他语言中一般对象的项都要给名称。

### 类型参数

在类型后加上类型参数可以实现泛型的功能，比如`Map k a`，键和值的类型是类型的一部分。是对应于C++模板、java泛型之类的语法。比如`Maybe`：
```haskell
data Maybe a = Nothing | Just a
```
- 有了类型参数`a`后，`Maybe`就不再是类型，`Maybe a`整体才是一个类型，`Maybe`则称为**类型构造器**：传入类型参数就可以得到类型，`Nothing`和`Just`是它的值构造器。
- 前面接触到的列表类型，`[]`其实就是列表的类型构造器，只是提供了语法糖。
- `Nothing :: Maybe a`是类型是多态的，`[] :: [a]`空列表也是多态的，可以被用于任何类型参数的`Maybe`或列表运算上。
- 类型参数一般用在不关心一个项具体的值的地方，比如`Map k a`只需要`k`属于`Ord`类型类就行，不关心键和值的具体类型和具体值，如果不是像容器这样的通用数据结构，一般不会使用类型参数。同模板和泛型一样，要能够有多个类型能够提取出公共的逻辑才比较适合使用类形参数，如果定义的方法都是针对某一种数据类型的，那么无法定义类型参数，定义类型参数也没有意义。
- 函数定义时类型参数可以加约束，但Haskell中有一个比较严格的**约定**，在`data`声明的类型参数中不要添加类型约束。
    - 注意是编程约定而不是语法规定（要启用这个语法需要启用在文件前添加`{-# LANGUAGE DatatypeContexts #-}`，并且目前已经废弃但未移除，新代码中不应该再使用，并提供了[ExistentialQuantification](https://wiki.haskell.org/Existential_type)作为替代），如果在类型中添加了类型参数，所有使用到该类型的地方都必须添加约束。为了避免函数声明中出现过多无所谓的类型约束，约定为不使用。那么类型又需要约束该怎么办呢？答案就是只在需要关心该约束的函数中添加约束（最典型的就是值构造器或者类似作用的函数），比如`Data.Map.fromList :: Ord k => [(k, a)] -> Map k a`，构造时添加了约束，那么得到的`Map`就一定是满足约束的。像`Data.Map.toList :: Map k a -> [(k, a)]`这种方法就完全不需要关心约束。
    - 又比如构造可以不加约束，但某些方法只有在某种约束下才能工作，那么就只需要那一部分方法添加约束，调用这些方法时编译器自然会检查类型参数是否满足了约束，不满足则会直接报错。
    - 甚至可以为不同约束的类型参数编写多组不同约束不同名称的方法，使用时根据构造时传入的类型参数选择使用哪一组，而通用的不关心约束的方法又可以用于所有类型，非常灵活，编译器的类型检查可以保证了通过了编译就不会发生类型不匹配之类的错误。
- **注意**：区分类型构造器和值构造器，类型声明中，左边是类型构造器，右边是值构造器，前者得到类型，后者得到该类型实例。

### 派生标准类型类

当从`Eq Ord Enum Bounded Show Read`这几个常见类型类派生时，只需要加上`deriving`关键字，Haskell就会自动为这些类型加上这些行为。
- 声明了`deriving(Eq)`时，就可以使用`== /=`来判断实例是否相等。判断依据是先判断其值构造器是否一致，再用`==`检查其中的所有数据是否一致（数据的类型必须都是`Eq`的实例）。
- 属于`Ord`的类型比较时会先判断值构造器是否一致（按照顺序后面比前面的大），再判断他们的参数，并且参数类型需要都是`Ord`的实例。函数不是`Ord`的实例，所以`Just (*2) < Just (*3)`这种比较会报错。
```haskell
{- Ord typeclass
>>> Nothing < Just (-100)
True
>>> Just 2 < Just 3
True
>>> Just 100 `compare` Just 50
GT
-}
```
- `Read Show`同样，只要成员都实现了`Read Show`就可以直接使用，`read`时需要添加类型注释注明想要得到的类型，否则Haskell不知道该如何转换。如果将`read`结果直接参与计算，那么也可以不注明类型。
```haskell
{- derived type behaviors
>>> kim = Person {name = "Kim", age = 18}
>>> mygirl = Person "Kim" 18
>>> kim == mygirl
True
>>> show kim
"Person {name = \"Kim\", age = 18}"
>>> mygirl
Person {name = "Kim", age = 18}
>>> read "Person {name = \"Kim\", age = 18}" :: Person
Person {name = "Kim", age = 18}
>>> kim > read "Person {name = \"catholly\", age = 15}"
False
-}
data Person = Person {
    name :: String,
    age :: Int
} deriving(Eq, Ord, Read, Show)
```
- 如果所有值构造器都没有参数，每个值构造器都有前置和后继，可以让其成为`Enum`的成员，并且可以使用Range。如果每个东西都有可能的最大值和最小值，可以成为`Bouned`类型类的成员。
```haskell
{- Enum
>>> Monday < Sunday
True
>>> [minBound .. maxBound] :: [Day]
[Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
>>> map succ [Monday .. Saturday]
[Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
>>> map pred [Tuesday .. Sunday]
[Monday,Tuesday,Wednesday,Thursday,Friday,Saturday]
>>> succ Sunday
succ{Day}: tried to take `succ' of last tag in enumeration
>>> pred Monday
pred{Day}: tried to take `pred' of first tag in enumeration
>>> [Tuesday .. Sunday] == map succ [Monday .. Saturday]
True
-}
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving(Eq, Ord, Show, Read, Enum, Bounded)
```
- 注意不能对最后一个枚举项求后继，不能对第一个枚举项求前置。

### 类型别名

类型别名不创建新类型，仅提供一个类型别名，使用`type`关键字，可以用在所有地方，类型声明、类型注释、类型别名声明中。
```haskell
type String = [Char]
```
使用类型别名可以让类型声明更易读，类型别名也可以有类型参数：
```haskell
type AssocList k v = [(k, v)]
```
此时别名`AssocList`是一个类型构造器，加上两个类型参数之后才是类型。

类型构造器也可以不全调用，得到新的类型构造器，但是下面的代码后者在本地并没有通过编译（`? The type synonym ‘AssocList’ should have 2 arguments, but has been given 1`），疑问尚存！类型构造器和值构造器或普通函数不是一个概念，只是有类似之处，不要混为一谈。
```haskell
type IntMap v = AssocList Int v
type IntMap' = AssocList Int
```

一个很有用的类型是[`Either`](https://hackage.haskell.org/package/base-4.14.3.0/docs/Data-Either.html)，定义大概就像：
```haskell
data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)
```
功能和`Maybe`类似，不过`Maybe`只提供一种值的封装，另一个选项是表示不存在含义的`Nothing`。但`Either`可以表示将可能是两种类型的值封装起来。可以提供左右两种值`Left Right`的模式匹配。常用于需要关心失败原因的场合，用`Maybe`只有`Nothing`无法传递失败原因等信息，就可以使用`Either`，约定`Left`表示错误，`Right`表示成功即可。

### 递归定义数据结构

就像递归定义函数一样，在类的值构造器中递归调用自己，就可以递归地定义数据类型：
- 比如类似于内置的列表自定义一个列表数据类型：
```Haskell
{- simulate a list, define data recursively
>>> Empty
Empty
>>> 5 `Cons` Empty
Cons 5 Empty
>>> 3 `Cons` (4 `Cons` (5 `Cons` Empty))
Cons 3 (Cons 4 (Cons 5 Empty))
-}
data MyList a = Empty | Cons a (MyList a) deriving(Eq, Ord, Show, Read)
```
- `Empty`对应于`[]`，`:`对应于`Cons`，`1:2:[]`对应于`Cons 1 (Cons 2 Empty)`，而`[1, 2]`仅仅是Haskell对`1:2:[]`提供的语法糖。这也解释了为什么`:`可以用于列表的模式匹配，而且只能从左边开始匹配，因为模式匹配就是用值构造器来做的，递归定义所以只能从左边的最外层开始匹配。
- Haskell还提供自定义运算符（也即是中缀函数）的方法：
```Haskell
{- use self define operator
>>> let a = 1 :-: 2 :-: 3 :-: Empty'
>>> a
1 :-: (2 :-: (3 :-: Empty'))
>>> :t (1 :-: Empty')
(1 :-: Empty') :: Num a => MyList' a
>>> let b = 10 :-: 100 :-: Empty'
>>> a .++ b
1 :-: (2 :-: (3 :-: (10 :-: (100 :-: Empty'))))
-}
infixr 5 :-:
data MyList' a = Empty' | a :-: (MyList' a) deriving(Eq, Ord, Show, Read)
infixr 5 .++
(.++) :: MyList' a -> MyList' a -> MyList' a
Empty' .++ xs = xs
(x :-: xs) .++ ys = x :-: (xs .++ ys)
```
- 使用`infixr 5 :-:`定义了中缀运算符`:-:`，优先级是5，右结合（所以`1 :-: 2 :-: Empty`从右往左计算，可以不用加括号）。
- 这是新的语法结构。左结合是`infixl`，右结合是`infixr`，也可以没有结合性`infix`。
- 定义`.++`类似于列表的`++`，用到了模式匹配和递归定义。可以看到其实并没有任何魔法，都是有迹可循的。
- 更多自定义运算符的优先级结合性、前缀的函数使用`` ` ` ``转为中缀运算符的优先级和结合性问题仍需探究。

例子，二叉搜索树：
```haskell
{- example: binary search tree
>>> treeInsert 3 EmptyTree
Node 3 EmptyTree EmptyTree
>>> let t = listToTree [0, 3, 5, 6, 7, 1, 2, 4, 4, 4]
>>> t
Node 4 (Node 2 (Node 1 (Node 0 EmptyTree EmptyTree) EmptyTree) (Node 3 EmptyTree EmptyTree)) (Node 7 (Node 6 (Node 5 EmptyTree EmptyTree) EmptyTree) EmptyTree)
>>> treeElem 5 t
>>> treeElem 10 t
True
False
-}

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving(Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree
treeInsert :: Ord a => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right -- de-duplicate, another option is to insert to right 
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)
    | otherwise = singleton x -- can be removed

listToTree :: (Ord a) => [a] -> Tree a
listToTree = foldr treeInsert EmptyTree

treeElem :: Ord a => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right
    | otherwise = False -- can be removed
```
- 守卫的条件其实已经完备了，`otherwise`可以去掉，只不过会警告所以加上了。
- 递归的思想在任何语言里都是一样的。

### 自定义类型类

自定义类型类：
- 回顾一下类型类：
    - 类型类以函数的形式定义了一些行为，一个类型如果被定义为该类型类的实例，便可以使用这些函数。
    - 类型类与命令式编程中的类没有任何关系，更加类似于接口类、纯虚类、抽象类等概念，不能直接使用类型类来声明一个实例，而需要从其派生出具体的类型实例。
- 看一看`Eq`的定义：
```Haskell
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y = not (x /= y)
    x /= y = not (x == y)
```
- `a`是一个类型变量，代表我们定义的任何`Eq`实例类型。并且声明了类型类提供的函数，并不一定需要有函数的定义，不过必须写出函数的类型声明。
- `Eq`提供的函数是`== /=`，并且是以相互递归的形式定义的。查看`==`的类型，会发现是`(==) :: Eq a => a -> a -> Bool`，`a`所属类型类`Eq`被添加到了约束中。
- 如果定义一个类型：
```haskell
data TrafficLight = Red | Yellow | Green
```
- 此时调用`Red == Red`会报错`No instance for (Eq TrafficLight) arising from a use of ‘==’`。
- 除了`deriving(Eq)`显式从`Eq`派生，还可以通过`instance`使其成为`Eq`的实例，此时就要自行提供`==`的实现。如果不提供`==`实现，那么会报警告，并调用`Eq`的默认实现相互递归直到栈溢出，一切都是合乎逻辑的。
```haskell
{- define our own typeclasses
>>> Red == Red
True
>>> Red /= Green
True
-}

data TrafficLight = Red | Yellow | Green
instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False
```
- 此时再调用`== /=`便可以成功，并且由于`Eq`中递归定义了`== /=`，只需要在具体的类型实例中定义其中一者覆盖类型类中定义，便可以使用两者。

总结：
- 使用`class`关键字定义类型类，其中声明类型类提供的函数，可以提供缺省定义也可以不提供，其中的类型参数表示类型类的实例。
- 使用`instance`关键字定义某个类型类的实例，此时将类型参数替换为具体的实例，提供需要的函数定义用来覆盖类型类中的定义。
- `deriving`关键字对于标准类型类会提供默认的实现，比如`Eq Show`等，如果需要改变这种默认行为，则需要针对该类型类定义类型实例。
```haskell
{-
>>> show Red
"Red light"
-}
instance Show TrafficLight where
    show Red = "Red light"
    show Yellow = "Yellow light"
    show Green = "Green light"
```
- 也可以把类型类定义为其他类型类的子类，比如`Num`同时也是`Eq`，定义类型类时加上类型约束即可。
```haskell
class (Eq a) => Num a where
    ...
```
- `instance`声明中，实际的类型类实例必须是具体的类型，如果是有类型参数的`data`，必须需要加上其类型参数（具体的类型或者通用的参数名），而不能仅仅只使用其类型构造器（类型构造器并不表示一个或一类类型）。
```haskell
instance Eq (Maybe m) where
    Just x == Just y = x == y
    Nothing == Nothing = True
    _ == _ = False
```
- 大部分情况下，在`class`定义中的类型约束都是宣告一个类型类成为另一个类型类的子类。而在`instance`定义中的类型约束则表达对于类型的限制。比如，要求`Maybe`的内容物（`Just a`中的`a`）也是属于`Eq`。
- 查看一个类型类有哪些实例，可以在ghci中使用命令`:i/:info YourTypeClass`。

实例：
- 定义`YesNo`类型类，提供非`Bool`类型的`True False`判断：
```Haskell
{- YesNo typeclass
>>> yesnoIf [] "Yes" "No"
"No"
>>> yesnoIf [2, 3, 4] "Not Empty" "Empty"
"Not Empty"
>>> yesnoIf True True False
True
>>> yesno Nothing
False
>>> :t Nothing
Nothing :: Maybe a
>>> yesno (Just 1)
True
-}

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True
instance YesNo Bool where
    yesno a = a
instance YesNo [a] where
    yesno [] = False
    yesno _ = True
instance YesNo (Maybe m) where
    yesno Nothing = False
    yesno _ = True

yesnoIf :: YesNo a => a -> p -> p -> p
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult
```
- 再从`YesNo`派生新类型类`EmptyOrNot`，仅针对列表或者`Maybe`类型，演示一下`class isntance`声明中的类型约束、使用类型类默认实现等情况。
```haskell
{- Empty or not type class
>>> empty (Just [])
True
>>> empty (Just [1, 2, 3])
False
>>> empty (Just (Just (Just [1, 2, 3])))
False
>>> empty []
True
-}

class YesNo a => EmptyOrNot a where
    empty :: a -> Bool
    empty = not . yesno

instance EmptyOrNot [a] -- use implementation of YesNo, equals to (not . yesno)
instance (EmptyOrNot m) => EmptyOrNot (Maybe m) where
    empty Nothing = False
    empty (Just m) = empty m
```
- 值得注意的细节是，每个实例类型都需要对多个类型类依次声明，而不能一次性在一次`instance`声明中同时实现`empty`和`yesno`方法，尽管类型类是具有派生关系的。

### Functor/函子

`Functor`是一个类型类，也称作**函子**，定义：
```haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b
```
- `Functor`比较特殊的地方在于类型参数`f`，前面遇到的类型参数一般都是一个类型，而这里的`f`并不是具体类型，而是**接受一个类型参数的类型构造器**。
- `fmap`函数接受一个函数，这个函数从一个类型映射到另一个类型，还接受一个装有原始类型的`Functor` `f a`，返回映射后另一个类型的`Functor` `f b`。或者不全调用，传入一个类型`a`到`b`的映射（函数），得到对应`Functor`函子`f a`到`f b`的映射（函数）。
- 对于列表类型来说，`map`其实就是列表类型的`fmap`。
```haskell
map :: (a -> b) -> [a] -> [b]
```
- 如何将列表定义成函子，注意类型参数传入的类型构造器`[]`而不是具体类型`[a]`。
```haskell
instance Functor [] where
    fmap = map
```
- `Maybe`作为函子的定义：
```haskell
instance Functor Maybe where
    fmap f (Just x) = Just (f x)
    fmap f Nothing = Nothing
```
- 对于`Nothing`，还是`Nothing`，对于`Just x`，则是取出元素映射之后再放回`Just`。就像列表一样，只是列表可以保存多个元素，`Just`只保存一个。
- 简单来说，将函子看做容器（盒子），`fmap`就是将盒子中数据取出来做运算之后得到结果再装进同样的盒子，结果类型并不需要和源类型一致。容器中存储的数据类型需要是单一的数据类型（实现函子的类型的类型构造器只有一个类型参数）。`fmap`需要在具体类型中进行实现。
- 当然如果是多个数据类型那么可以固定之后只剩一个，比如对于`Map k v`可以将`Map k`变为函子。
- 对于`data Either a b = Left a | Right b`一般用`Left`表示错误，`Right`表数据，那么可以将`a`固定不变（错误信息没有改变类型和`fmap`的必要），将`Either a`变为函子。
- 函子的定义应该遵守一些规则，这样他们的一些性质才能够得到保证。比如使用`(\a -> a)`函数来调用`fmap`那么应该期望得到与参数相同的结果。

### Kind

类型构造器：
- 类型构造器可以接受类型作为类型参数，来构造出一个具体的类型，这样的行为会让我们想到函数，接受参数并返回并一个值。
- ghci中使用`:k :kind`命令可以查看一个类型的Kind。
```haskell
import Data.Map
{- Kind
>>> :k Int
Int :: *
>>> :k []
[] :: * -> *
>>> :k Maybe
Maybe :: * -> *
>>> :kind Maybe
Maybe :: * -> *
>>> :k Maybe Int
Maybe Int :: *
>>> :k Map
Map :: * -> * -> *
>>> :k Map Int
Map Int :: * -> *
>>> :k Map Int String
Map Int String :: *
>>> :k Num
Num :: * -> Constraint
>>> :k Either
Either :: * -> * -> *
-}
```
- 比如`Maybe`的Kind是`* -> *`表示接受一个类型参数并返回一个具体类型。
- 而`-> Contraint`则表示这是一个约束或者类型类。
- 对一个类型使用`:k`就类似于对一个值使用`:t`。
- 类型构造器也是柯里化的，可以部分应用参数，得到新构造器，比如`Map Int`。
- 类型本身也是有类型系统的，比如一个类型构造器的类型参数也可以被限定为是接受一个类型参数的类型构造器（就像函数接受函数作为参数那样）：
```haskell
{-
>>> :k Frank
Frank :: * -> (* -> *) -> *
-}
data Frank a b = Frank {frankField :: b a} deriving (Show)
```
- 函数与类型构造器虽然有相似，但是它们是两个完全不同的东西，不要混淆。
- 一般来说写实用的Haskell程序时不会需要用到Kind，也不太需要去推敲，但需要知道有这些概念。
- 最后来一个比较绕的问题：类型类可以有类型参数吗？经过试验大概是不可以。

## 输入与输出

函数的副作用：
- Haskell是纯函数式语言，命令式语言中给电脑一串指令，在函数式编程中都是以定义东西的方式进行的。Haskell中的函数不能改变状态，比如改变变量内容，当一个函数会改变状态，称之为有副作用。没有副作用的函数在任何时候任何情况下以相同参数进行两次调用，结果都必定是相同的。
- 无副作用的函数即是优点也是限制，也很好理解，但是如果要进行输入输出，就必须要改变输入输出设备的状态。所以也需要存在有副作用的函数。
- Haskell在设计上对有副作用的函数做了区分，将程序分为纯粹和非纯粹两部分，输入输出由非纯粹的部分来处理，纯粹的部分依然具有函数式编程的优点，比如惰性求值、容错、模块性。

### IO动作

前面讨论的内容都是无副作用的，都是应该如何编写函数，计算结果，没有讨论过如何输出结果与组织程序，从输出开始：

```haskell
main = putStrLn "hello, world"
```
保存为`helloworld.hs`，编译`ghc helloworld.hs`，得到`helloworld.hi helloworld.i helloworld(.exe)`。可执行文件达到10MB，这得链了多少东西进去。

看一下`putStrLn`的类型声明：
```
Prelude> :t putStrLn
putStrLn :: String -> IO ()
Prelude> :t putStrLn "hello" 
putStrLn "hello" :: IO ()
```
`putStrLn`接受一个字符串并返回一个IO动作，这个IO动作的类型参数是`()`（即空的元组，或者是unit类型）。

所谓IO动作：
- 一个IO动作（I/O Action）是一个会造成副作用的动作，常常是读取输入或者输出到屏幕，同时会返回一些值。在标准输出打印字符串没有具体的值返回，用一个`()`代表。
- 一个IO动作会在我们把它绑定到 `main` 这个名字并且执行程序的时候触发。
- 整个程序限制到只能有一个IO动作看起来是很大的限制，所有有了`do`表示法将所有IO动作绑成一个。

`do`表示法：
```haskell
main :: IO ()
main = do
    putStrLn "hello, input your name:"
    name <- getLine 
    putStrLn ("Hey ! " ++ name ++ " Yo ! what's up !")
```
- `do`后接了一串指令，就像命令式程序一样，每一步都是一个IO动作，将所有IO动作绑到一起变成了一个大的IO动作，类型同样是`IO something`由最后一个IO动作决定。
- `main`的类型永远是`main :: IO somehting`，按照惯例，我们通常不会将`main`的类型在程序中写出来。
- 在`do`块中使用`let`表达式可以没有`in`部分，含义就是变量或者函数的绑定。

使用IO动作：
- 输入：`getLine :: IO String`。
- IO就像一个盒子，打开盒子拿到其中的字符串的方法就是`<-`。
- `getLine`是不纯粹的有副作用的，执行两次不能保证拿到同样的结果。
- 一段程序如果依赖着IO数据，那么这段程序也会被视为IO代码。这并不代表不能在纯粹的代码中使用IO动作返回的数据，只需要将其绑定到一个名字便可以短暂使用它。
- 同理如果要处理一些非纯粹的数据，应该到非纯粹的环境中做，最好把IO的部分缩减到最小的比例。
- 像`putStrLn :: String -> IO ()`也可以取出其中的值，`foo <- putStrLn "hello"`只不过取出来的也是`()`，没必要。
- 总之，要取出一个IO动作的值，就需要在另一个IO动作中将他用`<-`绑定给一个名字。换句话说，IO动作中才能执行`<-`，还不能是作为最后一个表达式。
- IO动作只有绑定给`main`或是在另一个用`do`串起来的IO动作时才会执行。可以用`do`串接IO动作之后再用`do`来串接这些串接起来的IO动作。最外层的IO动作绑定到`main`时才会触发执行。就类似于程序入口`main`函数。
- GHCI中也可以执行IO动作。

`return`：
```haskell
main :: IO ()
main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            main

reverseWords :: String -> String
reverseWords = unwords . map reverse . words
```
- 这个程序按行接受输入，将输入中的每个单词反转之后合并为新行输出，直到空行则停止。
- `do`块可以使用`return :: Monad m => a -> m a`，`IO`同时也是一个`Monad`。`return`这里与命令式语言中的单纯函数返回的逻辑完全不同，Haskell中`return`的含义是利用一个纯粹的值制造出一个IO对象，因为`main`的返回值类型是`IO ()`。
- 一般的命令式语言中，`return`都代表中断函数执行，从此处返回。而Haskell中`return`并不会导致函数返回，`return`同样只是做一个函数调用通过一个值得到一个IO对象而已。整个`do`就是一个表达式，它的值是其中最后一个`IO`动作的值，不存在说在一个表达式中返回这样的操作。
```haskell
main = do
    return ()
    return "HAHAHA"
    line <- getLine
    return "BLAH BLAH BLAH"
    return 4
    putStrLn line
```
- 像这样的逻辑，`return`将值装到IO对象中，其实就相当于什么都没做，最后返回还是`putStrLn line`的结果。甚至可以用`a <- return "hell"`这样来在从IO对象中取出数据。
- 需要`return`的原因：需要一个什么都不做的IO动作，或者不希望`do`块这个IO动作的结果值是其中最后一个IO动作的值时，就用`return`装在IO中后放到`do`块的最后面。
- 无论如何`return`要起作用都应该放在最后一个表达值中或者直接作为最后一个表达式。

### 输入与输出函数

常用输出函数：
- `putStr :: String -> IO ()` 不换行输出。
- `putStrLn :: String -> IO ()` 换行输出。
- `putChar :: Char -> IO ()` 输出字符。
- `print :: Show a => a -> IO ()` 输出`Show`实例，基本上就是`putStrLn . show`。

输入函数：
- `getChar :: IO Char` 读取字符。
- `getLine :: IO String` 读取行。
- `getContents :: IO String` 读取内容直到EOF（End of file）。

固定结构和模式：
- `when :: Applicative f => Bool -> f () -> f ()`在模块`Control.Monad`中，其作用就是将`if condition then (do some I/O action) else return ()`这样的模式封装为`when condition (do some I/O action)`，如果你写出了前面的结构，hlint会提示可以改写为后者：
```haskell
import Control.Monad
main :: IO ()
main = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main
```
- `sequence :: (Traversable t, Monad m) => t (m a) -> m (t a)`可以接受一串IO动作，回传一个会依次执行他们的IO动作，运算的结果是包在一个IO动作中的一连串IO动作结果，用在`IO`中比较典型是使用是`t`是列表，`m`是`IO`。常见用法类似于`sequence (map print [1, 2, 3])`这样。例：接受三行输入并输出：
```haskell
testSequence :: IO ()
testSequence = do
    rs <- sequence [getLine, getLine, getLine]
    print rs
```
- 对于一个列表`map`传一个返回IO动作的函数，然后再`sequence`这个动作太常用了，以至于函数库中有`mapM mapM_`来简化了这个操作，前者保留结果，后者丢弃结果。当我们对结果不关心时，后者会用得多一些。
```haskell
mapM :: (Traversable t, Monad m) => (a -> m b) -> t a -> m (t b)
mapM_ :: (Foldable t, Monad m) => (a -> m b) -> t a -> m ()

testMapM :: IO [()]
testMapM = do
    mapM print [1, 2, 3]

testMapM_ :: IO ()
testMapM_ = do
    mapM_ print [1, 2, 3]
```
- `Control.Monad`中的`forM :: (Traversable t, Monad m) => t a -> (a -> m b) -> m (t b)`函数和`mapM`作用一致，只是参数顺序不一样。
```haskell
forM :: (Traversable t, Monad m) => t a -> (a -> m b) -> m (t b)
forM_ :: (Foldable t, Monad m) => t a -> (a -> m b) -> m ()

testForM :: IO [()]
testForM = do
    colors <- forM [1,2,3,4] (\a -> do
        putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
        getLine)
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    mapM putStrLn colors
```
- `Control.Monad.forever :: Applicative f => f a -> f b`接受一个IO动作并返回永远做这件事（直到EOF）的IO动作：
```haskell
testForever :: IO ()
testForever = forever $ do
    l <- getLine
    putStrLn $ map Data.Char.toUpper l
```

总结：
- 输入输出函数仍是函数，要将其看做进行输入输出操作并返回IO action的函数，而不是输出内容到屏幕。
- `do`仅仅是语法糖，封装多个IO动作为一个。
- `return`仅做包装，与命令式程序中的函数返回区分开来。

### 文件与字符流

**惰性I/O**：
- 输入函数`getContents`同样是懒惰I/O（Lazy I/O）的，直到需要用到内容时才去读取，而不是像命令式一样立马读取输入。
```haskell
import Control.Monad
import Data.Char
testContents :: IO ()
testContents = do
    contents <- getContents
    putStr $ map toUpper contents

main :: IO ()
main = testContents
```
- 如果我们使用文件和管道去操作它，新建`test.txt`：
```
Nephren Ruq Insania
Catholly Nota Seniorious
Lilia Asplay
```
- 编译执行：`cat test.txt | ./IOFunction`
```shell
$ cat test.txt | ./IOFunctions
NEPHREN RUQ INSANIA
CATHOLLY NOTA SENIORIOUS
LILIA ASPLAY
```
- 而如果从标准输入按行输入，那么会发现内容会按行（行缓冲）逐渐输入到`contents`，直到输入EOF结束，这就是懒惰I/O，而不是表示`contents`是一个在内存中存储了具体字符串的中间变量。
```shell
$ ./IOFunctions
asdf
ASDF
asdf
ASDF
Catholly Nota Seniorious
CATHOLLY NOTA SENIORIOUS
```
- 由于懒惰IO的存在，没有输入在真正被用到之前被读入。

**`interact`**：
- 从输入取字符串，执行一些转换后输出这种模式太常见了，于是有一个函数专门做这个事情：`interact :: (String -> String) -> IO ()`，传入一个转换函数，对所有输入构成的字符串执行转换，直到EOF。
- 比如上面的函数，再加上一个只输出长度小于10的行：
```haskell
main :: IO ()
main = interact $ map toUpper . unlines . filter ((<10) . length) . lines
```
- 使用场景主要是用管道读取整个文件做一些处理输出，或者按行处理输入直接输出的场景。
- 在Windows上测试时发现这样对标准输入工作但对管道不工作（而`getContents`是工作的），按道理管道不应该和标准输入有区别，尚不知道具体原因！


文件操作：
- 读写文件与标准输入输出并没有什么不同，标准输入输出就是读取名为`stdin stdout`的特殊文件IO。
- 打开文件：
```haskell
import System.IO

main :: IO ()
main = do
    handle <- openFile "test.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
```
- 相关函数和类型，打开后使用句柄操作，读取结束后关闭，读写模式有读、写、追加写、读写。和其他语言大同小异。
```haskell
openFile :: FilePath -> IOMode -> IO Handle
hGetContents :: Handle -> IO String
hClose :: Handle -> IO ()
data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
```
- 可将`stdin stdout`作为句柄文件文件IO的函数上，`hGetContents stdin`与`getContents`含义相同。
- 文件打开后需要关闭，可以使用`withFile`函数来管理文件的关闭，离开后自动关闭，而不用显式调用`hClose`。接受文件、读写模式和一个句柄到要执行的IO操作的函数（通常都会传入一个lambda），`withFile`打开文件后将句柄传给函数执行其中的操作，并在执行结束后关闭。
```haskell
withFile :: FilePath -> IOMode -> (Handle -> IO r) -> IO r

testWithFile :: IO ()
testWithFile = do
    withFile "test.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)
```
- 实现一个`withFile`：
```haskell
withFile' :: FilePath -> IOMode -> (Handle -> IO b) -> IO b
withFile' path mode f = do
    handle <- openFile path mode
    result <- f handle
    hClose handle
    return result
```
- 常见输入输出函数的文件版本：
```haskell
hGetLine :: Handle -> IO String
hGetChar :: Handle -> IO Char
hPutChar :: Handle -> Char -> IO ()
hPutStr :: Handle -> String -> IO ()
hPutStrLn :: Handle -> String -> IO ()
hPrint :: Show a => Handle -> a -> IO ()
```
- 除了这些常见IO操作，读取文件并处理字符串内容的操作实在太常见了，于是有三个函数用来简化工作，用于读文件内容、写内容到文件、添加内容到文件。
```haskell
readFile :: FilePath -> IO String
writeFile :: FilePath -> String -> IO ()
appendFile :: FilePath -> String -> IO ()
```
- `getContents hGetContents`都是懒惰IO，不会一次将文件读到内存中，其实就是一个有缓冲的流。文本文件默认是行缓冲，也就是一次读进来的内容是一行，二进制文件默认是块缓冲（Block-Buffering），一个块一个块（Chunk）的读取。可以用`hSetBuffering`控制缓冲的行为。`hSetBuffering hFlush`会返回一个会设置缓冲和刷新缓冲的IO动作。
```haskell
hSetBuffering :: Handle -> BufferMode -> IO ()
hGetBuffering :: Handle -> IO BufferMode
hFlush :: Handle -> IO ()
data BufferMode = NoBuffering | LineBuffering | BlockBuffering (Maybe Int)
```
- 其他函数：
```haskell
System.Directory.renameFile :: FilePath -> FilePath -> IO ()
System.Directory.removeFile :: FilePath -> IO ()
System.Directory.getCurrentDirectory :: IO FilePath
System.IO.openTempFile :: FilePath -> String -> IO (FilePath, Handle) -- open a temporary file
```
- 使用`openTempFile`打开临时文件时，可以传入文件名`"temp"`这样会生成一个`temp`加上随机字符串的文件名，可以防止覆写已有的文件。

### 命令行参数

编写运行在终端中的函数时，命令行参数是必不可少的，利用Haskell的标准库可以有效地处理命令行参数。

`System.Environment`中提供了获取程序名称和命令行参数的函数：
```haskell
getArgs :: IO [String]
getProgName :: IO String
```
- 比如编译得到的目标文件是`test`，那么执行`test hello world`那么`getArgs`得到`IO ["hello", "world"]`而`getProgName`得到`IO "test"`。
- 一个例子，处理文本文件，通过命令行参数输入，可以查看增加和删除待办事项，错误处理待完善：
```haskell
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import System.Environment
import System.Directory
import System.IO
import Data.List

{- command arguments
>>> :t getArgs
>>> :t getProgName
getArgs :: IO [String]
getProgName :: IO String
-}

-- a to do list processing example
dispatch :: [([Char], [String] -> IO ())]
dispatch = [("add", add)
           , ("view", view)
           , ("remove", remove)
           ]

-- look up command and execute
main :: IO ()
main = do
    (command:args) <- getArgs
    let (Just action) = lookup command dispatch
    action args

-- prog add file item, add item to end of to-do list
add :: [String] -> IO ()
add [fileName, todoItem] = do
    appendFile fileName (todoItem ++ "\n")
    view [fileName]

-- prog view file, view to-do list file
view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStr $ unlines numberedTasks

-- prog remove file number, to remove line of to do list
remove :: [String] -> IO ()
remove [fileName, numberOfString] = do
    handle <- openFile fileName ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let number = read numberOfString
        todoTasks = lines contents
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile fileName
    renameFile tempName fileName
    view [fileName]
```

### 随机数

首先要明确的是要产生（伪）随机数，那么每次调用就应该拿到不一样的数字，但是Haskell是纯函数式语言，纯粹的引用透明（referential transparency）的函数是没有副作用的，特定输入就会得到特定输出。所以随机数发生的部分一定是有副作用的。

其他编程语言是怎么产生随机数的呢？可能会拿到电脑的一些信息，比如时间、鼠标信息、甚至CPU中的微小扰动等，根据这些信息算出一个看起来随机的值，或者更简单的类似于线性同余这种具有特定周期的伪随机数。在Haskell中，我们需要的随机函数应该是接受具有随机性的值，根据信息经过计算后得到一个值，也就是函数本身没有副作用，只是传入参数发生了变化。

`System.Random`模块（不在基础库`base`中，需要安装`random`包）中提供了这样的函数：`System.Random.random :: (Random a, RandomGen g) => g -> (a, g)`。
- 其中`Random`是可以用来装随机数的类型类，`RandomGen`是随机数发生器的类型类。
- `random`会接受一个随机数发生源，返回生成的随机数和新的随机数发生器（random generator）。

制作随机数发生器：
- `mkStdGen :: Int -> StdGen`可以用来制作一个整数随机数发生器。
- 注意`Random`是一个类型类，在`System.Random`中实现了多个类型实例，所以使用时需要通过类型指定具体用哪一个。
```haskell
Prelude System.Random> :i Random
type Random :: * -> Constraint
class Random a where
  randomR :: RandomGen g => (a, a) -> g -> (a, g)
  default randomR :: (RandomGen g, UniformRange a) =>
                     (a, a) -> g -> (a, g)
  random :: RandomGen g => g -> (a, g)
  default random :: (RandomGen g, Uniform a) => g -> (a, g)
  randomRs :: RandomGen g => (a, a) -> g -> [a]
  randoms :: RandomGen g => g -> [a]
        -- Defined in ‘System.Random’
instance Random Word -- Defined in ‘System.Random’
instance Random Integer -- Defined in ‘System.Random’
instance Random Int -- Defined in ‘System.Random’
instance Random Float -- Defined in ‘System.Random’
instance Random Double -- Defined in ‘System.Random’
instance Random Char -- Defined in ‘System.Random’
instance Random Bool -- Defined in ‘System.Random’
```
- 如果一直调用`random $ mkStdGen 100`的话会得到同样的结果，因为没有副作用，要生成多个随机数的话，需要使用返回的随机数发生器。但又因为没有循环，所以要这样生成很多随机数就很麻烦了。
- 多个随机数可以使用`randoms :: (Random a, RandomGen g) => g -> [a]`，返回一个无限列表。
```haskell
Prelude System.Random> take 10 $ randoms (mkStdGen 100) :: [Double]
[0.5003737531410817,0.3750119639966999,0.12733827138953357,3.882299251466059e-2,0.21477954261574972,0.6105785015461408,3.65223575759297e-2,0.9636215830016226,0.9939144570578136,0.9113023469143849]
Prelude System.Random> take 10 $ randoms (mkStdGen 100) :: [Bool]  
[True,False,False,False,False,False,True,False,False,False]
Prelude System.Random> take 10 $ randoms (mkStdGen 100) :: [Int] 
[9216477508314497915,-6917749724426303066,-2348976503111297336,-716157807093485800,-3961983254901128710,7183558718778820252,-673718583171682711,671063348175752782,112258453204082922,1636182906409015240]
Prelude System.Random> take 10 $ randoms (mkStdGen 100) :: [Char]
"\537310\28348\950093\909872\685754\243589\711431\321177\1019517\261448"
```
- `randoms`的实现就像是这样的：
```haskell
randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = random gen in value:randoms' newGen
```
- 做一下验证就知道其实就是这样实现的。
- 实现一个返回有限个随机数和一个随机数生成器的函数：
```haskell
finiteRandoms :: (RandomGen g, Random a) => Int -> g -> ([a], g)
finiteRandoms n gen
    | n <= 0 = ([], gen)
    | otherwise = 
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandoms (n-1) newGen
    in (value:restOfList, finalGen)
```
- 除了`random randoms`还可以使用`randomR randomRs`得到范围内随机数。
```haskell
Prelude System.Random> :t randomR
randomR :: (Random a, RandomGen g) => (a, a) -> g -> (a, g)
Prelude System.Random> :t randomRs
randomRs :: (Random a, RandomGen g) => (a, a) -> g -> [a]
Prelude System.Random> randomR (1, 10000) (mkStdGen 100)
(892,StdGen {unStdGen = SMGen 712633246999323047 2532601429470541125})
Prelude System.Random> randomR (1.0, 10.0) (mkStdGen 100)
(5.503363778269735,StdGen {unStdGen = SMGen 712633246999323047 2532601429470541125})
Prelude System.Random> randomR (False, True) (mkStdGen 100)
(True,StdGen {unStdGen = SMGen 712633246999323047 2532601429470541125})
Prelude System.Random> take 10 $ randomRs (1.0, 100.0) (mkStdGen 100)
[50.537001560967084,38.12618443567329,13.606488867563824,4.843476258951399,22.26317471895922,61.447271653067936,4.61571340001704,96.39853671716064,99.39753124872354,91.2189323445241]
Prelude System.Random> take 100 $ randomRs ('a', 'z') (mkStdGen 0)
"apyzsowwxjpdgslfiaqdhpawqyhuewqdnciakestkcsdttutjrnyjnqvfnmiiyneyggtfggvkoujcptcdeesvswyjxrcssudsgzw"
```

`mkStdGen`每次只要传入的数相同，得到的随机数序列一定是相同的，传入的数就像随机数种子。实际生产环境这样是不能接受的，要么我们需要一个随机的随机数种子，要么需要更加随机化的随机数发生器。

所以`System.Random`提供了`getStdGen :: Control.Monad.IO.Class.MonadIO m => m StdGen`用来获取一个`IO StdGen`。
- 程序执行时会有一个全局的随机数生成器，`getStdGen`就是拿到这个random generator并绑定到某个名字上。
```haskell
main :: IO ()
main = do
    gen <- getStdGen
    print (take 30 $ randomRs (1.0, 100.0) gen :: [Double])
```
- 某些程序在GHCI下也许不需要显式执行也能有一个类型，但在`.hs`中则需要指定类型，比如`random (mkStdGen 100)`，在GHCI中不指定类型会得到整数，需要注意，在`.hs`中则需要像这样声明类型`(let (value, _) = random (mkStdGen 100) in value :: Int)`。
- `::`类型声明的优先级和结合性值得研究。
- 两次通过`getStdGen`拿到的`StdGen`其实是一样的。要生成不一样的序列，可从一个长的随机序列中截取。
- 需要每次都得到不一样的可以使用`newStdGen :: Control.Monad.IO.Class.MonadIO m => m StdGen`：
```haskell
Prelude System.Random> getStdGen
StdGen {unStdGen = SMGen 2577900980329305605 14820693616592480073}
Prelude System.Random> getStdGen
StdGen {unStdGen = SMGen 2577900980329305605 14820693616592480073}
Prelude System.Random> getStdGen
StdGen {unStdGen = SMGen 2577900980329305605 14820693616592480073}
Prelude System.Random> newStdGen
StdGen {unStdGen = SMGen 10681034358804626100 9442248464978456119}
Prelude System.Random> newStdGen
StdGen {unStdGen = SMGen 16153741442900193658 9209421901824985913}
Prelude System.Random> getStdGen
StdGen {unStdGen = SMGen 6520443225570571049 14820693616592480073}
Prelude System.Random> getStdGen
StdGen {unStdGen = SMGen 6520443225570571049 14820693616592480073}
```
- 调用`newStdGen`后，全局的随机数发生器会被重新指定，`getStdGen`会和原先不一样，但再次调用又会一样。

### ByteString

在Haskell中因为列表非常重要，因为惰性求值，所以可以用`map filter`等函数来代替其他语言中的循环。由于求值只发生在需要的时候，所以甚至可以实现无限列表的无限列表这种东西。也正是因为惰性求值，所以可以用列表来表示流（Stream），比如`getContents`。

但因为`[1,2,3,4]`只是`1:2:3:4:[]`的语法糖（syntactic sugar），而`[Char]`中Char是Unicode字符，没有一个固定大小，所以用`[Char]`其实并不是一个高效的做法。比如在读大文件时可能就会造成负担。所以Haskell提供了`ByteString`。
- 模块：`Data.ByteString`，类型`ByteString`，这个类型是严格的，也就是没有惰性求值。严格的`ByteString`不可以无限长，如果求第一个字节，就必须求出整个`ByteString`。它没有Thunk（也即是说Haskell中常说的术语**保证**），缺点是可能快速消耗内存，因为进行了一次性读取。
- 对应的惰性求值的`ByteString`在`Data.ByteString.Lazy`中。惰性的`ByteString`具有惰性，但不会像`List`那么极端，它的数据被存在一个个64K的chunk（块）中，每次求值会按照chunk作为单位来求值，求到包含需要的字节的chunk即可。有点像装了一堆大小为 64K 的严格`ByteString`的列表。
- 一个`ByteString`的基本组成是8比特的字节。
- 大多数情况我们使用惰性的`ByteString`。
```haskell
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S
```
- 要构建`ByteString`需要使用：`pack :: [Word8] -> ByteString`，参数中的`Word8`类型在`GHC.Word`中，可以直接用`[1, 2, 100, 256, 300]`这样的列表来初始化（因为字面值是多态的，可以用于整型浮点等多种数据类型），超过一个字节的值会被截断并报警告。
- 对`ByteString`调用`show`得到的结果和字符串差不多。
- `unpack :: ByteString -> [Word8]`做相反的事情。
- `fromChunks`将一个列表的严格的`ByteString`转换为一个懒惰的，`toChunks`做相反的事情。
```haskell
B.fromChunks :: [ByteString] -> ByteString
B.toChunks :: ByteString -> [ByteString]
{-
>>> B.fromChunks [S.pack [40,41,42], S.pack [43,44,45], S.pack [46,47,48]]
"()*+,-./0"
>>> B.toChunks (B.pack [40..48])
["()*+,-./0"]
-}
```
- `ByteString`对应于列表的`:`运算符的是`B.cons :: Word8 -> ByteString -> ByteString` `B.cons' :: Word8 -> ByteString -> ByteString`前者是懒惰的，后者是严格的。但用起来没有看到差别：
```haskell
Prelude S B> B.cons 80 $ B.pack [81..90]
"PQRSTUVWXYZ"
Prelude S B> B.cons' 80 $ B.pack [81..90]
"PQRSTUVWXYZ"
>>> foldr B.cons B.empty [50..60]
>>> foldr B.cons' B.empty [50..60]
"23456789:;<"
"23456789:;<"
```
- `ByteString`也有列表操作类似的函数：`head tail init last null length map reverse foldl concat take takeWhile`等。
- 也有`System.IO`中一样的函数，只是`String`换成了`ByteString`。比如：`B.readFile :: FilePath -> IO ByteString`。

`ByteString`可以为数据读取提供更好的性能，一般正常用`String`，在性能不好是替换为`ByteString`。

### 异常(Exceptions)

Haskell中常用`Maybe Either`这种包装类型来处理失败的情况。

除此之外，Haskell是支持异常的，除了IO这种依赖于环境的行为，算术运算比如除0等操作也可能引发异常。
```haskell
Prelude S B> 4 / 0
Infinity
Prelude S B> 4 `div` 0
*** Exception: divide by zero
Prelude S B> head []
*** Exception: Prelude.head: empty list
```
- 无副作用的纯粹代码（Pure Code）或者IO操作都可能抛出异常，但是异常只能在IO环境中才能被catch。因为纯函数默认懒惰求值，我们不知道什么时候会求值，也就不知道应该在什么地方加捕获代码。而do块中的IO是顺序执行的，可以捕获。
- 这种设计就要求我们尽量不要在纯函数中使用异常（尽管某些函数还是会抛出），而是使用`Maybe Either`，然后仅在IO操作中使用异常。

捕获异常：
- 使用`catch :: (MonadCatch m, Exception e) => m a -> (e -> m a) -> m a`
```haskell
import System.Environment
import System.IO
import System.IO.Error
import Control.Monad.Catch.Pure (MonadCatch(catch))

{-
>>> :t catch
catch :: (MonadCatch m, Exception e) => m a -> (e -> m a) -> m a
-}

toTry :: IO ()
toTry = do
    (fileName:_) <- getArgs
    contents <- readFile fileName
    putStrLn ("This file has " ++ (show . length . lines) contents ++ " lines !")

handler :: IOError -> IO ()
handler e
    | isDoesNotExistError e = putStrLn ("File not exist : " ++ show e)
    | isEOFError e = putStrLn "EOF Error!"
    -- other errors
    | otherwise = ioError e -- ioError is like raise/throw in other languages

main :: IO ()
main = toTry `catch` handler
```
- 接受一个要捕获的IO动作，和处理异常的函数。
- 使用不存在的文件调用时就会抛出异常并被捕获到。
```shell
$ stack exec runhaskell Exception.hs hello
File not exist : hello: openFile: does not exist (No such file or directory)
```
- 有多个检测IOError类型的函数：
```haskell
isDoesNotExistError :: IOError -> Bool
isAlreadyExistsError :: IOError -> Bool
isFullError :: IOError -> Bool
isEOFError :: IOError -> Bool
isIllegalOperation :: IOError -> Bool
isPermissionError :: IOError -> Bool
isUserError :: IOError -> Bool
```

抛出异常：
- 也可以捕获到异常后不处理继续抛出：`ioError :: IOError -> IO a`函数。接受一个`IOError`并返回一个会抛出该异常的`IO`操作。
- 可以使用`userError :: String -> IOError`得到一个对`isUserError`为`True`的`IOError`。
- 上面的逻辑在处理`IOError`是还可以用`ioeGetFileName :: IOError -> Maybe FilePath`从`IOError`中抽出路径。
- 不想捕获所有异常的话，可以只捕获某一个IO动作的异常并处理，`catch`函数本身也是返回`IO a`。

这里并未提到如何在纯代码中抛出异常，正如前面所说的，不要这么做。异常也大多是在IO动作中处理，异常本身也都是IO的异常，就算是IO操作，如果能用`IO (Either a b)`相比使用异常可能也会更舒服一些。

总体来说，Haskell具备基本的异常处理，但用起来并不是那么舒服，也不太推荐使用异常，无可避免的时候还是要用的。

## 问题解决实例

看两个经典的问题用Haskell要如何解决。

### 逆波兰表达式

经典的计算逆波兰表达式（RPN，Reverse Polish Notation，或者叫后缀表达式Postfix notation）的例子。
- 计算方式，比如`10 1 2 + *`，从左往右，遇到数值就压栈，遇到符号从栈中取两个数计算后压栈，直到无运算符或者值，后缀表达式合法时最终栈中仅剩一个数，取出即最终结果。后缀表达式蕴含了计算顺序，不需要括号来规定。
```haskell
calculatePostfix :: (Num a, Read a) => String -> a
calculatePostfix = head . foldl foldingFunction [] . words
    where   foldingFunction (x:y:ys) "*" = (x * y):ys
            foldingFunction (x:y:ys) "+" = (x + y):ys
            foldingFunction (x:y:ys) "-" = (x - y):ys
            -- other functions
            foldingFunction xs numberString = read numberString:xs
```
- 调用，可以用于整数浮点等类型，还可以容易地扩展至其他运算符，比如`/ ^ log sum`等。
```haskell
>>> calculatePostfix "1.1 2.4 + 3.1 *" :: Double
10.85
>>> calculatePostfix "1 2 + 3 *" :: Int
9
```
- 其中函数声明用了函数组合，不用组合的话可能会更清晰一些：
```haskell
calculatePostfix expression = head (foldl foldingFunction [] (words expression))
    where ...
```
- 基本没有错误处理，数值少了可能直接宕掉，如果要处理错误可以声明成这样并添加错误处理的逻辑。
```haskell
calculatePostfix :: (Num a, Read a) => String -> Maybe a
```

### 路径规划问题

直接看代码，问题描述、建模过程、求解思路都在这里了，问题很简单，建模的过程比较精彩：
```haskell
{- a route planing problem from LEARN YOU A HASKELL FOR GREAT GOOD
example:
    50      5       40      10
A-------------------------------
C       |30     |20     |25     |0  destination
B-------------------------------
    10      90      2       8

best route: BCACBB
best length: 75

input: many groups of length of ABC
this example: 50  10  30  5  90  20  40  2  25  10  8  0
-}

-- a section of road, Section a b c
data Section = Section {getA :: Int, getB :: Int, getC :: Int} deriving(Show)
type RoadSystem = [Section]
-- example : [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]

-- type of path
data Label = A | B | C deriving(Show)
type Path = [(Label, Int)]

-- One step of road, input the optimal path to current node of A & B and this section of road,
-- get next optimal path to next node of A & B.
roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
    let priceA = sum $ map snd pathA
        priceB = sum $ map snd pathB
        forwardPriceToA = priceA + a
        crossPriceToA = priceB + b + c
        forwardPriceToB = priceB + b
        crossPriceToB = priceA + a + c
        newPathToA = if forwardPriceToA <= crossPriceToA
                        then (A,a):pathA -- path is a reverse list of actual path, from right to left
                        else (C,c):(B,b):pathB
        newPathToB = if forwardPriceToB <= crossPriceToB
                        then (B,b):pathB
                        else (C,c):(A,a):pathA
    in (newPathToA, newPathToB)

-- expected return of example: [(B,10),(C,30),(A,5),(C,20),(B,2),(B,8)]
optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
    let (bestPathA, bestPathB) = foldl roadStep ([], []) roadSystem -- if stackoverflow, try strict version foldl'
    in if sum (map snd bestPathA) > sum (map snd bestPathB)
            then reverse bestPathA
            else reverse bestPathB

{- test of example
>>> optimalPath [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]
[(B,10),(C,30),(A,5),(C,20),(B,2),(B,8)]
-}

-- group input data into sections
groupsOf :: Int -> [a] -> [[a]]
groupsOf _ [] = []
groupsOf n _
        | n <= 0 = undefined
groupsOf n xs = take n xs : groupsOf n (drop n xs)

-- read input from stdin
main :: IO ()
main = do
    contents <- getContents
    let threes = groupsOf 3 (map read $ lines contents)
        roadSystem = map (\[a, b, c] -> Section a b c) threes
        path = optimalPath roadSystem
        pathString = concatMap (show . fst) path -- concat $ map (show . fst) path
        pathLength = sum $ map snd path
    putStrLn $ "Best path is : " ++ show pathString
    putStrLn $ "Best length is : " ++ show pathLength
```
- 测试文件`road.txt`：
```
50
10
30
5
90
20
40
2
25
10
8
0
```
- 运行（windows中可以用`type road.txt`）：
```
$ cat road.txt | stack exec runhaskell RoutePlaning.hs
Best path is : "BCACBB"
Best length is : 75
```
- 从这个问题可以看出，用Haskell对问题建模要一步一步来，一个函数做一个确定的事情，函数最好短小而确切，一个个函数的作用就是对数据的映射筛选和处理。对数据和问题建模，并将问题拆分成一个个小问题之后依次解决，最后在`main`函数中处理IO。

## 函子、应用函子与幺半群

接下来就是讨论函子（Functors），应用函子（Applicative Functors）和幺半群（Monoids）。

前面提到了函子`Functor`，就是一群可以被映射的对象，可以理解为一个盒子，`fmap`就是对盒子中的对象做操作，当前已经遇到了很多函子的实例，比如`[] IO Maybe Either`等。

这里还会学到更多比较强一些的版本。

注意：这里用盒子来比喻函子，后续的应用函子和单子也会这样比喻，多数情况下这样比喻是恰当的，但不要过度引申，某些函子可能不适用这个比喻。一个比较正确的形容是函子是一个计算语境（computational context），这个语境可能带有值，可能会失败（`Maybe Either`），可能有多个值（`List`）等。

### 函子

回顾一下`Functor`，是一个类型类，接受一个类型构造器作为类型参数，定义了`fmap`函数，将函子中的值按照传入函数映射之后再包装在一个函子中。
```haskell
type Functor :: (* -> *) -> Constraint
class Functor f where
  fmap :: (a -> b) -> f a -> f b
  (<$) :: a -> f b -> f a
  {-# MINIMAL fmap #-}
  	-- Defined in ‘GHC.Base’
instance Functor (Either a) -- Defined in ‘Data.Either’
instance Functor [] -- Defined in ‘GHC.Base’
instance Functor Maybe -- Defined in ‘GHC.Base’
instance Functor IO -- Defined in ‘GHC.Base’
instance Functor ((->) r) -- Defined in ‘GHC.Base’
instance Functor ((,,,) a b c) -- Defined in ‘GHC.Base’
instance Functor ((,,) a b) -- Defined in ‘GHC.Base’
instance Functor ((,) a) -- Defined in ‘GHC.Base’
```

`IO`：
-看一下`IO`是怎么实现`Functor`实例的：
```haskell
instance Functor IO where
    fmap f action = do
        result <- action
        return (f result)
```
- 试一试`fmap`：
```haskell
main :: IO ()
main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
          putStrLn line
```
- 如果想要对Functor中的数据做变换，可以先将变换函数定义出来，或者使用lambda或者使用函数组合。

`(->) r`：
- 注意到`(->)`的Kind是`(->) :: * -> * -> *`，也就是说其实`(->)`是一个类型构造器，而非运算符（函数类型）。
```haskell
type (->) :: * -> * -> *
data (->) a b
```
- `(->)`接受两个类型参数并得到一个函数类型，而函子接受一个类型参数，所以`(->) r`被实现为`Functor`的实例，而`->`本身并不是函子。如果类型构造器可以像函数一样写成中缀形式的话，那么也可以写成`(r ->)`，实际上并不可以。看一下实现：
```haskell
instance Functor ((->) r) where  
    fmap f g = (\x -> f (g x))
```
- 在`fmap :: Functor f => (a -> b) -> f a -> f b`中带入`(->) r`就能得到在这里实例中`fmap`的类型：`fmap :: (a -> b) -> (r -> a) -> (r -> b)`。
- 表示将`r -> a`的函数映射到`r -> b`的函数。看一下实现其实就是做了一个函数组合（有趣！），简写：
```haskell
instance Functor ((->) r) where  
    fmap = (.)
```
- 很明显`fmap`可以当做函数组合来用：
```haskell
>>> :t fmap (*3) (+100)
fmap (*3) (+100) :: Num b => b -> b
>>> :t (*3) . (+100)
(*3) . (+100) :: Num c => c -> c
>>> fmap (*3) (+100) $ 1
303
>>> (*3) . (+100) $ 1
303
>>> (*3) `fmap` (+100) $ 1
303
```
- `fmap`用于函数时其实就可以用来替代`.`，这很有趣，但并不实用。
- 这里用再用盒子来比喻就不是那么恰当了，因为实现函子的实例类型是函数，函数里面装了值这种说法可能并不直观和恰当。

`(,) a`:
- `(,)`是一个二元组的类型构造器，它的`Kind`是`* -> * -> *`。同时也是值构造器，等价于`\x y -> (x, y)`。
```haskell
>>> :k (,)
(,) :: * -> * -> *
>>> :t (,)
(,) :: a -> b -> (a, b)
>>> :k (,) Int
(,) Int :: * -> *
>>> :k (,) Int String
(,) Int String :: *
>>> (,) 1 2
(1,2)

```
- 固定了一个类型参数后，`(,) a`的Kind是`* -> *`，被实现为函子：
```haskell
instance Functor ((,) a) where
    fmap f (x, y) = (x, f y)
```
- 多元组的类型构造器`(,,) (,,,) ...`同理：
```haskell
instance Functor ((,,) a b) where
    fmap f (a, b, c) = (a, b, f c)

instance Functor ((,,,) a b c) where
    fmap f (a, b, c, d) = (a, b, c, f d)
```
- `fmap`只应用于最后一个元素。

**函子和`fmap`的理解**：
- 将`fmap`柯里化地只传一个参数调用的话，可以解释为接受一个函数，并返回一个接受一个函子然后返回一个函子的函数。
```haskell
>>> :t fmap (*3)
fmap (*3) :: (Functor f, Num b) => f b -> f b
>>> :t fmap (replicate 3)
fmap (replicate 3) :: Functor f => f a -> f [a]
```
- 也就是说有两种解释`fmap`的说法：
    - `fmap`接受一个函数和一个函子，将函子看做容器，把函数对容器上的每一个元素做应用，得到应用后的新容器。
    - 函子是一种计算上下文，`fmap :: (a -> b) -> (f a -> f b)`接受一个普通函数，并将这个函数Lift（提升）成可以在应用在新的计算上下文`f`中的函数。也就是**对函数做映射**。
    - 对于第二种理解，其中有一种情况就是函子本身就是一个函数，接收的第一个函数类型的参数被提升为可以应用在函数上的函数，应用之后得到的结果就是两个函数的组合，里层是输入的函子，外层是这个普通函数，也即是提升这件事就是做一个组合。理解清楚了也不用那么绕，结论就是这时候`fmap`就是函数的组合。
    - 因为柯里化，两种解释等价并且都正确。

实现函子的规定（functor law）：
- 第一条：`fmap id = id`，毕竟`id = (\x -> x)`。即是一个函子应该有`fmap id a = id a = a`。
- 第二条：`fmap (f . g) = fmap f . fmap g`，函子的`fmap`支持结合律，例：
    - `famp (f . g) (Just x) = Just ((f . g) x) = Just (f (g x))`
    - `fmap f . fmap g (Just x) = fmap f (fmap g (Just x)) = fmap f (Just (g x)) = Just (f (g x))`
- 看一个不满足规定，实现了`Functor`类型类的类型实例，但是不是函子的例子：
```haskell
-- example, an instance of typeclass Functor, but it's not a functor
data CMaybe a = CNothing | CJust Int a deriving(Show)
instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter + 1) (f x)
{-
>>> fmap id (CJust 1 2)
CJust 2 2
>>> fmap ((+1) . (*3)) (CJust 1 2)
CJust 2 7
>>> fmap (+1) . fmap (*3) $ CJust 1 2
CJust 3 7
-}
```
- 第一条第二条都未满足，所以其实`CMaybe`不是函子，这里需要从概念上区分函子和代码中`Functor`的类型实例。
- 如果我们使用一个`Functor`类型，那么会期待函子的规定（funtor laws）被遵守。如果这些规定被遵守，那么我们就知道它做`fmap`时不会做多余的事情，只是用一个函数来映射而已，基于此看到代码就能推导出它的行为，写出来的代码足够抽象也容易扩展。
- 所有标准函数库中函子实例都遵守这两点，在自己实现`Functor`实例时也应该花时间推导一下是否满足。
- 满足第一个规定的话一定满足第二个规定，只需要检查函子是否满足第一条规定即可。

### 应用函子

应用函子（Applicative Functors）是函子的升级版，包含在`Control.Applicative`模块中，由`Applicative`类型类定义。

函子中的函数：
- 我们知道Haskell函数时默认柯里化的，也就是说函数`f :: a -> b -> c`的调用`f x y`就是`(f x) y`，而单独的`f x`也是合法的调用，那么比如用`fmap (*) (Just 3)`会得到什么呢？很明显`Just (* 3)`，一个装在`Just`中的函数，类型为`Num a => Maybe (a -> a)`。
```haskell
>>> :t fmap (*) (Just 3)
fmap (*) (Just 3) :: Num a => Maybe (a -> a)
>>> :t Just (* 3)
Just (* 3) :: Num a => Maybe (a -> a)
```
- 也可以有更多参数：
```haskell
>>> :t fmap (\x y z w -> x + y + z + w) (Just 1)
fmap (\x y z w -> x + y + z + w) (Just 1) :: Num a => Maybe (a -> a -> a -> a)
```
- 这些放在函子`Maybe`中的函数要怎么调用呢？当然可以使用接受函数的函数来做`fmap`，并且还可以部分参数调用，得到依然装在`Maybe`中的参数更少的函数。
```haskell
>>> fmap (\f -> f 10) (Just (* 3)) 
Just 30
>>> :t fmap (\f -> f 10) (fmap (\x y z w -> x + y + z + w) (Just 1))
fmap (\f -> f 10) (fmap (\x y z w -> x + y + z + w) (Just 1)) :: Num t => Maybe (t -> t -> t)
```
- 但如果要用这些装在函子中的函数来应用到装在另一个函子中的数据呢？看起来是没有办法的，只能用模式匹配将数据或者函数抽出来后，再`fmap`，或者都抽出来之后直接调用。

应用函子就是做这个事情的，看一下`Control.Applicative`中的`Applicative`类型类：
```haskell
type Applicative :: (* -> *) -> Constraint
class Functor f => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b
  liftA2 :: (a -> b -> c) -> f a -> f b -> f c
  (*>) :: f a -> f b -> f b
  (<*) :: f a -> f b -> f a
  {-# MINIMAL pure, ((<*>) | liftA2) #-}
```
- 可以看到`Applicative`是`Functor`子类型类，也就是说只要是应用函子那么就一定是函子。
- 注意`(<*>) :: Applicative f => f (a -> b) -> f a -> f b`函数，和`fmap :: Functor f => (a -> b) -> f a -> f b`很像，不过将函数也放到了函子`f`中。
- 看一下`Maybe`的`Applicative`类型类实例实现：
```haskell
instance Applicative Maybe where
    pure = Just
    Nothing <*> _ = Nothing
    (Just f) <*> something = fmap f something
```
- `Nothing`中没有函数，所以将其应用于任何参数都是`Nothing`，而`Just f`应用于`something`，就是将函数`f`抽出来之后做了`fmap`。
- 例子：
```haskell
>>> Just (*3) <*> Just 10
Just 30
>>> pure (*3) <*> Just 10
Just 30
>>> Just (*3) <*> Nothing
Nothing
>>> Nothing <*> Just 10
Nothing
>>> Just reverse <*> Just "hello"
Just "olleh"
```
- `pure :: Applicative f => a -> f a`函数包装一个参数到应用函子`f`中。经过类型推导后在这个上下文中`pure`和`Just`效果一样。
- 上面函数仅接受一个参数，看一下其他操作：
```haskell
>>> Just (*) <*> Just 3 <*> Just 10
Just 30
>>> pure (+) <*> Just 3 <*> Nothing
Nothing
>>> Nothing <*> Just 3 <*> Just 10
Nothing
>>> Just (\x y z -> x + y + z) <*> Just 1 <*> Just 2 <*> Just 3
Just 6
>>> :t Just (\x y z -> x + y + z) <*> Just 1
Just (\x y z -> x + y + z) <*> Just 1 :: Num a => Maybe (a -> a -> a)
>>> liftA2 (\x y z -> x + y + z) (Just 1) (Just 2) <*> Just 3
Just 6
```
- 由于柯里化，所以这里第一个例子中对应于`(<*>) :: f (a -> b) -> f a -> f b`中的类型参数`b`其实是`(Int -> Int)`，很好理解。还可以有更多参数，每个`<*>`调用都会接受一个装在`Applicative`中的参数。
- `Applicative`还定义了`liftA2`函数用来接受两个参数的函数，但感觉完全可以被支持柯里化的`<*>`替代。
- 显然`<*>`是左结合的，效果上来说就是在做部分参数调用，每次一个参数。

**`pure`** ：
- `pure`是将一个普通值放到一个默认的上下文（函子，注意这里说上下文就是指计算上下文，就是指一个函子，确切说应用函子）中，是一个**最小的包含这个值的上下文（函子）**。
- 列表的`Applicative`类型类实例的实现：
```haskell
instance Applicative [] where  
    pure x = [x]  
    fs <*> xs = [f x | f <- fs, x <- xs]
```
- 对于列表而言，最小的上下文（函子）就是`[]`，但`[]`不包含值，不能当做`pure`。看`pure`类型声明`pure :: Applicative f => a -> f a`，对于列表，就是接受一个值，返回仅包含该值的列表。同理，`Maybe`的最小上下文是`Nothing`，但没有值，要能够包含这个值，所以`pure`的实现是`Just`。
- `pure`也是多态的，指定类型后会根据类型推导使用不同应用函子的实现。不过不指定类型的话就没有应用函子，这个逻辑是怎么来的呢？这个`pure`是调用的哪个`data`的`pure`实现呢？
```haskell
>>> pure "hello" :: [String]
["hello"]
>>> pure "hello" :: Maybe String
Just "hello"
>>> pure "hello"
"hello"
```
- 另外注意列表的`<*>`实现，由于列表保存多个数据，所以`<*>`结果是列表中多个函数排列运用于参数中多个值的结果的列表，相当于做了二层循环。如果参数更多，那么循环层数还会更多。前面的列表相当于外层循环，后面相当于内层。
```haskell
>>> [(+), (-), (*)] <*> [1..3] <*> [1..3]
[2,3,4,3,4,5,4,5,6,0,-1,-2,1,0,-1,2,1,0,1,2,3,2,4,6,3,6,9]
>>> [(\x y z -> x + y + z)] <*> [1..3] <*> [1..3] <*> [1..3]
[3,4,5,4,5,6,5,6,7,4,5,6,5,6,7,6,7,8,5,6,7,6,7,8,7,8,9]
```
- 对于列表而言，使用`<*>`是一种可以替代列表生成式的方式（本来也就是用列表生成式实现的）：
```haskell
-- just like list comprehension
>>> [x * y | x <- [1..5], y <- [6..10]]
[6,7,8,9,10,12,14,16,18,20,18,21,24,27,30,24,28,32,36,40,30,35,40,45,50]
>>> (*) <$> [1..5] <*> [6..10]
[6,7,8,9,10,12,14,16,18,20,18,21,24,27,30,24,28,32,36,40,30,35,40,45,50]
>>> filter (>25) $ (*) <$> [1..5] <*> [6..10]
[27,30,28,32,36,40,30,35,40,45,50]
```

**`<$>`**：
- 考虑`pure f <*> x`其实就等于`fmap f x`（这是Applicative laws的其中一条）。
- 如果我们要将函数`f`放到默认的上下文（函子）中并调用其他放在应用函子中的值，可以这样写：`pure f <*> x <*> y <*> ...`，但一般不会这样写而是写成`fmap f x <*> y <*> ...`。
- 看一下`<$>`运算符：
```haskell
Prelude> :i <$>
(<$>) :: Functor f => (a -> b) -> f a -> f b
        -- Defined in ‘Data.Functor’
infixl 4 <$>
```
- 定义，其实就是中缀版的`fmap`。
```haskell
f <$> x = fmap f x
```
- 所以上面的`fmap f x <*> y <*> ...`就等价于`f <$> x <*> y <*> ...`，含义是将普通的函数运用于应用函子`x y ...`上。
- 所以对于普通函数`f`，想要应用于应用函子中的值，可以写成`f <$> x <*> y <*> z`，如果是应用于普通值则写成`f x y z`。这种调用风格叫做**Applicative style**。
- 回顾一下能这样做的底层逻辑是`pure f <*> x = fmap f x = f <$> x`。
- 区分`<$> <*>`：如果函数在应用函子中，就用`<*>`，普通函数就用`<$>`。
- 只需要加一些`<$> <*>`就能将运用于普通值的函数改写为运用在应用函子上的函数。
```haskell
>>> (++) <$> Just "hello" <*> Just "world"
Just "helloworld"
>>> (++) "hello" "world"
"helloworld"
```

上面介绍了`Maybe`和`[]`的例子。看一看其他的`Applicative`实例：
```haskell
instance Monoid m => Applicative (Const m)
  -- Defined in ‘Data.Functor.Const’
instance Applicative ZipList -- Defined in ‘Control.Applicative’
instance Monad m => Applicative (WrappedMonad m)
  -- Defined in ‘Control.Applicative’
instance Arrow a => Applicative (WrappedArrow a b)
  -- Defined in ‘Control.Applicative’
instance Applicative (Either e) -- Defined in ‘Data.Either’
instance Applicative [] -- Defined in ‘GHC.Base’
instance Applicative Maybe -- Defined in ‘GHC.Base’
instance Applicative IO -- Defined in ‘GHC.Base’
instance Applicative ((->) r) -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b, Monoid c) =>
         Applicative ((,,,) a b c)
  -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b) => Applicative ((,,) a b)
  -- Defined in ‘GHC.Base’
instance Monoid a => Applicative ((,) a) -- Defined in ‘GHC.Base’
```
- 抛开没见过的东西，常见的还有`Either a` `IO` `((->) r)` 各种元组。可以看到现在了解到的类型只要是函子，那都实现为了应用函子的实例。

`IO`:
- 实现：
```haskell
instance Applicative IO where  
    pure = return
    a <*> b = do
        f <- a
        x <- b
        return (f x)
```
- `IO`中同样放函数，所以`<*>`实现就是取出函数和参数，应用后再通过`return`放到`IO`中。而`pure`实现则就是`return`，做一个不做任何事情的IO动作，可以产生某些值作为结果。
- 考虑下面的例子：
```haskell
concatLine :: IO String
concatLine = do
    a <- getLine
    b <- getLine 
    return $ a ++ b

concatLine' :: IO String 
concatLine' = (++) <$> getLine <*> getLine
```
- 对于`IO`来说，我们说`do`块中的IO动作是类似于顺序执行的。使用应用函子，替换成`<$> <*>`之后是存在一个执行顺序的概念的，就类似于`sequence`。
- 如果是在做绑定IO动作（取其中的值）的事情，并且绑定之后还调用了一些函数，可以考虑使用Applicative Style。

`(->) r`:
- 前面提到了`fmap`用于函数作为函子的情况，不适用于盒子的比喻，`fmap`就是在做函数组合。
- 同样地，`(->) r`也是应用函子。
- 将`(->) r`带入到`(<*>) :: Applicative f => f (a -> b) -> f a -> f b`类型签名中替代`f`得到，注意`(->) r`转为中缀是`(r ->)`：
```haskell
<*> :: (r -> a -> b) -> (r -> a) -> (r -> b)
```
- 看一下实现：
```haskell
instance Applicative ((->) r) where  
    pure x = (\_ -> x)  
    f <*> g = \x -> f x (g x)
```
- 将一个值放在函数的上下文中，那么最小上下文（应用函子）就是返回这个值本身的函数，所以`pure`接受一个参数`x`返回接受一个任何参数都返回`x`的函数。
```haskell
>>> :t pure 3
pure 3 :: (Applicative f, Num a) => f a
>>> :t (pure 3) "hello"
(pure 3) "hello" :: Num t => t
>>> (pure 3) "hello"
3
>>> pure 3 "hello"
3
>>> pure 3
3
```
- 函数调用左结合，括号可以省略，所以给`pure`调用再传递一个参数，通过类型推断就会调用`(->) r`的`pure`实现。
- 观察`<*>`函数签名和实现，`f`的类型是`r -> a -> b`，`g`类型是`r -> a`，`<*>`实现中接受`r`类型参数，返回`f`函数输出，同时由`g x`作为`f`第二个参数。至于为什么这样实现还不得而知。
- 看一个例子：
```haskell
{-
>>> f <*> g $ "10"
110.0
>>> (\x -> f x (g x)) "10"
110.0
>>> f "10" (g "10")
110.0
-}
-- <*> :: (r -> a -> b) -> (r -> a) -> (r -> b)
-- example : r String, a Int, b Double
f :: String -> Int -> Double
f s x = read s + fromIntegral x

g :: String -> Int
g s = read s * 10

{-
>>> :t (+) <*> (*100)
(+) <*> (*100) :: Num a => a -> a
>>> (+) <*> (*100) $ 10
1010
-}
```
- 和`<$>`一起用，对于函数来说`<$>`也就是`fmap`就是函数组合：
```haskell
>>> :t (+) <$> (+3) <*> (*100)
(+) <$> (+3) <*> (*100) :: Num b => b -> b
>>> (+) <$> (+3) <*> (*100) $ 5 
508
>>> (\x -> (x+3) + (x*100)) 5
508
>>> ((+) . (+3)) <*> (*100) $ 5
508

>>> (\x y -> [x, y]) <$> (+1) <*> (*10) $ (10 :: Int)
[11,100]
>>> (\x y z -> [x,y,z]) <$> (+3) <*> (*2) <*> (/2) $ 5
[8.0,10.0,2.5]
```
- 所以说对于函数`k <$> f <*> g`的含义得到一个函数，这个函数有一个参数，它会将参数分别传给`f g`，并将结果再传给`k`。
- 上面的代码是能够理解的，但并不算那么好理解，平时使用时我们通常不会将函数当做应用函子来用，但它确实是。
- 技巧：对于函数类型的应用函子，用`r ->`代入类型变量`f`即可得到最终类型，用最终类型来理解，不要用盒子来类比。

`ZipList`：
- 考虑`[(+3), (*2)] <*> [1, 2]`这种调用，显然会调用列表的`<*>`，得到`[4, 5, 2, 4]`。
- 那么如果想得到的结果是`[(+3) 1, (*2) 2]`，也就是列表对应元素调用，有没有办法呢？可能也会有这种需求，所以有了类型`ZipList`。
- `ZipList`只有一个值构造器`newtype ZipList a = ZipList {getZipList :: [a]}`，包含一个列表类型的字段。并且定义为了应用函子：
```haskell
instance Applicative ZipList where  
    pure x = ZipList (repeat x)  
    ZipList fs <*> ZipList xs = ZipList (zipWith (\f x -> f x) fs xs)
```
- 即是对列表做包装，并将`<*>`的行为定义了第一个列表函数对第二个列表对应元素的调用。
```haskell
>>> ZipList [(+3), (*2)] <*> ZipList [1, 2]
ZipList {getZipList = [4,4]}
>>> getZipList (ZipList [(+3), (*2)] <*> ZipList [1, 2])
[4,4]
>>> getZipList $ (+) <$> ZipList [1, 2] <*> ZipList [2, 3]
[3,5]
>>> getZipList $ (,,) <$> ZipList "dog" <*> ZipList "cat" <*> ZipList "rat"  
[('d','c','r'),('o','a','a'),('g','t','t')]
```
- 使用时将列表用`ZipList`包装后，要取出结果则使用`getZipList`。
- 对于列表，如果要将多个列表Zip起来，需要使用`zipWith3 zipWith4 ...`等函数，但使用Applicative Style的`ZipList`则不需要，只要将任意数量的`ZipList`用`<*>`连接起来即可，因为函数是柯里化的，单纯的数据则不能这样。

`liftA2`函数；
- 定义：
```haskell
liftA2 :: (Applicative f) => (a -> b -> c) -> f a -> f b -> f c  
liftA2 f a b = f <$> a <*> b
```
- 应用函子比起函子要强的一点除了能应用在应用函子中的函数，还在于可以将函数或者函子中的函数应用于多个函子。通过`liftA2`函数或者Applicative Style。
- 例子：如何将`Just 2`附加到`Just [3, 4]`上使其变成`Just [2, 3, 4]`？
```haskell
>>> (:) <$> Just 2 <*> Just [3, 4]
Just [2,3,4]
```
- 实现接受一个装有多个应用函子的列表到一个列表的应用函子：
```haskell
sequenceA' :: Applicative f => [f a] -> f [a]
sequenceA' [] = pure []
sequenceA' (x:xs) = (:) <$> x <*> sequenceA' xs

sequenceA'' :: Applicative f => [f a] -> f [a]
sequenceA'' = foldr (\x xs -> (:) <$> x <*> xs) (pure [])

sequenceA''' :: Applicative f => [f a] -> f [a]
sequenceA''' = foldr (liftA2 (:)) (pure [])
```
- 几乎任何递归走遍整个列表然后累加的函数都可以使用`foldr/foldl`实现，和`Data.Traversable`中的`sequenceA`含义是相同的，用`liftA2`还可以进一步简化：
```haskell
sequenceA :: (Traversable t, Applicative f) => t (f a) -> f (t a)
{-
>>> sequenceA [Just 1, Just 2, Just 3]
Just [1,2,3]
>>> sequenceA' [Just 1, Just 2, Just 3]
Just [1,2,3]
>>> sequenceA'' [Just 1, Just 2, Just 3]
Just [1,2,3]
>>> sequenceA [[1, 2], [3, 4]]
[[1,3],[1,4],[2,3],[2,4]]
>>> sequenceA [[1, 2], [3, 4], []]
[]
-}
```
- `liftA2`在这种场合很实用，理解为将运算符`(:)`提升（Lift）为能应用于应用函子上的函数，函数命名是非常准确的，的确是有存在意义的。
- 当`sequenceA`接受装有函数的列表时，会回传一个返回列表的函数，此时其实就是应用于`(->) r`应用函子上，直接用`r ->`替换为类型变量`f`来得到最终类型。当有一系列函数需要应用在相同的参数上时使用`sequenceA`会非常方便，比使用`map`用接受函数的函数做映射更加方便。
```haskell
>>> :t sequenceA [(>2), (>3)]
sequenceA [(>2), (>3)] :: (Ord a, Num a) => a -> [Bool]
>>> sequenceA [(>2), (>3)] 3
[True,False]
>>> map (\f -> f 3) [(>2), (>3)]
[True,False]
```
- 当使用在`IO`对象上时，`sequenceA`和`sequence`是等价的。接受一串IO动作，返回一个会执行列表中所有IO动作并将结果放在一个列表中的IO动作。
```haskell
sequence :: (Traversable t, Monad m) => t (m a) -> m (t a)
sequenceA :: (Traversable t, Applicative f) => t (f a) -> f (t a)
```

Applicative Functor Laws:
- 同函子一样，应用函子也有一定要遵守的定律，前面提到的`pure f <*> x = fmap f x`是其中最重要的一个：
```haskell
pure id <*> v = v
pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
pure f <*> pure x = pure (f x)
u <*> pure y = pure ($ y) <*> u
```

总结：
- 应用函子可以用来结合不同种类的运算。
- `<*> <$> pure`。
- 注意列表上的non-deterministic的行为。

### newtype

`data`用于定义新类型，`type`用于定义类型别名，还有一种定义新类型的方式就是`newtype`。

比如定义`ZipList`时可以这样定义：
```haskell
data ZipList a = ZipList { getZipList :: [a] }
```
- 这里的目的是将`[a]`包在`ZipList`中，还可以使用`newtype`，实际的库中也是这样定义的：
```haskell
newtype ZipList a = ZipList { getZipList :: [a] }
```

那么`newtype`相较`data`有何异同呢？
- 使用`newtype`会告诉Haskell你只是想将一个类型包起来，有了这一点作为基础，Haskell可以将包装和解包的成本优化掉。`data`则不能。
- `newtype`定义一个新类型时，只能定义一个值构造器，而且这个值构造器只能有一个字段。使用`data`则不限制值构造器数量和值构造器的字段数量。
- 直观理解就是如果你要想用`newtype`包装一个类型，那么只能是一个类型的一个数据。
- `newtype`也能使用`deriving`关键字，可以直接派生`Eq Ord Enum Bounded Show Read`。如果想对新的类型类做派生，那么包装的那个类型必须也派生了那个类型类。这很合理。
- 配合Record Syntax，值构造器就是将内部包装的类型转为新类型的函数，字段名称就是将新类型转为内部包装类型的函数，轻易就可以取到其中的值。
- 只能包装一个类型的一个数据不代表只能有一个类型参数，内部包装的数据本身可以有多个类型参数，例：
```haskell
newtype Pair a b = Pair {getTuple :: (a, b)} deriving(Show, Read, Eq)
```
- 可以对`newtype`定义的类型做模式匹配，其实就和`data`一样，本质就是嵌套模式匹配：
```haskell
showPair :: (Show a, Show b) => Pair a b -> String
showPair (Pair (a, b)) = show (Pair (a, b))
```
- 元组在做`fmap`时只会对最后一个元素做，可以包装一层并将行为更改为对第一个元素：
```haskell
newtype Pair' b a = Pair' {getPair' :: (a, b)} deriving(Eq, Read, Show)
instance Functor (Pair' b) where
    fmap f (Pair' (x, y)) = Pair' (f x, y)
{-
>>> getPair' $ fmap reverse (Pair' ("hello", 3))
("olleh",3)
-}
```
- 看做一种有着限制的`data`定义就行。

`newtype`的懒惰特性：
- `undefined :: a`函数在求值时会触发异常。Haskell默认是懒惰求值，也就是真正需要值的时候才会去求（比如说要输出的时候）。
```haskell
>>> [0, 1, 2, 3, undefined, 5, undefined] !! 5
5
>>> sum [0, 1, 2, 3, undefined, 5, undefined]
Prelude.undefined
```
- 可以看到列表中元素的求值时懒惰的，下标为`5`的元素取出时，下标为`4`的元素并没有被求值。
- `newtype`还有一个重要特点就是其对字段求值具有懒惰特性，而`data`则没有：
```haskell
data NewBool = NewBool {getNewBool :: Bool}
helloBool :: NewBool -> [Char]
helloBool (NewBool _) = "hello"
{-
>>> helloBool undefined
Prelude.undefined
-}

newtype NewBool' = NewBool' {getNewBool' :: Bool}
helloBool' :: NewBool' -> [Char]
helloBool' (NewBool' _) = "hello"
{-
>>> helloBool' undefined
"hello"
-}
```
- 能做到这一点的原因和前面能将包装和解包优化掉的原因一样，`newtype`只能有一个值构造器和一个字段，在模式匹配时不需要计算数据的值就能知道形式一定是匹配的。
- `newtype`定义一种新的数据类型，但除了从盒子中取东西之外，更像是将一个类型转换为另一个类型。

`type data newtype`对比：
- `type`定义类型别名，并不定义新类型，只是给一个现有类型起一个新名字。定义别名的作用更多是增加可读性，使l类型签名更清晰。
```haskell
{- type & data & newtype
>>> :t PhoneBook
PhoneBook :: PersonName -> PhoneNumber -> PhoneBook
-}
type PersonName = String
type PhoneNumber = String
data PhoneBook = PhoneBook PersonName PhoneNumber deriving(Show, Read, Eq)
```
- `data`就是最普通最常见的类型定义，定义一个全新的类型。
- 当新类型只有一个值构造器和一个字段时，就可以使用`newtype`，可以获得`newtype`的优化，同时和`data`定义的类型含义差不多，只有懒惰求值的特点会有区别。注意和`data`一样，并不会自动派生内部包装的类型的基类，需要手动添加`deriving`或者实现`instance`。

### Monoid

Monoid这个单词的意思是**幺半群**，**半群**则是Semigroup。至于定义是什么，暂时未知，后续再解释。

前面所说的类型类定义多种类型拥有的共同属性，比如`Eq`，可以判断相等的类型都应该实现为`Eq`的实例。

让我们将这种抽象放到函数而不仅限于`data newtype`定义的数据类型，这里考虑函数`*`和`+`的共同特性：
- 都接受两个参数，参数和返回值类型相同。
- 存在某些值当应用于二元函数时不会改变其他值，1对于`*`，0对于`+`。
- 都满足结合律（associativity），`5*(3*4) = 5*3*4`。

将这些性质抽象具体地写出来，就可以得到一个`Monoid`：
```haskell
type Monoid :: * -> Constraint
class Semigroup a => Monoid a where
  mempty :: a
  mappend :: a -> a -> a
  mconcat :: [a] -> a
  mconcat = foldr mappend mempty
  {-# MINIMAL mempty #-}
  	-- Defined in ‘GHC.Base’
```
- 是一个类型类，从`Semigroup`派生。
- 其中`mempty`就是那个相对于二元函数作为Identity的值，是一个多态的常数，`mappend`则是这个二元函数，`mconcat`对一个列表的所有元素做`mappend`（满足结合律）。
- 实现一个`Monoid`实例时，一般实现`mempty mappend`就行，`mconcat`定义都没有问题，不过在某些情况下比如可以提供更高效的实现，依然可以实现`mconcat`。

`Monoid`类型类的定律（Monoid Law）：
```haskell
mempty `mappend` x = x
x `mappend` mempty = x
(x `mappend` y) `mappend` z = x `mappend` (y `mappend` z)
```
- 即是与单位元（Identity，暂且这么翻译）的运算结果还是自己，和满足结合律。
- Haskell不会检查这些定律是否被遵守，将类型实现为`Monoid`时需要自己小心地检查他们。
- 值得注意``a `mappend` b``和``b `mappend` a``并不需要相等。交换律并不要求被满足，`+ *`满足这一点这是他们自己的性质。

内置的实现了`Monoid`的类型：
- 列表：对于列表而言，`mconcat`就是`concat`，这个二元运算就是`++`操作。
```haskell
instance Monoid [a] where
    mempty = []
    mappend = (++)
{-
>>> mempty :: [a]
[]
>>> [1, 2] `mappend` [3, 4]
[1,2,3,4]
>>> mconcat [[1, 2], [3, 4], [5, 6, 7]]
[1,2,3,4,5,6,7]
-}
```
- `Product Sum`，对于整数浮点数`+ *`都满足Monoid Law，那么如何选择呢？答案是不做选择，`Data.Monoid`导出了两个类型`Product a/Sum a`，都是用`newtype`定义的，实现了常见的`Num Show Read Eq Ord `等类型类，可以用其来**包装**`Num`实例类型的数据。`Product a/Sum a`的`Monoid`实现中分别定义了`mappend`为`*/+`。使用时选择要用哪一个来包装，而更一般的`Num`则没有从`Monoid`派生。
```haskell
newtype Product a = Product {getProduct :: a}
    -- Defined in ‘Data.Semigroup.Internal’
    ...
instance Num a => Monoid (Product a) where
    mempty = Product 1  
    Product x `mappend` Product y = Product (x * y)

newtype Sum a = Sum {getSum :: a}
    -- Defined in ‘Data.Semigroup.Internal’
    ...
instance Num a => Monoid (Sum a) where
    mempty = Sum 0
    Sum x `mappend` Sum y = Sum (x + y)
{-
>>> getSum . mconcat . map Sum $ [1, 2, 3]
6
>>> getProduct . mconcat . map Product $ [1, 10, 100]
1000
-}
```
- 对于`Bool`类型，`&& ||`运算符都满足`Monoid`的规则，所以定义了两个包装类型`Any All`，实现就类似于下面这样，用法类似，包装就行：
```haskell
newtype Any = Any {getAny :: Bool}
instance Monoid Any where
    mempty = Any False
    Any x `mappend` Any y = Any (x || y)

newtype All = All {getAll :: Bool}
instance Monoid All where
        mempty = All True
        All x `mappend` All y = All (x && y)
{-
>>> getAll . mconcat . map All $ [True, True, False]
False
>>> getAny . mconcat . map Any $ [False, False, True]
True
-}
```
- `Ordering`类型是比较的结果，也是`Monoid`的实例。实现非常符合直觉，这个实现的含义就是：对于列表来说，在进行比较时，左边的元素优先级更高，如果左边小于/大于，那么最终结果就是小于/大于，左边元素相等那么继续比较后续元素。Monoid Law都是满足的。这个`Monoid`会用于什么场合呢？可以用于有多个比较因素时，用`mappend`或者`mconcat`连接起来构成最终的关系。
```haskell
data Ordering = LT | EQ | GT
instance Monoid Ordering where
    mempty = EQ
    LT `mappend` _ = LT
    EQ `mappend` y = y
    GT `mappend` _ = GT

-- usage
lengthCompare :: String -> String -> Ordering
lengthCompare x y = (length x `compare` length y) `mappend` (x `compare` y)
-- just write as an example, not necessary
lengthCompare' :: String -> String -> Ordering
lengthCompare' x y = mconcat $ [compare `on` length, compare, compare `on` map toUpper] <*> [x] <*> [y]
{-
>>> lengthCompare "hello" "world"
LT
>>> lengthCompare "hello1" "world"
GT
>>> lengthCompare' "hello" "world"
LT
>>> mconcat (zipWith compare "abcd" "abce")
LT
-}
```
- `Maybe a`类型包装一个数据，如果这个数据的类型`a`是`Monoid`，那么也可以将`Maybe a`实现为`Monoid`:
```haskell
instance Monoid a => Monoid (Maybe a) where  
    mempty = Nothing  
    Nothing `mappend` m = m  
    m `mappend` Nothing = m  
    Just m1 `mappend` Just m2 = Just (m1 `mappend` m2)
{-
>>> Nothing `mappend` Just "hello"
Just "hello"
>>> Just "hello" `mappend` Nothing
Just "hello"
>>> Just "hello" `mappend` Just "world"
Just "helloworld"
-}
```
- `First a / Last a`，`Maybe a`除了包装其中的`Monoid`这种实现方式还可以有其他实现。如果其中的数据类型不是`Monoid`，我们可以选择将`mappend`实现为丢弃其中某个数据，留下前者或者后者，留下前者则是`First a`，后者则是`Last a`，当然如果其中有`Nothing`那会优先留下非`Nothing`的值。`Maybe a`已经有了实现，他们都是`Maybe a`的包装。
```haskell
newtype First a = First { getFirst :: Maybe a }  
    deriving (Eq, Ord, Read, Show)
instance Monoid (First a) where  
    mempty = First Nothing  
    First (Just x) `mappend` _ = First (Just x)  
    First Nothing `mappend` x = x
{- First a & Last a
>>> mempty :: First a
First {getFirst = Nothing}
>>> First Nothing `mappend` First (Just 1)
First {getFirst = Just 1}
>>> First (Just 1) `mappend` First Nothing
First {getFirst = Just 1}
>>> First (Just 1) `mappend` First (Just 2)
First {getFirst = Just 1}

>>> mempty :: Last a
Last {getLast = Nothing}
>>> Last Nothing `mappend` Last (Just 1)
Last {getLast = Just 1}
-}
```
- `foldl foldr`可以用来折叠`Foldable`，`[a]`也是一种`Foldable`，前面多用于折叠`[a]`，其实还可以用于其他实现了`Foldable`的数据类型。注意其中的`fold foldMap foldMap'`方法，他们会使用`Monoid`的`mappend`方法进行折叠，可以是数据本来就是`Monoid`，也可以是使用传入函数将数据转换为`Monoid`。
```haskell
type Foldable :: (* -> *) -> Constraint
class Foldable t where
  fold :: Monoid m => t m -> m
  foldMap :: Monoid m => (a -> m) -> t a -> m
  foldMap' :: Monoid m => (a -> m) -> t a -> m
  foldr :: (a -> b -> b) -> b -> t a -> b
  foldr' :: (a -> b -> b) -> b -> t a -> b
  foldl :: (b -> a -> b) -> b -> t a -> b
  foldl' :: (b -> a -> b) -> b -> t a -> b
  foldr1 :: (a -> a -> a) -> t a -> a
  foldl1 :: (a -> a -> a) -> t a -> a
  toList :: t a -> [a]
  null :: t a -> Bool
  length :: t a -> Int
  elem :: Eq a => a -> t a -> Bool
  maximum :: Ord a => t a -> a
  minimum :: Ord a => t a -> a
  sum :: Num a => t a -> a
  product :: Num a => t a -> a
  {-# MINIMAL foldMap | foldr #-}
  	-- Defined in ‘Data.Foldable’
instance Foldable (Const m) -- Defined in ‘Data.Functor.Const’
instance Foldable [] -- Defined in ‘Data.Foldable’
instance Foldable Sum -- Defined in ‘Data.Foldable’
instance Foldable Product -- Defined in ‘Data.Foldable’
instance Foldable Maybe -- Defined in ‘Data.Foldable’
instance Foldable Last -- Defined in ‘Data.Foldable’
instance Foldable First -- Defined in ‘Data.Foldable’
instance Foldable (Either a) -- Defined in ‘Data.Foldable’
instance Foldable Dual -- Defined in ‘Data.Foldable’
instance Foldable f => Foldable (Ap f)
  -- Defined in ‘Data.Foldable’
instance Foldable f => Foldable (Alt f)
  -- Defined in ‘Data.Foldable’
instance Foldable ((,) a) -- Defined in ‘Data.Foldable’
instance Foldable ZipList -- Defined in ‘Control.Applicative’
```
- 二叉树的`Foldable`实现例子：
```haskell
data Tree a = EmptyTree | TreeNode a (Tree a) (Tree a) deriving(Show, Read, Eq)
instance Foldable Tree where
    foldMap f EmptyTree = mempty
    foldMap f (TreeNode x l r) = foldMap f l `mappend` f x `mappend` foldMap f r

testTree :: Tree Integer
testTree = TreeNode 5 
    (TreeNode 3 
        (TreeNode 1 EmptyTree EmptyTree) 
        (TreeNode 6 EmptyTree EmptyTree)
    )
    (TreeNode 9 
        (TreeNode 8 EmptyTree EmptyTree) 
        (TreeNode 10 EmptyTree EmptyTree)
    )
{-
>>> foldl (+) 0 testTree
42
>>> foldr (*) 1 testTree
64800
>>> foldMap (\x -> [x]) testTree
[1,3,6,5,8,9,10]
>>> getAny $ foldMap (\x -> Any $ x > 10) testTree
False
>>> getAll $ foldMap (\x -> All $ x > 5) testTree
False
-}
```

## Monad

`Functor`函子代表可以被映射（使用`fmap`）的值，将概念提升到`Applicative`应用函子，代表一种具有上下文的类型，可以用函数操作同时保有其上下文（这里的上下文可以通过`Applicative`将值包了起来，值的这一层包裹就叫做上下文这种说法来理解）。

注意说法上的细微差别，`Functor`一般称其能被map over，提升到`Applicative`时才说其具有上下文，一个Applicative value可以被看做一个附加了上下文的值，`pure`包装就是用来给其附加上下文的。然后使用`<$> <*>`就可以用普通函数或者具有上下文的函数操作具有上下文的值，同时保有上下文到结果中。

然后对于特定的`Applicative`，上下文含义不同，`Maybe a`代表可能失败的计算，`[a]`代表同时有多种结果的计算（non-deterministic），而`IO a`代表有副作用的计算。

现在一个新的问题是如果有一个具有上下文的值`m a`，和一个接受普通值返回具有上下文的值的函数`a -> m b`，如何将函数`a -> m b`应用于值`m a`上得到具有上下文的值`m b`。为此定义新的类型类`Monad`：
```haskell
type Monad :: (* -> *) -> Constraint
class Applicative m => Monad m where
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b
  return :: a -> m a
  {-# MINIMAL (>>=) #-}
  	-- Defined in ‘GHC.Base’
instance Monad (Either e) -- Defined in ‘Data.Either’
instance Monad [] -- Defined in ‘GHC.Base’
instance Monad Maybe -- Defined in ‘GHC.Base’
instance Monad IO -- Defined in ‘GHC.Base’
instance Monad ((->) r) -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b, Monoid c) => Monad ((,,,) a b c)
  -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b) => Monad ((,,) a b)
  -- Defined in ‘GHC.Base’
instance Monoid a => Monad ((,) a) -- Defined in ‘GHC.Base’
```
其中的`(>>=) :: Monad m => m a -> (a -> m b) -> m b`即是我们要的函数，这个函数称呼为bind。

`Monad`中文则翻译为**单子**，也就是开头所说的单子是自函子范畴上的幺半群的那个单子。

### Monad类型类

`Monad`是`Applicative`的子类型类，所以一个`Monad`单子也是一个应用函子，同样也是一个函子。对于具体的单子实例类型而言，实现`Monad`实例时必须要考虑其上下文的含义。

早期的`Monad`类型类定义看起来像这样：
```haskell
class Monad m where  
    return :: a -> m a  
    (>>=) :: m a -> (a -> m b) -> m b
    (>>) :: m a -> m b -> m b
    x >> y = x >>= \_ -> y
    fail :: String -> m a
    fail msg = error msg
```
- 这里并没有将`Applicative`加到`m`的类型约束中，实际上是有的，这里没有写出来。在Haskell早期，人们没有想到应用函子适合被放进语言中，那时暂时还没有约束。但确实每个`Monad`都是应用函子，即便没有这么声明。
- `return`函数就像`Applicative`的`pure`，做一样的事情，类型是`return :: Monad m => a -> m a`，接受普通值并将其放在最小的上下文中。在介绍`IO`时已经遇到过，再次提醒`return`并不表示函数返回，不改变任何函数的执行流程（况且Haskell中函数并非执行流程而是数据的变换），只是将值做包装。
- 现在`fail :: MonadFail m => String -> m a`函数不在`Monad`中，而是`Monad`的子类型类`MonadFail`中。被用在处理Haskell错误语法的情况，当前不用在意。
- `>>`已经有了默认实现，一般情况我们不会需要去考虑覆写它。

`Maybe`的实现：
- `Maybe a`同样也是单子。
- 实现：
```haskell
instance Monad Maybe where  
    return x = Just x  
    Nothing >>= f = Nothing  
    Just x >>= f  = f x  
    fail _ = Nothing
```
- 例子：
```haskell
>>> return 1 :: Maybe Int
Just 1
>>> Nothing >>= (\x -> Just x)
Nothing
>>> Just 10 >>= (\x -> Just $ x * x)
Just 100
```

### Monad应用

一个使用`Maybe`表示可能失败的上下文的例子，来自Haskell趣学指南：
- 大意是一个人在走钢丝，拿着一根长竿，这根竿两端会不时随机飞来一些鸟停在这里或者随机飞走，当两边鸟的数量差达到3时，这个人就会掉下去。
- 模拟这个过程，得到最终结果，如果掉下去了那么就表示已经失败了，不会有鸟在飞过来，用`Maybe`来表示很合理。
```haskell
type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs (left + n - right) < 4 = Just (left + n, right)
    | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (right + n - left) < 4 = Just (left, right + n)
    | otherwise = Nothing
```
- 最后整个模拟过程的调用链条中，上一步输出是`Maybe Pole`，而下一步的要求输入是`Pole`，使用`Maybe`的`Monad`特性，就可以使用`>>=`连接起来。
```haskell
>>> :t landLeft 2
landLeft 2 :: Pole -> Maybe Pole
>>> Nothing >>= landLeft 1
Nothing

>>> landLeft 1 (0, 0) >>= landLeft 3 >>= landRight 2 >>= landRight 1
Nothing
>>> landLeft 1 (0, 0) >>= landRight 3 >>= landLeft 2 >>= landRight 1
Just (3,4)
>>> return (0, 0) >>= landLeft 1 >>= landRight 3 >>= landLeft 2 >>= landRight 1
Just (3,4)
```
- 将初值用`return`函数附加了上下文之后也可以加到调用链条中。

使用`>>=`为我们省去了检查上一步结果的繁琐步骤，`Maybe`的实现含义就是遇到`Nothing`就返回`Nothing`，一直都是有效值就持续地用`Just`进行传递。

再看一下`>>`运算符：
```haskell
x >> y = x >>= \_ -> y
```
- 和`>>=`很类似，但是它会调用`>>=`传入第一个参数，第二个参数的函数不考虑参数并直接返回`>>`的第二个参数值。
- 也就是说`>>`做和`>>=`类似的事情，但不传递参数，而是保留最后一个有效的结果。
- 对于`Maybe`来说，包含可能失败的上下文语义，具体含义就是如果中途某一步失败，那么结果就是`Nothing`，如果每一步都成功，那么最终结果就是最后一步的结果。中间的结果不会被传递。
```haskell
>>> :t (>>)
(>>) :: Monad m => m a -> m b -> m b
>>> Nothing >> Just 1
Nothing
>>> Just 1 >> Just 2 >> Just 3
Just 3
>>> Just 1 >> Just 2 >> Nothing
Nothing
```

### do表示法

介绍IO时说过了`do`表示法，这是一个语法糖，但并未揭示它的细节。其实`do`串联多个`IO`对象的本质就是使用了`>>=`。

在前面所述的调用链中，如果要插入一些其他的值（这些值也具有上下文，所以也需要使用`>>=`传递），比如某个函数需要两个参数，一个是`>>=`前面的参数，一个是另一个具有上下文的值。那么可以使用lambda：
```haskell
>>> Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
Just "3!"
>>> Just 3 >>= (\x -> Nothing >>= (\y -> Just (show x ++ y)))
Nothing
```
将第一个例子写作多行：
```haskell
foo :: Maybe [Char]
foo = Just 3 >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))
```
为了简化这种写法，摆脱烦人的lambda，于是有了`do`表示法，将`foo`写成等价的`do`表示法：
```haskell
foo' :: Maybe [Char]
foo' = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)
{-
>>> foo
Just "3!"
>>> foo'
Just "3!"
-}
```
这也说明了为什么`do`表达式结果是最后一个式子的值，它串联的前面的所有结果，是最终的结果。

用`do`来表示上一个走钢丝例子中的`return (0, 0) >>= landLeft 1 >>= landRight 3 >>= landLeft 2 >>= landRight 1`：
```haskell
bar :: Maybe Pole
bar = do
    start <- return (0, 0) -- let start = (0, 0)
    second <- landLeft 1 start
    third <- landRight 3 second
    fourth <- landLeft 2 third
    landRight 1 fourth
{-
>>> bar
Just (3,4)
-}
```

总结：
- 很显然，如果其中某一步骤没有使用`<-`，其实就是使用`>>`而不是`>>=`。这很好理解。
- **`do`表示法就是`Monad`的`>>= >>`运算符和lamdba的语法糖**。
- 在`<-`左端可以使用模式匹配，因为本质上是lambda的参数，参数当然是可以使用模式匹配的。
- 使用`<-`的语句不能作为最后一个语句，因为本质上它只定义了lambda的参数，还没有定义函数体。
- 需要注意在每一步过程中结果类型都是可以发生改变的，并不需要和`>>=`的参数保持一致，只需要每一步输出类型和下一步输入类型一致，并且最终结果和返回值类型一致即可。

使用的选择：
- 具体是使用`>>= >>`还是用`do`其实主要看习惯问题。等价的怎么选都行。
- 一般来说如果每一步都只使用（甚至不使用）上一步的结果，并且还要是作为最后一个参数（不然会需要使用lambda），没有额外的值的参与，那么使用`>>= >>`就可以很清晰。（走钢丝的例子）
- 如果有额外的值的参与，或者某一步的值并不仅仅直接用于下一步而是用在后面几步之后，或者使用的值不是最后一个参数，改成`do`会更好一些。（各种复杂的IO动作）

### Monad实例

列表`[a]`：
- 就像应用函子中讨论的，列表提供了一种**不确定性（Non-determinism）含义的上下文**。
- 实现：
```haskell
instance Monad [] where
    return x = [x]
    xs >>= f = concat (map f xs)
    fail _ = []
```
- 目前来说`fail`实现在`MonadFail`中，不用管，`return`同`pure`接受一个值将其放到最小的上下文中。
- `>>=`提供了类似于`<*>`的non-deterministic（不确定）的计算结果。`>>=`将`xs`中所有参数应用于函数`f`之后将得到的所有列表连接起来。
- `<*>`的不确定性是由`<*>`连接的多个列表类型参数中值的排列（多层循环）导致的，而`>>=`则是输入列表中的一个值，通过`a -> [a]`的函数变成了多个值导致的（每一层中一个值都会扩展为多个值）。
- 例子：
```haskell
>>> [1, 2, 3] >>= (\x -> [x, -x]) >>= (\x -> [(x, x * 10)])
[(1,10),(-1,-10),(2,20),(-2,-20),(3,30),(-3,-30)]
>>> [(x, x * 10) | n <- [1, 2, 3], x <- [n, -n]]
[(1,10),(-1,-10),(2,20),(-2,-20),(3,30),(-3,-30)]
>>> [] >>= (\x -> ["hello", "world"])
[]
>>> [1, 2, 3] >>= (\x -> [])
[]
```
- 如果输入或者某一步输出是空列表，那么调用链的最终结果都会是`[]`，这就像`Maybe`的`Nothing`，执行任何`map f []`对于任何函数`f`结果都会是空列表。
- 用`do`表示法改写第一个例子：
```haskell
listOfTuples :: [Integer ] -> [(Integer, Integer)]
listOfTuples l = do
    n <- l
    m <- [n, -n]
    return (m, m * 10)
{-
>>> listOfTuples [1, 2, 3]
[(1,10),(-1,-10),(2,20),(-2,-20),(3,30),(-3,-30)]
-}
```
- 上一个例子中下一步直接使用了上一步返回值，经过几步之后再用也同样可以：
```haskell
listOfTuples' :: [(Int,Char)]  
listOfTuples' = do
    n <- [1,2]
    ch <- ['a','b']
    return (n,ch)
{-
>>> listOfTuples'
[(1,'a'),(1,'b'),(2,'a'),(2,'b')]
>>> [(n, ch) | n <- [1, 2], ch <- ['a', 'b']]
[(1,'a'),(1,'b'),(2,'a'),(2,'b')]
-}

listOfTuples'' :: [(Int, Char)]
listOfTuples'' = [1, 2] >>= (\n ->
                ['a', 'b'] >>= (\ch -> 
                [(n, ch)]))
{-
>>> listOfTuples''
[(1,'a'),(1,'b'),(2,'a'),(2,'b')]
-}

```
- 实际使用时，其实就表示一种Non-deterministic的上下文，用`do`表示法亦可。
- 我们会发现都可以等级为对应的List Comprehension，其实**List Comprehension就是`>>=`函数在列表这个`Monad`上的语法糖**。列表生成式中不需要最后`return`而是将最终列表中元素放在了`|`前。
- 无论用`do`表示法还是List Comprehension最终都会转换成`>>=`来计算。
- 列表生成式中可以允许条件来对结果进行筛选，这一点要怎么在`>>=`串联的函数调用中要怎么做到呢？
    - 可以考虑使用`Control.Monad`中的`guard`函数和`MonadPlus`函数：
    ```haskell
    type MonadPlus :: (* -> *) -> Constraint
    class (Alternative m, Monad m) => MonadPlus m where
      mzero :: m a
      mplus :: m a -> m a -> m a
      	-- Defined in ‘GHC.Base’
    instance MonadPlus [] -- Defined in ‘GHC.Base’
    instance MonadPlus Maybe -- Defined in ‘GHC.Base’
    instance MonadPlus IO -- Defined in ‘GHC.Base’

    instance MonadPlus [] where  
        mzero = []  -- same as mempty in Monoid
        mplus = (++) -- same as mappend in Monoid

    -- guard :: Alternative f => Bool -> f () defined in Control.Monad
    guard' :: MonadPlus m => Bool -> m ()
    guard' True = return () -- for [] return [()]
    guard' False = mzero -- for [] return []
    ```
    - `[]`同样是`MonadPlus`的实例，`MonadPlus`函数的`mzero mplus`对于列表来说就是`Monoid`的`mempty  mappend`的同义词，实现也一样。用在列表上时`guard`函数的返回类型是`[()]`。
    - `guard`使用：
    ```haskell
    >>> guard (5 > 2) :: [()]
    [()]
    >>> guard (2 > 3) :: [()]
    []
    >>> [()] >> return "cool" :: [String]
    ["cool"]
    >>> [] >> return "cool" :: [String]
    []
    >>> [(), ()] >> return "cool" :: [String]
    ["cool","cool"]
    >>> [1..50] >>= (\x -> guard ('7' `elem` show x) >> return x)
    [7,17,27,37,47]
    >>> [x | x <- [1..50], '7' `elem` show x]
    [7,17,27,37,47]
    >>> do x <- [1..50]; guard ('7' `elem` show x); return x
    [7,17,27,37,47]
    ```
    - `guard`实现，对于列表来说，输入`True`返回`[()]`，输入`False`则返回空列表`[]`，如果是非空列表，经过`>>`之后输入的空元组会被忽略，此时是一个成功状态，`return x`得到`[x]`。而输入为`[]`时是一个失败状态（实现上都是`map`然后`concat`）结果会为空`[]`。即实现了筛选功能。
    - 当然也可以使用`do`表示法。
    - 当然就这个例子而言，一个简单的`if-then-else`当然也可以做到：
    ```haskell
    >>> [1..50] >>= (\x -> if ('7' `elem` show x) then [x] else [])
    [7,17,27,37,47]
    ```
- 另外，对于列表来说，`>>`运算符，将左边列表的所有元素，替换为结果列表中的一个或多个元素（即替换为列表后再`concat`）。就是说左边列表的元素类型和值不重要，一般来说就像`guard`一样可以使用空元组`()`来占位。
```haskell
>>> [1..5] >> return 1
[1,1,1,1,1]
>>> [1..5] >> return [()]
[[()],[()],[()],[()],[()]]
>>> [1..5] >> [0, 1, 2]
[0,1,2,0,1,2,0,1,2,0,1,2,0,1,2]
```

一个例子：
- 查找国际象棋的骑士（就像中国象棋中的马，一个方向走1格，一个方向走两格）走3步可能到达的所有位置。
- 利用列表上下文的不确定性来做。
```haskell
import Data.List
import Control.Monad
-- example: find all possible position for knight to move in chess
-- valid chess posotin : row from 1 to 8, from column 1 to 8
type KnightPos = (Int, Int)
moveKnight :: KnightPos -> [KnightPos]
moveKnight (r, c) = do
    (a, b) <- [(a, b) | a <- [-1, 1], b <- [-2, 2]] -- offset
    (or, oc) <- [(a, b), (b, a)] -- all possible offset
    (rr, rc) <- [(r + or, c + oc)] -- result
    guard (rr `elem` [1..8] && rc `elem` [1..8]) -- filter
    return (rr, rc)

moveKnight3 :: KnightPos -> [KnightPos]
moveKnight3 start = nub $ moveKnight start >>= moveKnight >>= moveKnight

canReachIn3 :: KnightPos -> KnightPos -> Bool
canReachIn3 start end = end `elem` moveKnight3 start
{-
>>> moveKnight (6, 2)
[(4,1),(5,4),(8,1),(4,3),(7,4),(8,3)]
>>> moveKnight (8, 1)
[(7,3),(6,2)]
>>> moveKnight3 (6, 2)
[(2,1),(1,2),(2,5),(5,2),(4,1),(1,4),(4,5),(5,4),(3,4),(4,3),(3,2),(7,2),(6,1),(6,5),(7,4),(8,1),(8,3),(2,3),(6,3),(3,8),(2,7),(5,8),(6,7),(8,5),(1,6),(4,7),(5,6),(7,8),(8,7),(3,6),(7,6)]
>>> (6,2) `canReachIn3` (6,1)
True
>>> (6,2) `canReachIn3` (7,3)
False
-}
```

### Monad Law

正如函子和应用函子等各种类型类，单子也有自己的定律需要遵守：
```haskell
return x >>= f = f x -- Left Identity
m >>= return = m -- Right Identity
(m >>= f) >>= g = m >>= (\x -> f x >>= g) -- Associativity
```
- 前两者描述的是`return`的行为，`return`将普通值转换为具有上下文的值，这两条非常重要。前者表示将一个值放到最小`Monad`上下文中再通过`>>=`传递给`f`不应该与直接调用`f`有任何差别。后者表示一个单子通过`>>=`应用于`return`应该就是自己。
- 最后的结合律则是说明当我们用`>>=`将一串monadic function串联起来，他们的先后顺序不应该有影响。

可以定义一个运算符来将两个Monadic functin复合起来：
```haskell
(<=<) :: Monad m => (a -> m b) -> (t -> m a) -> t -> m b
f <=< g = \x -> g x >>= f
```
- `g`是里层，`f`是外层，`<=<`由里层指向外层。
- `Control.Monad`中定义同样含义的运算符`>=>`，只不过参数是反过来的，注意区分：
```haskell
>>> :t (Control.Monad.>=>)
(Control.Monad.>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
```
- 使用`<=<`运算符来描述Moand Law：
```haskell
f <=< return = f
return <=< f = f
m >>= f >>= g = m >>= (f <=< g)
```

其实就很像普通函数的：
```haskell
f . id = f
id . f = f
(f . g) . h = f . (g . h)
```

## More Monad

已经详细介绍了`Maybe []`，而`IO`这个`Monad`其实前面已经说过了，不需要再赘述。我们需要了解更多的`Monad`以培养对`Monad`的直觉，直觉非常重要。

下面介绍的`Monad`都在包[`mtl`](https://github.com/haskell/mtl)中，这个包是GHC内置的(用`[stack exec] ghc-pkg list`查看已安装的包)，我的本地版本是`mtl-2.2.2`，模块名都是`Control.Monad.xxx`。这个包叫做The Monad Transformer Library，是一系列`Monad`类型类的集合。

### Writer

对比`Maybe`是可能失败的上下文，`[]`是加入不确定性语义的上下文，`Writer`则是加进了一个附加值的上下文，就像日志一样，`Writer`可以在计算的同时搜索log记录，汇集成一个最终的log附加到结果上。

模拟`Writer`：
- 考虑附加其上的信息不仅可以是字符串、列表，任何`Monoid`都可以。
- 将附有上下文的数据用`Monoid m => (a, m)`来表示，那么`>>=`的实现就类似于：
```haskell
-- implement a Writer-like >>= function
applylog :: Monoid m => (a, m) -> (a -> (b, m)) -> (b, m)
applylog (x, log) f = let (y, newLog) = f x in (y, log `mappend` newLog)
```
- 使用：
```haskell
type Food = String  
type Price = Sum Int  
addDrink :: Food -> (Food,Price)  
addDrink "beans" = ("milk", Sum 25)  
addDrink "jerky" = ("whiskey", Sum 99)  
addDrink _ = ("beer", Sum 30)
{-
>>> ("jerky", Sum 25) `applyLog` addDrink
("whiskey",Sum {getSum = 124})
>>> ("beef", Sum 5) `applyLog` addDrink
("beer",Sum {getSum = 35})
-}
```

`Writer`类型：
- `Control.Monad.Writer`模块，`Writer w`是`WriterT w Identity`的别名。
```haskell
type Writer :: * -> * -> *
type Writer w = WriterT w Identity :: * -> *
type WriterT :: * -> (* -> *) -> * -> *
newtype WriterT w m a = WriterT {runWriterT :: m (a, w)}
instance [safe] (Monoid w, Monad m) => Monad (WriterT w m)
```
- 等价定义就像是这样，基本就和`applyLog`一个意思：
```haskell
instance (Monoid w) => Monad (Writer w) where  
    return x = Writer (x, mempty)  
    (Writer (x,v)) >>= f = let (Writer (y, v')) = f x in Writer (y, v `mappend` v')
```
- `return`附加的信息是空值`mempty`，最小的上下文就是没有附加的信息。
- 类型`Writer w a`中，`w`是附加的信息的类型，是一个`Monoid`，`a`是其中的数据的类型。
- 文档：[Control.Monad.Writer.Lazy](https://www.stackage.org/haddock/lts-18.18/mtl-2.2.2/Control-Monad-Writer-Lazy.html)
- 方法：
```haskell
writer :: MonadWriter w m => (a, w) -> m a
runWriter :: Writer w a -> (a, w)
execWriter :: Writer w a -> w
mapWriter :: ((a, w) -> (b, w')) -> Writer w a -> Writer w' b
```
- `writer`生成一个函数。
- `runWriter`得到`(result, output)`形式输出。
- `execWriter`就等价于`execWriter m = snd (runWriter m)`，只取出其中累加的信息。
- `mapWriter`则使用函数将`(result, output)`两者都进行计算。
- `MonadWriter`是`WriterT`实现的类型类，具体信息查看文档。
```haskell
>>> writer (1, Sum 0) :: Writer (Sum Int) Int
WriterT (Identity (1,Sum {getSum = 0}))
>>> runWriter (return 0 :: Writer String Int)
(0,"")
>>> execWriter (writer (10, "hello") :: Writer String Int)
"hello"
>>> runWriter . mapWriter (\(a, Sum b) -> (show a, show b)) $ (writer (1, Sum 0))
("1","0")
```

使用：
- 可以通过`do`表示法来用，如果就是想在某个时间点放入一个Monoid值，那么可以使用`tell :: MonadWriter w m => w -> m ()`（可以看到返回一个包装空元组的Monad，可以通过`>>`或者`do`来用）：
```haskell
logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["Got a number: " ++ show x])

multWithLog :: Writer [String] Int 
multWithLog = do
    a <- logNumber 3
    b <- logNumber 5
    tell ["hello"]
    c <- logNumber 2
    return (a * b * c)
{-
>>> runWriter multWithLog
(30,["Got a number: 3","Got a number: 5","hello","Got a number: 2"])
-}
```
- 例子，计算最大公约数的同时记录计算过程：
```haskell
gcd' :: Int -> Int -> Writer [String] Int 
gcd' a b
    | b == 0 = do
        tell ["Finished with : " ++ show a]
        return a
    | otherwise = do
        tell [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)]
        gcd' b (a `mod` b)
{-
ghci> mapM_ putStrLn $ snd $ runWriter $ gcd' 98 51
98 mod 51 = 47
51 mod 47 = 4
47 mod 4 = 3
4 mod 3 = 1
3 mod 1 = 0
Finished with : 1
-}
```

使用Difference List：
- 注意其中`[]`的`++`运算符的效率，列表是从右往左递归定义的，所以`a ++ (b ++ (c ++ d))`会很高效，而`((a ++ b) ++ c) ++ d`则相对效率不够好。上面的`gcd'`没有这种问题，但这点是需要注意的，如果在递归中先计算`gcd'`再`tell`则会有效率问题。
- 为了能够总是在列表的`++`操作上得到最好的效率，可以定义一个新的类型差异列表，将列表包装一下，实现无论怎么附加列表都是`(a ++ b) ++ c) ++ d`的效果。
- 类型定义：
```haskell
newtype DiffList a = DiffList {getDiffList :: [a] -> [a]}

toDiffList :: [a] -> DiffList a
toDiffList xs = DiffList (xs++)

fromDiffList :: DiffList a -> [a]
fromDiffList (DiffList f) = f []
```
- 将列表`xs`转换为`xs++`函数包装在`DiffList`中，通过传入`[]`就可以得到内部的原始列表，通过定义新函数来实现转换而不是使用模式匹配。
- 将其定义为`Monoid`:
```haskell
-- declare DiffList as a Monoid
instance Semigroup (DiffList a) where
    DiffList f <> DiffList g = DiffList (f . g)

instance Monoid (DiffList a) where
    mempty = DiffList ([]++)
    DiffList f `mappend` DiffList g = DiffList (f . g)
```
- `Monoid`派生自`Semigourp`，实现`Monoid`同时需要实现`Semigourp`，可以看到`DiffList`的`mempty`是附加一个空列表的函数，而`mappend`是函数组合。每次`mappend`，新的列表都会通过函数函数组合调用的方式附加到列表最前面，不会有从前往后附加这种情况出现。
- 效率测试：
```haskell
-- test performance of DiffList
finalCountDown :: Int -> Writer (DiffList String) ()
finalCountDown 0 = do
    tell (toDiffList ["0"])
finalCountDown x = do
    finalCountDown (x-1)
    tell (toDiffList [show x])

finalCountDown2 :: Int -> Writer [String] ()
finalCountDown2 0 = do
    tell ["0"]
finalCountDown2 x = do
    finalCountDown2 (x-1)
    tell [show x]

test1 :: IO ()
test1 = mapM_ putStrLn . fromDiffList . snd . runWriter $ finalCountDown 50000
test2 :: IO ()
test2 = mapM_ putStrLn . snd . runWriter $ finalCountDown2 50000

main :: IO ()
main = test1
-- main = test2
```
- 这里从一个数计数直到`0`，`Writer`值保存为`()`不关心，附加的信息使用`[]`或者`DiffList`的`mappend`来做。最终得到的`Writer`是`0-x`字符串的列表。
- 执行`test1 test2`，参数`50000`时能够感受到非常明显的性能差距。其实直观理解上来说就是$O(N)$和$O(N^2)$时间复杂度的差别。
- 做到这一点依赖于Haskell的懒惰求值的特性，函数的调用只是数据的变换过程，真正需要数据时才会计算。因为`finalCountDown`是将数组累加变成了函数的组合，没有实际地进行计算，计算过程中`DiffList`中的信息是类似于这样的：`["50000"]++["49999"]++ ... ++["xxxx"]++`，是一个函数。将数据的叠加变成了函数的组合，从而改变了最终运算符的结合顺序
- **设计要点：将数据以函数形式存储并包装起来，将`Monoid`的`mappend`则实现为函数的组合，改变运算符的结合顺序**。
- 当然底层涉及到函数式编程数据结构的设计，这和命令式编程的数据结构设计是存在差别的，这需要进一步了解，在入门Hakell之后如果有需求的话。

### Reader Monad

函数`(->) r`除了是函子和应用函子，同样也是一个`Moand`，实现：
```haskell
instance Monad ((->) r) where
    return x = \_ -> x
    h >>= f = \w -> f (h w) w
```
- 其中`return`的定义同`pure`，最小的函数上下文就是接受一个参数，直接返回`x`。
- 看`>>=`类型签名：
```haskell
(>>=) :: Monad m => m a -> (a -> m b) -> m b
```
- 将`(->) r`也就是`r ->`带入到`m`，得到`(->) r`实例的`>>=`函数签名：
```haskell
(>>=) :: (r -> a) -> (a -> r -> b) -> r -> b
```
- 定义中`h :: r -> a`，`f :: a -> r -> b`。定义很像`Applicative`的`<*>`。
- 最终得到一个函数，接受`r`类型参数，传给函数`h`后得到`a`类型结果，作为`f`第一个参数，`r`类型参数同时作为`f`第二个参数，得到最终`b`类型返回值。

例子：
```haskell
addStuff :: Int -> Int
addStuff = do
    a <- (*2)
    b <- (+10)
    return (a + b)

addStuff' :: Int -> Int
addStuff' x = let
    a = (*2) x
    b = (+10) x
    in a + b
{-
>>> addStuff 3
19
>>> addStuff' 3
19
-}
```
- `addStuff`中所有的函数都固定从一个地方取值，所以function monad又被称作**reader monad**。

总结：
- 函数作为单子的含义是将所有的函数粘在一起做成一个大的函数，把这个大的函数的参数喂给全部组成的函数。
- 通常使用`do`来实现，`>>=`会保证一切能够正常工作。

说实话不是非常理解。

### State Monad

Haskell是纯函数式语言，除去有副作用的部分比如IO，程序是由一堆无法改变全局状态或变量的纯函数组成。能做的事情只有处理并返回结果，这个性质使得我们很容易思考程序在干什么，不需要关心变量在某一时间点的值是什么。

然而某些领域的问题根本上就是随着时间改变的状态，要写出这样的程序，纯函数的特性就变成了阻碍。因此引入了State Monad，让程序能够处理状态性的问题，并让其他部分依然保持纯粹。

考虑随机数：生成随机数需要一个有副作用的随机数生成器，并返回新的随机数生成器，但随机数生成的过程是纯粹的。所以需要将会发生改变的状态传入，并将新的状态作为返回值返回。而在其他命令式语言中的话，一般会将妆台作为全局的状态，在生成随机数的同时改变状态，而不是将状态返回。
```haskell
let (value, _) = random (mkStdGen 100) in value :: Int
```

一般来说，这种函数的签名都会类似这样：
```haskell
s -> (a, s)
```
- `s`是状态类型，`a`是计算结果类型。
- 为了保持纯粹性，状态必须被作为参数和返回值。这样写非常不方便，可以将这些事情扔给State Monad来做。

例子：
- 考虑建立一个栈的模型，支持压栈和出栈操作，压栈时传入新值和栈，得到新的栈，出栈时传入栈得到新栈。
- 其中的栈就可以看做状态，通过返回值的方式返回新的状态：
```haskell
type Stack a = [a]

pop :: Stack a -> (a, Stack a)
pop [] = undefined
pop (x:xs) = (x, xs)

push :: a -> Stack a -> ((), Stack a)
push a xs = ((), a:xs)

stackMainOp :: Num a => Stack a -> (a, Stack a)
stackMainOp stack = let
    ((), newStack1) = push 3 stack
    (a, newStack2) = pop newStack1
    in pop newStack2
{-
>>> stackMainOp [1, 2, 3]
(1,[2,3])
-}
```
- 为了避免将状态操作写得这么具体，我们可以将状态封装在State Monad中，之后便可以像这样的方式调用：
```haskell
stackMainOp' = do
    push 3
    a <- pop
    pop
```

State Monad：
- 位于`Control.Monad.State`模块，具体来说`Control.Monad.State.Lazy`。
```haskell
type State :: * -> * -> *
type State s = StateT s Identity :: * -> *
type StateT :: * -> (* -> *) -> * -> *
newtype StateT s m a = StateT {runStateT :: s -> m (a, s)}

state :: MonadState s m => (s -> (a, s)) -> m a
runState :: State s a -> s -> (a, s)
(>>=) :: State s a -> (a -> State s b) -> State s b
```
- 更多信息查看[Wiki](https://wiki.haskell.org/State_Monad)。
- 类型`State s a`代表改变状态的操作，`s`是状态类型，`a`是产生的结果类型，`State s`被实现为`Monad`。
- `Monad`实例的实现类似于：
```haskell
instance Monad (State s) where
    return x = State $ \s -> (x,s)  
    (State h) >>= f = State $ \s -> let (a, newState) = h s
                                        (State g) = f a
                                    in  g newState
```
- 注意`State`作为类型构造器，接受2个类型参数，`s a`分别是状态和结果类型，而作为值构造器接受一个`s -> (a, s)`的函数类型参数，即是改变状态的操作。书上是这样写的，但注意现在的版本实现有了变化，就像`Writer`一样，应该使用`state`函数来构造`State`对象，而不是`State`直接作为值构造器。
- `return`要做的事是接受一个值，返回做出一个改变状态的操作，所以此时值构造器接受参数就是`\s -> (x, s)`函数，`x`当成结果，状态仍然是`s`。这即是最小上下文。
- `State`中封装的改变状态的操作，接受改变状态操作`h`，`f`则是接受状态操作返回`State Monad`的函数。`>>=`实现则是，先做操作`h`，再将结果做操作`f`。说实话不是很好理解。
- 运行一个`State`则使用，`runState myState initial_state`。
- 改写栈做为状态的例子：
```haskell
pop' :: State (Stack a) a
pop' = state $ \(x:xs) -> (x, xs)

push' :: a -> State (Stack a) ()
push' a = state $ \xs -> ((), a:xs)

stackMainOp' :: State (Stack Int) Int
stackMainOp' = do
    push' 3
    pop'
    pop'

{-
>>> runState stackMainOp' [1, 2, 3]
(1,[2,3])
>>> runState (push' 10 >> push' 100 >> pop') [1, 2, 3]
(100,[10,1,2,3])
-}
```
- 有一点点费解，因为`Monad`中函数，`>>=`其实是在对`Monad (State s)`中的函数做解开包装之后，将其应用在另一个接受函数返回使用`Monad (State s)`封装函数的函数上。简而言之就是对函数做映射，可以理解为将两个改变状态的行为合在了一起。
- 单纯的`>>`则可以直接将多个`State s a`合并起来，前提是后面的状态不会使用前面状态的返回值。等价在`do`中则就是不使用`<-`。当然有依赖的话用`do`表示法是最好的：
```haskell
stackComplexOp :: State (Stack Int) ()
stackComplexOp = do
    a <- pop'
    if a >= 10 then do
        push' 100
    else do
        push' 1000
{-
>>> runState stackComplexOp [1, 2, 10]
((),[1000,2,10])
>>> runState stackComplexOp [10, 1, 2]
((),[100,1,2])
-}
```

总结：
- 封装函数的行为还是有点太让人费解了，暂时尚无法熟练运用，需要后续有机会结合实践加深理解。注意和函数作为`Monad`相区分，这完全不是一个东西。和`DiffList`这样以函数形式封装数据也不一样（和单纯封装数据差别不大）。
- 写代码时对比`IO`就行，用`do`表示法的话非常符合直觉，用起来并不难。


### 常用的操作Monad的函数

操作包装在单子中的值（Monadic value）的函数，称之为Monadic Function，有一些是常见函数的变形，有一些是第一次遇到。

`liftM`：
```haskell
liftM :: Monad m => (a1 -> r) -> m a1 -> m r
fmap :: Functor f => (a -> b) -> f a -> f b
```
- 其实就是`fmap`，不过是针对`Monad`单独定义的，即使每一个`Monad`都是`functor`，但我们不需要依赖这一点。就像`pure`和`return`其实是同一件事，不过一个在`Applicative`中，一个在`Monad`中。
- 例：
```haskell
>>> liftM (*2) (Just 10)
Just 20
>>> liftM (*2) [1, 2, 3]
[2,4,6]
>>> :t liftM not
liftM not :: Monad m => m Bool -> m Bool
>>> runWriter $ liftM not $ writer (True, "whatever")
(False,"whatever")
```
- 除了`fmap`含义，另一种含义就是将直接用于值的函数提升为能够用于`Monad`的函数。
- 也就是说`fmap <$> liftM`其实是一个意思。
- 看一下实现：
```haskell
liftM :: (Monad m) => (a -> b) -> m a -> m b  
liftM f m = m >>= (\x -> return (f x))
```
- 用等价的`do`表示法：
```haskell
liftM :: (Monad m) => (a -> b) -> m a -> m b  
liftM f m = do
    x <- m
    return (f x)
```
- 实现只用到了`Monad`而并没有用到`Functor`的性质。可以看出`Monad`比`Functor`性质要强。
- 回顾`<*>`的类型签名：
```haskell
(<*>) :: Applicative f => f (a -> b) -> f a -> f b
```
- 其实`<*>`也能够用`Monad`保证的性质实现出来：
```haskell
apply :: Monad m => m (a -> b) -> m a -> m b
apply mf m = do
    f <- mf
    x <- m
    return (f x)
{-
>>> Just (*3) `apply` Just 5
Just 15
-}
```
- 对于`liftA2`等函数，也可以类似实现：
```haskell
liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
liftA2 f x y = f <$> x <*> y
```
- 对于`Monad`有类似的函数，`liftM2 liftM3 liftM4 ...`等。

`join`:
- 如果有包了多层`Monad`的值，那么可以使用`join`函数来解开包装。
```haskell
join :: Monad m => m (m a) -> m a
```
- 例子：
```haskell
>>> join (Just (Just 1))
Just 1
>>> join . join $ (Just (Just (Just 1)))
Just 1
>>> join $ Just Nothing
Nothing
>>> join [[1, 2, 3], [4, 5, 6]]
[1,2,3,4,5,6]
>>> runWriter $ join (writer (writer (1, "aaa"), "bbb"))
(1,"bbbaaa")
>>> join (Right (Right 1))
Right 1
>>> join (Right (Left "error"))
Left "error"
```
- 对于列表其实就是`concat`，对于`Monoid`会调用`mappend`。
- `m >>= f`永远等价于`join (fmap f m)`。

`filterM`：
```haskell
filterM :: Applicative m => (a -> m Bool) -> [a] -> m [a]
```
- 对比`filter`，只是将函数编程了返回Monadic Value，然后相应的返回值也变了。
```haskell
>>> filterM (\a -> Just (a > 0)) $ [-10..0] ++ [0..10]
Just [1,2,3,4,5,6,7,8,9,10]
>>> filterM (\a -> [True, False]) [1, 2, 3]
[[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
```
- 使用返回绝对不仅仅只是筛选这么简单，比如配合列表的不确定性得到一个列表的幂集。配合`Writer`可以在筛选同时写信息进去等，结合上下文的含义会让功能变得很强大。

`foldM`：
- `foldl`对`Monad`的版本是`foldM`：
```haskell
foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
foldM :: (Foldable t, Monad m) => (b -> a -> m b) -> b -> t a -> m b
```
- 例子：
```haskell
>>> foldM (\a b -> Just (max a b)) 10 [1, 2, 3]
Just 10
```

## Zippers

### 定义一个树

尝试定义一个二叉树类型，因为数据不可变，要修改只能使用模式匹配：
```haskell
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

freeTree :: Tree Char  
freeTree =   
    Node 'P'  
        (Node 'O'  
             (Node 'L'  
              (Node 'N' Empty Empty)  
              (Node 'T' Empty Empty)  
             )  
             (Node 'Y'  
              (Node 'S' Empty Empty)  
              (Node 'A' Empty Empty)  
             )  
        )  
        (Node 'L'  
             (Node 'W'  
                  (Node 'C' Empty Empty)  
                  (Node 'R' Empty Empty)  
             )  
             (Node 'A'  
                  (Node 'A' Empty Empty)  
                  (Node 'C' Empty Empty)  
             )
        )

data Direction = L | R deriving (Eq, Show)
type Directions = [Direction]

changeToP :: Directions -> Tree Char -> Tree Char
changeToP (L:ds) (Node x l r) = Node x (changeToP ds l) r
changeToP (R:ds) (Node x l r) = Node x l (changeToP ds r)
changeToP [] (Node _ l r) = Node 'P' l r
changeToP _ Empty = Empty

{-
>>> changeToP [R, L] freeTree
Node 'P' (Node 'O' (Node 'L' (Node 'N' Empty Empty) (Node 'T' Empty Empty)) (Node 'Y' (Node 'S' Empty Empty) (Node 'A' Empty Empty))) (Node 'L' (Node 'P' (Node 'C' Empty Empty) (Node 'R' Empty Empty)) (Node 'A' (Node 'A' Empty Empty) (Node 'C' Empty Empty)))
-}
```
- 可以将要修改的节点的路径作为一个数组传入，方便在树上游走。

### Zipper

但是这样非常不方便，我们希望在游走的同时保留能够重建一颗树所需要的所有信息以满足修改某个节点删除某个子树等需求。举个例子，游走到左节点，就可以将树的根节点值和右子树保存起来，单独定义一个类型`TreePath`来保留这两个信息，和左子树的二元组就构成了这棵树的完整信息。
```haskell
-- save a path of walking through a tree, LeftPath/RightPath rootValue subTreeOfTheOtherSide
data TreePath a = LeftPath a (Tree a) | RightPath a (Tree a) deriving(Show)
type TreePaths a = [TreePath a]

goLeft :: (Tree a, TreePaths a) -> (Tree a, TreePaths a)
goLeft (Node x l r, tzs) = (l, LeftPath x r:tzs)
goLeft (Empty, tzs) = error "go to left of empty tree"

goRight :: (Tree a, TreePaths a) -> (Tree a, TreePaths a)
goRight (Node x l r, tzs) = (r, RightPath x l:tzs)
goRight (Empty, tzs) = error "go to right of empty tree"

goUp :: (Tree a, TreePaths a) -> (Tree a, TreePaths a)
goUp (t, LeftPath x r:tzs) = (Node x t r, tzs)
goUp (t, RightPath x l:tzs) = (Node x l t, tzs)
goUp (t, []) = error "go to up of root node"

infixl 5 -:
(-:) :: t1 -> (t1 -> t2) -> t2
x -: f = f x

{- 
>>> fst $ goLeft (goRight (freeTree, []))
Node 'W' (Node 'C' Empty Empty) (Node 'R' Empty Empty)
>>> fst $ (freeTree, []) -: goLeft -: goRight -: goLeft
Node 'S' Empty Empty
-}

```

这样的二元组就称之为`Zipper`，就像拉链一样，将其定义为类型别名，作为函数的输入和输出就可以方便的修改一棵树：
```haskell
-- type synonym
type TreeZipper a = (Tree a, TreePaths a)

-- modify value of a node
modify :: (a -> a) -> TreeZipper a -> TreeZipper a
modify f (Node x l r, tps) = (Node (f x) l r, tps)
modify f (Empty, tps) = (Empty, tps)

-- replace a subtree
attach :: Tree a -> TreeZipper a -> TreeZipper a
attach t (_, tps) = (t, tps)

-- go to root of a tree
goRoot :: TreeZipper a -> TreeZipper a
goRoot (t, []) = (t, [])
goRoot (t, tps) = goRoot $ goUp (t, tps)

{-
>>> let (newTree, zipper) = (freeTree, []) -: goRight -: goLeft -: modify (\_ -> 'P')
>>> newTree
Node 'P' (Node 'C' Empty Empty) (Node 'R' Empty Empty)
>>> fst $ (newTree, zipper) -: goUp -: attach (Node '&' Empty Empty) -: goRoot
Node 'P' (Node 'O' (Node 'L' (Node 'N' Empty Empty) (Node 'T' Empty Empty)) (Node 'Y' (Node 'S' Empty Empty) (Node 'A' Empty Empty))) (Node '&' Empty Empty)
-}
```

虽然数据不可变，但通过`Zipper`，其实基本上所有的事情都可以做了。

### Zipper of List

`Zipper`几乎可以套用在任何数据结构，其实思想很简单，就是将一个数据结构拆开，边界位于关心的位置，要增加删除或者修改都可以方便地做，然后也可以方便的合并起来得到最终的结果。操作前后的对象类型就是`Zipper`。

比如列表：
```haskell
-- zipper of list, (rightSideOfList, reversedLeftSideOfList)
type ListZipper a = ([a], [a])

-- index from low to high
goForward :: ListZipper a -> ListZipper a
goForward (x:xs, ys) = (xs, x:ys)
goForward ([], ys) = error "go forward of empty list"

-- index from high to low
goBack :: ListZipper a -> ListZipper a
goBack (xs, x:ys) = (x:xs, ys)
goBack (xs, []) = error "go back of full list"
{-
>>> goForward . goForward . goForward $ ([1, 2, 3, 4], [])
([4],[3,2,1])
>>> goBack ([4],[3,2,1])
([3,4],[2,1])
-}
```

更多应用：
- 利用`Zipper`和树类型可以实现文件系统。
- 对于可能失败的情况可以将数据用`Maybe`上下文包装，并将`-:`运算符换成`>>=`。


## 总结

总结：
- 到此Haskell趣学指南就结束了，也算基本入门了Haskell了？但其实一开始的那句话单子是自函子范畴上的幺半群其实并没有理解，并不涉及到范畴论的内容。对于函子、应用函子、单子的理解仅限于实践层面，对应的范畴论还没有学习。
- 另外这本书确实一点都不Real World，其中的内容仅算是介绍，真实世界的Haskell编程其实基本可以说没有任何了解。

下一步方向：
- 刷完[Haskell 99 Problem](https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems)，这只是习题水平，还是远远不足以指导实践。
- 看[Typeclassopedia](https://wiki.haskell.org/Typeclassopedia)，搞清楚所有常用内建类型类，建立起直觉。
- 看[Real World Haskell](http://cnhaskell.com/index.html)。
- 学习范畴论。
- 暂时可以放一放，有空有兴趣了来做。