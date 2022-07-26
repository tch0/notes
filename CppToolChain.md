<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [C++工具链使用总结](#c%E5%B7%A5%E5%85%B7%E9%93%BE%E4%BD%BF%E7%94%A8%E6%80%BB%E7%BB%93)
  - [GCC](#gcc)
    - [Linux安装最新版本的GCC](#linux%E5%AE%89%E8%A3%85%E6%9C%80%E6%96%B0%E7%89%88%E6%9C%AC%E7%9A%84gcc)
    - [Windows中安装最新版本的GCC](#windows%E4%B8%AD%E5%AE%89%E8%A3%85%E6%9C%80%E6%96%B0%E7%89%88%E6%9C%AC%E7%9A%84gcc)
    - [Windows中安装MinGW-w64](#windows%E4%B8%AD%E5%AE%89%E8%A3%85mingw-w64)
    - [Windows安装MSYS2](#windows%E5%AE%89%E8%A3%85msys2)
    - [Windows安装Cygwin](#windows%E5%AE%89%E8%A3%85cygwin)
  - [Clang && LLVM](#clang--llvm)
  - [MSVC](#msvc)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# C++工具链使用总结

## GCC

### Linux安装最新版本的GCC

通常Linux的包管理工具并不提供最新版本的GCC编译器，比如Ubuntu20.04现在这个时间（2022.7.25）的包管理中只提供GCC9.4.0。在这个版本中某些C++20的特性并没有得到支持。所以就需要自己手动安装最新本的GCC。

当前时间最新的GCC发布版是2022-05-06发布的12.1.0，以此为例：
- 首先访问[https://ftp.gnu.org/gnu/gcc/](https://ftp.gnu.org/gnu/gcc/)（或者[镜像](https://gcc.gnu.org/mirrors.html)）下载最新的gcc版本安装包。
- 解压`tar -zxvf gcc-12.1.0.tar.gz`。
- 进入目录中，执行`./contrib/download_prerequisites`下载依赖，依赖的路径在[https://gcc.gnu.org/pub/gcc/infrastructure/](https://gcc.gnu.org/pub/gcc/infrastructure/)。
    - 会下载一系列依赖库：GMP、MPFR、MPC、ISL等。
- 然后：
```sh
cd gcc-12.1.0
mkdir build
cd build
../configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
make && make install
```
- 安装过程会使用旧版本GCC（需要支持C++11）编译新版本GCC，所以如果没有GCC需要先使用包管理工具安装。
- 安装成功之后需要添加库路径（这里是`/usr/local/lib/../lib64`）到搜索路径：
    - 直接添加库路径到`/etc/ld.so.conf`。
    - `~/.bashrc`添加环境变量`export LD_LIBRARY_PATH="/usr/local/lib/../lib64"`。
    - 执行程序前临时设置环境变量：`export LD_LIBRARY_PATH="/usr/local/lib/../lib64"`。
- 修改原有的gcc符号链接指向新版本的GCC。
```sh
sudo ln -s /usr/local/bin/gcc /usr/bin/gcc -f
```
- 原有的GCC9.4.0依然可以通过`gcc-9`来访问。
- 配合WSL其实和在Windows中也没有什么区别了。

### Windows中安装最新版本的GCC

Windows中使用GCC工具链有多种选择：
- MinGW
- MinGW-w64
- Cygwin
- MSYS
- MSYS2
- 其他

首先来一点阅读资料：
- [[科普][FAQ]MinGW vs MinGW-W64及其它](https://github.com/FrankHB/pl-docs/blob/master/zh-CN/mingw-vs-mingw-v64.md)
- [Cygwin 和MinGW 的区别与联系是怎样的？](https://www.zhihu.com/question/22137175/answer/90908473)

简而言之：
- MinGW是GCC在Windows上的移植，但现在仅支持32位，且已不再更新，基本处于废弃状态。
- 所以有了MinGW-w64，提供了最新的支持，支持了64位，所以现在都应该使用MinGW-w64而非MinGW。其编译出来的程序算是Windows原生的。
- Cygwin作为工具链来说是在Windows中模拟了POSIX API以支持在Windows中运行Linux程序，所以可用性会更广一些。使用了POSIX API的Linux程序使用Cygwin重新编译后即可在Windows中运行。运行时需要依赖`cygwin1.dll`，相当于多了一个间接层。并且Cygwin并不只是工具链，而是相当于运行于Windows下的类UNIX子环境，提供了非常多UNIX环境下的工具。
- 由于Cygwin太重了，而单纯的工具链不够用，所以有了MSYS，相当于Cygwin的简化版，提供了类UNIX环境，以MinGW为工具链，在工具链之上还提供了基本的Linux工具，没有多少扩展能力。是辅助在Windows中以MinGW作为工具链进行开发的配套软件包。
- 由于MinGW更新缓慢且放弃支持64位，而使用MinGW的MSYS也是如此，所以有了比较新的MSYS2，fork了较新版本的Cygwin（做了修改），提供了包管理工具，工具链则使用MinGW-w64，而MSYS2提供的其他Linux工具则依然是源自于Cygwin的。

总结：
- 现在已经不再使用MinGW和MSYS了。
- MinGW-w64是单纯的工具链，而MSYS2做为一个类UNIX环境是配合这个工具链来用的。
- Cygwin是一个大而全的Windows下的类UNIX子系统。
- 使用MinGW-w64和Cygwin编译运行在UNIX上的程序都需要重新编译，而不能直接运行UNIX环境的可执行文件。
- 想一想git for Windows是不是能够运行少量UNIX命令，其实就是因为其中包含了一套Cygwin.dll，MSYS2亦是这样，不过他们和Cygwin都互不兼容。

如何选择：
- 如果只需要Windows上的GCC工具链编写标准C/C++程序那就选择MinGW-w64。
- 如果还想要执行一些Linux常用工具命令，想要一个类UNIX环境，那就选择MSYS2，其使用MinGW-w64工具链且相关工具来自Cygwin。
- 使用Cygwin都能实现上述说的事情，但是Cygwin会更重，还有间接层导致的可能的性能损失。
- 如果要编写跨平台但是使用了POSIX API的程序，那么Cygwin就成了仅有的选择。

到底该如何选择：
- 小孩子才做选择，为什么不全部装起来，要什么用什么呢？
- 注意不要同时将这些环境配在环境变量中。

### Windows中安装MinGW-w64

比较通常的选择是[MinGW-w64](https://www.mingw-w64.org/downloads/)：
- 到[https://github.com/niXman/mingw-builds-binaries/releases](https://github.com/niXman/mingw-builds-binaries/releases)上下载最新版安装包即可。
- 线程模型有两种选择Win32或者POSIX：
    - 见这里：[What's the difference between thread_posixs and thread_win32 in gcc port of Windows?](https://stackoverflow.com/questions/13212342/whats-the-difference-between-thread-posixs-and-thread-win32-in-gcc-port-of-wind0)
    - 简单说就是Win32线程模型与POSIX(pthread)有很大不同，而标准C++以`std::thread`为代表的线程模型与`pthread`很接近，所以在Linux上都是使用`pthread`来实现标准C++线程（这也就是为什么使用了线程就需要手动链接pthread）。
    - 如果在Windows中选择POSIX线程模型，就需要使用pthread在Win32上的一致libwinpthread，因此发布时需要带上`libwinpthread-1.dll`之类的库。
    - 至于Win32线程模型，现在的GCC依然还没有基于Win32线程模型实现的标准C++线程。就是说选择了Win32线程模型，那么其中的标准C++就是残废的，无法用。不过可以在其中使用Win32原生的多线程API。
    - 如果要使用标准C++线程，为了可移植性，应该选择POSIX线程模型。如果要用Win32原生API写多线程程序，那我为什么不选择MSVC呢？
- mcf线程模型：
    - 在Win32和POSIX线程模型之外，还有一个独立的[GCC with the MCF thread model](https://gcc-mcf.lhmouse.com/)，也实现了标准C++线程。不过二进制兼容性会比POSIX差一些。
- 异常模型有三种选择：dwarf、sjlj和seh
    - dwarf仅支持32位程序。
    - sjlj支持32位以及64位。
    - seh则仅支持64位程序。
    - 现在的系统一般都是64位，所以一般都选择sjlj或者seh，如果有编译32位程序的需求，那么需要sjlj。如果没有一般都是选择seh，两者ABI不兼容（也就是说同编译器同平台但不同异常模型的二进制是不兼容的）。
    - 当你的程序的各个模块使用不同的异常模型时，如果跨模块抛了异常（从一个模块的函数中抛出，被另一个模块的某个函数接住），那么程序很可能会Boom掉。
    - seh性能会比sjlj高一些。
- 最终这两个都是可以选的：
    - x86_64-12.1.0-release-posix-seh-rt_v10-rev3
    - x86_64-12.1.0-release-posix-sjlj-rt_v10-rev3
- 删除旧版本的path环境变量中的路径，添加新版本的`bin/`目录到path即可。
- 惯例复制一份`mingw32-make.exe`重命名为`make.exe`。
- 至此就可以用GCC在Windows上编译C++20程序了。
- 部署程序时除了编译出来的程序和必要的数据还得带上什么东西：
    - Windows环境中默认不包含MinGW这些运行时环境，所以如果使用动态链接那么还需要带上依赖的动态库：
    - 异常：`libgcc_s_sjlj.dll`这样的dll。
    - 用到了线程：`libwinpthread-1.dll`之类的dll。
    - 如果使用mcf线程部署：如`mcfgthread-9.dll`。
    - `libstdc++`。
    - 具体还是得看是什么环境，可能还需要其他一些额外的东西，可以将程序复制到没有环境的机器中测试。
    - 更简单可靠的方法还是使用 [Dependency Walker](http://www.dependencywalker.com/) 等工具查看依赖。

### Windows安装MSYS2

MinGW-w64作为工具链对于编写C++程序已经足够，但是如果要使用make，其中要使用比如`rm`这种工具那就非常糟心。那么MSYS2就是最好的选择了：
- 首先去[官网](https://www.msys2.org/)或者[清华镜像](https://mirrors.tuna.tsinghua.edu.cn/msys2/distrib/x86_64/)（或者其他镜像whatever）下去下载最新的64位MSYS2安装包。
- [为pacman包管理工具配置清华源](https://mirrors.tuna.tsinghua.edu.cn/help/msys2/)。
- 执行根目录下的`MSYS2.exe`进入shell。
- 执行`pacman -Sy`刷新软件包数据。
- 然后：
```sh
pacman -Ss xx #查询软件xx的信息
pacman -S xx #安装软件xx
```
- 安装make：
```sh
pacman -S make
```
- 安装gcc/g++（最新版本是11.3，通常不应该以这种方式安装，这是Cygwin的打开姿势）：
```sh
pacman -S gcc
pacman -S g++
```
- 一键安装所有MinGW-w64工具链（看起来更应该这样做，这里的gcc就是MinGW-w64的最新版本12.1.0，这两个工具链是存在本质差别的，直接安装的gcc编译生成的文件依赖于Cygwin的转换层，而MinGW-w64是windows原生的）：
```sh
pacman -S mingw-w64-x86_64-toolchain
```
- 这里装了`make`就不需要搞将`mingw32-make.exe`重命名为`make.exe`这种把戏了。
- 进入MinGW-w64 Shell（或者直接找到MSYS2根目录的mingw64.exe启动）：
```sh
/mingw64.exe
```
- 在`MinGW-w64 Shell`中才能够使用MinGW-w64的工具链（应该是类似于重新启动了一个bash，并添加了一些环境变量）。
- MSYS2支持的原生工具链区别：
    - mingw64：GCC编译，链接到msvcrt（即msvcrt + listdc++ + GCC）。
    - ucrt64：GCC编译，链接到ucrt（即ucrt + libstdc++ + GCC）。
    - clang64：Clang编译，链接到ucrt（即ucrt + libc++ + Clang）。
    - 当然其实还有clang32，clangarm64，mingw32都比较好理解。
    - 需要安装其他工具链的话同理（其他的当前来说没有什么必要）。
    ```sh
    pacman -S mingw-w64-ucrt-x86_64-toolchain
    pacman -S mingw-w64-clang-x86_64-toolchain
    ```
    - [MSYS2的相关文档](https://www.msys2.org/docs/environments/)
    - 不同环境的区别在于环境变量、默认编译器链接器、架构、使用的系统变量、链接到的库等。
    - 这些环境仅仅是`MSYSTEM`这个系统变量的取值不同，比如`mingw64 ucrt64 clang64`等。
- 通常来说一般不要直接将通过MSYS2安装的MinGW-w64工具链添加到系统变量。通过MSYS2提供的Shell来使用即可。
- 现在可以通过开始菜单的各个快捷方式愉快地启动MinGW-w64/Clang Shell环境了：
    - MSYS2 MinGW x64
    - MSYS2 MinGW UCRT x64
    - MSYS2 MinGW Clang x64
    - MSYS2 MinGW x86

各种环境区别：
- 编译器：GCC vs LLVM/Clang
    - C++标准库区别libstdc++ vs libc++
    - 链接器：LD vs LLD，LLD更快，LD特性更丰富
    - Clang有对TLS（Thread local Storage）的本地支持
    - Clang提供ASAN（内存分析）工具
    - Clang支持ARM64/AArch64
- 运行时：MSVCRT vs UCRT，微软的两个不同的标准库
    - MSVCRT(Microsoft Visual C++ runtime)在所有Windows版本中可用，不兼容C99且缺失了某些特性。
    - UCRT（Universal C Runtime）是VS默认使用的新版本C运行时。和MSVC有更好的兼容性，在Win10上是默认运行时，在更早的Windows版本使用需要自行安装。

配置MSYS2到Windows Terminal：
- 见[MSYS2 - Documentaion - Terminals](https://www.msys2.org/docs/terminals/)
- 快速配置：
```json
// MSYS2 MSYS
{
    "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d114}",
    "name": "MSYS / MSYS2",
    "commandline": "C:/CppToolChain/MSYS2/msys2_shell.cmd -defterm -here -no-start -msys",
    "startingDirectory": "C:/CppToolChain/MSYS2/home/%USERNAME%",
    "icon": "C:/CppToolChain/MSYS2/msys2.ico",
    "fontFace": "Lucida Console",
    "fontSize": 12,
    "hidden": false,
    "colorScheme" : "One Half Dark"
},
// MSYS2 MinGW x64
{
    "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d115}",
    "name": "MINGW64 / MSYS2",
    "commandline": "C:/CppToolChain/MSYS2/msys2_shell.cmd -defterm -here -no-start -mingw64",
    "startingDirectory": "C:/CppToolChain/MSYS2/home/%USERNAME%",
    "icon": "C:/CppToolChain/MSYS2/mingw64.ico",
    "fontFace": "Lucida Console",
    "fontSize": 12,
    "hidden": false,
    "colorScheme" : "One Half Dark"
},
// MSYS2 MinGW UCRT x64
{
    "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d116}",
    "name": "UCRT64 / MSYS2",
    "commandline": "C:/CppToolChain/MSYS2/msys2_shell.cmd -defterm -here -no-start -ucrt64",
    "startingDirectory": "C:/CppToolChain/MSYS2/home/%USERNAME%",
    "icon": "C:/CppToolChain/MSYS2/ucrt64.ico",
    "fontFace": "Lucida Console",
    "fontSize": 12,
    "hidden": false,
    "colorScheme" : "One Half Dark"
},
// MSYS2 MinGW Clang x64
{
    "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d117}",
    "name": "Clang64 / MSYS2",
    "commandline": "C:/CppToolChain/MSYS2/msys2_shell.cmd -defterm -here -no-start -clang64",
    "startingDirectory": "C:/CppToolChain/MSYS2/home/%USERNAME%",
    "icon": "C:/CppToolChain/MSYS2/clang64.ico",
    "fontFace": "Lucida Console",
    "fontSize": 12,
    "hidden": false,
    "colorScheme" : "One Half Dark"
}
```
- 集成到终端的命令：
```sh
C:/CppToolChain/MSYS2/msys2_shell.cmd -defterm -here -no-start -xxx
```

集成MSYS2到VsCode终端：
- `"terminal.integrated.profiles.windows"`中添加：
```json
"MinGW64 MSYS2" : {
    "path": "C:\\CppToolChain\\MSYS2\\msys2_shell.cmd",
    "args": ["-defterm", "-here", "-no-start", "-mingw64"],
    "overrideName":true
},
"UCRT64 MSYS2" : {
    "path": "C:\\CppToolChain\\MSYS2\\msys2_shell.cmd",
    "args": ["-defterm", "-here", "-no-start", "-ucrt64"],
    "overrideName":true
},
"Clang64 MSYS2" : {
    "path": "C:\\CppToolChain\\MSYS2\\msys2_shell.cmd",
    "args": ["-defterm", "-here", "-no-start", "-clang64"],
    "overrideName":true
},
```
- 同样道理不再赘述。

MSYS2中必备的工具：
- Windows中的path在MSYS2中是不可用的，所以MSYS2中安装的工具性能可能会比原生的程序低一点。
```sh
pacman -S git
pacman -S vim
```

MSYS2在VsCode中不添加环境变量的情况下调试，尚待研究。

### Windows安装Cygwin

如果想把UNIX下的使用了POSIX API的程序移植到Windows下来却又不想重写一遍，或者想混合POSIX API以及Win32 API编程（什么逆天的想法），那么Cygwin就是你所需要的。

Todo yet!

## Clang && LLVM

Todo yet!

## MSVC

通常来说我们使用VS，每个人都会的东西就不需要赘述了。