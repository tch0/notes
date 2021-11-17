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

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Haskell语言入门

提示：本文含有公式，可安装[MathJax Plugin for Github](https://github.com/orsharir/github-mathjax)浏览器插件提供公式渲染，或者Clone到本地查看。

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
- 入门至少要了解一定的范畴论概念，理解函子、应用函子、单子等概念。
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
- [Learn You a Haskell for Great Good](https://www.bookstack.cn/read/learnyouahaskell-zh-cn/README.md) 目前在看，本文的主要参考，台湾人翻译的某些名词会有一些差异，比如实现称为实作、类型称为型别、参数称为引数、随机数称为乱数等，需要留意，不是很影响阅读。
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
- 如果最终会发布的话包的名称就是这个`PACKAGE_NAME`，由字母数组和连字符组成。

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
- 如果项目更加复杂，就需要指定想要加载哪一个组件，一个组件简单将就是stack中的一个库、一个可执行文件、或者一个测试套件、或者benchmark。可以使用命令查看所有组件或者叫目标，至于目标的语法可以参见[stack文档-Traget Syntax](stack ide targets)。
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
- `map :: (a -> b) -> [a] -> [b]` 映射一个数组到另一个数组。
- `filter :: (a -> Bool) -> [a] -> [a]` 筛选符合条件的元素到结果数组。
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
- `partition :: (a -> Bool) -> [a] -> ([a], [a])` 按条件分为满足和不满足的元素构成数组的元组。搜索整个数组，区别于`span break`。
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
- `insert :: Ord a => a -> [a] -> [a]` 插入元素到可排序数组的首个大于等于它的元素前，如果原先是升序排列的，那么插入后仍是。
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
- `on`就相当于对两个自变量的函数做一个复合：$(f\circ g)(x, y) = f(g(x), g(y))$。比如``compare `on` length``用于按照数组长度比较，``(==) `on` (>0)``用于按照是否同为正数判等，非常地灵活。
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
- 再从`YesNo`派生新类型类`EmptyOrNot`，仅针对数组或者`Maybe`类型，演示一下`class isntance`声明中的类型约束、使用类型类默认实现等情况。
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

`System.Random`模块中提供了这样的函数：`System.Random.random :: (Random a, RandomGen g) => g -> (a, g)`。

再谈开发环境：
- 首先需要安装`System.Random`模块。