<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [CMake](#cmake)
  - [1. 基础](#1-%E5%9F%BA%E7%A1%80)
    - [1.1 入门](#11-%E5%85%A5%E9%97%A8)
    - [1.2 头文件](#12-%E5%A4%B4%E6%96%87%E4%BB%B6)
    - [1.3 生成并链接静态库](#13-%E7%94%9F%E6%88%90%E5%B9%B6%E9%93%BE%E6%8E%A5%E9%9D%99%E6%80%81%E5%BA%93)
    - [1.4 生成动态链接库](#14-%E7%94%9F%E6%88%90%E5%8A%A8%E6%80%81%E9%93%BE%E6%8E%A5%E5%BA%93)
    - [1.5 安装](#15-%E5%AE%89%E8%A3%85)
    - [1.6 构建类型](#16-%E6%9E%84%E5%BB%BA%E7%B1%BB%E5%9E%8B)
    - [1.7 设置编译选项](#17-%E8%AE%BE%E7%BD%AE%E7%BC%96%E8%AF%91%E9%80%89%E9%A1%B9)
    - [1.8 查找第三方库](#18-%E6%9F%A5%E6%89%BE%E7%AC%AC%E4%B8%89%E6%96%B9%E5%BA%93)
    - [1.9 使用Clang编译](#19-%E4%BD%BF%E7%94%A8clang%E7%BC%96%E8%AF%91)
  - [2. 子项目](#2-%E5%AD%90%E9%A1%B9%E7%9B%AE)
  - [3. 实践](#3-%E5%AE%9E%E8%B7%B5)
    - [3.1 模板](#31-%E6%A8%A1%E6%9D%BF)
    - [3.2 常用参数](#32-%E5%B8%B8%E7%94%A8%E5%8F%82%E6%95%B0)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# CMake

首先[CMake](https://cmake.org/)是什么?
- 一个开源、跨平台的构建、测试、打包工具。CMake使用简单的编译器无关的配置文件来控制代码编译过程、生成Makefile和特定IDE的工程文件。最新版本是v3.20.x，[文档](https://cmake.org/documentation/)。CMake做的事情就是Windows中IDE比如VS，Linux中的Makefile做的事情。

为什么要使用CMake？
- CMake广泛用于C/C++语言，但也可以用于其他语言。如果写C++时有跨平台的需求，用CMake构建就可以忽略编译器和平台的差异，同时CMake相比Makefile这种基本专用于类Unix平台的工具更加简单，用CMake可以避免许多头发的掉落，减少心智负担。越来越多的人使用CMake，开源的C++项目基本都会使用CMake。

如何学习CMake？
- [CMake Reference Documentation](https://cmake.org/cmake/help/v3.20/)
- [知乎问题 - CMake 如何入门？](https://www.zhihu.com/question/58949190)


CMake做一些什么事情？
- C/C++代码需要跨平台编译，那首先代码应该是跨平台的，跨平台是代码应该做的事情，构建工具只负责指定包含路径和链接差异。
- CMake调用编译器如MSVC、gcc进行编译。


CMake使用文件`CMakeLists.txt`来管理工程的构建。


具体教程：- [ttroy50/cmake-examples](https://github.com/ttroy50/cmake-examples)


## 1. 基础

### 1.1 入门

当CMake在一个目录下工作时，会首先寻找并使用`CMakeLists.txt`文件，如果没有则会报错退出。

最小支持的CMake版本：
```cmake
cmake_minimum_required(VERSION 3.19)
```

指定项目名称，在有多个项目时就需要用项目名称引用某一个项目：
```cmake
project (project_name)
```

创建可执行文件:
`add_executable()`命令指定针对特定的源文件应该生成一个什么名称的可执行文件。
```cmake
add_executable(executable_name source_file_list)
```
一般来说将可执行文件名称指定为项目名一致，所以可以这样写：
```cmake
cmake_minimum_required(VERSION 3.19)
project (hello_cmake)
add_executable(${PROJECT_NAME} main.cpp)
```
其中`project()`函数会创建名为`${PROJECT_NAME}`值为`hello_cmake`。

二进制文件输出目录：
- 运行CMake的目录会保存在`CMAKE_BINARY_DIR`成为二进制文件的顶层目录。
- CMake支持就地生成(In-Place Build)二进制文件(即把对象文件生成到源文件同一个目录，最后生成的二进制文件和源文件拥有同样的目录结构)，也可支持统一生成在其他位置。

就地生成：
- 将所有临时文件生成在源文件同目录下，执行命令`CMake .`即是就地生成。

生成在其他位置：
- 执行 `mkdir bulid` `cd ./build` `make ..` 即是生成在新建的`build`目录下，参数是`CMakeLists.txt`所在目录。一般来说实践中大部分情况都是这样用。

如果编译器是MSVC(Windows环境下)，则会生成VS的解决方案和项目文件，如果在Linux下默认编译器会是GCC则会生成`Makefile`。然后使用VS或者Make来进一步生成库或者可执行文件。

### 1.2 头文件


CMake使用[一系列变量](https://gitlab.kitware.com/cmake/community/-/wikis/doc/cmake/Useful-Variables)来表示源码中一些有用的目录：


|变量|含义|
|:-|:-|
| CMAKE_SOURCE_DIR| The root source directory|
| CMAKE_CURRENT_SOURCE_DIR| The current source directory if using sub-projects and directories.|
| PROJECT_SOURCE_DIR| The source directory of the current cmake project.|
| CMAKE_BINARY_DIR| The root binary / build directory. This is the directory where you ran the cmake command.|
| CMAKE_CURRENT_BINARY_DIR| The build directory you are currently in.|
| PROJECT_BINARY_DIR| The build directory for the current project. |

主要就是源文件目录和二进制文件目录。

对于一个下列结构的包含头文件的项目：
```
├── CMakeLists.txt
├── include
│   └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp
```

可以创建一个`SOURCES`变量来保存所有源文件以用来编译：
```cmake
# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    src/Hello.cpp
    src/main.cpp
)
```

也可以使用`GLOB`命令加通配符查找所有匹配的源文件并指定给`SOURCES`变量：
```cmake
file(GLOB SOURCES "src/*.cpp")
```

现代CMake不推荐使用`set`直接设置源文件变量，直接使用`add_xxx`函数会更加方便。

当头文件和源文件分不同目录存放时，如果不是在源文件中`#include`使用相对路径从而能够查找到头文件，那么就需要在编译器参数(或者工程文件,最终都体现在编译器参数)中指定包含目录以确保编译器能够找到头文件。

在CMake对于头文件则使用`target_include_directories`([相关细节](https://cmake.org/cmake/help/v3.0/command/target_include_directories.html))，包含目录最后会体现到编译参数上：
```cmake
# Set the directories that should be included in the build command for this target
# when running g++ these will be included as -I/directory/path/
target_include_directories(hello_headers
    PRIVATE 
        ${PROJECT_SOURCE_DIR}/include
)
```

`PRIVATE`标识符包含的作用域，这对于库来说很重要。

`make`执行时不会显示详细信息，可以使用`make VERBOSE=1`显示详细编译信息以帮助调试。

### 1.3 生成并链接静态库

这里在同一个项目中使用静态库链接，但通常我们会将静态库配置为一个单独的项目，后面会详述。

目录结构：
```cmake
├── CMakeLists.txt
├── include
│   └── static
│       └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp
```

`add_library()`函数用来向库中添加源文件，这会用来创建一名为`libhello_library.a`的静态链接库(Linux下，Windows下则是`hello_library.lib`)：
```cmake
add_library(hello_library STATIC
    src/Hello.cpp
)
```

然后声明头文件目录(`static/`这一级目录在源文件中指定)：
```cmake
target_include_directories(hello_library
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)
```

使用`PUBLIC`会导致其中的包含目录用于以下地方：
- 编译这个库时。
- 编译链接了这个库的目标时。

对于`target_include_directories`来说三种不同作用域含义：

|关键字|含义|
|:-|:-|
|PRIVATE|目录被添加到目标的包含目录中|
|INTERFACE|目录被添加所有链接这个库的目标的包含目录|
|PUBLIC|综合PRIVATE和PUBLIC，目录被添加到目标包含目录和链接这个库的目标的包含目录|

对于项目中的公共头文件来说，一个常见的实践是：
- 使用一个子目录来区分不同的作用域，比如上面的`include/static/`目录。
- 在`target_include_directories`传入包含目录的根目录，即是`include/`。
- 然后在源文件中使用这个子目录来区分不同库的包含目录，`#include "static/Hello.h"`。
- 这样使用会有效减少一个项目使用了多个库时可能导致的文件名冲突。

链接一个库则使用`target_link_libraries` 函数：
```cmake
add_executable(hello_binary
    src/main.cpp
)

target_link_libraries( hello_binary
    PRIVATE
        hello_library
)
```

这样`hello_binary`可执行文件在链接时就会链接`hello_library`库。

### 1.4 生成动态链接库

示例文件结构：
```
├── CMakeLists.txt
├── include
│   └── shared
│       └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp
```

添动态链接库：
```cmake
add_library(hello_library SHARED
    src/Hello.cpp
)
```

这会创建一个`libhello_library.so`或者`hello_library.lib/.dll`的动态链接库。

`add_library`也可以用来创建一个目标别名:
```cmake
add_library(hello:library ALIAS hello_library)
```

然后当引用这个库链接到其他库或可执行文件时就可以使用这个别名了（只能在只读环境中使用）。更多解释参考[文档](https://cmake.org/cmake/help/v3.0/manual/cmake-buildsystem.7.html#alias-targets)。

链接到动态库：
```cmake
# Add an executable with the above sources
add_executable(hello_binary
    src/main.cpp
)

# link the new hello_library target with the hello_binary target
target_link_libraries( hello_binary
    PRIVATE 
        hello::library # alias above
)
```

可以看到和静态库区别就只有`add_library`中用`STATIC`还是`SHARED`而已。

当然动态库的跨平台需要由代码来实现，Windows中需要`__declspec(dllexport)/__declspec(dllimport)`声明导出导入的类和函数等。Linux中则不需要，一般通过宏来实现，在Windows中有导出符，Linux中定义为空。
```C++
#ifdef _MSC_VER
#ifdef XXX_DLL
#define DLL_EXPORT_IMPORT __declspec(dllexport)
#else
#define DLL_EXPORT_IMPORT __declspec(dllimport)
#endif
#else
#define DLL_EXPORT_IMPORT
#endif
```

在头文件声明中要导出的类或者函数前添加导出符`DLL_EXPORT_IMPORT`，每个动态库写一份上述宏定义被该模块所有头文件使用，`XXX_DLL`定义为该模块特有的名称，并在该模块预处理器中添加该宏的定义。主要为了Windows和Linux的动态库跨平台编译。

### 1.5 安装


### 1.6 构建类型

CMake可以使用不同配置来构建一个项目，可以指定不同的优化级别，：
- Release - 编译时添加`-O3 -DNDEBUG`标记。
- Debug - 添加`-g` 标记。
- MinSizeRel - `-Os -DNDEBUG`。
- RelWithDebInfo - `-O2 -g -DNDEBUG`。

通过执行时执行给`CMAKE_BUILD_TYPE`来确定：
```shell
cmake .. -DCMAKE_BUILD_TYPE=Release
```

默认情况下不添加任何标记，可以在`CMakeLists.txt`中设置默认标记：
```cmake
# Set a default build type if none was specified
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message("Setting build type to 'RelWithDebInfo' as none was specified.")
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
    "MinSizeRel" "RelWithDebInfo")
endif()
```


### 1.7 设置编译选项

- 使用`target_compile_definitions`函数。
- 设置给`CMAKE_C_FLAGS`或者` CMAKE_CXX_FLAGS`变量。


为每一个C++目标设置：
```cmake
target_compile_definitions(hello_exe
    PRIVATE EX3
)
```

则编译`hello_exe`时会添加`-DEX3`选项。如果目标是库，那么选择`PUBLIC`或者`INTERFACE`同样会决定头文件包含关系。

设置默认编译链接选项：
- `CMAKE_C_FLAGS` C编译选项。
- `CMAKE_CXX_FLAGS` C++编译选项。
- `CMAKE_LINKER_FLAGS` 链接选项。

这几个标记是全局的，所有目标都会使用。一般来说推荐使用`target_compile_definitions`。

同理可以在`CMakeLists.txt`中设置或者cmake命令参数中设置。

### 1.8 查找第三方库

`find_package`函数可以用来查找已安装第三方库。

### 1.9 使用Clang编译

CMake中用来控制编译器链接器的变量：
- `CMAKE_C_COMPILER`，C编译器。
- `CMAKE_CXX_COMPILER`，C++编译器。
- `CMAKE_LINKER`，链接器。

通过命令行传入或者在`CMakeLists.txt`中使用`set`设置可修改。
```shell
cmake .. -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
```


## 2. 子项目

在子项目的子目录中编写`CMakeLists.txt`，分开写即可。

然后在主`CMakeLists.txt`中添加对应的子项目：
```cmake
add_subdirectory(sub_project)
```



## 3. 实践

### 3.1 模板

```cmake
cmake_minimum_required(VERSION 3.20)
​
project(CMK-Hello
        VERSION 0.0.1
        DESCRIPTION "A Test Project"
        LANGUAGES CXX
)
# set language std
set(CMAKE_CXX_STANDARD 17)
# set language std and Disable fallback to a previous version
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# Disable CXX Syntax EXTENSIONS
set(CMAKE_CXX_EXTENSIONS OFF)
​
​
set(STATIC_HEADER "include/static/")
add_library(myLib STATIC src/STD_Suggestion.cpp ${STATIC_HEADER}STD_Suggestion.h)
​
# for #include "static/Suggestion.h"
target_include_directories(myLib
    INTERFACE
        include/
)
​
set(SOURCES
    src/hello.cpp
)
​
add_executable(HelloExe ${SOURCES})
​
target_link_libraries(HelloExe
    PRIVATE
        myLib
)
```

### 3.2 常用参数

cmake常用参数：
- `-A x64` 指定平台。
- `-D` 指定变量的值。
- `-S` 源目录。
- `-B` 构建目录。
- `-G` 选择生成器，如`Visual Studio 15 2017`。
- `-T` 指定编译器，如果生成器支持的话。

一般构建流程：
```shell
mkdir build
cd ./build/
cmake ..
make
```