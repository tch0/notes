
# 来入门一下Java吧！

教程：
- [廖雪峰Java教程](https://www.liaoxuefeng.com/wiki/1252599548343744)


## 0. 简介

### 0.1 关于Java
- 1995年发布1.0版本，Java之父[James Gosling](https://en.wikipedia.org/wiki/James_Gosling)，SUN公司财产，2009年被Orcale收购。
- Java源文件编译为字节码后运行在虚拟机（JVM）上，字节码与指令集或者操作系统无关，通过在多平台实现虚拟机来实现跨平台。
- JVM解释执行字节码，也就是所谓的解释器，并不会最终生成不依赖于JVM的目标平台的可执行文件。那么从理解上来说Java的跨平台就可以通过Java源码或者Java字节码来实现。
- Java字节码是二进制文件，可以理解为一层不依赖于硬件平台的指令集。
- Java即要编译也要解释执行，所以称其为混合型语言。那么可预见的多了一层之后Java的性能应该要优于解释型语言如Python，劣于编译型语言如C/C++。
- Java字节码向下兼容，低版本字节码可运行在高版本的JVM上。那么Java语言语法是否向下兼容呢？标准库是否向下兼容呢？
- Java是面向对象的编程语言，类似于C#，不同于C++多范式。当然这无关紧要。
- 名词术语：
    - Java SE: 标准版，标准的JVM和标准库
    - Java EE: 企业版，在Java SE的基础上加上了大量的API和库，以便方便开发Web应用、数据库、消息服务等
    - Java ME: 嵌入式版，针对嵌入式设备的“瘦身版”
    - JRE：Java Runtime Environment，包含虚拟机(JVM)和运行时库，只是运行编译好的Java程序的话只安装JRE即可。如果要编译则需要完整的JDK。
    - JDK: Java Development Kit，除了JRE还包括编译器调试器等基础设施。前面说的三个版本(SE/EE/ME)就是所谓的JDK。如[Java SE Development Kit 8](https://www.oracle.com/cn/java/technologies/javase/javase-jdk8-downloads.html)。安装了JDK则不需要再安装JRE。
    - JSR：Java Specification Request，Java规范，给Java平台添加工功能时先创建JSP规范，定义好接口，以保证兼容性。发布时还需要同时发布参考实现（RI，Reference Implementation，实现基础功能不保证性能给其他人实现做参考）和兼容性测试套件（TCK，Technology Compatibility Kit，用于兼容性测试）。
    - [JCP](https://jcp.org/en/home/index)：Java Community Process，负责审核JSR的组织。
- Java版本：1.0 ~ 1.9(1.5 ~ 1.9也称5.0 ~ 9.0)，之后10 ~ 15，最新版本Java15。
- 文件后缀：`.java`

### 0.2 开发环境

- 下载[JavaSE](https://www.oracle.com/java/technologies/javase-downloads.html)，安装。
- 配置环境变量：
    - Windows：`JAVA_HOME`指向安装目录，把`%JAVA_HOME%\bin`添加到path。
- `java -version`查看版本。
- `bin/`下的执行文件：
    - `java`: JVM运行java程序。
    - `javac`: 编译器，编译java源文件(`.java`)到字节码文件(`.class`)。
    - `jar`: 打包，把一组`.class`打包为`.jar`。
    - `javadoc`: 从java源码提取注释生成文档。
    - `jdb`: java调试器。
- 常用IDE：
    - [Eclipse](https://www.eclipse.org/): Java开发，基于插件结构。使用广泛，免费。
    - [IntelliJ Idea](https://www.jetbrains.com/idea/): `JetBrains`全家桶系列。商用，有免费和收费版。
- 使用Eclipse：
    - 安装：下载[Eclipse IDE for Java Developers](https://www.eclipse.org/downloads/packages/)，无需安装，解压即可使用。
    - 汉化：下载中文汉化包，[地址](https://www.eclipse.org/babel/downloads.php)，找到IDE对应版本汉化包，找到简体中文的包全部下载下来共20个左右，批量解压提取到当前位置，复制得到的两个文件夹`features/`和`plugins/`到安装目录。
    - 具体使用配置等略过不谈。

## 1. Java语言基础

### 1.1 hello,world!
```java
public class Hello
{
    public static void main(String[] args)
    {
        System.out.println("hello,world");
    }
}
```
从hello,world!可以看出来的细节：
- 语句以`;`结尾。
- 类似C#以某个类的静态main函数为入口，`main`的参数不同于C/C++，没有命令参数个数，因为数组可以确定大小。

### 1.2 基本约定

- 类名必须以英文字母开头，后接字母，数字和下划线的组合。
- 习惯以大写字母开头。
- 注释`/** */`,`//`同C++，多行注释需要写在类和方法的定义处，可以用于自动创建文档：
    ```java
    /**
    *  comments for javadoc
    */
    ```

### 1.3 基本数据类型

- 整型：只提供带符号类型
    - `byte`：1个字节
    - `short`：2个字节
    - `int`：4个字节
    - `long`：8个字节
- 浮点：IEEE-754标准浮点数，同C
    - `float`：4个字节
    - `double`：8个字节
- 字符：UniCode字符
    - `char`：2个字节
- 布尔：取值`true`和`false`。
    - `boolean`：大小取决于JVM实现，底层不提供。

### 1.4 基本运算

- 算术运算：`+` `-` `*` `/` `%` `+=` `-=` `*=` `/=` `%=` `++` `--` 同样有前置和后置的区别，同C
- 关系运算：`>` `>=` `<` `<=` `==` `!=` 
- 逻辑运算：`&&` `||` `!`
- 按位运算：`&` `|` `~` `^`
- 移位运算：`>>` `<<` 算术移位，`>>>`不考虑符号位逻辑右移，有无符号右移但没有左移，支持`<<=` `>>=`。

### 1.5 字符和字符串

字符`char`：
- 常量使用`''`
- 保存一个UniCode字符
- 可以用`\uXXXX`来表示
- 转义`\"` `\'` `\\` `\n` `\r` `\t` `\uXXXX`

字符串：
- `String`
- 字面值：`""`
- 可以用`+`连接字符串和其他任意数据类型，连接前会先将其他数据类型转换为字符串
- 多行字符串：前面的共同空格会被去掉，取最短的。
    ```java
    """
    就这就这？
    不会吧？不会吧？
    """
    ```
- 字符串是引用类型，可以指向一个空值`null`。类似于表示它是空指针，不指向任何值。空字符串和`null`当然是有区别的。引用类型指向一个值，基本类型持有一个值，非常好理解。

### 1.6 数组

- 定义：`type[] value;`
- 数组是引用类型，也就是说需要初始化：`int[] A = new int[size];`
- 创建后大小即固定，也就是指向的那个数组大小就固定，但是可以将其指向新的数组。
- `length`获取长度。
- 数组下标越界将引发运行时错误，抛出`java.lang.ArrayIndexOutOfBoundsException`异常。
- 初始化时直接指定元素值，则编译器会自动推导大小：`int[] A = new int[] {1,2};`，初始化时必须指定大小或者提供初始值，两者选一者，不能同时存在。可以进一步简写为`int[] A = {1,2}`。


### 1.7 输入输出

- 输出：`System.out.print`
- 换行输出：`System.out.println`
- 格式化输出：`System.out.printf`，占位符`%d`十进制 `%x`十六进制 `%f`浮点数 `%e`科学计数法 `%s`字符串，`%%`转义表示`%`本身
- 输入：

