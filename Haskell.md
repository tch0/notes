# Haskell语言入门

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

选择：
- 选择[Learn You a Haskell for Great Good](https://www.bookstack.cn/read/learnyouahaskell-zh-cn/README.md)和[Real World Haskell](http://cnhaskell.com/index.html)先看一看再说。

语言相关链接：
- [haskell主页](https://www.haskell.org/)，[Wiki](https://wiki.haskell.org/Haskell)。
- [GHC文档](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/index.html)。
- [stack文档](https://docs.haskellstack.org/en/stable/README/)。
- [Stackage首页](https://www.stackage.org/)
- [Hackage首页](https://hackage.haskell.org/)

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

**使用GHCup**：
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
- 倒腾了半天网络等各种原因，Linux上和Windows上都没有安装成功。

**安装stack**：
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

**使用stack安装GHC**：
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
echo echo installed>ghc-8.10.7.installed
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

**关于Cabal和stack**：
- cabal是另一个包管理和项目工具，和stack有区别有联系，cabal的包管理库是Hackage，stack是Stackage，Stackage官网介绍Stackage是Hackage的子集的分发。
- 都可以管理包，都可以管理项目，好像还可以实现同一个项目兼容两个工具。但stack好像是为了解决cabal的某些痛点，具体还未研究那么深。暂时不安装cabal，只使用stack就行了。




