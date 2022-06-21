# 使用Boost

首先，入门指南：[Boost Getting Started Guide](https://www.boost.org/doc/libs/1_79_0/more/getting_started/index.html)

## 入门

### Boost发行版

下载压缩包，解压。得到目录`boost_1_79_0/`，文件结构：
```
boost_1_79_0\ .................The “boost root directory”
   index.htm .........A copy of www.boost.org starts here
   boost\ .........................All Boost Header files
   lib\ .....................precompiled library binaries
   libs\ ............Tests, .cpps, docs, etc., by library
     index.html ........Library documentation starts here
     algorithm\
     any\
     array\
                     …more libraries…
   status\ .........................Boost-wide test suite
   tools\ ...........Utilities, e.g. Boost.Build, quickbook, bcp
   more\ ..........................Policy documents, etc.
   doc\ ...............A subset of all Boost library docs
```

重点：
- 文档中通常会用`$BOOST_ROOT`来表示这个boost根目录。
- 为了使用boost，boost的根目录应该在包含路径中。boost的所有头文件都在其下的`boost/`目录中，为`.hpp`后缀的文件。
- 然后使用时要包含boost头文件时就像这样：
```C++
#include <boost/whatever.hpp>
#include "boost/whatever.hpp"
```
- 根目录中的`doc/`仅包含了所有文档的一个子集。

### Header-only库

大部分的Boost库都是仅有头文件，其中包含模板和内联函数定义，不需要链接任何单独编译的二进制。

仅有的必须单独编译的Boost库列表：
- Boost.Chrono
- Boost.Context
- Boost.Filesystem
- Boost.GraphParallel
- Boost.IOStreams
- Boost.Locale
- Boost.Log (see build documentation)
- Boost.MPI
- Boost.ProgramOptions
- Boost.Python (see the Boost.Python build documentation before building and installing it)
- Boost.Regex
- Boost.Serialization
- Boost.Thread
- Boost.Timer
- Boost.Wave

一些库有可选的单独编译的二进制：
- Boost.Graph also has a binary component that is only needed if you intend to parse GraphViz files.
- Boost.Math has binary components for the TR1 and C99 cmath functions.
- Boost.Random has a binary component which is only needed if you're using random_device.
- Boost.Test can be used in “header-only” or “separately compiled” mode, although separate compilation is recommended for serious use.
- Boost.Exception provides non-intrusive implementation of exception_ptr for 32-bit _MSC_VER==1310 and _MSC_VER==1400 which requires a separately-compiled binary. This is enabled by #define BOOST_ENABLE_NON_INTRUSIVE_EXCEPTION_PTR.
- Boost.System is header-only since Boost 1.69. A stub library is still built for compatibility, but linking to it is no longer necessary.

### 使用Boost构建一个简单的程序

简单起见，首先来使用以下Header-only的Boost库：以下代码从标准输入读取一系列整数，将每个数乘以三之后，写到标准输出。
```C++
#include <boost/lambda/lambda.hpp>
#include <iostream>
#include <iterator>
#include <algorithm>

int main()
{
    using namespace boost::lambda;
    typedef std::istream_iterator<int> in;

    std::for_each(
        in(std::cin), in(), std::cout << (_1 * 3) << " " );
}
```
- 编译，运行（记住添加Boost根目录到包含路径，我的是`C:\LibsCpp\boost_1_79_0`）：
```
g++ -IC:\LibsCpp\boost_1_79_0 hello.cpp -o hello
```
- 写一个简单的`Makefile`：
```Makefile
CXX = g++
CXXFLAGS += -IC:\\LibsCpp\\boost_1_79_0

% : %.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@
```
- 即可一步编译：
```shell
make hello
```
- 在VsCode中工作时，配置`c_cpp_properties.json`，将该目录添加到包含目录以提供智能提示支持。
- IDE中比如VS就不多赘述了，添加了包含目录即可。

- 在Boost头文件中见到警告在很多编译器中是很正常的事情。确保不是你的代码报警告即可。

### 使用Boost的二进制库

- 需要使用Boost的b2构建工具构建从源代码需要的二进制，细节可以去看开头的链接中的文档。
- 或者直接下载[Windows中MSVC工具链下的Boost预编译二进制](https://sourceforge.net/projects/boost/files/boost-binaries/)。

最后：
- [B2 User Manual](https://www.boost.org/doc/libs/1_79_0/tools/build/doc/html/index.html#_introduction)
- [Index of all Boost library documentation](https://www.boost.org/doc/libs/1_79_0/libs/libraries.htm)

细节学习TODO。