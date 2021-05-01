<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Windows批处理脚本](#windows%E6%89%B9%E5%A4%84%E7%90%86%E8%84%9A%E6%9C%AC)
  - [1. Dos命令](#1-dos%E5%91%BD%E4%BB%A4)
  - [2. Cmd命令处理程序](#2-cmd%E5%91%BD%E4%BB%A4%E5%A4%84%E7%90%86%E7%A8%8B%E5%BA%8F)
  - [3. Batch批处理脚本](#3-batch%E6%89%B9%E5%A4%84%E7%90%86%E8%84%9A%E6%9C%AC)
    - [3.1 echo](#31-echo)
    - [3.2 @](#32-)
    - [3.3 注释](#33-%E6%B3%A8%E9%87%8A)
    - [3.4 pause](#34-pause)
    - [3.5 命令行参数](#35-%E5%91%BD%E4%BB%A4%E8%A1%8C%E5%8F%82%E6%95%B0)
    - [3.6 goto](#36-goto)
    - [3.7  call](#37--call)
    - [3.8 if ELSE](#38-if-else)
    - [3.9 for](#39-for)
    - [3.10 start](#310-start)
    - [3.11 set](#311-set)
    - [3.12 重定向 > & >>](#312-%E9%87%8D%E5%AE%9A%E5%90%91---)
    - [3.13 管道 |](#313-%E7%AE%A1%E9%81%93-)
    - [3.14 & && ||](#314---)
    - [3.15 setlocal endlocal](#315-setlocal-endlocal)
  - [4. 环境变量详解](#4-%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F%E8%AF%A6%E8%A7%A3)
  - [5. 常用Cmd命令](#5-%E5%B8%B8%E7%94%A8cmd%E5%91%BD%E4%BB%A4)
  - [6. 脚本编写技巧](#6-%E8%84%9A%E6%9C%AC%E7%BC%96%E5%86%99%E6%8A%80%E5%B7%A7)
  - [7. 批处理脚本实例](#7-%E6%89%B9%E5%A4%84%E7%90%86%E8%84%9A%E6%9C%AC%E5%AE%9E%E4%BE%8B)
    - [7.1 文件路径相关](#71-%E6%96%87%E4%BB%B6%E8%B7%AF%E5%BE%84%E7%9B%B8%E5%85%B3)
    - [7.2 用户交互](#72-%E7%94%A8%E6%88%B7%E4%BA%A4%E4%BA%92)
    - [7.3 区分命令行执行和双击执行](#73-%E5%8C%BA%E5%88%86%E5%91%BD%E4%BB%A4%E8%A1%8C%E6%89%A7%E8%A1%8C%E5%92%8C%E5%8F%8C%E5%87%BB%E6%89%A7%E8%A1%8C)
  - [8. 我的评价](#8-%E6%88%91%E7%9A%84%E8%AF%84%E4%BB%B7)
  - [9. Windows管理深入](#9-windows%E7%AE%A1%E7%90%86%E6%B7%B1%E5%85%A5)
    - [9.1 注册表](#91-%E6%B3%A8%E5%86%8C%E8%A1%A8)
    - [9.2 组策略](#92-%E7%BB%84%E7%AD%96%E7%95%A5)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Windows批处理脚本

教程与文章：
- [Windows批处理(cmd/bat)常用命令教程](https://www.cnblogs.com/xpwi/p/9626959.html)
- [Windows 批处理脚本指南](https://www.jianshu.com/p/3da1657f4c2b)
- 网上的教程真不如帮助文档来得详细，**BAT的命令帮助**都可以通过执行命令加参数`/?`得到。

虽然感觉好像Windows批处理脚本可能已经过时了，而且据了解，windows命令行解释器好像存在一些陈年老BUG。但是就了解历史，并且当前也可能会用到的目的还是可以了解一下。

并且借此机会加深了解Windows系统，作为软件从业人员，对每天都在用的Windows操作系统了解好像实在是有点太少了。

## 1. Dos命令

DOS(Disk Operating System)，就是Windows的前身，DOS中支持的命令就称之为DOS命令，在现在的Windows命令行提示符中依然可以使用。在命令行下执行命令其实就跟Win+R直接运行是一样都是在`Path`环境变量下搜索这个`.exe`可执行文件去执行。现在可能还会用的DOS命令：
- 目录命令：
    - `dir` 列出当前目录文件与子目录。
    - `cd` 切换当前目录。
    - `mkdir`/`md` 创建文件夹。
    - `rd` 删除空文件夹。
    - `path` 设备可执行文件搜索路径，就是`path`环境变量。
    - `tree` 以树形式打印一个目录或者驱动器下所有目录和文件。
    - `tasklist` 打印所有进程，功能类似任务管理器。
- 文件命令：
    - `copy` 拷贝文件。
    - `xcopy` 拷贝目录以及文件。
    - `type` 显示ASCII文件内容。
    - `ren` 重命名。
    - `move` 移动文件。
    - `fc` 比较两个文本文件差异。
    - `attrib` 修改指定文件属性。
    - `del` 删除文件。
- 其他命令：
    - `ping` 测试网络。
    - `cls` 清屏。
    - `data` 日期。
    - `time`时间。
    - `ver`系统版本。
    - `shutdown` 执行关机重启等一系列操作。
- 常用的软件：
    - `notepad` 记事本
    - `taskmgr` 任务管理器
    - `regedit` 注册表编辑器
    - `gpedit.msc` 组策略编辑器
    - `calc` 计算器
    - etc

都非常简单感觉也都没有太大必要去了解。


## 2. Cmd命令处理程序

执行方式：
- `Win + R`，输入`Cmd`回车。
- 执行Windows命令行提示符。
- 在`Cmd`命令行中执行`cmd`以打开一个新的命令处理程序子进程。
- 直接执行`C:\Windows\system32\cmd.exe`，总之无论何种方式最终都是执行的该`exe`文件。

关于`Cmd`命令，`cmd /?`的帮助如下：

启动 Windows 命令处理程序的一个新实例
```bat
CMD [/A | /U] [/Q] [/D] [/E:ON | /E:OFF] [/F:ON | /F:OFF] [/V:ON | /V:OFF] [[/S] [/C | /K] string]
```
|选项|行为|
|:-|:-|
|`/C`      |执行字符串指定的命令然后终止|
|`/K`      |执行字符串指定的命令但保留|
|`/S`      |修改 `/C` 或 `/K` 之后的字符串处理(见下)|
|`/Q`      |关闭回显|
|`/D`      |禁止从注册表执行 `AutoRun` 命令(见下)|
|`/A`      |使向管道或文件的内部命令输出成为 `ANSI`|
|`/U`      |使向管道或文件的内部命令输出成为 `Unicode`|
|`/T:fg`   |设置前台/背景颜色(详细信息见 `COLOR /?`)|
|`/E:ON`   |启用命令扩展(见下)|
|`/E:OFF`  |禁用命令扩展(见下)|
|`/F:ON`   |启用文件和目录名补全字符(见下)|
|`/F:OFF`  |禁用文件和目录名补全字符(见下)|
|`/V:ON`   |使用 `!` 作为分隔符启用延迟的环境变量扩展。例如，`/V:ON` 会允许 `!var!` 在执行时扩展变量 `var`。`var` 语法会在输入时扩展变量，这与在一个 `FOR`循环内不同。|
|`/V:OFF`  |禁用延迟的环境扩展。|

注意，如果字符串加有引号，可以接受用命令分隔符 `&&` 分隔多个命令。另外，由于兼容性原因，`/X` 与 `/E:ON` 相同，`/Y` 与 `/E:OFF` 相同，且 `/R` 与 `/C` 相同。任何其他开关都将被忽略。

如果指定了 `/C` 或 `/K`，则会将该开关之后的命令行的剩余部分作为一个命令行处理，其中，会使用下列逻辑处理引号`"`字符:

1.  如果符合下列所有条件，则会保留命令行上的引号字符:
    - 不带 `/S` 开关
    - 正好两个引号字符
    - 在两个引号字符之间无任何特殊字符，特殊字符指下列字符: `&<>()@^|`
    - 在两个引号字符之间至少有一个空格字符
    - 在两个引号字符之间的字符串是某个可执行文件的名称。

2.  否则，老办法是看第一个字符是否是引号字符，如果是，则去掉首字符并删除命令行上最后一个引号，保留最后一个引号之后的所有文本。

如果 `/D` 未在命令行上被指定，当 `CMD.EXE` 开始时，它会寻找以下 `REG_SZ/REG_EXPAND_SZ` 注册表变量。如果其中一个或两个都存在，这两个变量会先被执行：`HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\AutoRun` 和/或 `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun`。

命令扩展是**按默认值启用**的。你也可以使用 `/E:OFF` ，为某一特定调用而停用扩展。你可以在机器上和/或用户登录会话上启用或停用 `CMD.EXE` 所有调用的扩展，这要通过设置使用 `REGEDIT.EXE` 的注册表中的一个或两个 `REG_DWORD` 值: `HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\EnableExtensions` 和/或 `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\EnableExtensions`。在我的机器上，前者存在，默认值为1，后者不存在，可以自行添加。

值为 `0x1` 或 `0x0`。用户特定设置比机器设置有优先权。命令行开关比注册表设置有优先权。

在批处理文件中，`SETLOCAL ENABLEEXTENSIONS` 或 `DISABLEEXTENSIONS` 参数比 `/E:ON` 或 `/E:OFF` 开关有优先权。请参阅 `SETLOCAL /?` 获取详细信息。

命令扩展包括对下列命令所做的更改和/或添加:

```
DEL or ERASE
COLOR
CD or CHDIR
MD or MKDIR
PROMPT
PUSHD
POPD
SET
SETLOCAL
ENDLOCAL
IF
FOR
CALL
SHIFT
GOTO
START (同时包括对外部命令调用所做的更改)
ASSOC
FTYPE
```

有关特定详细信息，请键入 `commandname /?` 查看。

延迟环境变量扩展不按默认值启用。你可以用 `/V:ON` 或 `/V:OFF` 开关，为 `CMD.EXE` 的某个调用而启用或停用延迟环境变量扩展。你可以在机器上和/或用户登录会话上启用或停用 `CMD.EXE` 所有调用的延迟扩展，这要通过设置使用 `REGEDIT.EXE` 的注册表中的一个或两个 `REG_DWORD` 值: `HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\DelayedExpansion` 和/或 `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\DelayedExpansion`。

值为 `0x1` 或 `0x0`。用户特定设置比机器设置有优先权。命令行开关比注册表设置有优先权。

在批处理文件中，`SETLOCAL ENABLEDELAYEDEXPANSION` 或 `DISABLEDELAYEDEXPANSION`参数比 `/V:ON` 或 `/V:OFF` 开关有优先权。请参阅 `SETLOCAL /?`获取详细信息。

如果延迟环境变量扩展被启用，惊叹号字符 `!` 可在执行时间被用来代替一个环境变量的数值。

你可以用 `/F:ON` 或 `/F:OFF` 开关为 `CMD.EXE` 的某个调用而启用或禁用文件名完成。你可以在计算上和/或用户登录会话上启用或禁用 `CMD.EXE` 所有调用的完成，这可以通过使用 `REGEDIT.EXE` 设置注册表中的下列 `REG_DWORD` 的全部或其中之一：

- `HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\CompletionChar`
`HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\PathCompletionChar`
- `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\CompletionChar`
`HKEY_CURRENT_USER\Software\Microsoft\Command Processor\PathCompletionChar`

由一个控制字符的十六进制值作为一个特定参数(例如，`0x4`是`Ctrl-D`，`0x6` 是 `Ctrl-F`)。用户特定设置优先于机器设置。命令行开关优先于注册表设置。

如果完成是用 `/F:ON` 开关启用的，两个要使用的控制符是:目录名完成用 `Ctrl-D`，文件名完成用 `Ctrl-F`。要停用注册表中的某个字符，请用空格(`0x20`)的数值，因为此字符不是控制字符。

如果键入两个控制字符中的一个，完成会被调用。完成功能将路径字符串带到光标的左边，如果没有通配符，将通配符附加到左边，并建立相符的路径列表。然后，显示第一个相符的路径。如果没有相符的路径，则发嘟嘟声，不影响显示。之后，重复按同一个控制字符会循环显示相符路径的列表。将 `Shift`键跟控制字符同时按下，会倒着显示列表。如果对该行进行了任何编辑，并再次按下控制字符，保存的相符路径的列表会被丢弃，新的会被生成。如果在文件和目录名完成之间切换，会发生同样现象。两个控制字符之间的唯一区别是文件完成字符符合文件和目录名，而目录完成字符只符合目录名。如果文件完成被用于内置式目录命令(`CD`、`MD` 或 `RD`)，就会使用目录完成。用引号将相符路径括起来，完成代码可以正确处理含有空格或其他特殊字符的文件名。同时，如果备份，然后从行内调用文件完成，完成被调用时位于光标右方的文字会被调用。

需要引号的特殊字符是:
```
<space>
()[]{}^=;!'+,`~(&()
```

上述的完成就是Completion，就是补全的意思，执行命令是可以对文件和目录名进行补全，默认使用注册表值(`0x9`)都是`Tab`，一般也不需要改，同时按住`Shift`可以反方向搜索。如果是通过`cmd /F:ON`执行的命令的话，则对目录补全用`Ctrl-D`，文件补全用`Ctrl-F`。只会补全目录和文件不会补全命令。

## 3. Batch批处理脚本

批处理脚本的后缀是`.bat`或者`.cmd`，没有固定格式，文件内容大区分大小写，每一行可视作一条命令，从第一行执行到最后一行，双击即可执行，类似于Unix中的Shell脚本，主要是调用各种DOS命令来完成操作。顾名思义用来做批处理减少重复操作提高效率的脚本。

批处理中的命令都可以在`cmd`中直接执行，写成脚本就方便多了。

`bat`脚本的执行其实就是在命令行中执行是一样的，也会弹出Cmd的黑色对话框，其实就是调用了`C:\Windows\system32\cmd.exe`去执行。

批处理文件的命名推荐不使用空格，空格出现在文件名中可能会令人头疼，使用驼峰命名法或者`.` `-` `_`等字符作为分隔符是更好的选择，如果使用了空格，执行时请将文件名用`""`包起来。另外请避免命名与系统内置命令或常用软件重名，这会让人感到混乱。

就已知信息来看，没有调试批处理脚本的方法，那估计就只有`echo`打印中间信息来调了。

### 3.1 echo

显示消息，或者启用或关闭命令回显。

```bat
ECHO [ON | OFF]
ECHO [message]
```

若要显示当前回显设置，请键入不带参数的 `ECHO`。

`echo.`可以输出一个空行。

```bat
echo hello,world!
echo on
echo off
echo
echo.
```

### 3.2 @

`@`放在一条命令前，表示关闭该条命令本身的回显。通常放在`echo off`前关闭`echo off`回显。
```bat
@echo off
```

### 3.3 注释

在批处理文件或 `CONFIG.SYS` 里加上注解或说明。

```bat
REM [comment]
```
`rem`即是remark的意思，后面内容视为注释，但是`echo on`时可以回显。

`::`后面也是注释，任何情况下都不回显。

行内注释使用`%comment%`，将内容放在`%%`中间，比较少用。

### 3.4 pause

`pause`让批处理程序暂停一下，命令行中显示`请按任意键继续. . .`然后按下任意键后就会继续往后执行。以前在VC中写控制台程序为了让程序执行完停住经常会写的`System("pause")`就是让操作系统调用`pause`命令，当然现在不需要这样写了，注意只有Windows支持。

### 3.5 命令行参数

就像任何编程语言中你都可以给你编写的程序指定命令行参数(最终他们会作为字符串数组传递给`main`函数)一样，批处理脚本也可以添加命令行参数。但是批处理脚本没有入口，直接使用`%1` `%2` 就可以引用第1个和第2个参数。如果没有该参数，那么`%num`就是一个空的字符串。`%0`代表批处理文件本身。
```bat
::test.bat
@echo off
echo this is test.bat!
echo %1+%2
```

为了能够给批处理指定参数，你需要在`Cmd`中执行该`bat`。仅能通过`%num`引用最多9个参数，`%10`会被识别为第一个参数后附加了一个`0`。但是可以使用`shift`命令可以是参数从某个位置开始后边的参数向左移动一个位置，该位置参数被丢弃。这样就可以取到后面的参数了。

### 3.6 goto

将 `cmd.exe` 定向到批处理程序中带标签的行。

```bat
GOTO label
```
`label` ： 指定批处理程序中用作标签的文字字符串。

标签必须单独一行，并且以冒号`:`打头。

如果命令扩展被启用，`GOTO` 会如下改变:

`GOTO` 命令现在接受目标标签 `:EOF`，这个标签将控制转移到当前批脚本文件的结尾。不定义就退出批脚本文件，这是一个容易的办法。有关能使该功能有用的 `CALL` 命令的扩展描述，请键入`CALL /?`。


### 3.7  call

从批处理程序调用另一个批处理程序。

```bat
CALL [drive:][path]filename [batch-parameters]
```

`batch-parameters` ：指定批处理程序所需的命令行参数。

如果命令扩展被启用，`CALL` 会如下改变:

`CALL` 命令现在将标签当作 `CALL` 的目标接受。语法是:
```bat
CALL :label arguments
```
一个新的批文件上下文由指定的参数所创建，控制在标签被指定后传递到语句。你必须通过达到批脚本文件末两次来 "exit" 两次。第一次读到文件末时，控制会回到 `CALL` 语句的紧后面。第二次会退出批脚本。键入 `GOTO /?`，参看 `GOTO :EOF` 扩展的描述，此描述允许你从一个批脚本返回。

也就是说`call`一个标签时会创建新的批处理上下文，并且执行到文件末才会返回这个`call`语句，相当于把这个标签起的内容当做一个新的`bat`文件。如果在一个`bat`文件中调用了`goto :EOF`，那么相当于跳转到批处理文件末尾也就是结束该批处理文件。

另外，批脚本文本参数参照(`%0`、`%1`、等等)已如下改变:


批脚本里的 `%*` 指出所有的参数(如 `%1` `%2` `%3` `%4` `%5` ...)
批参数(`%n`)的替代已被增强。你可以使用以下语法:

|参数|含义|
|:-|:-|
|`%~1`      | 删除引号(`"`)，扩展 `%1`|
|`%~f1`     | 将 `%1` 扩展到一个完全合格的路径名|
|`%~d1`     | 仅将 `%1` 扩展到一个驱动器号|
|`%~p1`     | 仅将 `%1` 扩展到一个路径|
|`%~n1`     | 仅将 `%1` 扩展到一个文件名|
|`%~x1`     | 仅将 `%1` 扩展到一个文件扩展名|
|`%~s1`     | 扩展的路径只含有短名|
|`%~a1`     | 将 `%1` 扩展到文件属性|
|`%~t1`     | 将 `%1` 扩展到文件的日期/时间|
|`%~z1`     | 将 `%1` 扩展到文件的大小|
|`%~$PATH:1`| 查找列在 `PATH` 环境变量的目录，并将 `%1` 扩展到找到的第一个完全合格的名称。如果环境变量名未被定义，或者没有找到文件，此修改符会扩展到空字符串|

可以组合修改符来取得多重结果:

|参数|含义|
|:-|:-|
|`%~dp1`       | 只将 `%1` 扩展到驱动器号和路径|
|`%~nx1`       | 只将 `%1` 扩展到文件名和扩展名|
|`%~dp$PATH:1` | 在列在 `PATH` 环境变量中的目录里查找 `%1`，并扩展到找到的第一个文件的驱动器号和路径。|
|`%~ftza1`     | 将 `%1` 扩展到类似 `DIR` 的输出行。|

在上面的例子中，`%1` 和 `PATH` 可以被其他有效数值替换。`%~` 语法被一个有效参数号码终止。`%~` 修定符不能跟 `%*`使用。

例子，同目录下存在`hello.txt`文件：
```bat
::test.bat
@echo off
echo this is test.bat!
call hello.bat hello.txt
pause
```
```bat
::hello.bat
@echo off
echo this is hello.bat!
echo %~f1
echo %~d1
echo %~p1
echo %~n1
echo %~x1
echo %~s1
echo %~a1
echo %~t1
echo %~z1
echo %~$PATH:1
echo %~dp1
echo %~nx1
echo %~ftza1
pause
goto :EOF
echo whatever
```
执行结果：
```
this is test.bat!
this is hello.bat!
C:\Users\CapT\Desktop\BatTest\hello.txt
C:
\Users\CapT\Desktop\BatTest\
hello
.txt
C:\Users\CapT\Desktop\BatTest\hello.txt
--a--------
2021/04/28 09:00
15
ECHO 处于关闭状态。
C:\Users\CapT\Desktop\BatTest\
hello.txt
--a-------- 2021/04/28 09:00 15 C:\Users\CapT\Desktop\BatTest\hello.txt
请按任意键继续. . .
请按任意键继续. . .
```

利用扩展的批处理参数可以得到很多东西，其中`%~a1` `%~t1` `%~z1` 是获取文件的属性，需要文件存在，不存在的话结果为空，其他除搜索`%~$PATH:1`外都是简单的仅使用字符串作为文件名的操作，不要求文件存在。

利用`goto :EOF`和`call :label`就可以做到类似于函数调用的效果，定义多个标签作为函数，再定义一个入口作为整个批处理的入口就有编程语言那个味道了，只能说历史痕迹实在是太重了。

```bat
::functest.bat
goto :Main

:func1
    ::do something
    goto :EOF

:func2
    ::do something
    goto :EOF

:Main
    call func1 args1
    call func2 args2
```

### 3.8 if ELSE

执行批处理程序中的条件处理。

```bat
IF [NOT] ERRORLEVEL number command
IF [NOT] string1==string2 command
IF [NOT] EXIST filename command
```

- `NOT`指定只有条件为 `false` 的情况下，Windows 才应该执行该命令。

- `ERRORLEVEL number` 如果最后运行的程序返回一个等于或大于指定数字的退出代码，指定条件为 `true`。

- `string1==string2`  如果指定的文字字符串匹配，指定条件为 `true`。
- `EXIST filename`    如果指定的文件名存在，指定条件为 `true`。
- `command`           如果符合条件，指定要执行的命令。如果指定的条件为 `FALSE`，命令后可跟 `ELSE` 命令，该命令将在 `ELSE` 关键字之后执行该命令。

`ELSE` 子句必须出现在同一行上的 `IF` 之后。例如:

```bat
IF EXIST filename. (
    del filename.
) ELSE (
    echo filename. missing.
)
```

由于 `del` 命令需要用新的一行终止，因此以下子句不会有效:
```bat
IF EXIST filename. del filename. ELSE echo filename. missing
```
由于 `ELSE` 命令必须与 `IF` 命令的尾端在同一行上，以下子句也
不会有效:
```bat
IF EXIST filename. del filename.
ELSE echo filename. missing
```

如果都放在同一行上，以下子句有效:
```bat
IF EXIST filename. (del filename.) ELSE echo filename. missing
```
如果命令扩展被启用，`IF` 会如下改变:
```bat
IF [/I] string1 compare-op string2 command
IF CMDEXTVERSION number command
IF DEFINED variable command
```
其中， `compare-op` 可以是：

|比较操作|含义|
|:-|:-|
|`EQU`|等于|
|`NEQ`|不等于|
|`LSS`|小于|
|`LEQ`|小于或等于|
|`GTR`|大于|
|`GEQ`|大于或等于|

- 而 `/I` 开关(如果指定)说明要进行的字符串比较不分大小写。`/I` 开关可以用于 `IF` 的 `string1==string2` 的形式上。这些比较都是通用的；原因是，如果 `string1` 和 `string2` 都是由数字组成的，字符串会被转换成数字，进行数字比较。
- `CMDEXTVERSION` 条件的作用跟 `ERRORLEVEL` 的一样，除了它是在跟与命令扩展有关联的内部版本号比较。第一个版本是 `1`。每次对命令扩展有相当大的增强时，版本号会增加一个。命令扩展被停用时，`CMDEXTVERSION` 条件不是真的。
- 如果已定义环境变量，`DEFINED` 条件的作用跟 `EXIST` 的一样，除了它取得一个环境变量，返回的结果是 `true`。

如果没有名为 `ERRORLEVEL` 的环境变量，`%ERRORLEVEL%`会扩充为 `ERROLEVEL` 当前数值的字符串表达式；否则，你会得到其(该环境变量的)数值。运行程序后，以下语句说明 `ERRORLEVEL` 的用法:

```bat
goto answer%ERRORLEVEL%
:answer0
echo Program had return code 0
:answer1
echo Program had return code 1
```

你也可以使用以上的数字比较:

```bat
IF %ERRORLEVEL% LEQ 1 goto okay
```

如果没有名为 `CMDCMDLINE` 的环境变量，`%CMDCMDLINE%`将在 `CMD.EXE` 进行任何处理前扩充为传递给 `CMD.EXE` 的原始命令行；否则，你会得到其(该环境变量的)数值。

如果没有名为 `CMDEXTVERSION` 的环境变量，`%CMDEXTVERSION%` 会扩充为 `CMDEXTVERSION` 当前数值的字串符表达式；否则，你会得到其数值。


你可以使用 `%variable%` 去引用`variable`环境变量，用户和系统环境变量有同名时优先用户环境变量。一般来说无论是注册表中配置还是环境变量都是按照层级，越靠近系统顶层优先级越低，用户配置会覆盖系统配置。


例子：
```bat
::test.bat
@echo off
echo %temp%
echo %errorlevel%
echo %cmdextversion%
echo %cmdcmdline%
pause
```
结果：
```
C:\Users\CapT\AppData\Local\Temp
0
2
C:\Windows\system32\cmd.exe /c ""C:\Users\CapT\Desktop\BatTest\test.bat" "
请按任意键继续. . .
```
第一个 `%temp%` 是环境变量，通过 `%cmdcmdline%` 就可以知道系统是通过`C:\Windows\system32\cmd.exe`使用`/c`选项将脚本路径字符串作为参数执行批处理脚本的，即执行就退出。

### 3.9 for

对一组文件中的每一个文件执行某个特定命令。
```bat
FOR %variable IN (set) DO command [command-parameters]
```
- `%variable`  指定一个单一字母可替换的参数。
- `(set)`      指定一个或一组文件。可以使用通配符。
- `command`    指定对每个文件执行的命令。
- `command-parameters` 为特定命令指定参数或命令行开关。

在批处理程序中使用 `FOR` 命令时，指定变量请使用 `%%variable`而不要用 `%variable`。变量名称是区分大小写的，所以 `%i` 不同于 `%I`.

如果启用命令扩展，则会支持下列 `FOR` 命令的其他格式:
```bat
FOR /D %variable IN (set) DO command [command-parameters]
```
如果集中包含通配符，则指定与目录名匹配，而不与文件名匹配。
```bat
FOR /R [[drive:]path] %variable IN (set) DO command [command-parameters]
```
检查以 `[drive:]path` 为根的目录树，指向每个目录中的 `FOR` 语句。如果在 `/R` 后没有指定目录规范，则使用当前目录。如果集仅为一个单点(`.`)字符，则枚举该目录树。
```bat
FOR /L %variable IN (start,step,end) DO command [command-parameters]
```
该集表示以增量形式从开始到结束的一个数字序列。因此，`(1,1,5)`将产生序列`1 2 3 4 5，(5,-1,1)`将产生序列`(5 4 3 2 1)`
```bat
FOR /F ["options"] %variable IN (file-set) DO command [command-parameters]
FOR /F ["options"] %variable IN ("string") DO command [command-parameters]
FOR /F ["options"] %variable IN ('command') DO command [command-parameters]
```
或者，如果有 `usebackq` 选项:
```bat
FOR /F ["options"] %variable IN (file-set) DO command [command-parameters]
FOR /F ["options"] %variable IN ("string") DO command [command-parameters]
FOR /F ["options"] %variable IN ('command') DO command [command-parameters]
```
`fileset` 为一个或多个文件名。继续到 `fileset` 中的下一个文件之前，每份文件都被打开、读取并经过处理。处理包括读取文件，将其分成一行行的文字，然后将每行解析成零或更多的符号。然后用已找到的符号字符串变量值调用 `For` 循环。以默认方式，`/F` 通过每个文件的每一行中分开的第一个空白符号。跳过空白行。你可通过指定可选 `"options"` 参数替代默认解析操作。这个带引号的字符串包括一个或多个指定不同解析选项的关键字。这些关键字为:

- `eol=c`           - 指一个行注释字符的结尾(就一个)
- `skip=n`          - 指在文件开始时忽略的行数。
- `delims=xxx`      - 指分隔符集。这个替换了空格和制表符的默认分隔符集。
- `tokens=x,y,m-n`  - 指每行的哪一个符号被传递到每个迭代的 for 本身。这会导致额外变量名称的分配。m-n格式为一个范围。通过 nth 符号指定 mth。如果符号字符串中的最后一个字符星号，那么额外的变量将在最后一个符号解析之后分配并接受行的保留文本。
- `usebackq`        - 指定新语法已在下类情况中使用:在作为命令执行一个后引号的字符串并且一个单引号字符为文字字符串命令并允许在 file-set中使用双引号扩起文件名称。

    某些范例可能有助:
```bat
FOR /F "eol=; tokens=2,3* delims=, " %i in (myfile.txt) do @echo %i %j %k
```
- 会分析 `myfile.txt` 中的每一行，忽略以分号打头的那些行，将每行中的第二个和第三个符号传递给 `for` 函数体，用逗号和/或空格分隔符号。请注意，此 `for` 函数体的语句引用 `%i` 来获得第二个符号，引用 `%j` 来获得第三个符号，引用 `%k` 来获得第三个符号后的所有剩余符号。对于带有空格的文件名，你需要用双引号将文件名括起来。为了用这种方式来使用双引号，还需要使用 `usebackq` 选项，否则，双引号会被理解成是用作定义某个要分析的字符串的。
- `%i` 在 `for` 语句中显式声明，`%j` 和 `%k` 是通过- `tokens=` 选项隐式声明的。可以通过 `tokens=` 一行- 指定最多 26 个符号，只要不试图声明一个高于字母 "z" 或- "Z" 的变量。请记住，`FOR` 变量是单一字母、分大小写和全局的变量；- 而且，不能同时使用超过 52 个。
- 还可以在相邻字符串上使用 `FOR /F` 分析逻辑，方法是，用单引号将括号之间的 `file-set` 括起来。这样，该字符串会被当作一个文件中的一个单一输入行进行解析。
- 最后，可以用 `FOR /F` 命令来分析命令的输出。方法是，将括号之间的 `file-set` 变成一个反括字符串。该字符串会被当作命令行，传递到一个子 CMD.EXE，其输出会被捕获到内存中，并被当作文件分析。如以下例子所示:
```bat
FOR /F "usebackq delims==" %i IN (`set`) DO @echo %i
```
会枚举当前环境中的环境变量名称。

另外，`FOR` 变量参照的替换已被增强。你现在可以使用下列
选项语法:

|选项|含义|
|:-|:-|
|`%~I `        |删除任何引号(")，扩展 `%I`|
|`%~fI`        |将 `%I` 扩展到一个完全合格的路径名|
|`%~dI`        |仅将 `%I` 扩展到一个驱动器号|
|`%~pI`        |仅将 `%I` 扩展到一个路径|
|`%~nI`        |仅将 `%I` 扩展到一个文件名|
|`%~xI`        |仅将 `%I` 扩展到一个文件扩展名|
|`%~sI`        |扩展的路径只含有短名|
|`%~aI`        |将 `%I` 扩展到文件的文件属性|
|`%~tI`        |将 `%I` 扩展到文件的日期/时间|
|`%~zI`        |将 `%I` 扩展到文件的大小|
|`%~$PATH:I`   |查找列在路径环境变量的目录，并将 `%I` 扩展到找到的第一个完全合格的名称。如果环境变量名未被定义，或者没有找到文件，此组合键会扩展到空字符串|

可以组合修饰符来得到多重结果:
|选项|含义|
|:-|:-|
|`%~dpI`       |仅将 `%I` 扩展到一个驱动器号和路径|
|`%~nxI`       |仅将 `%I` 扩展到一个文件名和扩展名|
|`%~fsI`       |仅将 `%I` 扩展到一个带有短名的完整路径名|
|`%~dp$PATH:I` |搜索列在路径环境变量的目录，并将 `%I` 扩展到找到的第一个驱动器号和路径。|
|`%~ftzaI`     |将 `%I` 扩展到类似输出线路的 `DIR`|

在以上例子中，`%I` 和 `PATH` 可用其他有效数值代替。`%~` 语法用一个有效的 `FOR` 变量名终止。选取类似 `%I` 的大写变量名比较易读，而且避免与不分大小写的组合键混淆。

### 3.10 start

启动一个单独的窗口以运行指定的程序或命令。

```bat
START ["title"] [/D path] [/I] [/MIN] [/MAX] [/SEPARATE | /SHARED]
      [/LOW | /NORMAL | /HIGH | /REALTIME | /ABOVENORMAL | /BELOWNORMAL]
      [/NODE <NUMA node>] [/AFFINITY <hex affinity mask>] [/WAIT] [/B]
      [command/program] [parameters]
```

|选项|含义|
|:-|:-|
|`"title"`|在窗口标题栏中显示的标题。|
|`path`   |启动目录。|
|`B`      |启动应用程序，但不创建新窗口。应用程序已忽略 `^C` 处理。除非应用程序启用 `^C` 处理，否则 `^Break` 是唯一可以中断该应用程序的方式。|
|`I`          |新的环境将是传递给 `cmd.exe` 的原始环境，而不是当前环境。|
|`MIN`        |以最小化方式启动窗口。|
|`MAX`        |以最大化方式启动窗口。|
|`SEPARATE`   |在单独的内存空间中启动 16 位 Windows 程序。|
|`SHARED`     |在共享内存空间中启动 16 位 Windows 程序。|
|`LOW`        |在 `IDLE` 优先级类中启动应用程序。|
|`NORMAL`     |在 `NORMAL` 优先级类中启动应用程序。|
|`HIGH`       |在 `HIGH` 优先级类中启动应用程序。|
|`REALTIME`   |在 `REALTIME` 优先级类中启动应用程序。|
|`ABOVENORMAL`|在 `ABOVENORMAL` 优先级类中启动应用程序。|
|`BELOWNORMAL`|在 `BELOWNORMAL` 优先级类中启动应用程序。|
|`NODE`       |将首选非一致性内存结构(NUMA)节点指定为十进制整数。|
|`AFFINITY`   |将处理器关联掩码指定为十六进制数字。进程被限制在这些处理器上运行。将 `/AFFINITY` 和 `/NODE` 结合使用时，会对关联掩码进行不同的解释。指定关联掩码，以便将零位作为起始位置(就如将 NUMA节点的处理器掩码向右移位一样)。进程被限制在指定关联掩码和 NUMA 节点之间的那些通用处理器上运行。如果没有通用处理器，则进程被限制在指定的 NUMA 节点上运行。
|`WAIT`       |启动应用程序并等待它终止。|
|`command/program`|如果它是内部 `cmd` 命令或批文件，则该命令处理器是使用 `cmd.exe` 的 `/K` 开关运行的。这表示运行该命令之后，该窗口将仍然存在。如果它不是内部 `cmd` 命令或批文件，则它就是一个程序，并将作为一个窗口化应用程序或控制台应用程序运行。|
|`parameters` | 这些是传递给 `command/program` 的参数。|

注意: 在 64 位平台上不支持 `SEPARATE` 和 `SHARED` 选项。

>Windows为进程定义了6个优先级类别：见Windows API中的[GetPriorityClass](https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-getpriorityclass)。从高到低分别为`REALTIME_PRIORITY_CLASS` `HIGH_PRIORITY_CLASS` `ABOVE_NORMAL_PRIORITY_CLASS` `NORMAL_PRIORITY_CLASS` `BELOW_NORMAL_PRIORITY_CLASS` `IDLE_PRIORITY_CLASS`。分别对应上述的6个关于优先级类的选项。


通过指定 `/NODE`，可按照利用 NUMA 系统中的内存区域的方式创建进程。例如，可以创建两个完全通过共享内存互相通信的进程以共享相同的首选 NUMA 节点，从而最大限度地减少内存延迟。只要有可能，它们就会分配来自相同 NUMA 节点的内存，并且会在指定节点之外的处理器上自由运行。

```bat
start /NODE 1 application1.exe
start /NODE 1 application2.exe
```

这两个进程可被进一步限制在相同 NUMA 节点内的指定处理器上运行。在以下示例中，application1 在节点的两个低位处理器上运行，而 application2 在该节点的其后两个处理器上运行。该示例假定指定节点至少具有四个逻辑处理器。请注意，节点号可更改为该计算机的任何有效节点号，而无需更改关联掩码。

```bat
start /NODE 1 /AFFINITY 0x3 application1.exe
start /NODE 1 /AFFINITY 0xc application2.exe
```

>NUMA 全称 Non-Uniform Memory Access，译为“非一致性内存访问”。这种构架下，不同的内存器件和CPU核心从属不同的 Node，每个 Node 都有自己的集成内存控制器（IMC，Integrated Memory Controller）。
在 Node 内部，架构类似SMP(Symmetrical Multi-Processing，对称多处理)，使用 IMC Bus (IMC, Integrated Memory Controller, 集成内存控制器)进行不同核心间的通信；不同的 Node 间通过QPI（Quick Path Interconnect，快速通道互联，是一种由英特尔开发并使用的点对点处理器互联架构，用来实现CPU之间的互联）进行通信。

>对称多处理（英语：Symmetric multiprocessing，缩写为 SMP），也译为均衡多处理、对称性多重处理、对称多处理机，是一种多处理器的电脑硬件架构，在对称多处理架构下，每个处理器的地位都是平等的，对资源的使用权限相同。现代多数的多处理器系统，都采用对称多处理架构，也被称为对称多处理系统（Symmetric multiprocessing system）。在这个系统中，拥有超过一个以上的处理器，这些处理器都连接到同一个共享的主存上，并由单一操作系统来控制。在多核心处理器的例子中，对称多处理架构，将每一个核心都当成是独立的处理器。
在对称多处理系统上，在操作系统的支持下，无论行程是处于用户空间，或是核心空间，都可以分配到任何一个处理器上运行。因此，行程可以在不同的处理器间移动，达到负载平衡，使系统的效率提升。


如果命令扩展被启用，通过命令行或 `START` 命令的外部命令调用会如下改变:

- 将文件名作为命令键入，非可执行文件可以通过文件关联调用。(例如，`WORD.DOC` 会调用跟 `.DOC` 文件扩展名关联的应用程序)。关于如何从命令脚本内部创建这些关联，请参阅 `ASSOC` 和 `FTYPE` 命令。
- 执行的应用程序是 32 位 GUI 应用程序时，`CMD.EXE` 不等应用程序终止就返回命令提示符。如果在命令脚本内执行，该新行为则不会发生。
- 如果执行的命令行的第一个符号是不带扩展名或路径修饰符的字符串 `CMD`，`CMD` 会被 `COMSPEC` 变量的数值所替换。这防止从当前目录提取 `CMD.EXE`。
- 如果执行的命令行的第一个符号没有扩展名，`CMD.EXE` 会使用 `PATHEXT` 环境变量的数值来决定要以什么顺序寻找哪些扩展名。`PATHEXT` 变量的默认值是`.COM;.EXE;.BAT;.CM`请注意，该语法跟 `PATH` 变量的一样，分号隔开不同的元素。
- 查找可执行文件时，如果没有相配的扩展名，看一看该名称是否与目录名相配。如果确实如此，`START` 会在那个路径上调用Explorer（文件资源管理器）。如果从命令行执行，则等同于对那个路径作 `CD /D`。


>COMSPEC环境变量指向命令行解释器的exe完整路径，windows中一般来说是`C:\Windows\system32\cmd.exe`，源自DOS操作系统。你可以在系统环境变量中找到它。
>PATHEXT环境变量，规定在 `Path` 变量中所指定的可执行文件的扩展名有哪些。我的机器上的值是：`.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW`。
其中不同后缀对应的文件格式为：

|后缀|文件格式|
|:-|:-|
|`.COM`|DOS的可执行命令文件|
|`.EXE`|Windows可执行文件|
|`.BAT/.CMD`|Windows批处理文件|
|`.VBS/.VBE`|Visual Basic Script / 加密的VBS脚本文件|
|`.JS/.JSE`|JavaScript脚本文件/加密的JavaScript脚本文件|
|`.WSF/.WSH` |Windows脚本文件(Windows Script)。
|`.MSC`|微软管理控制台MMC(Microsoft Management Console)用来添加/删除的嵌入式管理单元文件。典型如`gpedit.msc` `services.msc`。|
|`.PY/.PYW`|python脚本文件，.py/.pyw的差别是运行程序分别为python.exe/pythonw.exe，可能是安装python是由安装程序添加，Windows系统本身应该不会将.py作为可执行文件。|

### 3.11 set

显示、设置或删除 `cmd.exe` 环境变量。
```bat
SET [variable=[string]]
```
- `variable`  指定环境变量名。
- `string`    指定要指派给变量的一系列字符串。

要显示当前环境变量，键入不带参数的 `SET`。

如果命令扩展被启用，`SET` 会如下改变:

可仅用一个变量激活 `SET` 命令，等号或值不显示所有前缀匹配 `SET` 命令已使用的名称的所有变量的值。例如:
```bat
SET P
```
会显示所有以字母 P 打头的变量

如果在当前环境中找不到该变量名称，`SET` 命令将把 `ERRORLEVEL`设置成 1。

`SET` 命令不允许变量名含有等号。

在 `SET` 命令中添加了两个新命令行开关:
```bat
SET /A expression
SET /P variable=[promptString]
```
`/A` 命令行开关指定等号右边的字符串为被评估的数字表达式。该表达式评估器很简单并以递减的优先权顺序支持下列操作:

|运算符|含义|
|:-|:-|
|`()`|分组|
|`! ~ -`|一元运算符|
|`* / %`|算数运算符|
|`+ -`|算数运算符|
|`<< >>`|逻辑移位|
|`&`|按位“与”|
|`^`|按位“异或”|
|`\|`|按位“或”|
|`= *= /= %= += -= &= ^= \|= <<= >>=`|赋值|
|`,`|表达式分隔符|

如果你使用任何逻辑或取余操作符， 你需要将表达式字符串用引号扩起来。在表达式中的任何非数字字符串键作为环境变量名称，这些环境变量名称的值已在使用前转换成数字。如果指定了一个环境变量名称，但未在当前环境中定义，那么值将被定为零。这使你可以使用环境变量值做计算而不用键入那些 `%` 符号来得到它们的值。如果 `SET /A` 在命令脚本外的命令行执行的，那么它显示该表达式的最后值。该分配的操作符在分配的操作符左边需要一个环境变量名称。除十六进制有 `0x` 前缀，八进制有 `0` 前缀的，数字值为十进位数字。因此，`0x12` 与 `18` 和 `022`相同。请注意八进制公式可能很容易搞混: `08` 和 `09` 是无效的数字，因为 `8` 和 `9` 不是有效的八进制位数。(`&`)

`/P` 命令行开关允许将变量数值设成用户输入的一行输入。读取输入行之前，显示指定的 `promptString`。`promptString` 可以是空的。

环境变量替换已如下增强:

```bat
%PATH:str1=str2%
```
会扩展 `PATH` 环境变量，用 "str2" 代替扩展结果中的每个 "str1"。要有效地从扩展结果中删除所有的 "str1"，"str2" 可以是空的。"str1" 可以以星号打头；在这种情况下，"str1" 会从扩展结果的开始到 str1 剩余部分第一次出现的地方，都一直保持相配。

也可以为扩展名指定子字符串。
```bat
%PATH:~10,5%
```
会扩展 `PATH` 环境变量，然后只使用在扩展结果中从第 11 个(偏移量 10)字符开始的五个字符。如果没有指定长度，则采用默认值，即变量数值的余数。如果两个数字(偏移量和长度)都是负数，使用的数字则是环境变量数值长度加上指定的偏移量或长度。
```bat
%PATH:~-10%
```
会提取 `PATH` 变量的最后十个字符。
```bat
%PATH:~0,-2%
```
会提取 `PATH` 变量的所有字符，除了最后两个。

终于添加了延迟环境变量扩充的支持。该支持总是按默认值被停用，但也可以通过 `CMD.EXE` 的 `/V` 命令行开关而被启用/停用。请参阅 `CMD /?`。

考虑到读取一行文本时所遇到的目前扩充的限制时，延迟环境变量扩充是很有用的，而不是执行的时候。以下例子说明直接变量扩充的问题:
```bat
set VAR=before
if "%VAR%" == "before" (
    set VAR=after
    if "%VAR%" == "after" @echo If you see this, it worked
)
```
不会显示消息，因为在读到第一个 `IF` 语句时，两个 `IF` 语句中的 `%VAR%` 会被代替；原因是: 它包含 `IF` 的文体，`IF` 是一个复合语句。所以，复合语句中的 `IF` 实际上是在比较 "before" 和"after"，这两者永远不会相等。同样，以下这个例子也不会达到预期效果:

```bat
set LIST=
for %i in (*) do set LIST=%LIST% %i
echo %LIST%
```
原因是，它不会在目前的目录中建立一个文件列表，而只是将 `LIST` 变量设成找到的最后一个文件。这也是因为 `%LIST%` 在 `FOR` 语句被读取时，**只被扩充了一次**；而且，那时的 `LIST` 变量是空的。因此，我们真正执行的 FOR 循环是:

```bat
for %i in (*) do set LIST= %i
```
这个循环继续将 `LIST` 设成找到的最后一个文件。

延迟环境变量扩充允许你使用一个不同的字符(惊叹号)在执行时间扩充环境变量。如果延迟的变量扩充被启用，可以将上面例子写成以下所示，以达到预期效果:

```bat
set VAR=before
if "%VAR%" == "before" (
    set VAR=after
    if "!VAR!" == "after" @echo If you see this, it worked
)
```
```bat
set LIST=
for %i in (*) do set LIST=!LIST! %i
echo %LIST%
```
如果命令扩展被启用，有几个动态环境变量可以被扩展，但不会出现在 SET 显示的变量列表中。每次变量数值被扩展时，这些变量数值都会被动态计算。如果用户用这些名称中任何一个明确定义变量，那个定义会替代下面描述的动态定义:

- `%CD% `- 扩展到当前目录字符串。
- `%DATE% `- 用跟 DATE 命令同样的格式扩展到当前日期。
- `%TIME% `- 用跟 TIME 命令同样的格式扩展到当前时间。
- `%RANDOM%` - 扩展到 0 和 32767 之间的任意十进制数字。
- `%ERRORLEVEL%` - 扩展到当前 ERRORLEVEL 数值。
- `%CMDEXTVERSION%` - 扩展到当前命令处理器扩展版本号。
- `%CMDCMDLINE%`- 扩展到调用命令处理器的原始命令行。
- `%HIGHESTNUMANODENUMBER%` - 扩展到此计算机上的最高 NUMA 节点号。

用`set`定义的环境变量是临时的，通常用`set`来定义变量，定义的变量在在当前`cmd`进程中可见。任何局部的变量在调用`endlocal`、`exit`或者执行到达文件的末尾都会恢复。下列示例中第一个`%size%`识别，第二个为空。
```bat
@echo off
setlocal
set size=10
echo %size%
endlocal
echo %size%
```
当然也可以在脚本执行环境中去覆盖系统环境变量，比如`path`。

### 3.12 重定向 > & >>

输出重定向命令：
- `>` 清除文件中原有的内容后再写入。
- `>>` 追加内容到文件末尾，而不会清除原有的内容。
- `2>` 清除文件内容，并将命令执行的错误输出重定向到文件。
- `2>>` 追加命令执行的错误输出到文件末尾。

主要将本来显示在屏幕上的内容输出到指定文件中，指定文件如果不存在，则自动生成该文件。注意`>`和`>>`只有在命令执行成功时才会将结果重定向，如果要重定向执行失败的提示需要使用`2>`和`2>>`。和linux的重定向基本上是一致的。要输出`>`本身需要用`^>`转义，`echo ^>`。

输入重定向：
- `<` 从文件获取内容而不是屏幕上。

>三个标准文件（或者叫标准流）：使用数字0、1、2分别表示标准输入(stdin)、标准输出(stdout)、标准错误(stderr)，C语言中定义在头文件`<stdio.h>`中。

默认的`>`等同与`1>`，`>>`等同于`1>>`。

### 3.13 管道 |

指将一个命令的执行结果输出给另一个命令作为输入。语法是`cmd1 | cmd2`。
```bat
dir | find "test"
```
结果与下列执行结果相同：
```bat
dir > test.txt
find "test" < test.txt
```

### 3.14 & && ||

- `&` 顺序执行多条命令，而不管命令是否执行成功。
- `&&` 顺序执行多条命令，当碰到执行出错的命令后将不执行后面的命令。
- `||` 顺序执行多条命令，当碰到执行正确的命令后将不执行后面的命令。

```bat
find "hello" hello.txt & echo execute find
find "hello" hello.txt && echo success
find "hello" hello.txt || echo failed
```

### 3.15 setlocal endlocal

开始批处理文件中环境改动的本地化操作。在执行 `SETLOCAL` 之后所做的环境改动只限于批处理文件。要还原原先的设置，必须执行 `ENDLOCAL`。达到批处理文件结尾时，对于该批处理文件的每个尚未执行的 `SETLOCAL` 命令，都会有一个隐含的 `ENDLOCAL` 被执行。

```bat
SETLOCAL
```
如果启用命令扩展，则 `SETLOCAL` 更改如下:

`SETLOCAL` 批命令现在可以接受可选参数:
- `ENABLEEXTENSIONS / DISABLEEXTENSIONS` 启用或禁用命令处理器扩展。这些 参数比 `CMD /E:ON` 或 `/E:OFF` 开关有优先权。请参阅 `CMD /?` 获取详细信息。
- `ENABLEDELAYEDEXPANSION / DISABLEDELAYEDEXPANSION` 启用或禁用延缓环境变量 扩展。这些参数比 `CMD /V:ON` 或 `/V:OFF` 开关有优先权。请参阅 `CMD /?` 获取详细信息。

无论在 `SETLOCAL` 命令之前的设置是什么，这些修改会一直生效，直到出现相应的 `ENDLOCAL` 命令。

在给定参数的情况下，`SETLOCAL` 命令将设置 `ERRORLEVEL` 值。如果给定两个有效参数中的一个，另一个未给定，则该值为零。

通过以下方法，你可以在批脚本中使用此项来确定扩展是否可用:
```bat
VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS
IF ERRORLEVEL 1 echo Unable to enable extensions
```
此方法之所以有效，是因为在 `CMD.EXE` 的旧版本上，`SETLOCAL` 不设置 `ERRORLEVEL` 值。如果参数不正确，`VERIFY` 命令会将 `ERRORLEVEL` 值初始化为非零值。经过新版本上也不设置？那为什么要强调旧版本呢？

## 4. 环境变量详解

主要的Windows系统/用户环境变量：

- `ComSpec` : 命令行解释器可执行文件位置。
- `NUMBER_OF_PROCESSORS` ：用户电脑中处理器数量，Intel超线程的处理器那应该是逻辑处理器数量，并非物理核心数量。
- `OS` ：用户操作系统，我的Win10是`Windows_NT`。大概操作系统的另一个名称，win10对应版本是Windows NT 10.0。NT指New Technology。
- `Path` ：规定操作系统在指定的文件路径中查看可执行文件。通常安装一个软件之后需要它能够在命令行执行那么就可执行文件所在目录加到`Path`环境变量中，这应该是程序员最熟悉的环境变量。
- `PathExt` ：规定在 Path 变量中所指定的可执行文件的扩展名有哪些。
- `PROCESSOR_ARCHITECTURE` ：用户处理器架构。64位Intel Core处理器结果是AMD64。
- `PROCESSOR_IDENTIFIER` ：用户处理器。我的是Intel64 Family 6 Model 94 Stepping 3, GenuineIntel。
- `PROCESSOR_LEVEL` ：表明用户处理器的等级。我的是6。
- `PROCESSOR_REVISION` ：表明用户处理器的版本。我的是5e03。
- `TEMP/TMP`：系统/用户临时目录。一般软件使用过程中产生的临时文件都存储用户临时目录，用户临时目录一般是：`C:\Users\username\AppData\Local\Temp`，软件编写过程中也经常会获取`%temp%`系统变量用来生成临时文件。系统临时目录是：`C:\Windows\TEMP`。
- `windir` ：规定操作系统的系统目录的路径。一般来说是：`C:\Windows`。

还有一些在环境变量的列表里面找不到，在`set`列表中能够看到，估计是写在注册表里面的：
- `SystemDrive` ：系统驱动器，一般都是C盘。
- `systemroot` ：`C:\Windows`。
- `programfiles` ：`C:\Program Files`，一般来说第三方软件会默认安装在这个目录或者另一个带(X86)的目录。
- `appdata` ：用户数据目录，第三方软件的配置信息一般存放在这个目录中，一般是`C:\Users\username\AppData\Roaming`。
- `userprofile` ：当前用户的用户目录，默认是`C:\Users\username`，可以通过修改注册表修改。
- `ALLUSERSPROFILE` ： 所有用户共享的软件配置，`C:\ProgramData`。
- 还有一些与用户名、机器名、其他目录等。

一般第三方软件安装时可能会修改`path`环境变量，添加自己的可执行文件目录，一些还可能会添加新的环境变量。如果没有从命令行执行的需求的话，一般没有必要修改。

Win10更新一次，UI就会变一次，当前20H2版本的环境变量设置方法为：电脑，右键属性，高级系统设置，环境变量。
- 系统环境变量注册表位置：`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SessionManager\Environment\`。
- 用户环境变量注册表位置：`HKEY_CURRENT_USER\Environment`。

一些国产第三方软件会默认安装在`%appdata%`来防止UAC(User Account Control)检查，基本属于耍流氓的行为。安装软件最好安装在`%programfiles%`中，这样软件暗地里做了什么事情会通过UAC告诉你，当然如果你的UAC是从不通知，那当我没有说。当然也看情况，为单用户安装一般也会装在`%appdata%`中，我的建议都是为所有用户安装。

## 5. 常用Cmd命令

有关某个命令的详细信息，请键入 `HELP` 命令名
- `ASSOC      `    显示或修改文件扩展名关联。
- `ATTRIB     `    显示或更改文件属性。
- `BREAK      `    设置或清除扩展式 CTRL+C 检查。
- `BCDEDIT    `    设置启动数据库中的属性以控制启动加载。
- `CACLS      `    显示或修改文件的访问控制列表(ACL)。
- `CALL       `    从另一个批处理程序调用这一个。
- `CD         `    显示当前目录的名称或将其更改。
- `CHCP       `    显示或设置活动代码页数。
- `CHDIR      `    显示当前目录的名称或将其更改。
- `CHKDSK     `    检查磁盘并显示状态报告。
- `CHKNTFS    `    显示或修改启动时间磁盘检查。
- `CLS        `    清除屏幕。
- `CMD        `    打开另一个 Windows 命令解释程序窗口。
- `COLOR      `    设置默认控制台前景和背景颜色。
- `COMP       `    比较两个或两套文件的内容。
- `COMPACT    `    显示或更改 NTFS 分区上文件的压缩。
- `CONVERT    `    将 FAT 卷转换成 NTFS。你不能转换当前驱动器。
- `COPY       `    将至少一个文件复制到另一个位置。
- `DATE       `    显示或设置日期。
- `DEL        `    删除至少一个文件。
- `DIR        `    显示一个目录中的文件和子目录。
- `DISKPART   `    显示或配置磁盘分区属性。
- `DOSKEY     `    编辑命令行、撤回 Windows 命令并创建宏。
- `DRIVERQUERY`    显示当前设备驱动程序状态和属性。
- `ECHO       `    显示消息，或将命令回显打开或关闭。
- `ENDLOCAL   `    结束批文件中环境更改的本地化。
- `ERASE      `    删除一个或多个文件。
- `EXIT       `    退出 CMD.EXE 程序(命令解释程序)。
- `FC         `    比较两个文件或两个文件集并显示它们之间的不同。
- `FIND       `    在一个或多个文件中搜索一个文本字符串。
- `FINDSTR    `    在多个文件中搜索字符串。
- `FOR        `    为一组文件中的每个文件运行一个指定的命令。
- `FORMAT     `    格式化磁盘，以便用于 Windows。
- `FSUTIL     `    显示或配置文件系统属性。
- `FTYPE      `    显示或修改在文件扩展名关联中使用的文件类型。
- `GOTO       `    将 Windows 命令解释程序定向到批处理程序中某个带标签的行。
- `GPRESULT   `    显示计算机或用户的组策略信息。
- `GRAFTABL   `    使 Windows 在图形模式下显示扩展字符集。
- `HELP       `    提供 Windows 命令的帮助信息。
- `ICACLS     `    显示、修改、备份或还原文件和目录的 ACL。
- `IF         `    在批处理程序中执行有条件的处理操作。
- `LABEL      `    创建、更改或删除磁盘的卷标。
- `MD         `    创建一个目录。
- `MKDIR      `    创建一个目录。
- `MKLINK     `    创建符号链接和硬链接
- `MODE       `    配置系统设备。
- `MORE       `    逐屏显示输出。
- `MOVE       `    将一个或多个文件从一个目录移动到另一个目录。
- `OPENFILES  `    显示远程用户为了文件共享而打开的文件。
- `PATH       `    为可执行文件显示或设置搜索路径。
- `PAUSE      `    暂停批处理文件的处理并显示消息。
- `POPD       `    还原通过 PUSHD 保存的当前目录的上一个值。
- `PRINT      `    打印一个文本文件。
- `PROMPT     `    更改 Windows 命令提示。
- `PUSHD      `    保存当前目录，然后对其进行更改。
- `RD         `    删除目录。
- `RECOVER    `    从损坏的或有缺陷的磁盘中恢复可读信息。
- `REM        `    记录批处理文件或 CONFIG.SYS 中的注释(批注)。
- `REN        `    重命名文件。
- `RENAME     `    重命名文件。
- `REPLACE    `    替换文件。
- `RMDIR      `    删除目录。
- `ROBOCOPY   `    复制文件和目录树的高级实用工具
- `SET        `    显示、设置或删除 Windows 环境变量。
- `SETLOCAL   `    开始本地化批处理文件中的环境更改。
- `SC         `    显示或配置服务(后台进程)。
- `SCHTASKS   `    安排在一台计算机上运行命令和程序。
- `SHIFT      `    调整批处理文件中可替换参数的位置。
- `SHUTDOWN   `    允许通过本地或远程方式正确关闭计算机。
- `SORT       `    对输入排序。
- `START      `    启动单独的窗口以运行指定的程序或命令。
- `SUBST      `    将路径与驱动器号关联。
- `SYSTEMINFO `    显示计算机的特定属性和配置。
- `TASKLIST   `    显示包括服务在内的所有当前运行的任务。
- `TASKKILL   `    中止或停止正在运行的进程或应用程序。
- `TIME       `    显示或设置系统时间。
- `TITLE      `    设置 CMD.EXE 会话的窗口标题。
- `TREE       `    以图形方式显示驱动程序或路径的目录结构。
- `TYPE       `    显示文本文件的内容。
- `VER        `    显示 Windows 的版本。
- `VERIFY     `    告诉 Windows 是否进行验证，以确保文件正确写入磁盘。
- `VOL        `    显示磁盘卷标和序列号。
- `XCOPY      `    复制文件和目录树。
- `WMIC       `    在交互式命令 shell 中显示 WMI 信息。

大部分目录文件磁盘操作、也有一些系统设置进程之类的操作，这些操作应该都能找到相关的UI操作，用到时去查就行，没必要折磨自己。知道常用的就行，某些磁盘操作命令可能是危险的，请注意数据安全，确保知道自己在做什么。

批处理也大多用在需要批量处理文件目录操作的场景中，具体怎么写还得通过实践总结。

## 6. 脚本编写技巧

脚本编写实践技巧：
- 带空格的文件路径参数传进来时需要用`""`括起来，`%~1`可以去掉引号`""`。
- 通过`%~dp0`得到当前执行的脚本所在的目录，`%~nx0`得到脚本完全名称。
- 默认是启用扩展的，也可以用`setlocal ENABLEEXTENSIONS/DISABLEEXTENSIONS`来覆盖默认设置。
- `echo` `if` `set`将保留`%errorlevel%`现有值，通常通过正确编码用`NEQ`来判断`%errorlevel%`而不是类似于`if errorlevel 1`这种语法。而具体返回什么编码通常通过实验得到，有的时候会返回`9009`，这并不是完美的解决方案，但能解决问题。
- 程序执行失败就退出可以用`a.exe || exit /B 1`退出脚本不退出cmd，或者用`a.exe || goto :EOF`。
- 好的编写习惯：坚持使用0作为脚本成功执行返回值，正数作为失败返回。可以在脚本中定义错误码增加可读性，最好从1开始向上递增。
- 退出脚本时返回一个值：`exit /B retCode`，如果需要组合多个错误状态信息，也可以按位表示错误码，按位与到一起来返回。
- 输出重定向时可以在末尾附加`1>&2`将`stdout`当做`stderr`来处理，`2>&1`将`stderr`当做`stdout`处理。
- `NUL`是一个虚拟的设备(文件)，将`stdout`重定向到`NUL`，则会丢弃标准输出。可以用`2>NUL`屏蔽错误输出。
- 使用`CON`将命令行自己的输入重定向到一个文件，输入完成后只需要Ctrl+C发送一个EOF即可结束编辑：`TYPE CON > output.txt`。
- 新建一个空文本：`TYPE NUL > w.txt`。
- `if`中可以在在判断的表达式两边加上双引号，这样可以避免一些bug，比如变量不存在，导致语法错误。
- 通过`:label`标签配合`call :label`可以实现函数调用，函数结束时应该使用`got :EOF`或者`eixt /B [errorCode]`。
- 善用基于成功失败的条件执行：`||` `&&`。


## 7. 批处理脚本实例

### 7.1 文件路径相关

得到输入文件的完整路径：`test.bat ..\hello.c`
```bat
::test.bat
@echo off
echo %~f1
```
遍历输入目录所有文件：
```bat
::traverse.bat
@echo off
if exist %1 (
    for /R %1 %%v in (*) do echo %%v  
)
exit /B 0
```
遍历删除所有当前目录中所有子目录下的`overlays`目录：
```bat
@echo off
set parent=%~dp0
for /D %%I in (%parent%*) do rd /s /q %%I\overlays
exit /B 0
```

### 7.2 用户交互

让用户选择是否继续执行：
```bat
@ECHO OFF
SET /P confirm="Continue [y/n]>"
ECHO %confirm% | FINDSTR /I "n" > NUL && exit /B 1
echo continue to execute!
::more command
```

### 7.3 区分命令行执行和双击执行

根据当前`%comspec%`是否与`%cmdcmdline%`相同来判断是否命令行交互中执行脚本，如果是双击执行则在末尾`pause`方便查看。
```bat
@echo off
setlocal
set interactive=0
echo %comspec% | findstr /L %cmdcmdline% >NUL 2>&1
if %errorlevel% == 0 set interactive=1

echo do work

if "%interactive%"=="0" pause
endlocal
exit /B 0
```
通过搜索`%cmdcmdline%`中是否包含`%comspec%`的字符串来完成，如果是找到了`cmd.exe`文件，双击打开的命令行那么还是会理解为非交互执行，有BUG，但也只能做到这种程度了。

## 8. 我的评价

我的主观看法：
- 语法晦涩、简陋、不清晰，没有类型系统，写起来吃力。
- 源自DOS，有点过时了，很多语法很原始。
- 通过调用命令来组合功能，命令都很过时了，费劲去查帮助理解命令逻辑真的不明智。
- 如果需要实现的脚本逻辑有一点点复杂，那么选择`python`这种第三方脚本语言可能会降低很多心智负担，也会使脚本严谨很多。
- 总体来看，了解了个寂寞，用途仅限于读懂现有的可能遇到的脚本吧！

## 9. Windows管理深入

### 9.1 注册表

关于注册表，就不赘述了，见[Windows注册表内容](https://zhuanlan.zhihu.com/p/72194354)。

注册表是windows操作系统、硬件设备以及客户应用程序得以正常运行和保存设置的核心“数据库”，是一个非常巨大的树状分层结构的数据库系统。执行`regedit`可以打开注册表编辑器，方便查看和修改注册表项。

编写Windows客户端程序通常需要将一部分配置存储到注册表中，一般是在`HKEY_LOCAL_MACHINE\SOFTWARE`和`HKEY_CURRENT_USER\SOFTWARE`下存放软件的系统配置和用户配置。除此之外可能还会需要注册COM类等等操作会在其他位置增加注册表项。一般来说在安装时添加软件相关注册表项，卸载删除软件相关的注册表项，也有些软件卸载时不会删除，下次安装时就可以恢复配置。某些软件卸载时注册表未删干净导致卸载后再次安装安装不上的情况并不罕见，需要视相应的第三方软件来讨论。

Windows API中提供了[增删改查注册表项的接口](https://docs.microsoft.com/en-us/windows/win32/sysinfo/registry)，可以将注册表项导出为`.reg`文件，或者将要添加的注册表项写在`.reg`文件中，双击直接导入。


### 9.2 组策略

Windows操作系统的组策略是配置计算机中某一些用户组策略的程序，是系统管理员操作控制计算机程序、访问网络资源、操作行为、各种软件设置的最主要工具。

电脑的管理员可以通过组策略进行诸如禁止运行指定程序、锁定注册表编辑器、阻止访问命令提示符、禁止修改系统还原配置、修改用户组密码等等操作。

组策略设置就是在修改注册表中的配置。组策略使用了更完善的管理组织方法，可以对各种对象中的设置进行管理和配置，远比手工修改注册表方便、灵活，功能也更加强大。

Win+R，`gpedit.msc`打开组策略编辑器，具体的策略管理暂时也用不到，以后实践中总结。