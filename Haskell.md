<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Haskell语言入门](#haskell%E8%AF%AD%E8%A8%80%E5%85%A5%E9%97%A8)
  - [关于Haskell](#%E5%85%B3%E4%BA%8Ehaskell)
  - [Haskell与函数式编程](#haskell%E4%B8%8E%E5%87%BD%E6%95%B0%E5%BC%8F%E7%BC%96%E7%A8%8B)
  - [环境搭建](#%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA)
    - [使用GHCup](#%E4%BD%BF%E7%94%A8ghcup)
    - [安装stack](#%E5%AE%89%E8%A3%85stack)
    - [使用stack安装GHC](#%E4%BD%BF%E7%94%A8stack%E5%AE%89%E8%A3%85ghc)
    - [关于Cabal和stack](#%E5%85%B3%E4%BA%8Ecabal%E5%92%8Cstack)
    - [开发环境](#%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83)
    - [编译与测试](#%E7%BC%96%E8%AF%91%E4%B8%8E%E6%B5%8B%E8%AF%95)
  - [感受一下Haskell](#%E6%84%9F%E5%8F%97%E4%B8%80%E4%B8%8Bhaskell)
  - [基本要素](#%E5%9F%BA%E6%9C%AC%E8%A6%81%E7%B4%A0)
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

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Haskell语言入门

提示：本文含有公式，可安装[MathJax Plugin for Github](https://github.com/orsharir/github-mathjax)浏览器插件提供公式渲染，或者Clone到本地查看。

## 关于Haskell

关于Haskell：
>[Haskell](https://zh.wikipedia.org/wiki/Haskell)（发音为/ˈhæskəl/）是一种标准化的，通用的纯函数式编程语言，有惰性求值和强静态类型。它的命名源自美国逻辑学家哈斯凯尔·加里，他在数理逻辑方面上的工作使得函数式编程语言有了广泛的基础。在Haskell中，“函数是第一类对象”。作为一门函数编程语言，主要控制结构是函数。Haskell语言是1990年在编程语言Miranda的基础上标准化的，并且以λ演算为基础发展而来。这也是为什么Haskell语言以希腊字母“λ”（Lambda）作为自己的标志。Haskell具有“证明即程序、命题为类型”的特征

首先需要明确的是：
- Haskell是一门纯函数式编程语言，学习曲线非常陡峭，收获同样会很丰富。
- 不要在没有任何编程基础的情况下学习Haskell，至少先学习一些过程式和支持函数式编程的语言，有一定数据结构和算法基础。
- Haskell非常注重理论，范畴论是支持函数式编程的理论基础之一，作为一门数学分支理论，学习Haskell将会深入范畴论的内容，也就是说不可避免地需要了解很多数学概念和定理，将会时刻与抽象作伴。
- 不要期待几天几个月就学懂并深入Haskell，这将会是一条艰涩的道路。
- 不要期待通过一本书或者一门课程就学到Haskell的全部，从不同的教程和书籍不同的视角思考是必要的。
- 相教传统的命令式编程而言，需要换一种方式来思考，否则永远学不会Haskell。
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
- [Learn You a Haskell for Great Good](https://www.bookstack.cn/read/learnyouahaskell-zh-cn/README.md) 目前在看。
- [Real World Haskell](http://cnhaskell.com/index.html)
- [Haskell 2010 Report](https://www.haskell.org/definition/haskell2010.pdf) 没有什么比标准更准确，进阶的话必须要看，还没有到这一步。

语言相关链接：
- [haskell主页](https://www.haskell.org/)，[Wiki](https://wiki.haskell.org/Haskell)。
- [GHC文档](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/index.html)。
- [stack文档](https://docs.haskellstack.org/en/stable/README/)。
- [Stackage首页](https://www.stackage.org/)
- [Hackage首页](https://hackage.haskell.org/)


课外阅读：
- [一个很全面的Haskell笔记](https://blog.tonycrane.cc/p/b3ca5c18.html)

## Haskell与函数式编程

函数式（functional languages）与命令式（imperative languages）：
- 不同于命令式编程语言，程序是描述要怎么做，要做什么，函数式编程需要通过函数描述出问题**是什么**，比如「阶乘就是只从1到某个数的乘积」，而命令式编程语言则会用程序描述出阶乘的计算过程：定义结果的初值为1，然后从1一直累乘到某个数的计算过程。
- 在函数式编程语言中，变量一旦指定就不可以更改了，在命令式编程语言中，变量表示状态，如果状态不可变，那么能做的事情将非常有限。而函数式编程语言中，变量的含义更接近数学中的变量，`x=5`表示`x`就是`5`，而不是`x`处于`5`这个状态。
- 所以在纯粹的函数式编程语言中，函数唯一能做的事情就是利用引数计算结果，不会产生副作用（side effect），副作用的含义是改变非函数内部的状态，这在命令式编程中是非常常见的。在函数式编程语言中，若以同样的参数调用一个函数两次，结果必定相同，也就是说函数都是**可重入**的。在命令式编程语言中，则需要函数实现时进行非常严格的限定才能做到。没有副作用的函数实现对于并发非常有用，因为没有副作用，并行执行的正确性就能够得到保证。

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

### 使用GHCup
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
- 倒腾了半天网络等各种原因，Linux上和Windows上都没有安装成功。好像可以换源解决，参考[这里](https://zh.z.haskell.world/guide)。

### 安装stack
- 使用stack安装，[视频教程](https://www.youtube.com/watch?v=sRonIB8ZStw)，[一个在Windows上安装stack的教程](https://krantz-xrf.github.io/2020/09/25/windows-install-stack-ghc.html)。
- [stack](https://github.com/commercialhaskell/stack)是一个跨平台的Haskell项目管理、环境管理工具。
- [stack文档](https://docs.haskellstack.org/en/stable/README/)。
- 特性：
    - 安装GHC到一个独立位置。
    - 安装项目需要的包。
    - 构建、测试项目。
    - 为项目做Benchmark。
- 安装：
- Linux：
```shell
curl -sSL https://get.haskellstack.org/ | sh
```
- Windows中：下载[Windows 64-bit Installer.](https://get.haskellstack.org/stable/windows-x86_64-installer.exe)。默认会添加用户path环境变量，并设置了用户环境变量`STACK_ROOT=C:\sr`表示使用stack安装程序的位置。由于Windows下默认由260字节的路径长度限制，且stack管理的文件通常具有较深的目录层次，所以这里的目录名很短，也可以设置为其他盘或者其他路径。
- 升级stack：
```shell
stack upgrade
```
- [更换stack的源为清华源](https://mirrors.tuna.tsinghua.edu.cn/help/stackage/)，注意其中给出的配置文件目录为`%APPDATA%\stack\config.yaml`，但由于我们修改了`%STACK_ROOT%`，需要修改的配置文件其实在`%STACK_ROOT%\config.yaml`。

### 使用stack安装GHC
- 到[Stackage](https://www.stackage.org/)找到最新的LTS版本，目前是18.15，然后安装GHC，[文档](https://docs.haskellstack.org/en/stable/GUIDE/#resolvers-and-changing-your-compiler-version)。
```shell
stack --resolver lts-18.15 setup
```
- 如果要安装最新的Nigthly版本，直接`--resolver lts`则使用最新的LTS版本。
```shell
stack --resolver nigthly setup
```
- 故障排除：
```
C:\Users\tch>stack --resolver lts-18.15 setup
Warning: http://mirrors.tuna.tsinghua.edu.cn/stackage/stack-setup.yaml: Unrecognized field in GHCDownloadInfo: version
Preparing to install GHC to an isolated location.
This will not interfere with any system-level installation.
Already downloaded.
Preparing to download 7z.dll ...
Download expectation failure: HttpExceptionRequest Request {
  host                 = "github.com"
  port                 = 443
  secure               = True
  requestHeaders       = [("User-Agent","The Haskell Stack")]
  path                 = "/fpco/minghc/blob/master/bin/7z.dll"
  queryString          = "?raw=true"
  method               = "GET"
  proxy                = Nothing
  rawBody              = False
  redirectCount        = 10
  responseTimeout      = ResponseTimeoutDefault
  requestVersion       = HTTP/1.1
}
 (InternalException Network.Socket.recvBuf: invalid argument (Invalid argument))
```
- 显示无法下载7z.dll，stack安装GHC的方法是下载一个`.tar.xz`压缩包，并使用下载的`7z.exe`和`7z.dll`来解压文件，最后创建用于标记GHC安装成功的`ghc-X.X.X.installed`文件。并且后续也无法下载`msys2-20210604-x86_64.tar.xz`，原因是[镜像源中配置文件](http://mirrors.tuna.tsinghua.edu.cn/stackage/stack-setup.yaml)中链接存在问题。已经提了[Issue](https://github.com/tuna/issues/issues/1379)，不知道什么时候能解决，解决之后可能就没有这个问题了。
- **绕过方法**：由于失败时完成了`.tar.xz`的步骤，可以直接使用`7z.exe`来解压，可以找到下载临时目录，本地是`C:\Users\user\AppData\Local\Programs\stack\x86_64-windows\`，所有下载文件都在这个目录，安装成功后会生成`.installed`文件，内容是`installed`。只需要手动下载`msys2-20210604-x86_64.tar.xz`提取到当前目录。
```
echo installed>ghc-8.10.7.installed
```
- 前面的GHC同理：具体版本可能需要变更。
```
echo installed>msys2-20210604.installed
```
- 下载路径就是最终的安装路径。
- GHC版本：
```shell
stack exec -- ghc --version
```
- 进入交互式执行环境：
```shell
stack exec -- ghci
```
- 离开交互式环境：`:q`。
- 如果希望直接`ghci ghc`命令启动编译器，可以将其路径添加到path。
- 到这里GHC就安装成功了，和我们手动从GHC的网站上下载解压配置其实是一样的，不过下载用stack来管理了。
- stack可以管理多个版本的GHC，为了避免冲突，使用命令行来选择版本：`stack --compiler ghc-8.8.4 exec ghci`。
- 搞了一个下午才解决环境问题。
- 更多使用需要查看stack文档。

### 关于Cabal和stack
- cabal是另一个包管理和项目工具，和stack有区别有联系，cabal的包管理库是Hackage，stack是Stackage，Stackage官网介绍Stackage是Hackage的子集的分发。
- 都可以管理包，都可以管理项目，好像还可以实现同一个项目兼容两个工具。但stack好像是为了解决cabal的某些痛点，具体还未研究那么深。暂时不安装cabal，只使用stack就行了。


### 开发环境
- VS Code安装Haskell扩展，新建文件`hello.hs`：
```haskell
main = print "hello,world"
```
- 编译执行：
```shell
ghc hello.hs
hello
```
- 打开控制台：
```shell
ghci
```
- 加载`hello.hs`文件。
```
Prelude> :l hello.hs
[1 of 1] Compiling Main             ( hello.hs, interpreted )
Ok, one module loaded.
*Main> main
"hello,world"
```
- 正常工作流程大概会是创建修改`hs`文件，ghci中重新加载，执行。

- 更改GHCI的提示符：
```shell
:set prompt "ghci> "
```
- 仅执行haskell脚本不编译：
```shell
runhaskell hello.hs
```
- 安装Haskell插件后将会自动下载对应版本的Haskell Language Server，也可以在插件设置中语言服务器的路径（只有一个全局设置，无法为项目设置）。启用插件将会自动开始Haskell Language Server子进程，将会吃掉将近1个G内存，提供补全、求值、类型推断等服务。

### 编译与测试

仅仅学习语法的话，如果每次测试都将结果打印出来，会非常冗余，利用VsCode插件和语言服务器提供的功能，可以在注释中进行测试：
```haskell
{-
>>> 1 + 1
2
-}
```
- `{--}`注释中在`>>>`后输入需要测试的表达式，语言服务器会自动求值并将结果填写在注释中，既能保留下测试结果，又不影响主体逻辑，和在`ghci`中运行是一个道理，修改了代码刷新一下便会立即得出测试结果。这样就不需要再写很多冗余的简单测试打印代码了，也不必在每个`.hs`中都定义`main`，如果是单文件编译，和C一样不定义`main`是链接不过的。

更多用法尚待挖掘。

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

Typeclass定义类型的行为，如果某一个类型属于某一个Typeclass，那么它必然实现了该Typeclass描述的方法。就类似于其他语言中纯虚类或者接口（类）的作用。
```
Prelude> :t (==)
(==) :: Eq a => a -> a -> Bool
Prelude> :t elem
elem :: (Foldable t, Eq a) => a -> t a -> Bool
```
- 其中的`Eq`就是一种`Typeclass`。
- 这里有一个符号`=>`，其左边的东西叫类型约束，这段类型声明可以看做两段，`=>`后的部分是类型，前的部分约束了类型变量的可能类型。
- 参数和返回值的类型如果是类型类（也就是约束），那么应该放在`=>`前并用类型变量指代，如果是具体类型，应该放在`=>`后。
- 多个类型约束放在括号中，用`,`分隔，就像一个Tuple，有可能含义上真就是一个Tuple。
- 常见Typeclass：
    - `Eq`是可判断相等性的类型。提供`== /=`函数，除函数以外所有类型都有这个Typeclass。
    - `Ord`是可比较大小的类型，提供`< > <= >=`之类用于比较大小的函数。
    - `compare`函数用于两个同类`Ord`的比较，类型是`Ord a => a -> a -> Ordering`，结果是以下三个类型之一：`GT LT EQ`。
    ```
    Prelude> 5 `compare` 3
    GT
    ```
    - `Show`是成员可用字符串表示的类型。常用函数是`show`，将类型转换为`[Char]/String`。
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
    - `Read`是`Show`相反的类型，`read`将一个字符串转换为`Read`的成员类型。作用可能就类似于在代码中这样写差不多。
    ```
    >>> :t read
    read :: Read a => String -> a
    >>> read "1.2" + 3.2
    4.4
    >>> read "1"
    Prelude.read: no parse
    ```
    - 单纯的`read`返回一个`Read`，无法区分具体类型，可以在调用时后面加上`::`类型注释，以明确类型。
    ```
    >>> read "1.0" :: Double
    1.0
    >>> read "(1.0, \"hello\", 10)" :: (Double, [Char], Int)
    (1.0,"hello",10)
    ```
    - `Enum`的类型成员都是可枚举类型，`Enum`的类型可以用于`Range`中。每个值都有后继（successer）和前置（predecesor），可分别通过`suc`和`pred`得到。包含类型有：`() Bool Char Ordering Int Integer Float Double`。
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
    - `Bounded`类型都有一个上限和下限。`minBound maxBound`类型是`Bounded a => a`，无参数，得到一个，得到一个`Bounded`类型的下限和上限。
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
    - `Integral`是表示整数的Typeclass，包含`Int Integer`。
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
- 可见Haskell对运算符的处理是很严格的，C++模板也可以做到类似的事情，不过对于内置类型来说，因为有整型提升和隐式类型转换的存在，运算符的类型检查其实并没有严格到这种地步。
- 其实只是一种形式，Typeclass提供的功能，在其他语言中也有提供，java的interface（当然java没有运算符重载），Python中的`__eq__ __str__`等特殊方法，C++的运算符重载和模板，异曲同工。

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
- 模式匹配是按照定义顺序来的，匹配到就停止。【不像prolog那种需要在后续的模式中去掉前面的匹配的条件】。
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
- `where`中可以定义多个名字和函数，每个名字对守卫都是可见的，并且仅对本函数可见，不会污染其他函数的名称空间。其中的名字都是一列垂直排开，这是语法规范。
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
                               _ -> True
```
- 函数参数模式匹配只能用于函数定义时，而`case`表达式可以用于任何地方。

究根结底，模式匹配、守卫、case表达式都是条件判断的语法糖，为了更方便地进行分支而产生的语法，在支持函数式编程的语言中，这些都是必不可少的糖。

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

高阶函数：函数可以作为参数、返回值、赋给另一个函数。

### 柯里化

在Haskell中，所有的多参数函数都支持柯里化，所以也可以说本质上Haskell的所有函数都只有一个参数。
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
- `max 4`将得到一个函数，`max4 max4'`从含义是等价的，并且Haskell的lint会提示后者可以简写为前者。
- 所以在实际上类型`a -> a -> a -> a`和`a -> (a -> (a -> a))`是等价的。
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

有高阶函数那肯定要有匿名函数了。Haskell用`\`来表示匿名函数，定义方法：`\args -> retval`，用的时候一般用括号将整个表达式括起来。
```haskell
>>> zipWith (\x y -> x + y) [1, 2] [10, 100, 1]
[11,102]
>>> map (\x -> x ** x) [1, 2, 3, 4]
[1.0,4.0,27.0,256.0]
```
同普通函数一样可以使用模式匹配，但是无法为匿名函数设置多个模式，所以要慎用。

使用匿名函数来实现`x * y * z`的柯里化会更容易理解一些，当然同样不如`f' = x * y * z`简单直观。
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
- `foldl foldr`接受一个函数，一个初值和一个可折叠对象，对初值和起始元素调用函数，然后一次对结果和下一个值调用直接结束，得到结果。`foldl`从左到右，`foldr`从右到左。并且注意传入函数的参数对应关系是不同的，`foldl`第一个参数为初值或者中间结果，第二个参数是可折叠对象元素，而`foldr`是反过来的。
```haskell
foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
>>> :t foldr
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
>>> foldl (-) 0 [1, 2, 3]
-6
>>> 0 - 1 - 2 - 3
-6
>>> foldr (-) 0 [1, 2, 3]
2
>>> 1 - (2 - (3 - 0))
2
```
- `foldl1 foldr1`和`foldl foldr`类似，不过他们使用首或尾元素作为初值而不需要传入。
- 对空列表进行折叠会抛出运行时错误。
- 有个小区别是`foldl`能用于无限列表（但这不是会无限循环吗？），`foldr`不能。经过实测都会进入无限循环？

扫描：
- `scanl scanr`与`foldl foldr`类似，不同的是结果，`scanl scanr`的结果是一个列表，包括初始值和所有中间结果（包括最终结果）。`scanl`是从左往右添加结果，
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

折叠和扫描在一定程度上可以用来替代递归。

### $函数调用符

`$`被称作函数调用符。
- 定义：接受一个函数并返回这个函数，就是什么都没做，但使用`$`后，优先级被改变了。
```haskell
($) :: (a -> b) -> a -> b
f $ x = f x
```
- 用空格调用的函数调用是左结合的`f x y z`与`((f x) y ) z`等价。
- 而`$`是右结合的，并且是最低优先级，所以`f $ 1+ 1`表示`f (1 + 1)`。`$`是中缀函数，右结合，最低优先级，其他表达式都会得到优先计算，然后才从右向左执行使用`$`调用的函数。
- 可以用来改变优先级，减少括号的使用。
- `$ x`可以将数据变成函数，接受一个函数，返回值是将这个数据`x`用于传入的函数后得到的结果。
- 虽然有点魔法的味道，但是又改优先级又改结合性，感觉用起来心智负担会很重，能不用就不用吧。
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

### 函数复合(Function Composition)

在数学中，复合函数的定义是$(f \circ g)(x) = f(g(x))$，即将函数$g(x)$的值作为$f(x)$的自变量，既然函数式编程中的函数的含义是数学中的函数而不是一般命令式编程中表是一个计算过程的函数。那么理所应当要支持复合函数（或者叫做函数组合）了，$f(g(x))$的含义就是先调用$g(x)$在对结果调用$f(x)$。
- haskell中使用`.`运算符定义复合函数。
- 定义：非常直白，中缀，接受两个函数，先调用后者，再调用前者。
```haskell
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)
```
- 很显然定义函数复合时`g`的返回值类型必须要和`f`的参数类型一致。
- 使用：`.`优先级低于函数调用，需要将复合函数括起来。
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
- 比如`sum (replicate 5 (max 6.7 8.9))`可以写作`(sum . replicate 5 . max 6.7) 8.9`（看起来很怪，仅做演示）。
- 使用函数复合配合`$`可以进一步去掉括号，也不太好说到底应不应该用，既然存在那必然有存在的理由，如果有充足的使用理由那便可以用。
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
- `foldl' :: Foldable t => (b -> a -> b) -> b -> t a -> b` `foldl`的严格版本，`foldl`是惰性的，不会立即求值，而是做一个”在必要时会取得所需的结果”的承诺。每过一遍累加器，这一行为就重复一次。在列表很大时，这堆承诺可能会塞满堆栈造成栈溢出，此时应改用严格版本，严格版本会直接计算出中间值并继续执行下去。
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
- `on`就相当于对两个自变量的函数做一个复合：$(f\circ g)(x, y) = f(g(x), g(y))$。比如``compare `on` length``用于按照数组长度比较，``(==) `on` (>0)``用于按照是否同为整数判等，非常地灵活。
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
- 要导出的函数放到`()`中，
- 便可以在同级目录下的`.hs`中进行导入。

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
