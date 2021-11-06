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
- 倒腾了半天网络等各种原因，Linux上和Windows上都没有安装成功。好像可以换源解决，参考[这里](https://zh.z.haskell.world/guide)。

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


编辑器：
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

更多用法尚待挖掘。

## 感受一下

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

## 函数

### 感受函数

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

### List Comprehension

也就是列表生成式：
- `[x * 2 | x <- [1..10]]`得到`[2,4,6,8,10,12,14,16,18,20]`。
- 表达式中可以是`if-else`语句，因为其也是一个表达式。
- 作用就是`x`遍历`<-`后列表中所有元素，类似于做了循环，变量可以有多个`[[x, y] | x <- [1..], y <- [10..], x + y == 20]`，甚至可以加条件，就像一个数学中的集合生成式一样。
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