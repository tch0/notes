<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Lua语言学习](#lua%E8%AF%AD%E8%A8%80%E5%AD%A6%E4%B9%A0)
  - [准备](#%E5%87%86%E5%A4%87)
    - [关于Lua](#%E5%85%B3%E4%BA%8Elua)
    - [编译Lua](#%E7%BC%96%E8%AF%91lua)
    - [IDE集成](#ide%E9%9B%86%E6%88%90)
  - [语法](#%E8%AF%AD%E6%B3%95)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Lua语言学习

## 准备
### 关于Lua
- Lua是巴西里约热内卢天主教大学（Pontifical Catholic University of Rio de Janeiro）里的一个由Roberto Ierusalimschy、Waldemar Celes 和 Luiz Henrique de Figueiredo三人所组成的研究小组于1993年开发的。
- Lua读音是LOO-ah(/ˈluːə/)，在葡萄牙语中是月亮的意思（巴西是前葡萄牙殖民地）。正确写法是大写字母L开头的Lua，不是lua也不是LUA。
- Lua是一个轻量的可以轻松嵌入其他语言项目中的脚本语言，可以用在任何类型项目中，广泛用在游戏中作为脚本。
    - 主要原因是Lua是脚本语言且足够高效，更新Lua脚本的逻辑不会造成程序的ABI不兼容，在国内主要用在手机游戏中以资源形式更新Lua脚本以实现频繁的热更新，从而绕过漫长的应用商店审查、和漫长的下载安装过程，以提升用户体验。
    - 国外的话则是由2001年魔兽世界的使用带火起来的，现在来说已经有了很多替代，比如quickjs。
    - 单纯的Lua并不具备太大生产力，就是一个很多人都在用的胶水语言。
- Lua使用ANSI C（C89）实现，使用源码分发，代码量不大，可以轻松将解释器嵌入C/C++（以及任何兼容C ABI的语言）项目中。
- lua使用MIT协议开源，可以用在任何商业项目中。
- 官方有一本书：[Programming in Lua](https://www.lua.org/pil/)，当前出到第四版。
- 特点：
    - 轻量、高效、可嵌入、可移植。
    - 特别是高效、快：有benchmark说明Lua是最快的脚本语言，没有之一。
    - 如果需要更快的速度，可以使用[LuaJIT](https://luajit.org/)，一个独立的Lua编译器，支持JIT编译（运行时将热点代码编译为native二进制以加速，广泛运用于Java等虚拟机语言）。
    - 使用C89编写，代码只有三万行，支持几乎所有平台（除了Windows/Unix，还支持Android、IOS、Windows Phone甚至嵌入式平台）。
    - 可以无缝嵌入C/C++等多种语言程序中（Java、C#、Fortran甚至其他脚本语言Perl、Ruby），可以轻松使用其他语言编写的库来扩充Lua的能力。
    - 支持面向过程、面向对象、函数式、数据驱动编程。
    - 动态类型，编译为字节码后运行在一个基于寄存器的虚拟机上。
    - 使用增量式垃圾收集的自动内存管理。
    - 适用于配置、脚本、快速原型设计。
- 官网：https://www.lua.org/
- github：https://github.com/lua/lua
- 文档：https://www.lua.org/docs.html
- Getting started：https://www.lua.org/start.html
- 手册：https://www.lua.org/manual/5.4/manual.html
- 教程：http://lua-users.org/wiki/TutorialDirectory

### 编译Lua

- 官网指南：https://www.lua.org/manual/5.4/readme.html
- 下载源码，当前版本5.4.4。

Linux下编译lua：
- 下载编译：
```sh
curl -R -O http://www.lua.org/ftp/lua-5.4.4.tar.gz
tar zxf lua-5.4.4.tar.gz
cd lua-5.4.4
make all test
```
- Linux中安装：
```sh
sudo make install
```
- Linux本地安装：
```sh
make install INSTALL_TOP=xxx
```

Windows中：
- 使用mingw-w64编译：（不过此时生成文件比较散乱，需要手动收集）
```sh
make all
```
- 可以直接运行下面脚本：
```bat
@echo off
:: ========================
:: build.bat
::
:: build lua to dist folder
:: tested with lua-5.3.5
:: based on:
:: https://medium.com/@CassiusBenard/lua-basics-windows-7-installation-and-running-lua-files-from-the-command-line-e8196e988d71
:: ========================
setlocal
:: you may change the following variable’s value
:: to suit the downloaded version
set work_dir=%~dp0
:: Removes trailing backslash
:: to enhance readability in the following steps
set work_dir=%work_dir:~0,-1%
set lua_install_dir=%work_dir%\dist
set compiler_bin_dir=%work_dir%\tdm-gcc\bin
set lua_build_dir=%work_dir%
set path=%compiler_bin_dir%;%path%
cd /D %lua_build_dir%
make PLAT=mingw
echo.
echo **** COMPILATION TERMINATED ****
echo.
echo **** BUILDING BINARY DISTRIBUTION ****
echo.
:: create a clean “binary” installation
mkdir %lua_install_dir%
mkdir %lua_install_dir%\doc
mkdir %lua_install_dir%\bin
mkdir %lua_install_dir%\include
mkdir %lua_install_dir%\lib
copy %lua_build_dir%\doc\*.* %lua_install_dir%\doc\*.*
copy %lua_build_dir%\src\*.exe %lua_install_dir%\bin\*.*
copy %lua_build_dir%\src\*.dll %lua_install_dir%\bin\*.*
copy %lua_build_dir%\src\luaconf.h %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\lua.h %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\lualib.h %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\lauxlib.h %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\lua.hpp %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\liblua.a %lua_install_dir%\lib\liblua.a
echo.
echo **** BINARY DISTRIBUTION BUILT ****
echo.
%lua_install_dir%\bin\lua.exe -e "print [[Hello!]];print[[Simple Lua test successful!!!]]"
echo.

:: configure environment variable
:: https://stackoverflow.com/a/21606502/4394850
:: http://lua-users.org/wiki/LuaRocksConfig
:: SETX - Set an environment variable permanently.
:: /m Set the variable in the system environment HKLM.

pause
```
- 然后将`dist`中的所有子目录复制到比如：`C:\lua-5.4.4`，然后将其中`bin`目录添加到path即可。

测试：
- 检查版本：
```sh
lua -v
```
- 两个可执行文件：
    - `lua`是解释器，解释执行。
    - `luac`是编译器，编译为字节码。

### IDE集成

VsCode：
- 原生的lua支持几乎只有高亮，很简陋，刚开始的话配合CodeRunner也基本能用。
- 可以选择官方插件[lua](https://github.com/LuaLS/lua-language-server)，提供代码感知、高亮等功能，配合lua Debug实现调试。
- 也可以选择腾讯的插件[LuaHelper](https://github.com/Tencent/LuaHelper)，名称还是叫lua，选Tencent开发的那一个就好，提供智能感知、高亮、调试等一系列必备功能。
- 这里选择LuaHelper。

## 语法

Reference Manual is all you need：https://www.lua.org/manual/5.4/manual.html

记录见：https://github.com/tch0/LearnLua

EBNF描述：
```EBNF
chunk ::= block
block ::= {stat} [retstat]
stat ::=  ‘;’ | 
    varlist ‘=’ explist | 
    functioncall | 
    label | 
    break | 
    goto Name | 
    do block end | 
    while exp do block end | 
    repeat block until exp | 
    if exp then block {elseif exp then block} [else block] end | 
    for Name ‘=’ exp ‘,’ exp [‘,’ exp] do block end | 
    for namelist in explist do block end | 
    function funcname funcbody | 
    local function Name funcbody | 
    local attnamelist [‘=’ explist] 
attnamelist ::=  Name attrib {‘,’ Name attrib}
attrib ::= [‘<’ Name ‘>’]
retstat ::= return [explist] [‘;’]
label ::= ‘::’ Name ‘::’
funcname ::= Name {‘.’ Name} [‘:’ Name]
varlist ::= var {‘,’ var}
var ::=  Name | prefixexp ‘[’ exp ‘]’ | prefixexp ‘.’ Name 
namelist ::= Name {‘,’ Name}
explist ::= exp {‘,’ exp}
exp ::=  nil | false | true | Numeral | LiteralString | ‘...’ |functiondef | 
    prefixexp | tableconstructor | exp binop exp | unop exp 
prefixexp ::= var | functioncall | ‘(’ exp ‘)’
functioncall ::=  prefixexp args | prefixexp ‘:’ Name args 
args ::=  ‘(’ [explist] ‘)’ | tableconstructor | LiteralString 
functiondef ::= function funcbody
funcbody ::= ‘(’ [parlist] ‘)’ block end
parlist ::= namelist [‘,’ ‘...’] | ‘...’
tableconstructor ::= ‘{’ [fieldlist] ‘}’
fieldlist ::= field {fieldsep field} [fieldsep]
field ::= ‘[’ exp ‘]’ ‘=’ exp | Name ‘=’ exp | exp
fieldsep ::= ‘,’ | ‘;’
binop ::=  ‘+’ | ‘-’ | ‘*’ | ‘/’ | ‘//’ | ‘^’ | ‘%’ | 
    ‘&’ | ‘~’ | ‘|’ | ‘>>’ | ‘<<’ | ‘..’ | 
    ‘<’ | ‘<=’ | ‘>’ | ‘>=’ | ‘==’ | ‘~=’ | 
    and | or
unop ::= ‘-’ | not | ‘#’ | ‘~’
```