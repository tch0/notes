<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [入门一下Java](#%E5%85%A5%E9%97%A8%E4%B8%80%E4%B8%8Bjava)
  - [0. 简介](#0-%E7%AE%80%E4%BB%8B)
    - [0.1 关于Java](#01-%E5%85%B3%E4%BA%8Ejava)
    - [0.2 开发环境](#02-%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83)
    - [0.3 基本Eclipse使用](#03-%E5%9F%BA%E6%9C%ACeclipse%E4%BD%BF%E7%94%A8)
  - [1. Java语言基础](#1-java%E8%AF%AD%E8%A8%80%E5%9F%BA%E7%A1%80)
    - [1.1 hello,world!](#11-helloworld)
    - [1.2 基本约定](#12-%E5%9F%BA%E6%9C%AC%E7%BA%A6%E5%AE%9A)
    - [1.3 基本数据类型](#13-%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B)
    - [1.4 基本运算](#14-%E5%9F%BA%E6%9C%AC%E8%BF%90%E7%AE%97)
    - [1.5 字符和字符串](#15-%E5%AD%97%E7%AC%A6%E5%92%8C%E5%AD%97%E7%AC%A6%E4%B8%B2)
    - [1.6 数组](#16-%E6%95%B0%E7%BB%84)
    - [1.7 输入输出](#17-%E8%BE%93%E5%85%A5%E8%BE%93%E5%87%BA)
    - [1.8 流程控制——条件](#18-%E6%B5%81%E7%A8%8B%E6%8E%A7%E5%88%B6%E6%9D%A1%E4%BB%B6)
    - [1.9 流程控制——循环](#19-%E6%B5%81%E7%A8%8B%E6%8E%A7%E5%88%B6%E5%BE%AA%E7%8E%AF)
    - [1.10 命令行参数](#110-%E5%91%BD%E4%BB%A4%E8%A1%8C%E5%8F%82%E6%95%B0)
  - [2. java面向对象](#2-java%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1)
    - [2.1 类和对象](#21-%E7%B1%BB%E5%92%8C%E5%AF%B9%E8%B1%A1)
    - [2.2 方法](#22-%E6%96%B9%E6%B3%95)
    - [2.3 继承](#23-%E7%BB%A7%E6%89%BF)
    - [2.4 多态](#24-%E5%A4%9A%E6%80%81)
    - [2.5 抽象类](#25-%E6%8A%BD%E8%B1%A1%E7%B1%BB)
    - [2.6 接口](#26-%E6%8E%A5%E5%8F%A3)
    - [2.7 静态字段与方法](#27-%E9%9D%99%E6%80%81%E5%AD%97%E6%AE%B5%E4%B8%8E%E6%96%B9%E6%B3%95)
    - [2.8 包](#28-%E5%8C%85)
    - [2.9 作用域](#29-%E4%BD%9C%E7%94%A8%E5%9F%9F)
    - [2.10 嵌套类](#210-%E5%B5%8C%E5%A5%97%E7%B1%BB)
    - [2.11 classpath](#211-classpath)
    - [2.12 jar包](#212-jar%E5%8C%85)
    - [2.13 模块](#213-%E6%A8%A1%E5%9D%97)
  - [3. Java核心类](#3-java%E6%A0%B8%E5%BF%83%E7%B1%BB)
    - [3.1 字符串与编码](#31-%E5%AD%97%E7%AC%A6%E4%B8%B2%E4%B8%8E%E7%BC%96%E7%A0%81)
    - [3.2 String操作类](#32-string%E6%93%8D%E4%BD%9C%E7%B1%BB)
    - [3.3 包装类型](#33-%E5%8C%85%E8%A3%85%E7%B1%BB%E5%9E%8B)
    - [3.4 JavaBean](#34-javabean)
    - [3.5 枚举类](#35-%E6%9E%9A%E4%B8%BE%E7%B1%BB)
    - [3.6 记录类](#36-%E8%AE%B0%E5%BD%95%E7%B1%BB)
    - [3.7 BigInteger](#37-biginteger)
    - [3.8 BigDecimal](#38-bigdecimal)
    - [3.9 常用工具类](#39-%E5%B8%B8%E7%94%A8%E5%B7%A5%E5%85%B7%E7%B1%BB)
    - [3.10 BigInteger实现分析](#310-biginteger%E5%AE%9E%E7%8E%B0%E5%88%86%E6%9E%90)
  - [4. 异常处理](#4-%E5%BC%82%E5%B8%B8%E5%A4%84%E7%90%86)
    - [4.1 Java异常](#41-java%E5%BC%82%E5%B8%B8)
    - [4.2 捕获异常](#42-%E6%8D%95%E8%8E%B7%E5%BC%82%E5%B8%B8)
    - [4.3 抛出异常](#43-%E6%8A%9B%E5%87%BA%E5%BC%82%E5%B8%B8)
    - [4.4 自定义异常](#44-%E8%87%AA%E5%AE%9A%E4%B9%89%E5%BC%82%E5%B8%B8)
    - [4.5 NullPointerException](#45-nullpointerexception)
    - [4.6 断言](#46-%E6%96%AD%E8%A8%80)
    - [4.7 使用JDK Logging](#47-%E4%BD%BF%E7%94%A8jdk-logging)
    - [4.8 Commons Logging](#48-commons-logging)
    - [4.9 Log4j](#49-log4j)
    - [4.10 SLF4J & Logback](#410-slf4j--logback)
  - [5. 反射](#5-%E5%8F%8D%E5%B0%84)
    - [5.1 Class类](#51-class%E7%B1%BB)
    - [5.2 访问字段](#52-%E8%AE%BF%E9%97%AE%E5%AD%97%E6%AE%B5)
    - [5.3 访问方法](#53-%E8%AE%BF%E9%97%AE%E6%96%B9%E6%B3%95)
    - [5.4 调用构造方法](#54-%E8%B0%83%E7%94%A8%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95)
    - [5.5 获取继承关系](#55-%E8%8E%B7%E5%8F%96%E7%BB%A7%E6%89%BF%E5%85%B3%E7%B3%BB)
    - [5.6 动态代理](#56-%E5%8A%A8%E6%80%81%E4%BB%A3%E7%90%86)
  - [6. 注解](#6-%E6%B3%A8%E8%A7%A3)
    - [6.1 使用注解](#61-%E4%BD%BF%E7%94%A8%E6%B3%A8%E8%A7%A3)
    - [6.2 定义注解](#62-%E5%AE%9A%E4%B9%89%E6%B3%A8%E8%A7%A3)
    - [6.3 处理注解](#63-%E5%A4%84%E7%90%86%E6%B3%A8%E8%A7%A3)
    - [6.4 TODO](#64-todo)
  - [7. 泛型](#7-%E6%B3%9B%E5%9E%8B)
    - [7.1 什么是泛型](#71-%E4%BB%80%E4%B9%88%E6%98%AF%E6%B3%9B%E5%9E%8B)
    - [7.2 使用泛型](#72-%E4%BD%BF%E7%94%A8%E6%B3%9B%E5%9E%8B)
    - [7.3 编写泛型](#73-%E7%BC%96%E5%86%99%E6%B3%9B%E5%9E%8B)
    - [7.4 泛型实现方法](#74-%E6%B3%9B%E5%9E%8B%E5%AE%9E%E7%8E%B0%E6%96%B9%E6%B3%95)
    - [7.5 extends通配符](#75-extends%E9%80%9A%E9%85%8D%E7%AC%A6)
    - [7.6 super通配符](#76-super%E9%80%9A%E9%85%8D%E7%AC%A6)
    - [7.7 泛型和反射](#77-%E6%B3%9B%E5%9E%8B%E5%92%8C%E5%8F%8D%E5%B0%84)
  - [8. 集合](#8-%E9%9B%86%E5%90%88)
    - [8.1 Java集合](#81-java%E9%9B%86%E5%90%88)
    - [8.2 List](#82-list)
    - [8.3 Map & HashMap](#83-map--hashmap)
    - [8.4 EnumMap](#84-enummap)
    - [8.5 TreeMap](#85-treemap)
    - [8.6 Properties](#86-properties)
    - [8.7 Set](#87-set)
    - [8.8 Queue](#88-queue)
    - [8.9 PriorityQueue](#89-priorityqueue)
    - [8.10 Deque](#810-deque)
    - [8.11 Stack](#811-stack)
    - [8.12 Iterator](#812-iterator)
    - [8.13 Collections](#813-collections)
  - [9.0 IO](#90-io)
  - [TODO](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


# 入门一下Java

Java教程：[廖雪峰Java教程](https://www.liaoxuefeng.com/wiki/1252599548343744)

Eclipse教程：[Eclipse 教程](https://www.runoob.com/eclipse/eclipse-tutorial.html)

JavaSE15 API文档：[Java® Platform, Standard Edition & Java Development Kit Version 15 API Specification](https://docs.oracle.com/en/java/javase/15/docs/api/index.html)

写在前面：仅仅是关键性知识点的笔记，用来串联、查阅和回顾，并不系统也并不细节。

## 0. 简介

### 0.1 关于Java
- 1995年发布1.0版本，Java之父[James Gosling](https://en.wikipedia.org/wiki/James_Gosling)，SUN公司财产，2009年被Orcale收购。
- Java源文件编译为字节码后运行在虚拟机（JVM）上，字节码与指令集或者操作系统无关，通过在多平台实现虚拟机来实现跨平台。
- JVM解释执行字节码，也就是所谓的解释器， 并不会最终生成不依赖于JVM的目标平台的可执行文件。那么从理解上来说Java的跨平台就可以通过Java源码或者Java字节码来实现。
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
    - 具体配置等略过不谈，网上一大把。

### 0.3 基本Eclipse使用

Eclipse基本调试操作：
- `Ctrl+Shift+B` 添加移除断点
- `Ctrl+F11` 开始运行
- `F11` 开始调试
- `F5` 单步跳入，能跳入(语句有函数调用)就跳入，不能就下一条语句
- `Ctrl+F5` 单步执行选择，能跳入就跳入，不能就不执行
- `F6` 单步跳过，下一条语句
- `F7` 单步跳出，跳出这个函数执行(只执行完这个函数调用，回到调用语句)
- `F8` 继续，执行到下一个断点
- `Ctrl+F2` 终止调试
- `Ctrl+R` 运行至行
- `Ctrl+Alt+B` 跳过所有断点，也就是无效化所有断点
- `Drop to Frame` 拖放至帧(这什么破翻译，真就直译？)，跳转到当前执行函数的开头开始执行，不会改变一个全局数据原有的值，只是切换了栈帧。
- 跳过、跳出、运行至行等能够运行多行代码的操作执行过程中遇到断点都会断住。
- 首选项，调试，单步执行过滤，过滤不需要关注的类。
- 配合调用堆栈(位于调试窗口)、本地变量监视、条件断点、表达式求值，常用的调试操作也就这些了。

其他提高效率的快捷键：
- `Ctrl+O` 右键快速大纲，用于搜索当前文件中的字段或者方法以快速跳转
- `Ctrl+F3` 显示当前符号的快速大纲
- `Ctrl+T` 右键快速类型层次结构，显示派生层次结构
- `F3` 转到一个符号的声明
- `Ctrl+F` 查找符号
- `Ctrl+Shift+G` 搜索当前工作空间所有该符号引用位置
- `Alt + ->/<-` 代码浏览位置跳转
- `Ctrl+H` 搜索，有精细的搜索选项，类型、方法、包等。
- `Ctrl+Shift+R` 文件搜索
- `Alt+Shift+R` 重命名符号
- IDE内运行终端：`Ctrl+Alt+Shift+T`

说实话有些快捷键实在是有点太啰嗦，一点都起不到快捷的作用，说的就是`Alt+Sift+Q`加上一个键的那一堆，也懒得自己改，不要增加太多心智负担，记住常用的就好。如`Ctrl+O`, `F3`, `Ctrl+T`，加上常用的查找和调试快捷键就行。快捷键的使用必须要能够方便到在两秒钟内定位到想要的某个类、方法、文件、某个符号的所有引用、某个类的派生结构层次才算是舒服。

Eclipse导入第三方库：
- 右键项目，属性，Java构建路径，库，类路径(就是`classpath`)，添加外部JAR，选择JAR添加之后即可导入到该项目中。然后在包资源管理器中`src`、JRE系统同级的引用的库中就有这个库了。并且这个库的路径是绝对路径。
- 也可以在项目中新建文件夹，然后将`jar`文件复制到这个目录中，右键选中该jar，构建路径，添加到构建路径后同样会被加入到引用的库中，此时`jar`被加入到了项目中，如果删除文件夹会移除依赖，库的路径是以相对路径保存的。或者类路径右边选择"添加JAR"就是添加项目内的`Jar`路径。

启用预览特性：
- 右键项目，属性，Java编译器，取消JDK一致性，并勾选`Enable preview features for Java 15`。并且可以设置警告等级。

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

- 创建后大小即固定，也就是指向的那个数组大小就固定，但是可以将其指向新的数组。
- 数组下标越界将引发运行时错误，抛出`java.lang.ArrayIndexOutOfBoundsException`异常。
- 初始化时直接指定元素值，则编译器会自动推导大小：`int[] A = new int[] {1,2};`，初始化时必须指定大小或者提供初始值，两者选一者，不能同时存在。可以进一步简写为`int[] A = {1,2}`。
- 定义: `type[]`
- 长度: `length`
- 取成员: `[]`
- range-for: `for(type val : arr)`
- 转换为`String`: `Arrays.toString()`，输出`[elem1, elem2, ..., elemLast]`，需要`import java.util.Arrays;`
- 排序: `Arrays.sort()`
- 多维数组: `type[][]`，即是数组的数组，不要求每个元素统一大小。
- 多维数组转字符串: `Arrays.deepToString()`

### 1.7 输入输出

- 输出：`System.out.print`
- 换行输出：`System.out.println`
- 格式化输出：`System.out.printf`，占位符`%d`十进制 `%x`十六进制 `%f`浮点数 `%e`科学计数法 `%s`字符串，`%%`转义表示`%`本身。详细信息见文档[java.util.Formatter](https://docs.oracle.com/en/java/javase/15/docs/api/java.base/java/util/Formatter.html)。
- 输入：
```java
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String sInputStr = scanner.nextLine(); // 下一行
        int iNextInt = scanner.nextInt(); // 下一个输入解析为整数
    }
}
```
很好理解，但也感觉很啰嗦，可能的确需要啰嗦才能好理解吧。

### 1.8 流程控制——条件

和C/C++如出一辙：同样，只有一条语句时`{}`可以省略。
```java
if (condition) {
}
else if (other-condition) {
}
else {
}
```

对引用变量`==`判等时，含义是判断是否指向同一个对象。判断内容相等需要使用`equals`方法。在java中，通常称函数为**方法(mtthod)**，因为函数必定是某个类的成员，不管是不是静态。

众所周知，浮点数不要直接判等，通常判断差值是否在精度范围内。

`switch`语句: 同C，不赘述，可以使用整型、枚举。不同的是java中`String`也可以作为`switch`的判断条件，这就很方便了。因为C/C++其实并没有语法层面的字符串抽象类型。
```java
 switch (option) {
        case 1:
            System.out.println("Selected 1");
            break;
        case 2:
            System.out.println("Selected 2");
            break;
        case 3:
            System.out.println("Selected 3");
            break;
        }
```
语法糖：`case -> statement;`执行结束退出，不需要`break`。Java12开始。
并且还可以直接返回一个值：
```java
double d = switch(i) {
		case 1 -> 1.0;
		default -> 100;
		};
```
如果有多种情况，中间还有语句执行，还可以用`{}`包起来，执行多个语句后用`yield`返回，就像定义一个函数那样。

这种结构存在的意义是什么呢？我感觉并没有那么清晰。算是一个语法糖，完全可以找到等价的写法替代，可用可不用。


### 1.9 流程控制——循环

```java
while(condition) {
}

do {
}
while(conditon);

for (init; condition; update conuter) {
}

for (type val : valArr) { // iterate iterable type, like array([])/String/etc.
}
```

同样可以用`break`/`continue`。


### 1.10 命令行参数

```java
public class Main {
    public static void main(String[] args) {
        System.out.println(Arrays.toString(args));
    }
}
```

命令行执行`java Main.java hello world`，则传递给`main`的参数`args`为`["hello", "world"]`。


## 2. java面向对象

不同于C++，Java中称数据成员为**字段**(**field**)，称成员函数为**方法**(**method**)。


### 2.1 类和对象

- 关键字: `class`
- 指代对象自身: `this`引用变量
- 引用类型: 创建类对象实例都是使用引用变量来使用，可以理解为指向堆区域对象的指针，但是毕竟java没有指针(但的确有一个与空指针语义相同的`null`)，也就没有解引用和直接在栈上实例化的操作。C++通过多重指针、指针引用等可以精确控制一个对象的生存周期，持有关系等任何行为。
- 单从语义上理解java的引用和C++非常像，不同的是java中可以更改引用指向的对象，还可以指向`null`，就像是C++指针和引用的融合一样。
- 构造方法(Constructor): 无返回值，当然不定义的话编译器会生成一个函数体为空的无参默认构造方法，定义之后便不再生成默认构造。光凭想象就可以想到不用管理内存之后相比C++会少掉多少考虑拷贝构造、移动构造、赋值运算符这类的事情，瞬间好像就轻松起来了。
- 默认构造时各种类型默认值: 不同于C++如果不给初始化，对于没有构造函数的内置类型(整型浮点指针)，分配内存之后那块区域里面存什么值，成员就会是什么值。java中理所当然会执行默认初始化，引用初始化为`null`，数值类型用默认值`0`，`boolean`则是`false`。
- 初始化：java可以直接在类内成员定义时给初始值。执行顺序理所当然是先初始化为字段默认值或定义时给定的值，然后在执行构造方法。
```java
class Person {
    private String name; // 默认初始化为null
    private int age = 10; // 初始化为10
    private double weight = 50; // 最终初始化为构造函数中给的值
    public Person(double weight) {
        this.weight = weight;
    }
}
```
- java中没有类似C++中构造函数初始化列表这种东西。所以初始化就两个途径：给初始值、构造函数中赋值。
- 调用其他构造：`this(args);`。
- 调用基类构造：`super(args);`
- 除了构造函数之外，从各种意义上我们都需要有一个析构函数，因为不需要管理内存，好像析构存在的意义就没有那么大了。但用不用另说，必须有是确定的。java中扮演这个角色的就是`void finalize()`方法。
    - 但其实如果去看`Object.finalize`的注释的话，上面会说，这个方法从Java9就已经废弃了，原因是这个机制在本质上存在问题。如果在`finalizer`中出现错误，可能会导致资源泄漏、线程/进程挂起、死锁、造成性能问题。而且如果没有必要也无法取消，析构时机和顺序也无法保证。这我这直接好家伙！那你这保证了个啥？
    - 作为替代：那些持有了并非是普通的堆内存资源但是需要释放的，都应该提供方法来显示释放资源，如果合适的话应该实现`AutoCloseable`接口。`java.lang.ref.Cleaner`和`java.lang.ref.PhantomReference`提供了更灵活和高效的对象用完后释放资源的方法。具体怎么用什么场景用还需要进一步探究。
- 访问权限：
    - `public`
    - `private`
    - `protected`
    - 默认，不写访问修饰符
- 思考与探索：有没有类似于C++中`=default`,`=delete`那种显式使用或者禁用默认构造/`=`运算符的语法呢？

### 2.2 方法

- 可变参数: 
    - 定义: `void mthod(type ... args)`
    - 调用: `method(arg1, arg2, arg3)`
    - 当然这要求所有参数同类型，和C中通过`va_list`加上一个参数个数来实现的方式有区别
    - 最终`args`被解释为一个数组，同类型可变参数完全可以使用数组来传递，但是需要调用时显式构造数组，并且可以传递`null`为参数，可变参数算是一个还不错的语法糖。
- 方法重载(Overload):
    - 同C++一致的是，方法重载只与参数列表(类型和顺序)有关，和返回值，访问修饰符无关系。C++中函数重载之后其实就是成为了不同的函数，经过名称修饰之后符号是不同的。那么java有没有类似于名称修饰一类的东西呢？是如何保证调用时正确跳转到对应的函数入口地址的呢？这可能需要后续了解了字节码之后才能知道。
    - 重载函数返回值类型和访问修饰符不必相同，这是理所当然的。
    - 问题来了：可变参数类型参数算作数组还是多个参数呢？和重载混合在一起如何工作？如何判断调用哪一个？
- 默认参数：
    - 根据已知信息，并不存在这种东西，请通过方法重载来实现。
    ```java
    public void method(type1 v1, type2 v2) {
    }
    public void method(type1 v1) {
        method(v1, default_v2);
    }
    ```
    - 也是，不然和可变参数混在一起估计编译器估计就要凌乱了，也减少心智负担，挺好。以管窥豹，看得出来java所谓的啰嗦的确是有原因的，都是权衡了利弊之后的结果。



### 2.3 继承
- 提前一句话总结所有内容: `class` `extends` `Object` `implements` `super` `protected` `sealed`  `permits` `final` `intanceOf` `@Override`
- 语法：`class Student extends Person`
- 根类：`Object`，没有父类的类都会自动继承`Object`。  
- 继承方式仅有一种，不像C++一样还有私有保护公有继承，虽然我从来未在工作中碰到过私有和保护继承就是了，无用的东西都可以剃掉，好耶！
- java不像C++一样可以多继承，也就是一个类只能有一个基类。一般来说的确是如此呢！这样的话类的继承关系就会是一棵真正的树，不会有多个基类。
- 其实也可以变相的多继承：`class C implements A,B`。只是`A`和`B`必须是接口(`interface`)。
- 调用基类构造：`super(args);`，也即是用`super`指代这个对象中的基类部分。引用父类字段或者方法时使用。
- 当然子类不会继承父类所有构造函数，不写的话默认构造是编译器生成，此时调基类的默认构造，即等价于在构造函数第一行添加`super();`，如果基类没有默认构造，那么是编不过的。
- 访问限定：和C++的公有继承如出一辙，子类无法访问父类`private`，可以访问`protected`和`public`。
- 不要在派生类中定义和基类字段同名的字段。当然并非语法上禁止，只是工程实践中不要这么做比较好，子类作用于会覆盖基类作用域，然后局部方法作用域会覆盖类作用域，你总可以使用`this.val`、`super.val`来区分它们。在C++允许多继承所以使用`baseclass::val/baseclass::func`。
- 阻止继承：`sealed`配合`permits`关键字只允许指定的类继承该类，`public sealed class Shape permits Rect, Circle, Triangle`，这个操作有点意思。
- 使用`final`修饰类表明该类不能再被继承。同C++。`final calss A extends B`。
- 类型转换：向上转换必然成功，向下转换如果类型匹配则可以成功，不匹配则会失败抛异常，很好理解。
- 判断是否是指定类型：`instanceof`，返回`boolean`，完全匹配的类型或者基类都会返回`true`。RTTI有了，好耶！语法层面支持真棒！C++某些时候还要自己去实现RTTI就很烦了（小声说其实C++也是有的就是了）。
    - 用法：`obj instanceof Type`，返回`boolean`。
    - Java14开始：`obj instanceof Type s`，返回`boolean`。且可直接使用转换后的变量`s`。默认配置本地Eclipse/Java SE15上显示`preview feature and disabled by default`？见[0.3 基本Eclipse使用](#03-%E5%9F%BA%E6%9C%ACeclipse%E4%BD%BF%E7%94%A8)。
- 继承与组合：is与has的关系要区分清楚当然不用多说，has关系不应该用继承。
- 覆写(Override)：
    - 在C++中，只有虚函数可以重写，和重载一样，判断是否是覆写的标准依然是函数参数列表（方法签名）。如果重写了一个并非虚函数的函数，那么也就不能称之为重写，非虚函数不会在虚表中，也就不会有多态，调用指针/引用/变量类型在编译期就确定了到底调用哪一个。
    - 在Java中，所有函数皆是虚函数，其实也就是没有虚函数的概念，所有普通函数皆可以被重写。除非显式使用`final`阻止重写，不然都可以重写，使用了`final`再在子类中重写会编不过。如果是方法签名相同但返回值不同的重写，当然会报错。
    - `@Override`放在方法前，可以让编译器帮助检查是否进行了正确的覆写。如果是重写，但是方法名写错了，就会报错，如果不加，那么就会有基类方法和子类接口写错的方法同时可用。懂了，防呆设计！怪不得都说Java可靠性高，新手不容易犯错。当然，这是非必须的。
    - 看起来并没有那种能够在子类重写父类同名方法但又能使其不具有多态性的行为。这不是废话吗？

### 2.4 多态

- java中不能在栈中实例化对象，所以都取决于运行时类型就是了，运行时是什么类型，就调那个类型的方法，可能是重写的基类方法，也可能是继承自基类的方法，总之是运行时类型所决定，当然要能够编过，那必然要编译时类型能够调用该方法才行。也就是说要使用基类重写的方法，需要是用这个基类方法重写自的那个类或者派生链条中间的类的引用。总感觉我在说一堆废话。
- 根类`Object`重要方法：
    - `toString`，将对象输出为`String`。
    - `equals`，两对象判等。貌似并没有重写`operator==`这种选项（因为根本就不支持运算符重载呀），看来C++的确自由度要更高那么一点点，当然心智负担也要高那么亿点点。对引用变量来说，`==`就是判断是否指向同一个对象，也就是保存的地址是否相等。
    - `hashCode`，计算对象哈希值，java赛高！
- 子类调用基类方法：`super.method`。
- 字段加`final`之后表示在初始化之后不能更改。有点像C++`const`成员，只能在构造函数初始化列表中赋值，或者C++11之后的类内初始值。

### 2.5 抽象类

- 声明：`abstract`同时用于类和方法。放在类返回值前和`class`前。方法也就称之为**抽象方法**。
- 抽象类无法实例化，和C++抽象类同样的，还是类，也可以有成员，也可以有构造、被派生。当然也不能多继承，抽象类的修为还不够，需要舍弃血肉，灵魂飞升变为接口后才可以被多继承。
- 面向抽象编程：尽量引用顶层抽象类，不关心具体子类型。本质：
    - 上层代码只定义规范。
    - 不需要子类就可以实现业务逻辑。
    - 具体的业务逻辑由不同的子类实现，调用者并不关心。
- 定义了抽象方法的类必须定义为抽象类。不实现抽象方法的话，子类依然是抽象类。

### 2.6 接口

- 关键字：`interface`。
- 对标C++的纯虚类，当然C++允许多继承，所以纯虚类和普通抽象类并无太大区别，可以构造、可以有成员。但java只有接口类允许多继承，那么当然就不能由只有一个的基类引用`super`来完成构造，那么必然就不能有正常属于普通类对象的字段和构造。
- 其实写了构造也能编过，会被识别为一个普通方法提示缺少返回值，而不是构造。写了字段也没有问题，貌似被当做了静态字段来处理。别说细节还挺多。经过求证接口的字段会自动`public final static`。
- 实现接口时，需要使用`implements`关键字。
- 同时派生一个类，并实现接口：`class A extends B implements C,D`。`super`将指代`B`，没有`B`的话就是默认的`Object`。
- 接口是可以允许类似菱形继承这种继承方式的，因为没有字段就不需要考虑多份数据怎么存存几份怎么取这种问题了。
- `default`方法：接口中也可以有实现了的方法，此时就需要加`default`关键字，当然没有字段可以给它访问。目的是实现没必要在所有子类中重写的接口，派生类中可以不进行重写。所以其实接口和类的区别就只有是否有字段和构造这一点是吗？
- 接口中所有方法默认`public abstract`，不需要显示写出。
- 接口可以继承另一个接口，同样使用`extends`。
- 最后接口这个词，正常来说应该是表示纯虚类，上层的抽象出来的和实现类相对的没有数据的抽象类。但工作里面感觉好多人都用接口来表示函数，比如在这个类里面加一个接口这种说法。最后Java里面有人说函数吗？都是说方法吗？字段会说成成员吗？说实话从C++切换过来什么都还好还是有点不适应名词变了。

### 2.7 静态字段与方法

- 只有一个独立的内存空间，属于整个类，并不属于某个实例。所有实例都可以使用。
- 通过`className.staticFieldOrMethod`来访问，当然也可以通过`aInstance.staticFieldOrMethod`访问，等价于前者，但最好使用类名来访问，更加清晰。这点与C++是相同的。
- 静态方法无法使用`this`变量，只能访问静态字段。
- `interface`是可以有静态字段的，并且只能是`final`的。所以编译器会自动为interface的字段加上`public final static`。
- 常用于工具类辅助类等。

### 2.8 包

- Java中使用Package来解决名称冲突，因为不同的人写的代码是完全可能出现名称重复的。C++中则是使用`namespace`，但是C++的`namespace`仅仅是加了一层作用域而已，仅用于解决名称冲突问题。而java的包功能则更多。
- 调用方式：`Package.class`。
- 声明：`package packageName;`，必须写在程序有效代码第一行。
- 虚拟机运行时，JVM只看完整的类名，只要包名不同，类就不同。包可以是多层结构，用`.`隔开，类似于`java.util`。
- 包不存在任何父子关系，所以`java.util`和`java.util.zip`是不同的包。C++的namespce也可以嵌套，而且是有关系的。
- 不使用包名，那么就是使用默认包，类似于使用全局作用域。
- Java中包还要求和目录层次完全统一，不然就是语法错误。生成的`.class`也会是同样的结构。由衷感叹java真省心啊！
- 在一个类中引用了其他类时，可以使用完整包名，也可以使用`import`将包中的类导入进来。类似于C++中的`using namespace XXX;`。
- `import`用法：
    - 导入一个包所有`class`：`import package.*;`
    - 导入一个类：`import package.class;`
    - 导入一个类中的所有静态字段和方法：`import static pacakge.class.*;`，使用较少。
- Java编译器最终编译出的`.class`只使用完整类名，编译器遇到一个类名时查找顺序：
    - 当前包中查找。
    - 导入的包中查找。
    - `java.lang`包查找。
    - 还无法确定类名就报错。
- 编写一个类是，编译器默认做的事情：
    - 默认自动导入当前包所有类。
    - 默认自动导入`java.lang.*`。但像`java.lang.reflect`这种其实和`java.lang`不是一个包，也没有父子关系，还是需要手动导入的。
- 不同包中两个类有相同的类名，都导入就会名称冲突，因为包没有嵌套这个说法所以最多只能导入其中一个，另一个需要写完整类名。
- 要移动或者一个文件所在的包时，IDE都会自动完成文件操作，还提供一键更新引用这种操作，可以说很方便了。
- 相比C++的继承自C的原始的头文件包含方式、头文件宏定义保护防止重复包含、接口实现分离、交叉引用、前向声明，java可以算的上很无脑很方便了。

### 2.9 作用域

- 访问修饰符限定了访问作用域
- `public`
    - `public`的类和接口可以被其他任何类访问。
    - `public`的方法和字段可以被其他类访问，前提是拥有类的访问权限。
- `private`
    - `private`字段和方法无法被其他类访问。仅内类可以访问。
    - Java支持嵌套类，嵌套的类也在类内，也可以访问该类的私有字段和方法。
- `protected`
    - 派生类中可访问。
- 总结：清晰明了，比起C++，搞出了各种东西，例如友元，加上三种
- 包作用域/默认作用域
    - 一个类不添加访问修饰符，可以访问包内所有`public`和没有访问修饰符包作用域的类。
    - 一个包不可访问另一个包内默认作用域的类。
- `private`和`protected`不能用来修饰类，但可以用来修饰嵌套类。一个最外层的非嵌套类只能用`public`/`final`/`abstract`修饰。或者不用`public`包内使用。

### 2.10 嵌套类

- 内部类(Inner Class)
    ```java
    class Outer {
        class Inner {
        }
    }
    ```
    - Inner类实例不能单独存在，必须依附于一个Outer的实例。
    ```java
    public class Main {
        public static void main(String[] args) {
            Outer outer = new Outer("Nested"); // 实例化一个Outer
            Outer.Inner inner = outer.new Inner(); // 实例化一个Inner
            inner.hello();
        }
    }

    class Outer {
        private String name;
        Outer(String name) {
            this.name = name;
        }
        class Inner {
            void hello() {
                System.out.println("Hello, " + Outer.this.name);
            }
        }
    }

    ```
    - 要实例化一个Inner，我们必须首先创建一个Outer的实例，然后调用``Outer``实例的`new`来创建Inner   实例。因为Inner Class除了有一个`this`指向它自己，还隐含地持有一个Outer Class实例，可以用   `Outer.this`访问这个实例。所以，实例化一个Inner Class不能脱离Outer实例。
    - `Outer`类被编译为`Outer.class`，而`Inner`类被编译为`Outer$Inner.class`

- 匿名类(Anonymous Class)
    - 不需要在Outer Class中明确地定义这个Class，而是在方法内部，通过匿名类（Anonymous Class）来定义。
    ```java
    public class Main {
        public static void main(String[] args) {
            Outer outer = new Outer("Nested");
            outer.asyncHello();
        }
    }

    class Outer {
        private String name;

        Outer(String name) {
            this.name = name;
        }

        void asyncHello() {
            Runnable r = new Runnable() {
                @Override
                public void run() {
                    System.out.println("Hello, " + Outer.this.name);
                }
            };
            new Thread(r).start();
        }
    }
    ```
    - `Runnable`是一个接口，`asyncHello`方法内`new`的时候定义了一个没有类名的匿名类重写了`run`方法，重写`run`接口之后实例化并给了`r`。
    - `Outer`类被编译为`Outer.class`，而匿名类被编译为`Outer$1.class`，如果有多个匿名类，那么被编译为`Outer$2.class` etc
    - 除了接口外，匿名类也完全可以继承自普通类。
- 静态嵌套类(Static Nested Class)
    - 和Inner Class类似，但是使用`static`修饰，称为静态内部类。
    - 用static修饰的内部类和Inner Class有很大的不同，它不再依附于Outer的实例，而是一个完全独立的类，因此无法引用`Outer.this`，但它可以访问`Outer`的`private`静态字段和静态方法。
    - 就是一个独立的类，只是有Outer Class的private访问权限。
    - 果然我觉得这才比较正常，像内部类，一个类依赖于一个对象感觉有一点点奇怪，暂不清楚应用场景。

### 2.11 classpath

- classpath是什么？
- JVM用到的一个环境变量，它用来指示JVM如何搜索class。
- 因为Java是编译型语言，源码文件是`.java`，而编译后的`.class`文件才是真正可以被JVM执行的字节码。因此，JVM需要知道，如果要加载一个`abc.xyz.Hello`的类，应该去哪搜索对应的`Hello.class`文件。
- 设定方法
    - 系统环境变量中设置`classpath`环境变量，不推荐，会污染整个系统环境。
    - 启动JVM时设置`classpath`变量，推荐。启动时添加`-classpath`或者`-cp`选项，添加`;`分割的路径作为参数（Windows中）。
- IDE中运行时，自动传入的`-cp`参数就是工程`bin`目录和引入的`jar`包。
- 更好的做法是，不要设置`classpath`！默认的当前目录`.`对于绝大多数情况都够用了。


### 2.12 jar包

- 如果有多个`.class`文件，散落在各层目录中，肯定不便于管理。如果能把目录打一个包，变成一个文件，就方便多了。
- `jar`包就是用来干这个事的，它可以把package组织的目录层级，以及各个目录下的所有文件（包括`.class`文件和其他文件）都打成一个`jar`文件。
- `jar`包实际上是一个zip格式的压缩包文件，jar包相当于目录。执行一个jar包里的class，就可以把jar包放到classpath中。
```shell
java -cp ./hello.jar abc.xyz.hello
```
- 因为`jar`包就是zip文件，所以直接将`bin`目录中的目录和文件压缩成`zip`文件，更改后缀为`.jar`就算制作成功了一个`jar`包。值得注意的是，`bin`目录不应该被包含到压缩包的路径中。
- `jar`包还可以包含一个特殊的`/META-INF/MANIFEST.MF`文件，`MANIFEST.MF`是纯文本，可以指定`Main-Class`和其它信息。JVM会自动读取这个`MANIFEST.MF`文件，如果存在`Main-Class`，我们就不必在命令行指定启动的类名，而是用更方便的命令：`java -jar hello.jar`。
- 举例来说，如果写了两个包一个`Main`一个`Hello`，编译后`bin`目录下生成了两个目录`Main/`和`Hello/`，选中这两个目录，zip格式压缩到文件`Main.jar`，文件名无关紧要。执行时：`java -cp ./Main.jar Main.Main`。jar文件位置随意，路径给对就行，包中的类名随意，只要你定义了`public static main`即可执行。没有这个类或者依赖了其他类但是打包时没有加进去则解释执行时JVM会抛出`java.lang.ClassNotFoundException`。
- 一个包中可以有多个类有`public static main`方法，甚至可以互相调用。执行时通过参数指定想执行哪一个就执行哪一个。

- 清单文件
    - 如果没有`jar`包中`/META-INF/MANIFEST.MF`，那么是不能通过`java -jar`来执行的。
    - 清单文件中定义了许多内容，但不必全部关心。
    - 手动创建清单文件：注意最后要有一个空行。
    ```
    Manifest-Version: 1.0
    Main-Class: package.mainClass

    ```
    只要给出入口类`Main-Class`就可以通过`java -jar`来执行了。
- 使用Eclipse导出`jar`包：
    - 包资源管理器中选择包右键导出->Java->JAR文件，选择要导出的一个或多个包，填写入口类，即可导出。
    - 不设置其他选项的话，导出的清单文件中也就只有版本和入口类的信息。
    - 当然还可以导出其他文件，清单文件也可以有很多其他配置内容，尚不清楚，有需求再了解。
- 到这里只能说，Java的确很方便。无论是项目配置，编译，执行，依赖，打包发布都如此简单方便。怪不得是时下最流行的编程语言。
- **你永远可以通过增加一个中间层来解决一些问题**。永远可以通过减少一个中间层来提升一些性能。
- 现在这个时代，硬件性能已经普遍强大到绝大部分情况下我们并不需要去抠一个程序是到底是多占了几个字节的内存还是多执行了几条指令。愉快地开始java之旅吧！
- 最后，JVM是世界上最好的虚拟机！


### 2.13 模块

- `.class`是JVM看到的最小执行文件，`jar`包就是与`.class`的容器。但写一个大型程序时是可能需要依赖其他第三方的jar包的。最后执行时就需要将所有jar放在一起来执行，少了或者写漏了某个jar就可能会`ClassNotFoundException`。
    ```java
    java -cp 1.jar;2.jar;...;last.jar package.mainClass
    ```
- 引入了模块解决**依赖**的问题。如果`a.jar`依赖`b.jar`，那我们应该给`a.jar`加点东西说明这个信息。让程序编译运行时自动定位到`b.jar`，这种自带依赖关系的`class`容器就是模块。始于Java 9。
- 创建模块：与创建Java项目一致，在`src/`目录一级下创建`module-info.java`文件，即是**模块描述文件**。文件内容类似与下面这样：使用`module`和`requires`说明模块和依赖。
```java
module hello.world {
	requires java.base; // 可不写，任何模块都会自动引入java.base
	requires java.xml;
}
```
- `module-info.java`经过编译后会在`bin`下生成`module-info.class`。
- 下一步把`bin`目录所有`class`文件打包成`jar`。使用`jar`命令。
- 模块还可以导入导出。使用`jmod`命令从`jar`生成模块。
- 更详细的理解和说明：TODO。

## 3. Java核心类

### 3.1 字符串与编码

- String是一个引用类型，本身也是一个class，Java编译器对String有特殊处理，可以直接用字符串字面值`"string-literal"`来表示。
- 实际上字符串内部是通过字符数组来表示，这点很多编程语言应该都是一样的。
- Java字符串的重要特性就是不可变，内部保存字符串的字段是`private final`的字符数组，赋值后即**不可变**。`String`类中没有实现任何修改这个数组的方法。使用Eclipse的话F3到定义里面可以看到其实是一个字节数组`private final byte[] value;`，并不是`char[]`。
- 用字符串字面值创建就相当于使用字符数组创建。java的语法层面支持使我们可以简写。
```java
String s = "yes";
String s2 = new String(new char[] {'y', 'e', 's'});
```
- 对字符串判等应该用`equals`方法，如果使用`==`则是判断两个字符串引用变量是否引用同一个对象。
- 忽略大小写判等：`equalsIgnoreCase`
- 搜索提取子串的接口：`idnexOf` `lastIndexOf` `startsWith` `endsWith` `substring`
- 下标从0开始，遗憾的是不支持像数组一样使用`[]`来引用字符串中的字符。可能是因为不允许改变的原因。还是说因为内建的字符类型不支持引用，就算获取了也无法设置，没有理由提供语法层面支持。获取某一个字符使用`public char charAt(int index)`。
- 字符串操作不改变原字符串内容，而是返回新字符串。
- 去除收尾空字符：`trim()`，返回去除后的新字符串。包括`\t` `\t` `\n` `\0`。
- `stricp()`也是去除首位空字符，在`trim()`基础上还会去除像`\u3000`中文空格这样的字符。只移除首或尾：`stricpLeading` `stripTrailing`
- 判空：`isEmpty`
- 判断是否是空白：`isBlank`
- 替换：`replace`
- 分割：`split`
- 拼接：`join`
- 格式化：`formatted` `format`
- 将任意类型转换为`String`：`valueOf`
- 转换为`char[]`：`toCharArray`
- 字符编码：
    - java的`String`和`char`在内存中总是用UniCode表示。
    - 可以调用`String`的方法手动将字符串转换为其他编码，结果为`byte[]`
    ```java
    String s = "你好，世界！";
    printBytes(s.getBytes()); // 系统默认编码，最好不要这么写
    printBytes(s.getBytes(StandardCharsets.UTF_8));
    printBytes(s.getBytes(StandardCharsets.UTF_16));
    printBytes(s.getBytes(StandardCharsets.UTF_16BE));
    printBytes(s.getBytes(StandardCharsets.UTF_16LE));
    ```
- 进入到`String`的声明里面可以看到内部是怎么存储一个字符串的，早期可能会直接使用`char`数组，但那样的话对于只有ASCII字符构成的字符串内存空间明显不够友好，现在都是用字节数组并且内部有区分编码，但可以发现都是`final`修饰的，也就是赋值之后即不可变。而我们在外部不需要关心`String`内是怎么存储的。
```java
public final class String
    implements java.io.Serializable, Comparable<String>, CharSequence,
               Constable, ConstantDesc {
     private final byte[] value;
     private final byte coder; // 0 - LATIN1(即ISO-8859-1,单字节,向下兼容ASCII), 1 - UTF16
    // ...
}
```

### 3.2 String操作类

StringBuilder：频繁编辑字符串，位于`java.lang`
- Java字符串赋值之后即不可变，对字符串的编辑的操作都返回一个新的字符串，指向新的内存，如果需要对字符串频繁编辑，那么频繁构造也就会频繁分配内存，也会影响GC效率。所以Java标准库提供了`StringBuilder`，它是一个可变的对象，编辑操作改变自身，而不是新构造对象。
- 看看它都有些什么方法：`compare` `append` `delete` `replace` `insert` `indexOf` `lastIndexOf` `resverse` `toString` 都是一些字符串应该有的操作，都有不同参数的重载，操作完之后使用`toString`得到字符串。
```java
StringBuilder sb = new StringBuilder(2048);
sb.append(100).append(',').append(" your princess!");
sb.insert(3, "%");
sb.replace(0, 3, "99");
sb.delete(sb.length()-1, sb.length());
System.out.println(sb.toString());
```
- 总感觉参数的含义怪怪的，不是很好用的感觉。
- 因为编辑操作修改自己，并返回`this`，所以可以连起来调用。

StringJoiner：用来高效拼接字符串，位于`java.util`
- 能用的方法不多：
```java
public StringJoiner(CharSequence delimiter, CharSequence prefix, CharSequence suffix)
public StringJoiner setEmptyValue(CharSequence emptyValue) // 为空时的默认值
public String toString() // 转字符串
public StringJoiner add(CharSequence newElement) // 添加
public int length() // 长度
public StringJoiner merge(StringJoiner other) // 合并
```
- 这也能单独实现为一个类是我没有想到的。

### 3.3 包装类型

- 简单来说就是把基本类型如`boolean` `byte` `short` `int` `long` `float` `double` `char`等类型变为**引用**的手段。
- 为`int`定义包装类：类似于这样包装一层之后就可以将其当做对象来用。
```java
class Integer {
	private final int value;
	public Integer(int value) {
		this.value = value;
	}
	public int intValue() {
		return value;
	}
}
```
- java核心库`java.lang`为每种基本类型都定义了包装类型，分别为 `Boolean` `Byte` `Short` `Integer`  `Long` `Float` `Double` `Character`
- 可以`new`包装对象传数值对象来创建，但会提示从java 9开始就弃用了，会有Warning。正常用应该用类似于`Integer.valueOf(int n)`这种静态方法来创建。
- 提供了很多操作：与字符串的互相转换，解析，比较，进制转换，该类型的常量边界值，编码等。其中大部分是静态方法，感觉的确还是有点用的。
- 将`Integer.valueOf()`这种方法成为静态工厂方法，创建新对象时应该优先选择静态工厂方法，而不是`new`运算符。看一下实现可以知道某些情况下会返回缓存的实例而不是`new`的新实例。
```java
public static Integer valueOf(int i) {
    if (i >= IntegerCache.low && i <= IntegerCache.high)
        return IntegerCache.cache[i + (-IntegerCache.low)];
    return new Integer(i);
}
```
- 包装也成为装箱(Boxing)，自动装箱和自动拆箱都是在编译器完成的，装箱拆箱会影响执行效率，且拆箱是可能会`NullPointerException`。
- 包装类型比较应该使用`equals`，整数和浮点数的包装类型都继承自`Number`。

### 3.4 JavaBean

Java中，很多时候为了封装，都会这样去写一个类：
- 若干`private`字段。
- 通过`public`方法去读写实例字段。

如果读写方法符合以下的命名规范，那么这种类被称为`JavaBean`，其中的字段是`xyz`。
```java
// 字段
private Type xyz;
// 读方法getter
public Type getXyz()
// 写方法setter
public void setXyz(Type value)
```
通常将读方法(`getter`)和写方法(`setter`)称之为属性(`property`)。
- 只写`getter`的属性称为只读(read-only)属性，比较常见。
- 只有`setter`的属性称为只写(write-only)属性，不常见。
- 属性是一种通用叫法、实践约定，不是语法规定，本质上其实就是一个方法。

作用：
- 用来传输数据，把一组数据组合成一个`JavaBean`来传输。
- 方便被IDE分析，直接生成读写属性的接口。就不需要自己来慢慢写了。Eclipse中，右键->源码->生成getter和setter，选择要生成属性的字段和读写接口，访问修饰符等就可以直接生成了。

使用`java.beans`提供的`Introspector`可以枚举出一个`JavaBean`的所有属性。
```java
public static void main(String[] args) throws IntrospectionException {
	BeanInfo info = Introspector.getBeanInfo(Person.class);
	for (PropertyDescriptor pd : info.getPropertyDescriptors()) {
		System.out.println(pd.getName());
		System.out.println("\t" + pd.getReadMethod());
		System.out.println("\t" + pd.getWriteMethod());
	}
}
```
因为可能抛异常所以最后声明中必须加上`throws`语句，不然会报错，异常暂时没有了解，后续详解。其中的`class`字段是继承自`Object`而来。得到的结果中对于`class`字段有一个只读属性：`public final native java.lang.Class java.lang.Object.getClass()`。

`Introspector`称之为**内省**，使用方法一般是：
>内省(IntroSpector)是Java 语言针对 Bean 类属性、事件的一种缺省处理方法。一般的做法是通过类 `Introspector` 的 `getBeanInfo` 方法来获取某个对象的 `BeanInfo` 信息,然后通过 `BeanInfo` 来获取属性的描述器(`PropertyDescriptor`)，通过这个属性描述器就可以获取某个属性对应的 getter/setter 方法，然后我们就可以通过反射机制来调用这些方法，这就是内省机制。

当然现在还未接触**反射**，后续详解。


### 3.5 枚举类

要用常量时，java暂时没有`const`(预留关键字，但还没有使用)，定义局部常量的话使用`final`即可。定义全局常量的话定义为`static final`就行，使用时`ClassName.staticFinalVar`这样来用就行。某些时候要做判断时，无法通过编译器来检查值的合理性，当然这时候枚举就必须要有了。

枚举类定义：
```java
enum WorkingState {
    coding, testing, takeABreak, slacking, drinkingCoffee, watchingVideos, playingGame, snapping
}
```
- 比较枚举值是编译器会进行类型检查，确保了枚举值的有效性。不同类型的枚举不能互相比较或者赋值。
- `enum`是引用类型，比较值时应该使用`equals`方法，但是由于`enum`类型的所有常量在JVM中只有一个实例，所以使用`==`比较也不会有问题。
```java
if (state == WorkingState.coding) {
    state = WorkingState.takeABreak;
}
```

`enum`和`class`有什么区别呢，答案是本质上没有区别，只是具有几个特点：
- 定义的`enum`总是从`java.lang.Enum`派生，且无法比继承。
- 只能定义`enum`的实例，而无法通过`new`运算符创建实例。
- 定义的每个实例都是引用的该枚举类型的唯一实例。
- 可以用于`switch`语句。

编译后得到的`class`类似于这样：
```java
public final class WorkingState extends Enum { // 继承自Enum，标记为final class
    // 每个实例均为全局唯一:
    public static final Color coding = new WorkingState();
    public static final Color testing = new WorkingState();
    public static final Color takeABreak = new WorkingState();
    // ...
    // private构造方法，确保外部无法调用new操作符:
    private WorkingState() {}
}
```

每个枚举的值都是`class`的一个实例，所以可以使用一些从`Enum`继承而来的方法：
```java
WorkingState state = WorkingState.coding;
String s = state.name(); // 获取枚举名称：coding
int order = state.ordinal(); // 获取枚举常量定义的顺序(从0开始)：0
```

可以为枚举定义自己的构造，字段和方法。例如自己定义枚举的值：因为`enum`就是`class`，所以定义`enum`常量时可以调用自己的构造。要加字段建议声明为`final`因为你也没办法`new`一个`enum`去改它。
```java
enum Weekday {
    MON(1), TUE(2), WED(3), THU(4), FRI(5), SAT(6), SUN(0);
    public final int dayValue;
    private Weekday(int dayValue) {
        this.dayValue = dayValue;
    }
}
```
默认情况下`toString`方法会返回和`name`一样的值(也就是是这个枚举常量的名称)，但是是可以重写实现自己的`toString`的，目的一般在于使输出更具可读性。所以如果要判断枚举常量的名字，应该始终使用`name`。


### 3.6 记录类

不变类：
- 定义时使用`final`，无法派生子类。
- 每个字段使用`final`，保证创建实例后无法修改任何字段。
- 为了保证不变类比较，还需要重写`equals`和`hashCode`方法。这样才能在集合类中使用。

这样写起来很繁琐，所以语法糖又来了。java14开始，引入了`Record`类，使用关键字`record`:
```java
public record Point(int x, int y) {}
```
上述定义改写为`class`后类似于：
```java
public final class Point extends Record {
    private final int x;
    private final int y;

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public int x() {
        return this.x;
    }

    public int y() {
        return this.y;
    }

    public String toString() {
        return String.format("Point[x=%s, y=%s]", x, y);
    }

    public boolean equals(Object o) {
        ...
    }
    public int hashCode() {
        ...
    }
}
```
啊这，java的繁琐真是不无道理呢！

和`Enum`类似，不能人为的从`Record`派生，只需要使用`record`关键字由编译器来处理就行。
- 简单来说，`record`就是为了定义纯数据载体类。
- 可以添加自己的静态方法。
- 可以给一个Compact Constructor添加逻辑。
- 一种典型静态方法就是`of`方法，实现静态工厂，用来创建新对象。`Point p = Point.of(1, 2)`这样写还是挺方便的。
```java
public record Point(int x, int y) {
     public Point { // 没有参数列表，赋值的逻辑由编译器负责补全
        if (x < 0 || y < 0) {
            throw new IllegalArgumentException();
        }
    }
    public static Point of() {
        return new Point(0, 0);
    }
    public static Point of(int x, int y) {
        return new Point(x, y);
    }
}
```
java15版本中，这好像还是preview feature：
- 打开编译开关：`--source 15 --enable-preview`才能使用，不然会报错。
- Eclipse中右键项目，属性，Java编译器，勾选`Enable preview features for Java15`才能使用。并且会有警告`You are using a preview language feature that may or may not be supported in a future release`。


### 3.7 BigInteger

Java提供的原生类型中表示范围最大的整型是64为整型`long`，和其他任何语言中一样，内置类型计算一般来说都可以由CPU指令直接提供支持，基本上一条指令就可以搞定。但是表示范围超过了64位的范围，那么就必须自己造轮子实现高精度整数了，用空间和时间来换表示范围和精度。

java提供了高精度大整数实现：`java.math.BigInteger`。其中用`int[]`数组来模拟大整数，做算术运算时需要通过调用其方法来实现，编译器没有提供运算符支持。这时候就不得不提一句C++的运算符重载了。

定义：
- `public class BigInteger extends Number implements Comparable<BigInteger>`
- 继承自`Number`
- 不可变对象。

方法：
- 构造：任意进制`public BigInteger(String val, int radix)`，十进制`public BigInteger(String val)`，字节数组`public BigInteger(byte[] val, int off, int len)`，静态工厂`public static BigInteger valueOf(long val)`，等。
- 比较操作
```java
public int compareTo(BigInteger val) // return -1, 0, 1 - less, equal, greater
public boolean equals(Object x)
public BigInteger min(BigInteger val)
public BigInteger max(BigInteger val)
```
- 算术运算：尚未列完全，该有的都有了，加减乘除、相反数、取余求模、开方乘方、绝对值、位运算。
```java
 public BigInteger add(BigInteger val)
 public BigInteger subtract(BigInteger val)
 public BigInteger multiply(BigInteger val)
 public BigInteger divide(BigInteger val)
 public BigInteger[] divideAndRemainder(BigInteger val)
 public BigInteger remainder(BigInteger val)
 public BigInteger pow(int exponent)
 public BigInteger sqrt()
 public BigInteger gcd(BigInteger val)
 public BigInteger abs()
 public BigInteger negate()
 public int signum()
 public BigInteger mod(BigInteger m)
 public BigInteger shiftLeft(int n)
 public BigInteger shiftRight(int n)
 public BigInteger and(BigInteger val)
 public BigInteger or(BigInteger val)
 public BigInteger xor(BigInteger val)
 public BigInteger not()
```
- 转换为算术类型：
```java
// 超过表示范围将丢失高位信息
public int intValue()
public long longValue()
public float floatValue()
public double doubleValue()
// 超过表示范围抛异常
public long longValueExact()
public int intValueExact()
public short shortValueExact()
public byte byteValueExact()
```
- 其他转换
```java
public byte[] toByteArray()
public String toString(int radix)
public String toString()
```

### 3.8 BigDecimal

对应于高精度整数，必然也应该有高精度浮点数。`java.math.BigDecimal`可以表示一个任意大小且精度完全准确的浮点数。

定义：
- `public class BigDecimal extends Number implements Comparable<BigDecimal>`
- 继承自`Number`
- 不可变对象。

方法：
- 构造和算术运算都和`BigInteger`差不多就不列除了。区别是都有包含指定保留小数位数与舍入规则的参数的重载版本。
- `public int scale()` 用来表示小数位数。如果小数点后只有0那么会返回负值。
- `public BigDecimal setScale(int newScale)`设置小数位数，精度会丢失时按指定方法舍入或截断。
- `public BigDecimal stripTrailingZeros()`去除末尾0。

比较：
- `equals`会比较scale，如果值相等scale不等，则也会不等。
- 忽略scale比较：`public int compareTo(BigInteger val)`，返回值-1,0,1。一般来说比较应该用`compareTo`而不是`equals`。

实现：通过一个表示每一位值的大整数，和一个表示小数位数的`scale`实现。
```java
public class BigDecimal extends Number implements Comparable<BigDecimal> {
    private final BigInteger intVal;
    private final int scale;
}
```

### 3.9 常用工具类

**数学计算**：

- `java.lang.Math`类提供了大量静态方法来执行常见的数学运算，比如指数、对数、开方、三角函数、取整舍入、绝对值、最大值，还定义了常见的常数(`e` `PI`)。

- 很多时候它的实现是直接调用`java.lang.StrictMath`，他们的关系是：
在`Math`类中，为了达到最快的性能，所有的方法都使用计算机浮点单元中的例程。如果得到一个完全可预测的结果比运行速度更重要的话，就应该使用`StrictMath`类。它使用“Freely Distributable Math Library”实现算法，以确保在所有平台上得到相同的结果。有关这些算法的源代码请参阅 [fdlibm](http://www.netlib.org/fdlibm/index.html)，都是常用数学函数的C实现。
- 简单来说就是因为存在浮点计算误差，不同平台(如x86和ARM)计算结果不能不一样(指误差不同)，`StrictMath`保证所有平台计算结果一致，而`Math`会针对平台优化计算速度。大部分情况使用`Math`就足够了。
- `java.lang.*`是默认导入的，但因为是静态方法，所以还是要在调用时加上`Math.`。如果不想要在调用时加上`Math.`，那么如前所述导入`Math`类的所有公有静态字段和方法即可:`import static java.lang.Math.*;`

**伪随机数**：

- `java.util.Random`包可用于生成伪随机数：所谓伪随机数，是指只要给定一个初始的种子，产生的随机数序列是完全一样的。
- 要生成一个随机数，可以使用`nextInt()`、`nextLong()`、`nextFloat()`、`nextDouble()`。
- 都是非静态方法，要生成随机数需要构造一个`Random`实例。
```java
Random r = new Random();
System.out.println(r.nextInt());
System.out.println(r.nextDouble());
System.out.println(r.nextLong());
```
- 可以使用一个随机数种子作为参数构造`Random`对象，不给种子的话就会采用系统时间戳作为种子。也可以通过`public synchronized void setSeed(long seed)`设置种子。
- 可以生成的随机数类型包括：`int` `long` `float` `double`
- `Math.random`其实也是调用了内部的`Random`实现的。

**真随机数**：

有**伪随机数**，就有**真随机数**。实际上真正的真随机数只能通过量子力学原理来获取，而我们想要的是一个不可预测的安全的随机数，`SecureRandom`就是用来创建安全的随机数的
```java
SecureRandom sr = new SecureRandom();
System.out.println(sr.nextInt(100));
```
- `SecureRandom`无法指定种子，使用RNG（random number generator）算法。JDK的`SecureRandom`实际上有多种不同的底层实现，有的使用安全随机种子加上伪随机数算法来产生安全的随机数，有的使用真正的随机数生成器。实际使用的时候，可以优先获取高强度的安全随机数生成器，如果没有提供，再使用普通等级的安全随机数生成器。
```java
public class Main {
    public static void main(String[] args) {
        SecureRandom sr = null;
        try {
            sr = SecureRandom.getInstanceStrong();
        } catch (NoSuchAlgorithmException e) {
            sr = new SecureRandom();
        }
        byte[] randomBuffer = new byte[64];
        sr.nextBytes(randomBuffer);
        System.out.println(Arrays.toString(randomBuffer));
    }
}
```
>`SecureRandom`的安全性是通过操作系统提供的安全的随机种子来生成随机数。这个种子是通过CPU的热噪声、读写磁盘的字节、网络流量等各种随机事件产生的“熵”。在密码学中，安全的随机数非常重要。如果使用不安全的伪随机数，所有加密体系都将被攻破。因此，时刻牢记必须使用`SecureRandom`来产生安全的随机数。
- 需要使用安全随机数的时候，必须使用`SecureRandom`，绝不能使用`Random`！
- 这里要提一句java的异常处理感觉很舒服，处理成本不高，如果调用了一个可能抛出异常的函数，那么就一定需要处理这个异常，可以向上抛出，也可以就地处理。并且IDE会给提示，不处理是不能编过的。而对于C++，抛异常要考虑的事情就多了，资源和内存的释放，接到了异常之后能否恢复正确的上下文继续执行？太多需要考虑的事情，而对于内存用光、下标越界这种事也不会去考虑，让其崩溃然后修BUG也许是更好的选择。就我个人在实践中C++的异常处理用的不算多，更多的实践是返回一个错误码。

### 3.10 BigInteger实现分析

插播一小节闲话，分析一下`BigInteger`的实现：



`BigInteger`源码分析：
- 包声明和导入：主要是异常、IO、数组、随机数、数学、以一些不知道的东西。
```java
package java.math;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectStreamField;
import java.util.Arrays;
import java.util.Objects;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import jdk.internal.math.DoubleConsts;
import jdk.internal.math.FloatConsts;
import jdk.internal.HotSpotIntrinsicCandidate;
import jdk.internal.vm.annotation.Stable;
import jdk.internal.vm.annotation.ForceInline;
```

- 声明：
```java
public class BigInteger extends Number implements Comparable<BigInteger>
```
- 基类`Number`：抽象类，可以和java原始类型`byte` `short` `int` `long` `float` `double` 互相转换的类型的基类。派生中应该实现这些转换方法。
```java
package java.lang;
public abstract class Number implements java.io.Serializable {
    public Number() {super();}
    public abstract int intValue();
    public abstract long longValue();
    public abstract float floatValue();
    public abstract double doubleValue();
    public byte byteValue() {
        return (byte)intValue();
    }
    public short shortValue() {
        return (short)intValue();
    }
    @java.io.Serial
    private static final long serialVersionUID = -8742448824652078965L;
}
```
- 字段、常量
```java
final int signum; // 表示符号，取值-1,0,1，表示负数,0,正数
final int[] mag; // 表示值，大端序存储，0元素表最大量级
private int bitCountPlusOne; // 比特位之和+1
private int bitLengthPlusOne; // 比特位长度+1
private int lowestSetBitPlusTwo;
private int firstNonzeroIntNumPlusTwo;
```

尚未开始分析好吧，TODO。

## 4. 异常处理

### 4.1 Java异常

为什么要有异常？
- 错误不可避免：未获取到资源，用户错误操作，程序有BUG，随机错误等。
- 需要处理错误，使用错误码返回值来标识出现的错误处理太麻烦。
- Java语言层面上提供异常处理机制，用异常来表示错误。

**异常**是一种类，本身带有类型信息。可以在任何地方抛出，只需要在上层捕获，和方法调用分离，不需要返回一个错误码来标识错误。

使用`try-catch`块来捕获与处理异常：
```java
try {
    // dosomething
    // ok
} catch (FileNotFoundException e) {
    // file not found:
} catch (SecurityException e) {
    // no read permission:
} catch (IOException e) {
    // io error:
} catch (Exception e) {
    // other error:
}
```

java的异常是类，派生关系如图如下：
```
                     ┌───────────┐
                     │  Object   │
                     └───────────┘
                           ▲
                           │
                     ┌───────────┐
                     │ Throwable │
                     └───────────┘
                           ▲
                 ┌─────────┴─────────┐
                 │                   │
           ┌───────────┐       ┌───────────┐
           │   Error   │       │ Exception │
           └───────────┘       └───────────┘
                 ▲                   ▲
         ┌───────┘              ┌────┴──────────┐
         │                      │               │
┌─────────────────┐    ┌─────────────────┐  ┌───────────┐
│OutOfMemoryError │... │RuntimeException │  │IOException│...
└─────────────────┘    └─────────────────┘  └───────────┘
                                ▲
                    ┌───────────┴──────────────┐
                    │                          │
         ┌─────────────────────┐  ┌─────────────────────────┐
         │NullPointerException │  │IllegalArgumentException │...
         └─────────────────────┘  └─────────────────────────┘
```

`Throwable`有两个子类：`Error`和`Exception`，`Error`表示较为严重的错误，程序一般无法处理，比如：
- `OutOfMemoryError` 内存用尽
- `NoClassDefFoundError` 类定义未找到
- `StackOverflowError` 栈溢出

而`Exception`是运行时的错误，可以被捕捉并处理。某些异常是程序处理的一部分，比如：
- `NumberFormatException` 数值类型的格式错误
- `FileNotFoundException` 未找到文件
- `SocketException` 读取网络失败

某些异常是错误的程序逻辑导致的，应该修复程序。比如：
- `NullPointerException` 对某个`null`的对象调用方法或字段
- `IndexOutOfBoundsException` 数组索引越界

Java规定：
- 必须捕获的异常，包括`Exception`及其子类，但不包括`RuntimException`及其子类。这种类型的异常称为Checked Exception。必须捕捉也就是说编译器会强制调用方对异常进行处理，不然会直接编译报错。
- 不需要捕获的异常，包括`Error`及其子类，`RuntimeException`及其子类。也成Unchecked Excetion。

当然编译器并不强制要求程序捕获`RuntimeException`，但是否捕获应该视程序逻辑而定，具体情况具体分析。

- 捕捉异常：使用`try-catch`块。
- 抛出异常：`throws`语句，比如`throws new XXException(args);` 异常也是一个对象，也需要`new`。

如果是Checked Exception，但是没有用`try-catch`捕捉，那么必须在方法定义时，使用`throw XXXException`表明该函数可能抛出某种异常，由上层调用者来处理。
```java
static byte[] stringToGBK(String s) throws UnsupportedEncodingException{
    return s.getBytes("GBK");
}
```

此时就表明`stringToGBK`可能抛出Checked Exception，调用者就必须处理：`try-catch`或向上抛出，当然也可以使用`try-catch`捕获到异常后再向上抛出。

从编译器层面保证了Checked Exception必定能够得到处理，当然有助于保证程序的健壮性，但同时也使程序变得啰嗦起来。

当然只捕获不处理也是行得通的，但那感觉就像把异常抛弃了一样的脱裤子放屁的作弊行为，并不值得推荐，至少应该将其记录下来，让人知道程序运行出现了什么问题，而不是发现了问题但包着拒不报告增加调试和纠错难度。程序并不只是为了运行而编写，程序首先是给人看让人理解的，其次才是给机器执行的。

打印异常栈：`Throwable.printStackTrace()`方法。

### 4.2 捕获异常

使用`try-catch`语句来捕获异常，可以使用多个`catch`，每个`catch`分别捕获一个`Exception`的子类。捕获异常时从上到下匹配，匹配到后便不在继续，类似于`if - else if - else`逻辑。最后只能由一个`catch`语句能够被执行。

所以说`catch`的顺序很重要，如果同时捕获的多个异常类具有派生关系，那么为了确保子类异常能够被捕捉到，就必须将其放在父类异常前面。

如果无论是否有一场发生，都希望能够执行一些语句，做一些清理工作，那么应该放到`finally`中。
```java
try {
    // do try things
} catch (XXException e) {
    // do XXexcetion things
} catch (Exception e) {
    // do exception things
} finally {
    // do finally things
}
```

关于`finally`：
- 可写可不写，可选。
- `finally`总是最后执行。
- 如果有异常被捕获，那么执行对应的`catch`，然后执行`finally`，如果没有异常被捕获，那么`try`语句执行完后直接执行`finally`。
- 比较反直觉的一点是，如果在`catch`里面`return`了，同样会执行`fianlly`。并且如果`return`返回了一个表达式，那么会先计算这个表达式的值，然后再去执行`finally`中处理，然后返回原先计算得到的值，返回值是确定的，不会因为`finally`中有可能造成表达式值修改的处理而改变了返回的值。搞清楚这点即可。
- 某些情况也可以没有`catch`，直接使用`try ... finally`保证能够有一些抛出异常时同样能够得到执行的语句，并将异常继续往上抛。

甚至还可以合并多个类型的异常捕获：
```java
try {
    // do try things
} catch (XXXException | YYYException e) {
    // do XXexcetion or YYYException things
} catch (Exception e) {
    // do exception things
} finally {
    // do finally things
}
```
如果他们做的事情很类似的话，可以合并，否则感觉也没有多大必要。那么问题来了，合并处理的时候，异常对象`e`的类型是运行时才确定的吗？


### 4.3 抛出异常

异常的传播：
- 如果抛出的异常在调用层没有被捕获，那么异常会一致沿着调用者向上抛。直到被某一层的`try ... catch`捕获到。
- `try ... catch`可以嵌套，可以在`try`语句块里面再去`try ... catch`，如果没有里层`catch`没有捕获到，会被抛到外层来由外层的`catch`尝试捕获。
- 可以通过基类的`Throwable.printStackTrace()`方法来打印出该异常传播的调用栈。从最底层抛出的那一层直到调用的最顶层。对于调试错误很有帮助，给出了源代码行号，可以直接定位。
```java
java.io.UnsupportedEncodingException: unknown
	at java.base/java.lang.StringCoding.encode(StringCoding.java:440)
	at java.base/java.lang.String.getBytes(String.java:960)
	at Main.Main.stringToEncode(Main.java:41)
	at Main.Main.test(Main.java:22)
	at Main.Main.main(Main.java:13)
```
- 如果在某一层捕获了异常，但重新`new`了一个新的异常像上抛出，那么这个新的异常打印调用堆栈时就会丢失原始异常的信息。为了能够追踪原始的异常栈，可以把捕获到的异常作为参数，构造新的异常。
- 作为参数传入的用来构造异常的原始异常会被保存在`Throwable.cause`字段中，通过`Throwable.getCause()`方法获取到。
- 捕获到异常后，一定要**保留住原始异常**，以便定位最终的抛出位置。打印时你能够显示出原始异常信息。
```java
java.lang.IllegalArgumentException: java.lang.NumberFormatException: For input string: "abc"
    at Main.Main.test(Main.java:29)
    at Main.Main.main(Main.java:13)
Caused by: java.lang.NumberFormatException: For input string: "abc"
    at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.  java:68)
    at java.base/java.lang.Integer.parseInt(Integer.java:652)
    at java.base/java.lang.Integer.parseInt(Integer.java:770)
    at Main.Main.test(Main.java:24)
    ... 1 more
```
- 在`catch`中抛出异常，同`return`一样不会影响`finally`的执行，JVM会执行`finally`再抛出异常。那如果在`finally`抛出异常呢？那么既然是先执行`finally`自然是先抛出`finally`中的异常，`catch`中要跑出的异常就被屏蔽了。
- 像上述描述那样如果有多个类型的异常需要抛出，但是由于只能抛出一个，怎么办呢？如果我们需要捕获所有的异常的话，方法是先用`origin`变量保存原始异常，然后调用`Throwable.addSuppressed()`，把原始异常添加进来，最后在`finally`抛出
```java
static int test() throws Exception {
    Exception origin = null;
    try {
        System.out.println(Integer.parseInt("abc"));
    } catch (Exception e) {
        origin = e;
        throw e;
    } finally {
        Exception e = new IllegalArgumentException();
        if (origin != null) {
            e.addSuppressed(origin);
        }
        throw e;
    }
}
```
最终打印出的异常信息会是这个样子的：两个异常的信息都会得到保留。感觉也同样可以将`origin`作为参数用来构造新异常，但表示的含义应该有点区别：导致的关系与并列的关系？
```java
java.lang.IllegalArgumentException
    at Main.Main.test(Main.java:29)
    at Main.Main.main(Main.java:13)
    Suppressed: java.lang.NumberFormatException: For input string: "abc"
        at java.base/java.lang.NumberFormatException.forInputString   (NumberFormatException.java:68)
        at java.base/java.lang.Integer.parseInt(Integer.java:652)
        at java.base/java.lang.Integer.parseInt(Integer.java:770)
        at Main.Main.test(Main.java:24)
        ... 1 more
```
通过`Throwable.getSuppressed()`可以获取到所有的Suppressed Exception，结果是一个`Throwable []`。绝大多数情况下，`finally`中不需要抛出异常，通常也不需要关心Suppressed Exception，但需要知道可以这么用。

### 4.4 自定义异常

Java标准库常用异常：
```java
Exception
│
├─ RuntimeException
│  │
│  ├─ NullPointerException
│  │
│  ├─ IndexOutOfBoundsException
│  │
│  ├─ SecurityException
│  │
│  └─ IllegalArgumentException
│     │
│     └─ NumberFormatException
│
├─ IOException
│  │
│  ├─ UnsupportedCharsetException
│  │
│  ├─ FileNotFoundException
│  │
│  └─ SocketException
│
├─ ParseException
│
├─ GeneralSecurityException
│
├─ SQLException
│
└─ TimeoutException
```
当我们要抛异常时，尽量使用标准库异常，然而在一个大型项目中，必然需要定义自己的异常。这是，保持一个合理的异常继承体系非常重要。

常见做法是定义一个根异常，然后所有异常类从其派生，实现的话可以参照标准库`RuntimeException`:
```java
package java.lang;
public class RuntimeException extends Exception {
    public RuntimeException() {
        super();
    }
    public RuntimeException(String message) {
        super(message);
    }
    public RuntimeException(String message, Throwable cause) {
        super(message, cause);
    }
    public RuntimeException(Throwable cause) {
        super(cause);
    }
    protected RuntimeException(String message, Throwable cause,
                               boolean enableSuppression,
                               boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
```
应该要提供多种构造方法，好像也就构造了，其他具体问题具体看。

### 4.5 NullPointerException

派生于`RuntimeException`，异常类的定义都出人意料的简单。

java语法层面没有指针的概念，指针当然源自于C，指针让使用者看见了地址，提供给使用去操作地址的手段，引用类型只是隐藏了内存地址让其对使用者不可见，但思想是完全相同的，并且使用起来更简单。java中还是能看见指针的影子的，比如打印一个引用变量的值就能够看到类似于地址的东西。

如果使用了一个值为`null`的引用变量去调用它的非静态字段和方法，就会抛出`NullPointerException`。当然使用空引用操作静态字段或方法就等价于直接用类去使用，和引用的值没有半毛钱关系，是可以的，只是一般来说也不会去这么用。

如果遇到了`NullPointerException`，那么正确的处理应该是找到抛出的位置，添加判空处理，修正逻辑错误，而不是将其捕捉后隐藏错误或向上抛。至少在C++中，使用一个指针前先判空是常识性的东西，通过空指针去操作对象会直接导致崩溃。相信任何语言都是一样的，一个可用的程序它必须是健壮的，不应该有空指针异常这样的低级错误。

另一些避免该类问题的手段：当可以返回一个空字符串/空数组/其他空值或者返回一个`null`时，构造一个空值返回可以避免一部分这类问题。但不管怎么说，使用一个可能为空的东西前都应该是要判空的，难道不是吗？

给JVM添加一个`-XX:+ShowCodeDetailsInExceptionMessages`参数启用`NullPointerException`的详细信息输出，说明是谁空掉了。在IDE里面一般是默认开启的。

Eclispe给JRE指定参数：`window > preferences > java > Installed JREs > your JRE > edit > default VM arguments`。

### 4.6 断言

语法：`assert condition : "assertion message";`，其中的断言消息是一个字符串，可选。

断言失败，会抛出`AssertionError`，程序结束退出，因此断言不能用于可恢复的程序错误，只应该用在开发和测试阶段。我的理解是断言只应该用在那种基本不会失败，一旦失败程序再执行下去就没有什么意义不如直接退出的地方，以帮助快速定位。

那么如何区分测试阶段和正式上线，不让断言影响到用户体验呢？C/C++的方法一般是通过宏定义在DEBUG版本中断言是正常语义，在Release版本中断言不做任何事情。所以断言内部不应该有会修改变量的操作，去掉断言不应该会改变程序逻辑。绝对不应该写出这样的语句：`assert x++ > 0;`，当然这在任何语言中应该都是常识。

JVM默认关闭断言，遇到`assert`语句直接就忽略了，要开启断言，需要给JVM传递`-enableassertions`(简写`-ea`)参数。还可以有选择的启用断言，比如参数`-ea:Main.Main`就是对`Main.Main`这个类启用断言，或者某一个函数也可以。

实际开发中，很少使用断言，更好的做法是编写**单元测试**。以我有限的C++开发经验来说，在一个复杂的大型程序中，断言除了在调试版本中让你的程序崩溃之外没有任何作用。


### 4.7 使用JDK Logging

某些时候我们需要完整运行程序，而不是在调试环境下调试程序，但又想知道程序的详细运行状态。此时就需要知道一些中间过程执行情况，中间变量是否正确，这是可以怎么办呢？

最简单的方式就是通过`System.out.println`打印我们需要输出的变量，但这样比较初级，也不好管理。如果想要更加详细的信息，那么可以实现一个日志系统，在程序中穿插日志的记录，日志记录不会影响也不应该影响程序的正常执行逻辑，只是记录程序的执行状态。并且可以设定输出样式、设置日志分级、重定向到文件等等功能。

Java当然考虑到了这些东西，所以提供了内置的日志包`java.util.logging`，不需要我们来自己造轮子。

`java.util.logging.Logger`类：
```java
import java.util.logging.Logger;

LLogger logger = Logger.getGlobal();
logger.severe("a fatal error occurred...");
logger.warning("just a warining...");
logger.info("started...");
logger.config("config ...");
logger.fine("just fine...");
logger.finer("won't crash...");
logger.finest("work normally...");
```
打印信息中包含了时间，调用类和方法，输出信息：
```java
3月 24, 2021 10:49:03 下午 Main.Main main
严重: a fatal error occurred...
3月 24, 2021 10:49:03 下午 Main.Main main
警告: just a warining...
3月 24, 2021 10:49:03 下午 Main.Main main
信息: started...
```

JDK的`Logging`定义了7个日志级别，从严重到普通:
- `SEVERE`
- `WARNING`
- `INFO`
- `CONFIG`
- `FINE`
- `FINER`
- `FINEST`

默认级别是`INFO`，`INFO`及以下的信息不会被打印出来。使用日志级别的好处在于可以调整级别就可以筛选和屏蔽调很多调试相关的日志输出。

局限：
- JDK的`Logging`系统在JVM启动时读取配置文件完成初始化，一旦开始运行`main`方法，就无法修改配置。
- 配置不太方便，需要在JVM启动时传递参数`-Djava.util.logging.config.file=<config-file-name>`以重定向到文件。

好处：
- 可以存档以追踪问题，将一次程序的运行状况记录下来分析。
- 可以按级别分类，方别打开或关闭某些级别。
- 可以根据配置文件调整日志，无需修改代码。

TODO：使用参数`-Djava.util.logging.config.file=<config-file-name>`重定向到文件无论是IDE还是命令行都可以执行，但都没有成功输出到文件，更多细节待以后有需要来补充。

### 4.8 Commons Logging

Commons Logging是一个由Apache创建的第三方日志库，可以挂接不同的日志系统，通过配置文件指定挂接的日志系统。默认情况下自动搜索并使用Log4j，如果没有找到就再使用JDK Logging。

使用方法：
- 通过`LogFactory`获取`Log`类实例，然后使用`Log`实例来打印日志。

```java
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
public class Main {
    public static void main(String[] args) {
        Log log = LogFactory.getLog(Main.class);
        log.info("start...");
        log.warn("end.");
    }
}
```
当然因为是第三方库，JDK里面是没有的，所以需要下载([下载地址](https://commons.apache.org/proper/commons-logging/download_logging.cgi)，最新版本1.2)后添加到`classpath`。

命令行编译执行：
- 将`commons-logging-1.2.jar`文件放在`Main.java`同一个目录。
- 执行`javac -cp commons-logging-1.2.jar Main.java`编译得到`Main.class`。
- 然后`java -cp .;commons-logging-1.2.jar Main`执行java程序。如果执行`.class`时指定了classpath，那么应该将当前目录也作为classpath，不然会找不到主类`Main`。注意classpth多个路径时Windows中使用`;`分割，Linux和MacOS使用`:`分割，Windows中如果在Powershell中执行，多个路径还要加上双引号包起来。
- 也可以跳过编译，直接执行java文件，`java -cp commons-logging-1.2.jar Main.java`。

Eclipse中导入第三方库见 [0.3 基本Eclipse使用](#03-%E5%9F%BA%E6%9C%ACeclipse%E4%BD%BF%E7%94%A8)。

Common Logging定义了6个日志级别，默认级别是`INFO`：
- `FATAL`
- `ERROR`
- `WARN`
- `INFO`
- `DEBUG`
- `TRACE`

`Log`的使用：
- 如果在静态方法中使用`Log`，通常直接定义了一个静态成员给所有方法共用，使用`LogFactory.getLog(Main.class)`获取`Log`实例，只能在该类中使用。
- 如果是在实例方法中使用，通常定义一个实例变量，使用`LogFactory.getLog(getClass())`获取实例，这样做的好处时，由于多态的特性子类的`getClass()`返回的是子类的类型，所以子类也可以直接使用该`Log`实例。最好定义为`protected`。
- `Log`接口(interface)对每种级别的日志都声明了两个重载的方法，接口名称和上面列出的级别一致：
```java
void info(Object message)
void info(Object message, Throwable t)
```
第二个重载可以传入异常，用在`catch`语句中很方便，结果除了输出`message`之外，还会调用异常的`printStackTrace`输出异常栈。
```java
public static void main(String[] args) {
	try {
		throw new RuntimeException();
	} catch (Exception e) {
		log.error("exception occureed", e);
	}
}
```

### 4.9 Log4j

上面的Commons Logging可以作为“日志接口”来使用，而真正的“日志实现”可以使用Log4j。前面提到Commons Logging默认查找`classpath`下的Log4j来作为日志实现，没有的话则会使用JDK Logging。

Log4j是一种非常流行的日志框架，当前最新版本2.14，[下载地址](https://logging.apache.org/log4j/2.x/download.html)，同样是Apache的。

Log4j是一个组件化的日志系统，架构如下：
```
log.info("User signed in.");
 │
 │   ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐
 ├──>│ Appender │───>│  Filter  │───>│  Layout  │───>│ Console  │
 │   └──────────┘    └──────────┘    └──────────┘    └──────────┘
 │
 │   ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐
 ├──>│ Appender │───>│  Filter  │───>│  Layout  │───>│   File   │
 │   └──────────┘    └──────────┘    └──────────┘    └──────────┘
 │
 │   ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐
 └──>│ Appender │───>│  Filter  │───>│  Layout  │───>│  Socket  │
     └──────────┘    └──────────┘    └──────────┘    └──────────┘
```
使用Log4j输出日志时，自动通过不同的Appender把日志输出到不同的目的地。
- console: 屏幕/控制台
- file: 文件
- socket: 通过网络输出到远端计算机
- jdbc: 输出到数据库

输出日志时可以通过Filter过滤哪些日志要输出，哪些不输出。例如仅输出ERROR级别的日志，最后通过Layout来格式化日志信息。例如自动添加日期、时间、方法名称等。

实际使用时，并不需要关心Log4j的API，而是通过配置文件来配置它。使用时，将一个`Log4j2.xml`文件放到`classpath`下就可以让Log4j读取配置文件并按照我们想要的输出方式输出日志。例子：
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration>
	<Properties>
		<!-- 定义日志格式 -->
		<Property name="log.pattern">%d{MM-dd HH:mm:ss.SSS} [%t] %-5level %logger{36}%n%msg%n%n</Property>
		<!-- 定义文件名变量 -->
		<Property name="file.err.filename">log/err.log</Property>
		<Property name="file.err.pattern">log/err.%i.log.gz</Property>
	</Properties>
	<!-- 定义Appender，即目的地 -->
	<Appenders>
		<!-- 定义输出到屏幕 -->
		<Console name="console" target="SYSTEM_OUT">
			<!-- 日志格式引用上面定义的log.pattern -->
			<PatternLayout pattern="${log.pattern}" />
		</Console>
		<!-- 定义输出到文件,文件名引用上面定义的file.err.filename -->
		<RollingFile name="err" bufferedIO="true" fileName="${file.err.filename}" filePattern="${file.err.pattern}">
			<PatternLayout pattern="${log.pattern}" />
			<Policies>
				<!-- 根据文件大小自动切割日志 -->
				<SizeBasedTriggeringPolicy size="1 MB" />
			</Policies>
			<!-- 保留最近10份 -->
			<DefaultRolloverStrategy max="10" />
		</RollingFile>
	</Appenders>
	<Loggers>
		<Root level="info">
			<!-- 对info级别的日志，输出到console -->
			<AppenderRef ref="console" level="info" />
			<!-- 对error级别的日志，输出到err，即上面定义的RollingFile -->
			<AppenderRef ref="err" level="error" />
		</Root>
	</Loggers>
</Configuration>
```
虽然配置Log4j比较繁琐，但一旦配置完成，使用起来就非常方便。对上面的配置文件，凡是INFO级别的日志，会自动输出到屏幕，而ERROR级别的日志，不但会输出到屏幕，还会同时输出到文件。并且，一旦日志文件达到指定大小（1MB），Log4j就会自动切割新的日志文件，并最多保留10份。更多配置参见[官方文档](https://logging.apache.org/log4j/2.x/manual/configuration.html)。

使用：下载后将下面三个`jar`和配置文件`Log4j2.xml`添加到`classpath`:
- `log4j-api-2.x.jar`
- `log4j-core-2.x.jar`
- `log4j-jcl-2.x.jar`

将这三个包添加到classpath之后还要保证`Log4j.xml`在classpath根目录（也就是要放到Eclipse工程的`bin/`目录下，或者命令行执行时放到生成`.class`的根目录），这样就可以按照配置文件内容输出到日志文件。

总结：
- 通过Commons Logging输出日志，不用修改代码只需进行配置就可以使用Log4j。
- 使用Log4j只需要将jar和配置文件Log4j2.xml添加到classpth。
- 更换Log4j，只需要移除jar和Log4j2.xml。
- 扩展Log4j时才需要使用Log4j的接口，例如自己开发将日志加密写入数据库的功能。
- 当然其实也可以跳过Commons Logging这一层直接使用Log4j输出日志。

### 4.10 SLF4J & Logback

上面的Commons Logging和Log4j分别扮演日志API和日志实现的角色，搭配使用。同样的库还有SLF4J(API)和Logback(实现)。他们都是开源的第三方库，因为对Commons Logging的接口和Log4j的性能不满意，所以就分别有了[SLF4J](https://www.slf4j.org/download.html)和[Logback](https://logback.qos.ch/download.html)。

那么SLF4J相较Commons Logging有什么优势呢？
- 支持`logger.info("{},{}", str1, str2)`这样的字符串格式化。
- 还有呢？

事实上SLF4J的日志接口与Commons Logging几乎一波一样，对比：
|Commons Logging|SLF4j|
|:-|:-|
|`org.apache.commons.logging.Log`|`org.slf4j.Logger`|
|`org.apache.commons.logging.LogFactory`|`org.slf4j.LoggerFactory`|

就是`Log`变成了`Logger`，`LogFactory`变成了`LoggerFactory`。

配置SLF4J和Logback，需要下列三个jar包，目前使用的是`SLF4J 1.7.9`和`logback 1.2.3`：
- `slf4j-api-1.7.x.jar`
- `logback-classic-1.2.x.jar`
- `logback-core-1.2.x.jar`

添加到`classpath`，添加配置文件`logback.xml`到`classpath`根目录：
```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>

	<appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
		<encoder>
			<pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
		</encoder>
	</appender>
	<appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
		<encoder>
			<pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
			<charset>utf-8</charset>
		</encoder>
		<file>log/output.log</file>
		<rollingPolicy class="ch.qos.logback.core.rolling.FixedWindowRollingPolicy">
			<fileNamePattern>log/output.log.%i</fileNamePattern>
		</rollingPolicy>
		<triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
			<MaxFileSize>1MB</MaxFileSize>
		</triggeringPolicy>
	</appender>
	<root level="INFO">
		<appender-ref ref="CONSOLE" />
		<appender-ref ref="FILE" />
	</root>
</configuration>
```

然后使用时替换为对应的类型和接口接口：
```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class Main {
    public static void main(String[] args) {
        Logger logger = LoggerFactory.getLogger(Main.class);
        logger.info("start...");
        logger.warn("end.");
    }
}
```

总结：
- SLF4J和Logback可以取代Commons Logging和Log4j。
- 始终使用SLF4J的接口写入日志，使用Logback只需要配置，不需要修改代码。

知道大概用法即可，有需求时再去研究具体配置和细节用法。


## 5. 反射

### 5.1 Class类

除了`int`等基本类型外，Java的其他类型都是`class`，包括`interface`。如`Runable`、`Object`、`String`、`Exception`等。

类这种东西是由Java在执行过程中动态加载的，那么Java是如何实现RTTI的呢？每加载一个类，JVM会为其创建一个`Class`类实例，并将这个类和这个`Class`实例关联起来。这个`Class`类的定义大概是这样的：
```java
public final class Class {
    private Class() {}
}
```

在C++里面，如果我们要自己实现RTTI，其实也是这样来做的，具体做法大概是：
- 当有新的类被添加到继承体系结构时，新的`Class`对象被创建，并被加到派生关系树的对应位置(叶子节点)，通过这个对象我们可以访问到他的所有直接与间接基类(向上遍历)。
- 每个类中使用一个静态数据成员保存该类对应的`Class`对象(指针)，定义静态成员函数以获取到该指针。
- 每个类中再定义非静态成员函数(`getClass()`)转调上面的静态成员函数，这个非静态成员函数需要是从根类继承来的**虚函数**，在每个类中重写以返回自己的`Class`对象，这是最关键的地方，通过该接口获取到对象真实类型的`Class`对象即可实现运行时类型识别。
- 通常通过一个机制实现上面3个过程，一般来说就是写一个宏而已。典型的实现可以参考MFC(一个经典/过时的Windows界面库)。
- 一般来说还会允许用户自己从指定的基类派生实现的类也有这个特性，那么就需要对外公开上一步说的那个机制让用户来用，还需要提供能够使类型动态加载和卸载的机制，也就是动态地从类型树上删除或者添加节点的机制，一般作为静态函数实现在类中，在模块加载和卸载时做即可。

TODO：了解反射之后，可以尝试在C++上实现反射。

能够预想到，java从语言层面就实现了这个机制，那么就来看一下对应的功能是如何实现的：
- `Class`类构造是`private`的，也就是说只有JVM能够来创建`Class`实例。
- JVM持有的每一个`Class`对象都对应一个数据类型(`class`或`interface`)。
- `Class`实例包含了该类的所有信息(`String`为例)：
    - 名称，`java.lang.String`
    - 包，`java.lang`
    - 基类，`java.lang.Object`
    - 接口，`java.io.Serializable`,`Comparable<String>`,etc.
    - 字段，`value[]`,etc.
    - 方法，`String()`,`length()`,etc.

这种通过该`Class`实例获取到类的信息的方法称为**反射(Reflection)**。

那么要如何获取到一个类的`Class`对象呢：
- 通过类的静态变量`class`获取：`Class strClass = String.class`。因为`class`还是定义类的关键字，所以这里是Java编译器做了特殊处理，不是简单地在定义在`Object`类中的一个静态字段。在`Object`定义中也是找不到`class`字段的。
- 通过实例的`getClass()`方法获取，这个方法是定义在万物的基类`Object`中的，因为内置类型不从`Object`派生，所以没有这个方法可以调用。
    ```java
    String s = "hello";
    Class strClass = s.getClass();
    ```
- 如果知道一个`Class`实例的完整类名，可以通过静态方法`Class.forName(String className) throws ClassNotFoundException`来获取：
    ```java
    try {
        Class strCls = Class.forName("java.lang.String");
    } catch (Exception e) {
        System.out.println("no such a class: java.lang.String");
    }
    ```

注意获取类的`Class`实例判等与`isntanceOf`的区别，如果要求是同一个类型，后者可以是基类。

`Class`定义：
```java
public final class Class<T> implements java.io.Serializable,
                              GenericDeclaration,
                              Type,
                              AnnotatedElement,
                              TypeDescriptor.OfField<Class<?>>,
                              Constable
```


通过`Class`对象获取类的基本信息：获取类名、去除包名后的简化类名、类型名、包、包名、基类、接口、字段、方法、判断是否是各种特殊的类型、通过类名得到对应`Class`对象等，这里并未列全。
```java
public String getName()
public String getSimpleName()
public String getTypeName()
public String getCanonicalName()
public Package getPackage() // If this class represents an array type, a primitive type or void, this method returns null
public String getPackageName()
public native Class<? super T> getSuperclass()
public Class<?>[] getInterfaces()
public boolean isAnonymousClass()
public boolean isLocalClass()
public boolean isMemberClass()
public Class<?>[] getClasses()
public Field[] getFields() throws SecurityException
public Method[] getMethods() throws SecurityException
public Constructor<?>[] getConstructors() throws SecurityException
public Field getField(String name)
public Method getMethod(String name, Class<?>... parameterTypes) throws NoSuchMethodException, SecurityException
public Constructor<T> getConstructor(Class<?>... parameterTypes) throws NoSuchMethodException, SecurityException
public boolean isEnum()
public boolean isRecord()
public native boolean isArray();
public native boolean isInterface();
public native boolean isPrimitive();
public boolean isAnnotation()
public boolean isSynthetic()
public static Class<?> forName(String className) throws ClassNotFoundException
public T newInstance() throws InstantiationException, IllegalAccessException
```

JVM为每一种基本类型进行了特殊处理创建了`Class`对象，可以直接通过`int.class`这种方式访问。但是对内置类型的变量，因为没有从`Object`派生，所以是不能通过实例的`getClass`方法来获取`Class`对象的。

获取到一个类型的`Class`对象之后，就可以用其来创建该类型对象：但是因为没有参数，所有只能调用无参构造函数。
```java
try {
	Class cls = Student.class;
	Student s  = (Student)cls.newInstance();
	System.out.println(s);
} catch (Exception e) {
	System.out.println(e);
}
```
如果传入的这个`Class`对象对应的类没有无参构造，那么会抛出`java.lang.InstantiationException`，如果无参构造无法访问或者使用的是`Class`类对应的`Class`对象，那么会抛出`java.lang.IllegalAccessException`。其中做了特殊处理，况且`Class`的无参构造是`private`的。`Class`对象只能由JVM在加载了新的类时来创建。

JVM并不会在一次性把所有用到的类加载到内存中(即是不会一次性创建所有`Class`对象)，需要程序执行过程中用到了一个新的类，才会把这个类加载到内存(也就是创建它的`Class`对象)。这是JVM**动态加载**`class`的特性。

因为动态加载特性，就可以用下面的函数来判断一个类是否存在，如果传入的类名在`classpath`中存在那么就会返回`true`，前面提到的Commons Logging判断Log4j是否存在就可以用这样的方法。
```java
static boolean isClassPresent(String name) {
	try {
		Class.forName(name);
		return true;
	} catch (Exception e) {
		return false;
	}
}
```

我比较好奇的一点是`Class`对象是如何创建的，用什么样的数据结构来存储的，JVM会如何管理。当然这个可能需要了解JVM的实现，TODO。

### 5.2 访问字段

对任意的`Object`，有了它的`Class`对象，就可以获取这个它的一切信息。
- `public Field getField(String name)` 根据字段名获取某个public的字段（包括父类和接口，找不到的话先按照声明顺序找接口，再找基类）
- `public Field getDeclaredField(String name)` 根据字段名获取当前类的某个字段，包括所有访问权限的字段（不包括父类和接口）
- `public Field[] getFields()` 获取所有public字段，包括所有基类和实现的接口，如果是内置类型或者数组对应的`Class`实例，那么返回空数组
- `public Field[] getDeclaredFields()` 获取当前类定义的所有访问权限的字段，不包括基类和接口

`Field`类型：
- 定义：`public final class Field extends AccessibleObject implements Member`
- `public String getName()` 获取字段名称
- `public Class<?> getType()` 获取字段类型的`Class`对象
- `public native int getModifiers();` 获取字段修饰符，不同的bit表示不同含义
    ```java
    public static final int PUBLIC           = 0x00000001;
    public static final int PRIVATE          = 0x00000002;
    public static final int PROTECTED        = 0x00000004;
    public static final int STATIC           = 0x00000008;
    public static final int FINAL            = 0x00000010;
    public static final int SYNCHRONIZED     = 0x00000020;
    public static final int VOLATILE         = 0x00000040;
    public static final int TRANSIENT        = 0x00000080;
    public static final int NATIVE           = 0x00000100;
    public static final int INTERFACE        = 0x00000200;
    public static final int ABSTRACT         = 0x00000400;
    public static final int STRICT           = 0x00000800;
    ```

获取字段的值：`public Object get(Object obj)`，参数为需要获取字段的对象，返回值被装箱到`Object`对象中，如果是内置类型，会自动包装为对应的包装类型。

如果在没有访问该字段权限的地方用了`Field.get`那么可能会抛出`IllegalAccessException`，如果非要访问，可以在前面加上`public void setAccessible(boolean flag)`调用传入`true`确保能够访问。`setAccessible`是在从基类`AccessibleObject`中继承而来的，`Field` `Method` `Constructor`都直接或间接从其派生。
- 反射是一个非常规用法，使用反射，代码会很繁琐，使用反射会破坏对象的封装。
- 反射更多提供给工具或底层框架来使用，目的是在不知道目标实例任何信息的情况下，获取特定字段的值。
- `setAccessible(true)`可能会失败，如果JVM运行期存在`SecurityManager`，那么它会根据规则进行检查，有可能阻止`setAccessible(true)`。

设置字段值：`public void set(Object obj, Object value)`

静态实例的话`get/set`的`obj`参数会被忽略，自动为`null`，建议写为`null`，就像调用类的静态方法是最好用类名而不是用实例一样，只为让代码更清晰。

值得注意的是，反射相关类型位于`java.lang.reflect`包内，与`java.lang`不是一个包，不会自动导入，需要手动`import`。

### 5.3 访问方法

类似于访问字段，访问一个类的方法在`Class`类中有如下方法：
- `public Method getMethod(String name, Class<?>... parameterTypes)` public，包括基类
- `public Method getDeclaredMethod(String name, Class<?>... parameterTypes)` 所有权限，不包括基类和接口
- `public Method[] getMethods()` public，包括基类
- `public Method[] getDeclaredMethods()` 所有权限，不包括基类和接口

末尾的可变参数需要按顺序传入方法参数列表的`Class`对象，为空就是无参版本。

`Method`类型：
- 定义：`public final class Method extends Executable`
- `public String getName()`
- `public int getModifiers()`
- `public int getParameterCount()`
- `public TypeVariable<Method>[] getTypeParameters()`
- `public Class<?> getReturnType()`
- `public Class<?>[] getExceptionTypes()`

见名知意，其中后面三个都还有一个`Generic`的方法，`getGenericParameterTypes` `getGenericReturnType()` `getGenericExceptionTypes()`返回值类型为`Type`，也就是`Class`实现的其中一个接口。这三个方法表示得到参数列表、返回值、异常的正式类型。

使用反射调用方法：
- `public Object invoke(Object obj, Object... args)` 第一个是对象实例，后面的是参数列表。
- 对`Method`实例调用`invoke`方法，就等同与直接使用该对象调用该方法。
- 调用静态方法的话第一个参数传入`null`即可，会被忽略。
- 同理，调用非`public`字段需要`setAccessible(true)`。
- 当然也遵守多态原则。


### 5.4 调用构造方法

我们通常用`new`操作符创建新的实例，有了反射也可以通过`Class`对象的方法来创建：
```java
Student s = new Student();
Student s2 = Student.class.newInstance(); // 调用public无参构造
```

后者只能调用公有的无参构造，为了能够调用到所有构造，Java的反射API提供了`Constructor`对象，包含一个构造方法的所以信息，可以用来创建一个实例，和`Method`很类似，不同之处仅在于它是构造方法，并且总是返回实例。`Class`中用于获取`Constructor`的方法：
```java
public Constructor<T> getConstructor(Class<?>... parameterTypes) throws NoSuchMethodException, SecurityException
public Constructor<?>[] getConstructors() throws SecurityException
public Constructor<T> getDeclaredConstructor(Class<?>... parameterTypes) throws NoSuchMethodException, SecurityException
public Constructor<?>[] getDeclaredConstructors() throws SecurityException
```
同理前两者获取public的构造，后两者获取所有访问权限的构造，不同于方法和字段的是前两个方法不会获取到基类的构造，因为并不能调用基类的构造方法来构造子类的对象。如果是非静态的Inner class，那么第一个参数还需要额外传入内部类关联的实例，不展开详述。

`Constructor`类型：
- 定义：`public final class Constructor<T> extends Executable`
- 方法：设置访问权限、获取定义的类、名称、修饰符、参数列表类型、异常类型、调用构造方法等。
```java
public void setAccessible(boolean flag)
public Class<T> getDeclaringClass()
public String getName()
public int getModifiers()
public TypeVariable<Constructor<T>>[] getTypeParameters()
public Class<?>[] getExceptionTypes()
public T newInstance(Object ... initargs) throws 
            InstantiationException, IllegalAccessException, 
            IllegalArgumentException, InvocationTargetException
```


### 5.5 获取继承关系

获取一个`Class`对象的三种方法：
- `className.class`
- `classInstance.getClass()`
- `Class.forName(classNameString)`

对同一个类而言，这三种方法获取的都是同一个实例，JVM对每个类只会创建一个`Class`实例。

获取父类的`Class`，前面已经有提到，就是`Class`的`getSuperClass`方法，获取接口则使用`getInterfaces`接口：
```java
public native Class<? super T> getSuperclass();
public Class<?>[] getInterfaces()
```

判断继承关系：
- 如果是一个实例，那么使用`instanceof`
    ```java
    Double n = Double.valueOf(10.0);
    boolean isDouble = n instanceof Double;
    ```
- 如果是`Class`对象，那么使用`isAssignableFrom`，含义是`cls`表示的类的对象是否可以被赋给`this`表示的类的变量，即是传入的`Class`是否是当前`Class`的子类。
    ```java
    // declaration
    public native boolean isAssignableFrom(Class<?> cls);
    // calling
    boolean isNumber = Number.class.isAssignableFrom(Integer.class); // true
    ```
- 判断一个对象是否是一个类或者其子类的对象：`isInstance`，等价于使用`instanceof`
    ```java
    // declaration
    public native boolean isInstance(Object obj);
    // calling
    Integer n = Integer.valueOf(10);
    boolean isNumber = Number.class.isInstance(n); // true
    ```

### 5.6 动态代理

Java的`class`和`interface`的区别就是接口可以多继承，接口没有构造，接口不能有类成员，接口不能实例化。当然抽象类也不可以实例化，这样看感觉其实也就多继承和区别而已，因为需要用接口来多继承所以才不能有构造和实例字段。

那么能不能不编写实现类，在运行时创建出一个`inteface`实例呢？Java标准库提供了动态代理(Dynamic Proxy)来实现这个事情。

所谓的动态是和静态对应的，典型的静态创建即定义类来实现接口，然后实例化类对象并用接口来调用：
```java
interface Hello {
	public void morning();
}
class HelloWorld implements Hello {
	public void morning() {
		System.out.println("hello, world");
	}
}
public class Test {
	public static void Main() {
		Hello h = new HelloWorld();
	    h.morning();
	}
}
```

那么动态创建怎么做呢？
```java
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

interface Hello {
	public void morning();
}

public class Main {
	public static void main(String[] args) throws Exception {
		InvocationHandler handler = new InvocationHandler() {
			@Override
			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				System.out.println(method);
				if (method.getName().equals("morning"))
				{
					System.out.println("hello,world");
				}
				return null;
			}
		};
		Hello h = (Hello)Proxy.newProxyInstance(
				Hello.class.getClassLoader(),
				new Class[] {Hello.class},
				handler);
		h.morning();
	}
}
```

方法如下：
- 定义一个`InvocationHandler`实例，负责实现接口的方法调用，这里的语法是使用匿名类实现了`InvocationHandler`接口的`invoke`方法，并且在其中动态实现了`morning`方法。
- 通过`Proxy.newProxyInstance()`创建`interface`实例，需要三个参数：
    - 使用的`ClassLoader`，通常就是接口的`ClassLoader`，通过接口`Class`实例的`getClassLoader`方法获取。
    - 需要实现的接口数组，至少传入一个接口。
    - 处理调用方法的`InvocationHandler`实例。
- 将返回的`Object`实例转换为接口。

其实实现的方式就是JVM为我们自动编写了一个类（不需要源码直接生成字节码），并不存在可以直接实例化接口的黑魔法。而且因为最终创建的对象是通过接口来用，也就没有办法添加和使用实例字段。暂不清楚使用场景。

动态代理是通过`Proxy`创建代理对象，然后将方法代理给`InvocationHandler`完成的。

更多理解TODO。

## 6. 注解

### 6.1 使用注解

注解(Annotation)是放在Java源码的类、字段、方法、参数前的一种特殊“注释”。注释会被编译器直接忽略，但注解可以被编译器打包进`class`文件中，因此，注解是一种用作标注的“元数据”。比如重写基类方法时开头添加的`@Override`就是注解。

注解的作用：

从JVM的角度看，注解本身对代码逻辑没有任何影响，如何使用注解完全由工具(比如一些库自己定义的注解)、你的代码(你自己定义的注解需要编写逻辑来使用它)决定。Java的注解可以分为三类：

第一类是由编译器使用的注解，如：
- `@Override`：让编译器检查方法是否正确实现了覆写。
- `@SuppressWarnings`：告诉编译器忽略此处代码产生的警告。

类注解不会被编译到`.class`文件中，编译后就被扔掉了。

第二类是由工具处理的`.class`文件时使用的注解，比如某些工具加载class时候会对class做动态修改，实现一些特殊的功能。这类注解会被编译到`.class`文件中，但加载结束后不会存在于内存中。这类注解只会被一些底层库使用，一般我们不必处理。例如？

第三类是程序运行期能够读取的注解，加载后一直存在JVM中，这也是**最常用**的注解。比如一个配置了`@PostConstruct`注解的方法会在调用构造方法后自动被调用，这是我们自己的Java代码读取该注解需要实现的功能，JVM并不认识该注解也不会帮你实现你脑子里的东西。

定义一个注解时，还可以定义**配置参数**，配置参数可以包括：
- 所有基本类型
- `String`
- 枚举
- 基本类型、`String`、`Class`以及枚举的数组

因为配置参数必须是常量，上述的限制保证了注解在定义时就已经确定了每个参数的值，就是说编译期就已经确定了。

注解的配置参数可以有默认值，缺少某个配置参数时将使用默认值。大部分注解会有一个名为`value`的配置参数，对此参数赋值，可以只写常量，相当于省略了`value`参数。如果只写注解，相当于全部使用默认值。
```java
public class Hello {
    @Check(min=0, max=100, value=55) // 定义了三个参数
    public int n;

    @Check(value=99) // 只定义了一个value参数
    public int p;

    @Check(99) // 等价于@Check(value=99)
    public int x;

    @Check // 全部使用默认值
    public int y;
}
```

### 6.2 定义注解

注解当然不是从虚空中生长出来的，Java语言使用`@interface`语法来定义注解。格式如下：
```java
public @interface Report {
    int type() default 0;
    String level() default "info";
    String value() default "";
}
```
`@interface`定义注解名，注解的参数类似无参数方法，使用`类型 参数名() default 默认值;`这样的语法来定义，可以用`default`设定一个默认值（强烈推荐）。最常用的参数应当命名为`value`（这样使用时就可以不写参数名）。

**元注解**：一些可以被用来修饰其他注解的注解（搁着套娃呢？），这些注解就被称为元注解（meta annotation）。元注解也是注解，当然也可以被元注解修饰。

Java标准库定义了一些元注解，通常不需要自己去编写元注解，就是说其实也是可以的喽。

**@Target**：最常用的元注解，使用`@Target`用来定义注解可以被用于源码的哪些位置：
- 类或接口：`ElementType.TYPE`
- 字段：`ElementType.FIELD`
- 方法：`ElementType.METHOD`
- 构造方法：`ElementType.CONSTRUCTOR`
- 方法参数：`ElementType.PARAMETER`
- 其他：`LOCAL_VARIABLE` `ANNOTATION_TYPE` `PACKAGE` `TYPE_PARAMETER` `TYPE_USE` `MODULE`

例如定义`@Report`注解可以用于方法上，则需要加上元注解`@Target(ElementType.METHOD)`。
```java
@Target(ElementType.METHOD)
public @interface Report {
    int type() default 0;
    String level() default "info";
    String value() default "";
}
```

`ElementType`是一个位于`java.lang.annotation`的枚举类型，和注解`@Target`一样使用时都需要导入。`@Target`的`value`参数是一个`ElementType[]`，如果可以用在多个位置，则需要使用数组`@Target({ElementType.METHOD, ElementType.TYPE})`，只用在一个位置则可以只使用一个枚举值。

**@Retention**：定义注解的生命周期：
- 仅编译期：`RetentionPolicy.SOURCE`
- 仅`class`文件：`RetentionPolicy.CLASS`
- 运行期：`RetentionPolicy.RUNTIME`

如果`@Retention`不存在，则该注解默认为`CLASS`，通常我们自定义的注解都是`RUNTIME`，所以务必要加上`@Retention(RetentionPolicy.RUNTIME)`这个元注解。

**@Repeatable**：使用这个元注解可以定义注解是否可以重复，应用不是很广泛。经过`@Repeatable`修饰之后，就可以在某个类型声明处添加多个注解。
```java
@Repeatable(Reports.class)
@Target(ElementType.TYPE)
@interface Report {
    int type() default 0;
    String level() default "info";
    String value() default "";
}

@Target(ElementType.TYPE)
@interface Reports {
    Report[] value();
}

@Report(type=1, level="debug")
@Report(type=2, level="warning")
class Hello {
}
```

**@Inherited**：定义子类是否可以继承父类的注解，`@Inherited`仅针对`@Target(ElementType.TYPE)`的注解有效，并且仅针对`class`继承，对`interface`继承无效。

以上这些元注解都是定义在包`java.lang.annotation`中的，前面说到的标准库中的注解如`@Override`/`@SuppressWarnings`是定义在`java.lang`中自动导入的，并不是编译器或者JVM凭空生成的。

总结：
- 注解使用`@interface`定义。
- 可定义多个参数和默认值，核心参数使用`value`名称。
- 必须使用`@Target`来指定注解可以应用的范围。
- 自定义注解时应当设置`@Retention(RetentionPolicy.RUNTIME)`以便运行期读取改注解。


到这里其实我已经有一堆疑问了：
- 为什么用`@interface`来定义，感觉这么暧昧，注解可以理解为一种特殊的类型/接口定义吗？
- 注解到底是怎么起作用的？我自己定义的注解能够做到些什么？应该怎么编写逻辑来实现注解的功能？标准库的如`@Override`这种注解是怎么实现效果的？是写在代码中的逻辑？还是java编译器的特殊处理？
- java编译器如何处理`RetentionPolicy.SOURCE`的注解？`.class`文件如何保存`RetentionPolicy.CLASS`的注解？JVM如何看待和处理`RetentionPolicy.RUNTIME`的注解？

### 6.3 处理注解

根据`@Retention`的配置：
- `RetentionPolicy.SOURCE`类型的注解主要由编译器使用，因此我们一般只使用，不编写。
- `RetentionPolicy.CLASS`的注解主要由底层工具使用，涉及到class的加载，一般我们很少用到。
- `RetentionPolicy.RUNTIME`的注解会被经常用到，经常需要编写。

这里只讨论如何读取`RetentionPolicy.RUNTIME`类型的注解。注解定义后也是一种`class`，所有注解都继承自`java.lang.annotation.Annotation`。读取注解需要使用反射API。

java提供的使用反射API读取注解的方法包括：
判断某个注解是否存在于`Class` `Field` `Method` `Constructor`：
- `Class.isAnnotationPresent(Class)`
- `Field.isAnnotationPresent(Class)`
- `Method.isAnnotationPresent(Class)`
- `Constructor.isAnnotationPresent(Class)`

`Clss`是实现了这个方法的，后三者是直接或间接从基类`AccessibleObject`继承而来的该方法。最终都是实现的最顶层接口`AnnotatedElement`的方法。

`AnnotatedElement`接口定义，主要是判断注解是否存在和获取注解：
```java
default boolean isAnnotationPresent(Class<? extends Annotation> annotationClass)
<T extends Annotation> T getAnnotation(Class<T> annotationClass);
Annotation[] getAnnotations();
default <T extends Annotation> T[] getAnnotationsByType(Class<T> annotationClass)
default <T extends Annotation> T getDeclaredAnnotation(Class<T> annotationClass)
default <T extends Annotation> T[] getDeclaredAnnotationsByType(Class<T> annotationClass)
Annotation[] getDeclaredAnnotations();
```

这里的`Annotation`接口的就是所有注解的基类。定义：
```java
public interface Annotation {
    boolean equals(Object obj);
    int hashCode();
    String toString();
    Class<? extends Annotation> annotationType();
}
```

使用反射API读取注解：
- 对于`Class` `Field` `Method` `Constructor`的话就是使用`AnnotatedElement.getAnnotation()`等相关接口了。`Class` `Field` `Method` `Constructor`都是有定义的。如果不存在对应的注解，会返回`null`。可以通过返回值是否为`null`来判断是否有传入的注解。
- 而要获取到方法参数的注解就相对麻烦了，因为可能有多个参数，每个参数也可能有多个注解，所以结果使用一个二维数组来表示。使用`public abstract Annotation[][] getParameterAnnotations();`方法，最顶层定义在`Executable`中(`Method`和`Constructor`的抽象基类)，在`Field`和`Constructor`中做了实现。


使用注解：我们要在运行期来使用注解，那必然是使用`RetentionPolicy.RUNTIME`类型的注解，那注解要怎么用呢？这完全由程序自己决定，也就是说我们必须编写代码来使用注解，使用方法就是通过反射去读取。JVM并不会对我们的注解添加任何额外的逻辑，应该说通过反射的统一处理仅仅是将其作为了一个类动态加载进来然后将一个编译期就已经确定内容的注解实例关联到对应的类、方法、字段、参数等上而已。

我的理解：不使用注解是完全OK的，但注解提供了一种方法让我们能够定义自己的关于类、构造、方法、实例等的“规则”，以提供给自己活着其他人使用。这个规则的解释完全由自己的程序进行实现。

例子，定义一个`@Range`注解，希望用它来定义一个`String`字段的规则：字段长度必须满足`@Range`参数的定义：
- 定义注解
```java
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface Range {
    int min() default 0;
    int max() default 255;
}
```
- 使用注解
```java
public class Person {
    @Range(min=1, max=20)
    public String name;

    @Range(max=10)
    public String city;
}
```
- 编写注解的规则
```java
void check(Person person) throws IllegalArgumentException, ReflectiveOperationException {
    // 遍历所有Field:
    for (Field field : person.getClass().getFields()) {
        // 获取Field定义的@Range:
        Range range = field.getAnnotation(Range.class);
        // 如果@Range存在:
        if (range != null) {
            // 获取Field的值:
            Object value = field.get(person);
            // 如果值是String:
            if (value instanceof String) {
                String s = (String) value;
                // 判断值是否满足@Range的min/max:
                if (s.length() < range.min() || s.length() > range.max()) {
                    throw new IllegalArgumentException("Invalid field: " + field.getName());
                }
            }
        }
    }
}
```
这样通过`@Range`配合`check()`方法，就可以完成`Person`实例的检查。虽然就这个例子而言谁都能够想到替代的写法，但好像的确能够更方便一些的样子，比如说如果新增加了一个字段并且同样需要进行长度校验的话那么只需要在新字段上添加注解而不需要去修改`check`的逻辑。更多使用场景待挖掘，任何东西都需要结合具体的使用场景才能够有深刻的理解。

### 6.4 TODO

梳理反射和注解相关的类、接口、方法，了解实现，了解`java.lang.relfect`包。

## 7. 泛型

### 7.1 什么是泛型

可以将类型作为参数，从而创建一种可以同时用于多种类型的通用的逻辑的方法。比如创建一种可以应用于所有类型的变长数组类型：`ArrayList<T>`，其中`T`是数据元素的类型。`T`需要编译期可知，当然一个类型不可能编译期不知道，这里的`T`是指的`int` `double` `Runnable`这种内置类型或已经在代码中定义的类型，而不是反射中和一个类型相关联的`Class`对象。

向上转型，标准库的`ArrayList<T>`实现了`List<T>`接口，所以可以向上转型。但是需要注意这里的`T`是整个类型定义的一部分，`ArrayList<Integer>`不能转换为`ArrayList<Number>`或者`List<Number>`。`T`必须严格一致才能向上转换。类型参数`T`不一致的，比如`ArrayList<Integer>`和`List<Number>`是没有继承关系的两个类型。

和C++模板差不太多，就是编写模板代码来适应任意类型，类型参数确定之后才成为一个类型，参数类型不同的模板类是不同的类型。

那么C++的模板特化偏特化、模板递归、可变模板参数、模板元编程这种烧脑袋的东西有没有对应的呢？

TODO：深入了解Java泛型的实现方式，和C++模板有何异同。

### 7.2 使用泛型

以`java.util.ArrayList`为例，如果不定义泛型类型，泛型类型实际上就是`Object`，相当于默认类型参数是`Object`，这个机制应该是语言层面实现的，因为java并没有默认参数或者默认类型参数这种东西。
```java
List list = new ArrayList();
list.add("hello");
System.out.println((String)list.get(0));
```

当定义泛型类型为`String`之后，`List<T>`泛型接口变为强类型`List<String>`。
```java
List list = new ArrayList<String>();
list.add("hello");
System.out.println(list.get(0));
```

编译器如果能自动推断出泛型类型，就可以省略后面的泛型类型。如用`ArrayList<T>`指定泛型类型为`String`后，接口`List<T>`就自动成为`List<String>`。

除了类，接口也可以使用泛型，正如`List<T>`。一如：
```java
public interface Comparable<T> {
    public int compareTo(T o);
}
```
对于`Arrays.sort`接口对数组元素排序就会使用`Comparable.compareTo`来比较，元素类型需要实现`Comparable`接口后才能调用。如果未实现则会抛出`java.lang.ClassCastException`提示元素类型不能转化为`java.lang.Comparable`。但这样其实只能对元素按照一种类型来排序，如果需要更高的可定制性，可以使用`Arrays`的`public static <T> void sort(T[] a, Comparator<? super T> c)`接口传入一个`Comparator`已进行更加灵活的比较。当然也可以在重写`compareTo`比较多种比较方式，加上标记或者`boolean`实例成员来控制即可。

### 7.3 编写泛型

编写泛型类比普通类复杂，泛型类一般用于集合类中。

比如编写一个类表示键值对：先用一个特定类型来实现。
```java
class kvPair {
	private String key;
	private String value;
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
```
然后将`String`替换为`T`，并在类名后面加上类型参数`<T>`的声明。
```java
class kvPair<T> {
	private T key;
	private T value;
	public T getKey() {
		return key;
	}
	public void setKey(T key) {
		this.key = key;
	}
	public T getValue() {
		return value;
	}
	public void setValue(T value) {
		this.value = value;
	}
}
```
那么如果我需要键和值可以是不同的类型呢，添加多个泛型类型参数即可。
```java
class kvPair<K, V> {
	private K key;
	private V value;
	public K getKey() {
		return key;
	}
	public void setKey(K key) {
		this.key = key;
	}
	public V getValue() {
		return value;
	}
	public void setValue(V value) {
		this.value = value;
	}
}
```

实例方法是类的一部分，泛型参数类型对其是可见的。但是对于静态方法来说，类的泛型类型参数对其是不可见的，如果要定义静态泛型方法，需要为静态泛型方法专门指定静态类型参数。这里的静态方法的`K` `V`和`kvPair<K, V>`中的`K` `V`是没有任何关系的，完全可以替换为其他名称。如果不在`static`后指定静态类型参数的话会报错：不能对非静态类型`K`/`V`进行静态引用。
```java
class kvPair<K, V> {
	private K key;
	private V value;
	public kvPair(K k, V v) {
		key = k;
		value = v;
	}
	public K getKey() {
		return key;
	}
	public void setKey(K key) {
		this.key = key;
	}
	public V getValue() {
		return value;
	}
	public void setValue(V value) {
		this.value = value;
	}
	
	public static<K, V> kvPair<K, V> create(K key, V value) {
		return new kvPair<K, V>(key, value);
	}
}
```
使用时：如果就是实例化这个类的对象，那么类型声明时需要写上类型参数，不然类型还是会默认为`Object`，而且貌似类型参数不能使用内置类型，因为默认是`Object`无法持有内置类型的缘故吗？那么就使用相应的包装类型吧，应该就是提供了来满足类似这种场景的。
```java
kvPair<String, Double> pair = new kvPair<String, Double>("xiaoming", 100.0);
```


### 7.4 泛型实现方法

不同于C++的模板实现，Java中的泛型实现方法是**擦拭法**(**Type Erasure**)。

所谓擦拭法是指：
- JVM对泛型一无所知，所有工作都是编译器做的。编写了一个泛型类`kvPair<K, V>`，虚拟机执行的代码就是`kvPair<Object, Object>`。
- 然后编译器根据使用的具体的泛型类型参数实现了安全的强制类型转换。因为泛型类型参数都是编译期确定的，不能转换就会报错停止编译。

所以，Java的泛型是编译器在编译器实现的，编译器内部永远把所有类型`T`当做`Object`处理(即是说**擦拭**成了`Object`)，但是需要转换类型时，编译器会自动根据`T`的类型为我们安全的实行强制转换。

所以必然就有局限：
- `<T>`不能是基本类型，因为`Object`无法持有基本类型。
- 无法取得类型参数的`class`，因为`class`是运行期的。编译期对编译器来说所有泛型类型参数都是`Object`。
- 无法区分带泛型的类型，因为都是同一个`Class`对象。
- 不能实例化类型参数`T`的变量，实例化`Object`明显不是我们想要的，所以java编译器阻止了在泛型类中对参数类型变量的实例化。

所以`kvPair<Object, Object>`和`kvPair`和`kvPair<String, Double>`实际上是一个类型，他们的`Class`对象是同一个。那直观感受来看和C++的模板是有区别的，C++的模板会为每一种模板类型参数生成一个类或者函数的机器码，模板参数实际上最终的类的一部分，所以以上局限都是没有的。而Java中的泛型看来类型参数只是提供了用来告诉编译器需要如何做类型转换的手段，而并不是类型的一部分。

**不恰当的覆写**：
```java
public class Pair<T> {
    public boolean equals(T t) {
        return this == t;
    }
}
```
像这样的代码其实会被擦拭成`equals(Object t)`，这个方法是继承自`Object`的，编译器会阻止一个实际上会变成覆写的方法定义。错误提示为：类型 `Pair<T>` 的方法 `equals(T)`与类型 `Object` 的 `equals(Object)`具有相同的擦除，但是未覆盖它。


需要换个方法名，避免与`Object.equals(Object)`冲突。
```java
public class Pair<T> {
    public boolean same(T t) {
        return this == t;
    }
}
```

**泛型类的继承**：

一个类可以继承自一个泛型类。比如
```java
class StringDoublePair extends kvPair<String, Double> {
	public StringDoublePair() {
		super("", 0.0);
	}
}
```
继承之后`StringDoublePair`的基类的类型参数是确定的，就是`<String, Double>`，但是我们无法通过`kvPair.class`对象获取到这个类型参数。但在继承了泛型类型的情况下，子类是可以获取到父类的泛型类型的。获取方式：
```java
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class Main {
	public static void main(String[] args){
		Class<StringDoublePair> cls = StringDoublePair.class;
		Type t = cls.getGenericSuperclass();
		if (t instanceof ParameterizedType) {
			ParameterizedType pt = (ParameterizedType)t;
			Type[] types = pt.getActualTypeArguments();
			for (Type typeArgs : types) {
				Class<?> typeClass = (Class<?>)typeArgs;
				if (typeClass != null) {
					System.out.println(typeClass);
				}
			}
		}
	}
}
```
这里获取到的是`Type`，因为java引入了泛型，所以单纯的`Class`用来标识类型就不够了，Java的类型系统结构如下：
```
Type
|____Class
|____ParameterizedType
|____GenericArrayType
|____WildcardType
```

### 7.5 extends通配符

还是上面的`kvPair`，如果定义一个适用于`kvPair<Number, Number>`的方法：
```java
class PairHelper {
	public static int add(kvPair<Number, Number> pair) {
		return pair.getKey().intValue() + pair.getValue().intValue();
	}
}
```
那么下面的语句时能够编译通过的:
```java
int sum = PairHelper.add(new kvPair<Number, Number>(1, 1));
```
但是其实参数的类型是`(Integer, Integer)`，如果类型参数就是`Integer`呢：
```java
int sum = PairHelper.add(new kvPair<Number, Number>(1, 1));
```
编译错误：类型 `PairHelper` 中的方法`add(kvPair<Number,Number>)`对于参数`(kvPair<Integer,Integer>)`不适用。

原因很简单：类型`kvPair<Integer,Integer>`不是`kvPair<Number,Number>`的子类。但是很明显`kvPair<Integer,Integer>`参数类型运用于`add`函数是完全满足内部代码的类型规范的，即基类或者接口来使用子类对象。

那现在有没有方法能够使得方法`add`能够接受`kvPair<Type2, Type2>`其中`Type1` `Type2`是`Number`子类呢？办法当然是有的，就是定义`add`时使用`? extends Number`替代类型参数`Number`。
```java
class PairHelper {
	public static int add(kvPair<? extends Number, ? extends Number> pair) {
		return pair.getKey().intValue() + pair.getValue().intValue();
	}
}
```

这种使用`<? extends Number>`的泛型定义称为**上界通配符**(Upper Bounds Wildcards)。即把泛型类型参数`T`的上界限定为`Number`，就是只要是`Number`和其子类都可以。

此时编译器能够确定`kvPair<? extends Number, ? extends Number>`的`getKey` `getValue`接口返回值一定`Number`或其子类，但无法确定具体类型。

使用了通配符之后能不能用子类实例设置给基类成员呢？
```java
class PairHelper {
	public static int add(kvPair<? extends Number, ? extends Number> pair) {
		pair.setKey(Integer.valueOf(pair.getKey().intValue() + 100));
		pair.setKey(Integer.valueOf(pair.getValue().intValue() + 100));
		return pair.getKey().intValue() + pair.getValue().intValue();
	}
}
```
这时会编译错误提示：类型 `kvPair<capture#1-of ? extends Number,capture#2-of ? extends Number>` 中的方法 `setKey(capture#1-of ? extends Number)`对于参数`(Integer)`不适用

编译错误的原因还是在于擦拭法，这就是`<? extends Number>`通配符的一个重要限制：
- 方法参数签名`setKey(? extends Number)`无法传递任何`Number`或者子类型给`setKey(? extends Number)`，唯一的例外是可以传入`null`。
- 对于方法类型参数`<? extends Number>`的泛型参数来说，方法内部不能调用它的传入`Number`引用的方法，总结来说**只读不能写**。为什么呢？这里我有一万个问号？后续再来理解，TODO。

定义泛型类时也可以用`<T extends Number>`这样的方式使用通配符来限定`T`的类型。那么实例化时该类型参数就只能使用`Number`或者其子类。这里当然也可以是`interface`，只不过语法规定为使用`extends`。

### 7.6 super通配符

除了`extends`通配符外还有`super`通配符，对于类型参数中有`<? super Integer>`的实例来说。
- 对应地，可以使用`Integer`和它的基类来进行匹配。
- 使用该类型作为方法参数时，该参数**只能写不能读**，不能调用它的返回`<? super Integer>`类型的接口，但可以调用它的使用`<? super Integer>`参数的接口。就上面例子来说就是能调`setKey`不能调用`getKey`。

**PECS原则**：一般使用`extends`和`super`是遵循**Producer Extends Consumer Super**。即生产者使用`extends`，而消费者使用`super`。

除了`extends`和`super`通配符，`Java`的泛型还允许使用**无限定通配符**(Unbounded Wildcard Type)，即只定义一个`?`。

特点：
- 因为`<?>`通配符既没有`extends`也没有`super`：
    - 不允许调用`set(T)`方法并传入引用（`null`除外）。
    - 不允许调用`T get()`方法并获取`T`引用（只能获取`Object`引用）。
    - 即既不能读也不能写，只能做一些`null`判断。
- 大多数情况可以引入泛型参数`<T>`消除`<?>`的使用，就是说可以替换。
- 无限定通配符`<?>`很少使用。

`<?>`通配符有一个独特的特点，就是`pair<?>`是所有`pair<T>`的超类，可以安全地向上类型转换。

到这里我只能说并没有搞懂为什么要有`extends`和`super`通配符这两个东西，也没有完全理解，TODO。

### 7.7 泛型和反射

java的部分反射API也是泛型，比如`Class`类就是泛型：
```java
public final class Class<T> implements java.io.Serializable,
                              GenericDeclaration,
                              Type,
                              AnnotatedElement,
                              TypeDescriptor.OfField<Class<?>>,
                              Constable {
    public static Class<?> forName(String className) {...}
    public native boolean isAssignableFrom(Class<?> cls);
    public TypeVariable<Class<T>>[] getTypeParameters() {...}
    public native Class<? super T> getSuperclass();
    public Class<?>[] getInterfaces() {...}
    public Type[] getGenericInterfaces() {...}
    public Class<?> getComponentType() {...} // 获取元素类型，仅对数组类型有效，否则返回null
    public Class<?> getDeclaringClass() throws SecurityException {...}
    public Constructor<?>[] getConstructors() throws SecurityException {...}
    // other method about Constructor ...
    public <A extends Annotation> A getAnnotation(Class<A> annotationClass) {...}
    public boolean isAnnotationPresent(Class<? extends Annotation> annotationClass) {...}
    // etc ...
}
```

构造方法`Constructor<T>`也是泛型。

泛型与数组：
- 我们可以声明带泛型的数组，但不能直接`new`带泛型的数组，需要经过强制类型转换。
```java
Pair<String>[] ps = null; // ok
Pair<String>[] ps = new Pair<String>[2]; // compile error!
@SuppressWarnings("unchecked")
Pair<String>[] ps = (Pair<String>[]) new Pair[2]; // ok
```
- 要安全使用泛型数组，不要将上述`new Pair[2]`的结果保存之后使用。因为`new Pair[2]`的结果不是泛型数组，编译器不会检查。
- 带泛型的数组编译器也会做类型擦除：
```java
Pair<String>[] ps = (Pair<String>[]) new Pair[2];
System.out.println(ps.getClass() == Pair[].class); // true
```
- 不能直接创建泛型数组`T[]`，因为擦拭后代码变`为Object[]`
```java
// compile error:
public class Abc<T> {
    T[] createArray() {
        return new T[5];
    }
}
```
- 必须借助`java.lang.reflect.Array`来创建
```java
T[] createArray(Class<T> cls) {
    return (T[]) Array.newInstance(cls, 5);
}
```
- 还可以利用可变参数创建泛型数组：
```java
public class ArrayHelper {
    @SafeVarargs
    static <T> T[] asArray(T... objs) {
        return objs;
    }
}
```
- 谨慎使用泛型可变参数，如果仔细观察，可以发现编译器对所有可变泛型参数都会发出警告，除非确认完全没有问题，才可以用`@SafeVarargs`消除警告。跟详细解释参考[*Effective Java*](https://www.oreilly.com/library/view/effective-java/9780134686097/)，看起来java的“上层建筑”确实有点太多太繁杂了。

说实话泛型有点云里雾里的感觉，后续看书补充理解，TODO。

## 8. 集合

集合大部分时候应该会是使用最多的类型，因为任何东西都需要存储、管理，元素多了的时候就需要使用集合来存储。其中各式各样的数据结构服务于各种不同的使用场景：存储、查找、遍历、增删修改元素等操作的不同侧重。

先上Java集合类框架：
![java集合类框架](Images/Java_collections.jpg)

### 8.1 Java集合

数组的限制：
- 数组初始化后大小不可变。
- 数组只能按索引顺序存取，即随机存取。

其他存储需求：
- 可变大小
- 保证无重复元素
- 快速查找

**java.util.Collection**：java标准库提供的集合类，定义在`java.util`包中，除`Map`所有其他集合类的根接口。`java.util`包主要提供了三种类型集合：
- `List` 一种有序列表的集合。
- `Set` 一种保证没有重复元素的集合。
- `Map` 一种通过键值（key-value）查找的映射表集合。

Java集合设计特点：
- 接口和实现类分离，有序表接口`List`，实现`ArrayList` `LinkedList`。
- 支持泛型。
- 同一方式访问：迭代器(Iterator)。好处：无需知道集合内部元素的存储方式。

Java集合历史久远，不应再使用的遗留类：
- `Hashtable` 一种线程安全的`Map`实现
- `Vector` 一种线程安全的`List`实现
- `Stack` 基于`Vector`实现的LIFO的栈

不应使用的遗留接口：
- `Enumeration<E>`：已被`Iterator<E>`取代。

`Collection`接口：
```java
public interface Collection<E> extends Iterable<E> {
    int size();
    boolean isEmpty();
    boolean contains(Object o);
    Iterator<E> iterator();
    Object[] toArray();
    <T> T[] toArray(T[] a);
    default <T> T[] toArray(IntFunction<T[]> generator) {
        return toArray(generator.apply(0));
    }
    boolean add(E e);
    boolean remove(Object o);
    boolean containsAll(Collection<?> c);
    boolean addAll(Collection<? extends E> c);
    boolean removeAll(Collection<?> c);
    default boolean removeIf(Predicate<? super E> filter) { // 移除所有满足给定条件的元素
        Objects.requireNonNull(filter);
        boolean removed = false;
        final Iterator<E> each = iterator();
        while (each.hasNext()) {
            if (filter.test(each.next())) {
                each.remove();
                removed = true;
            }
        }
        return removed;
    }
    boolean retainAll(Collection<?> c);
    void clear();
    boolean equals(Object o);
    int hashCode();
    @Override
    default Spliterator<E> spliterator() {
        return Spliterators.spliterator(this, 0);
    }
    default Stream<E> stream() {
        return StreamSupport.stream(spliterator(), false);
    }
    default Stream<E> parallelStream() {
        return StreamSupport.stream(spliterator(), true);
    }
}
```


`Iterable`接口：
```java
public interface Iterable<T> {
    Iterator<T> iterator(); // 迭代器
    default void forEach(Consumer<? super T> action) { // 对所有元素执行传入的操作
        Objects.requireNonNull(action);
        for (T t : this) {
            action.accept(t);
        }
    }
    default Spliterator<T> spliterator() {
        return Spliterators.spliteratorUnknownSize(iterator(), 0);
    }
}
```

### 8.2 List

有序列表，可变数组实现`ArrayList`，和链表实现`LinkedList`，对比：

||ArrayList|LinkedList|
|:-:|:-:|:-:|
|获取|快|从头查找，慢|
|添加到末尾|快|快|
|指定位置添加/删除|需要移动元素|不需要移动元素|
|内存占用|小|较大|

通常情况下，我们总是优先使用`ArrayList`。

`List`接口：
```java
public interface List<E> extends Collection<E> {
    // Query Operations
    int size();
    boolean isEmpty();
    boolean contains(Object o);
    Iterator<E> iterator(); // 迭代器
    Object[] toArray(); // 返回列表元素构成的一个重新分配的数组
    <T> T[] toArray(T[] a); // 返回特定类型，如果可以的话返回内置数组(如ArrayList)，否则新分配
    // Modification Operations
    boolean add(E e); // 添加元素到末尾
    boolean remove(Object o); // 移除特定元素
    // Bulk Modification Operations
    boolean containsAll(Collection<?> c); // 包含集合中所有元素
    boolean addAll(Collection<? extends E> c); // 添加集合所有元素到列表末尾，参数是自己的话未定义行为
    boolean addAll(int index, Collection<? extends E> c); // 添加集合元素到index开始位置，从index开始所有元素向后移
    boolean removeAll(Collection<?> c); // 移除当前列表中所有在集合中的元素
    boolean retainAll(Collection<?> c); // 移除所有不在集合中的元素，保留集合中的元素
    default void replaceAll(UnaryOperator<E> operator) {...} // 替换所有元素对给该元素应用传入的operator之后的结果
    @SuppressWarnings({"unchecked", "rawtypes"})
    default void sort(Comparator<? super E> c) {...} // 使用传入的比较运算对数组元素进行s稳定排序(不会重排相等的元素)
    void clear(); // 清空所有元素
    // Comparison and hashing
    boolean equals(Object o); // 和另一个List判等，同一位置元素相同、相同大小则等
    int hashCode(); // 哈希值，根据列表所有元素哈希值求得
    // Positional Access Operations
    E get(int index); // 获取元素
    E set(int index, E element); // 设置元素
    void add(int index, E element); // 添加/插入元素到下标index处，index开始所有元素右移
    E remove(int index); // 移除index处元素，后面元素左移
    // Search Operations
    int indexOf(Object o); // 第一个出现元素下标，没有则返回-1
    int lastIndexOf(Object o); // 最后一个出现的该元素下标，没有则返回-1
    // List Iterators
    ListIterator<E> listIterator(); // 列表迭代器
    ListIterator<E> listIterator(int index); // 从index开始的列表迭代器
    // View
    List<E> subList(int fromIndex, int toIndex); // 返回一个子列表，包括fromIndex，不包括toIndex，相等则返回空
    @Override
    default Spliterator<E> spliterator() {...}
    @SuppressWarnings("unchecked")
    static <E> List<E> of() {...} // 得到空列表
    // other of method ... // 得到由传入的多个元素构成的列表，不接受null值
    static <E> List<E> copyOf(Collection<? extends E> coll) {...} // 得到传入集合元素构成的不可修改的列表
}
```

特点：
- 允许添加重复元素。
- 允许添加`null`元素。
- 不支持`[]`取元素，仅有原生数组支持`[]`。不能运算符重载有点微妙。

遍历：`String`列表为例
- 经典`for`循环，对`ArrayList`来说是随机存取，但链表访问需要遍历，但要遍历修改还是得老老实实用。
```java
for (int i = 0; i < list.size(); i ++) {
    String elem = list.get(i);
    // ...
}
```
- 范围`for`循环，通过迭代器实现，但不能修改元素
```java
for (String elem : list) {
    // ...
}
```
- 迭代器遍历，始终推荐使用迭代器
```java
Iterator<String> iter = list.iterator();
while (iter.hasNext()) {
    String elem = iter.next();
    // ...
}
```

常用方法解析：
- `toArray()`只能返回`Object[]`少用。
- `toArray(T[])`更为常用，填充传入的数组并返回，如果传入的数组元素不够，那么会重新分配并返回，如果超过了，剩余的会填`null`。一般都根据列表大小传：`Integer[] array = list.toArray(new Integer[list.size()]);`。
- 所有会比较两个元素的操作都是调用`equals`方法判等。要正确使用查找相关的方法，就必须正确重写`equals`方法。


如何正确覆写`equals`方法：
- 自反性(Reflexive)：非`null`的`x`来说，`x.equals(x)`一定返回`true`
- 对称性(Symmetric)：非`null`的`x`和`y`，`x.equals(y)`结果一定和`y.equals(x)`相同
- 传递性(Transitive)：非`null`的`x`、`y`、`z`，如果`x.equals(y)==true`，`y.euqals(z) == true`，那么`y.equals(z)`一定为`true`
- 一致性(Consistent)：非`null`的`x`和`y`，只要`x`和`y`状态不变，则`x.euqals(y)`总是一致地返回`true`或者`false`，就是它不能薛定谔，需要具有确定性。
- 对`null`的比较：`x.equals(null)`一定返回`false`


### 8.3 Map & HashMap

`Map`即键值（key-value）映射表，高效通过`key`查找`value`。

`Map`接口：
```java
public interface Map<K, V> {
    // Query Operations
    int size();
    boolean isEmpty();
    boolean containsKey(Object key);
    boolean containsValue(Object value);
    V get(Object key);

    // Modification Operations
    V put(K key, V value);
    V remove(Object key);
    // Bulk Operations
    void putAll(Map<? extends K, ? extends V> m);
    void clear();
    // Views
    Set<K> keySet();
    Collection<V> values();
    Set<Map.Entry<K, V>> entrySet();
    interface Entry<K, V> {
        K getKey();
        V getValue();
        V setValue(V value);
        boolean equals(Object o);
        int hashCode();
        public static <K extends Comparable<? super K>, V> Comparator<Map.Entry<K, V>> comparingByKey() {
            return (Comparator<Map.Entry<K, V>> & Serializable)
                (c1, c2) -> c1.getKey().compareTo(c2.getKey());
        }
        public static <K, V extends Comparable<? super V>> Comparator<Map.Entry<K, V>> comparingByValue() {
            return (Comparator<Map.Entry<K, V>> & Serializable)
                (c1, c2) -> c1.getValue().compareTo(c2.getValue());
        }
        public static <K, V> Comparator<Map.Entry<K, V>> comparingByKey(Comparator<? super K> cmp) {
            Objects.requireNonNull(cmp);
            return (Comparator<Map.Entry<K, V>> & Serializable)
                (c1, c2) -> cmp.compare(c1.getKey(), c2.getKey());
        }
        public static <K, V> Comparator<Map.Entry<K, V>> comparingByValue(Comparator<? super V> cmp) {
            Objects.requireNonNull(cmp);
            return (Comparator<Map.Entry<K, V>> & Serializable)
                (c1, c2) -> cmp.compare(c1.getValue(), c2.getValue());
        }
    }

    // Comparison and hashing
    boolean equals(Object o);
    int hashCode();

    // Defaultable methods
    default V getOrDefault(Object key, V defaultValue) {
        V v;
        return (((v = get(key)) != null) || containsKey(key))
            ? v
            : defaultValue;
    }
    default void forEach(BiConsumer<? super K, ? super V> action) {
        Objects.requireNonNull(action);
        for (Map.Entry<K, V> entry : entrySet()) {
            K k;
            V v;
            try {
                k = entry.getKey();
                v = entry.getValue();
            } catch (IllegalStateException ise) {
                // this usually means the entry is no longer in the map.
                throw new ConcurrentModificationException(ise);
            }
            action.accept(k, v);
        }
    }
    default void replaceAll(BiFunction<? super K, ? super V, ? extends V> function) {
        Objects.requireNonNull(function);
        for (Map.Entry<K, V> entry : entrySet()) {
            K k;
            V v;
            try {
                k = entry.getKey();
                v = entry.getValue();
            } catch (IllegalStateException ise) {
                // this usually means the entry is no longer in the map.
                throw new ConcurrentModificationException(ise);
            }

            // ise thrown from function is not a cme.
            v = function.apply(k, v);

            try {
                entry.setValue(v);
            } catch (IllegalStateException ise) {
                // this usually means the entry is no longer in the map.
                throw new ConcurrentModificationException(ise);
            }
        }
    }
    default V putIfAbsent(K key, V value) {
        V v = get(key);
        if (v == null) {
            v = put(key, value);
        }

        return v;
    }
    default boolean remove(Object key, Object value) {
        Object curValue = get(key);
        if (!Objects.equals(curValue, value) ||
            (curValue == null && !containsKey(key))) {
            return false;
        }
        remove(key);
        return true;
    }
    default boolean replace(K key, V oldValue, V newValue) {
        Object curValue = get(key);
        if (!Objects.equals(curValue, oldValue) ||
            (curValue == null && !containsKey(key))) {
            return false;
        }
        put(key, newValue);
        return true;
    }
    default V replace(K key, V value) {
        V curValue;
        if (((curValue = get(key)) != null) || containsKey(key)) {
            curValue = put(key, value);
        }
        return curValue;
    }
    default V computeIfAbsent(K key,
            Function<? super K, ? extends V> mappingFunction) {
        Objects.requireNonNull(mappingFunction);
        V v;
        if ((v = get(key)) == null) {
            V newValue;
            if ((newValue = mappingFunction.apply(key)) != null) {
                put(key, newValue);
                return newValue;
            }
        }

        return v;
    }
    default V computeIfPresent(K key,
            BiFunction<? super K, ? super V, ? extends V> remappingFunction) {
        Objects.requireNonNull(remappingFunction);
        V oldValue;
        if ((oldValue = get(key)) != null) {
            V newValue = remappingFunction.apply(key, oldValue);
            if (newValue != null) {
                put(key, newValue);
                return newValue;
            } else {
                remove(key);
                return null;
            }
        } else {
            return null;
        }
    }
    default V compute(K key,
            BiFunction<? super K, ? super V, ? extends V> remappingFunction) {
        Objects.requireNonNull(remappingFunction);
        V oldValue = get(key);

        V newValue = remappingFunction.apply(key, oldValue);
        if (newValue == null) {
            // delete mapping
            if (oldValue != null || containsKey(key)) {
                // something to remove
                remove(key);
                return null;
            } else {
                // nothing to do. Leave things as they were.
                return null;
            }
        } else {
            // add or replace old mapping
            put(key, newValue);
            return newValue;
        }
    }
    default V merge(K key, V value,
            BiFunction<? super V, ? super V, ? extends V> remappingFunction) {
        Objects.requireNonNull(remappingFunction);
        Objects.requireNonNull(value);
        V oldValue = get(key);
        V newValue = (oldValue == null) ? value :
                   remappingFunction.apply(oldValue, value);
        if (newValue == null) {
            remove(key);
        } else {
            put(key, newValue);
        }
        return newValue;
    }
    @SuppressWarnings("unchecked")
    static <K, V> Map<K, V> of() {
        return (Map<K,V>) ImmutableCollections.EMPTY_MAP;
    }
    static <K, V> Map<K, V> of(K k1, V v1) {
        return new ImmutableCollections.Map1<>(k1, v1);
    }
    static <K, V> Map<K, V> of(K k1, V v1, K k2, V v2) {
        return new ImmutableCollections.MapN<>(k1, v1, k2, v2);
    }
    static <K, V> Map<K, V> of(K k1, V v1, K k2, V v2, K k3, V v3) {
        return new ImmutableCollections.MapN<>(k1, v1, k2, v2, k3, v3);
    }
    static <K, V> Map<K, V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4) {
        return new ImmutableCollections.MapN<>(k1, v1, k2, v2, k3, v3, k4, v4);
    }
    static <K, V> Map<K, V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5) {
        return new ImmutableCollections.MapN<>(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5);
    }
    static <K, V> Map<K, V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5,
                               K k6, V v6) {
        return new ImmutableCollections.MapN<>(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5,
                                               k6, v6);
    }
    static <K, V> Map<K, V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5,
                               K k6, V v6, K k7, V v7) {
        return new ImmutableCollections.MapN<>(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5,
                                               k6, v6, k7, v7);
    }
    static <K, V> Map<K, V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5,
                               K k6, V v6, K k7, V v7, K k8, V v8) {
        return new ImmutableCollections.MapN<>(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5,
                                               k6, v6, k7, v7, k8, v8);
    }
    static <K, V> Map<K, V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5,
                               K k6, V v6, K k7, V v7, K k8, V v8, K k9, V v9) {
        return new ImmutableCollections.MapN<>(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5,
                                               k6, v6, k7, v7, k8, v8, k9, v9);
    }
    static <K, V> Map<K, V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5,
                               K k6, V v6, K k7, V v7, K k8, V v8, K k9, V v9, K k10, V v10) {
        return new ImmutableCollections.MapN<>(k1, v1, k2, v2, k3, v3, k4, v4, k5, v5,
                                               k6, v6, k7, v7, k8, v8, k9, v9, k10, v10);
    }
    @SafeVarargs
    @SuppressWarnings("varargs")
    static <K, V> Map<K, V> ofEntries(Entry<? extends K, ? extends V>... entries) {
        if (entries.length == 0) { // implicit null check of entries array
            @SuppressWarnings("unchecked")
            var map = (Map<K,V>) ImmutableCollections.EMPTY_MAP;
            return map;
        } else if (entries.length == 1) {
            // implicit null check of the array slot
            return new ImmutableCollections.Map1<>(entries[0].getKey(),
                    entries[0].getValue());
        } else {
            Object[] kva = new Object[entries.length << 1];
            int a = 0;
            for (Entry<? extends K, ? extends V> entry : entries) {
                // implicit null checks of each array slot
                kva[a++] = entry.getKey();
                kva[a++] = entry.getValue();
            }
            return new ImmutableCollections.MapN<>(kva);
        }
    }
    static <K, V> Entry<K, V> entry(K k, V v) {
        // KeyValueHolder checks for nulls
        return new KeyValueHolder<>(k, v);
    }
    @SuppressWarnings({"rawtypes","unchecked"})
    static <K, V> Map<K, V> copyOf(Map<? extends K, ? extends V> map) {
        if (map instanceof ImmutableCollections.AbstractImmutableMap) {
            return (Map<K,V>)map;
        } else {
            return (Map<K,V>)Map.ofEntries(map.entrySet().toArray(new Entry[0]));
        }
    }
}
```

最常用的实现类是`HashMap`，采用**数组+链表+红黑树**实现，也就是分离链表法(**拉链法**)实现的**哈希表**。简而言之就是用一个大数组存元素，每个不同元素都有一个特定的哈希值通过某种计算之后得到一个数组下标，然后这个元素就存在这个下标的位置，如果哈希冲突了(两个不同元素哈希值相同或者通过哈希值计算得到的下标相同)就用链表将下标相同的键值对链起来，如果链表长度超过8，则将链表转换为红黑树以提高查找效率。哈希表分配了数组之后数组大小是确定的，因为需要利用这个大小和哈希值来计算索引，在往哈希表中添加元素的过程中，必然会导致哈希冲突越来越频繁，当达到某一个阈值时基于效率考虑需要对哈希表进行扩容，重新分配更大的数组，并且根据哈希值重算所有元素的下标（再哈希，rehash）。扩容时机选择、哈希函数的编写、哈希冲突的解决方案都会影响哈希表的性能。

常用方法：`get` `put` `remove` `containsKey` `keySet` `entrySet`

遍历：
- `for each`循环遍历`keySet`返回的集合
- `for each`遍历`entrySet()`集合，同时遍历`key`和`value`

特点：
- 哈希表特性：不保证按插入顺序存储，也无法对元素排序，最佳`O(1)`的访问、插入、删除、按key查找时间复杂度。
- 使用`key`的`hashCode()`作为哈希值，`key`的值作为发生哈希冲突时辅助判断的方法。

正确使用`Map`必须保证：
- 判断`key`相等依然是通过`equals`方法，所以要正确覆写`key`类型的`equals`方法。
- 作为`key`还需要正确覆写`int hashCode()`方法以获取哈希值。要求：
    - 如果对象相等(`equals()`返回`true`)，那么哈希值必须相等。必须满足以保证正确性。
    - 两个对象不相等，尽量保证两个对象的`hashCode()`不相等。尽量保证以减少哈希冲突，提高查找效率。
- 编写`equals(`)和`hashCode()`遵循的原则是: `equals()`用到的用于比较的每一个字段，都必须在`hashCode()`中用于计算，`equals()`中没有使用到的字段，绝不可放在`hashCode()`中计算。
- `对于value`对象则没有任何要求。

`equals`和`hashCode`编写实例：
```java
class Person {
	private String name;
	private int age;
	
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	public boolean equals(Person other) {
		return name.equals(other.name) && age == other.age;
	}
	public int hashCode() {
		return name.hashCode() * 31 + age;
	}
}
```
`hashCode`需要用到每一个参与`equals`比较的字段，一种常见方法是：迭代逐次将每一轮的哈希值乘以一个素数并加上下一个字段的哈希值，直到所有字段都参与计算。

上述`Person.hashCode`其实还有一点问题，如果`name`为`null`那么就直接`NullPointerException`了，所以经常借助`Objects.hash()`来计算哈希值。它的实现是差不多一样的逻辑：
```java
public final class Objects {
    ublic static int hash(Object... values) {
        return Arrays.hashCode(values);
    }
}

public class Arrays {
    public static int hashCode(Object a[]) {
        if (a == null)
            return 0;

        int result = 1;

        for (Object element : a)
            result = 31 * result + (element == null ? 0 : element.hashCode());

        return result;
    }
}
```


最一般的通过哈希值计算下标的方式就是直接取低位或者做取余操作。取低位操作计算量小，且实现时默认尺寸是16，每次扩容都是扩容为原先的2倍，`HashMap`就是采用取低位的方式。
```java
int index = key.hashCode() & 0xf; // 数组大小默认是16，直接取低4位
int index = key.hashCode() % arraySize; // 计算量相对取低位来说就大了一点
```
``HashMap``内部其实使用提供的哈希值又做了一次计算然后才用来计算下标。在低16位加入了高16位的扰动(将高16位异或到了低16位)，因为直接取低位的方式会导致元素不多数组不大时高位用不到，加入高位扰动后可以进一步将低哈希冲突的概率。
```java
static final int hash(Object key) {
    int h;
    return (key == null) ? 0 : (h = key.hashCode()) ^ (h >>> 16);
}
```

TODO：详细分析`HashMap`实现。


### 8.4 EnumMap

如果`Map`的`key`是`enum`的话，还可以使用`java.util.EnumMap`，可以在内部以一个非常紧凑的数组存储`value`，并不需要计算`hashCode()`，不但效率最高，而且没有额外的空间浪费。当然其实如果是其他语言可能直接用`enum`转整数作为下标，`new`一个数组直接存其实就行了。

定义：
```java
public class EnumMap<K extends Enum<K>, V> extends AbstractMap<K, V> implements java.io.Serializable, Cloneable
```

使用时直接使用`Map<K,V>`接口来使用即可。和使用`HashMap`没有任何区别。

### 8.5 TreeMap

`HashMap`以哈希表来实现就决定了它的元素是无序的，当我们需要`Map`的元素有序时可以使用`SortedMap`接口以及实现类`TreeMap`。

对应于C++的容器来说`TreeMap`就对应于`std::map`，而`HashMap`则对应于`std::unordered_map`。

派生关系：
```
Map
|__HashMap
|__SortedMap
    |__TreeMap
```

`SortedMap`保证遍历时以`key`的顺序进行排序，具体的排序规则则由传入的`Comparable`接口决定。对于没有实现`Comparable`的接口的`key`，则需要在构造`TreeMap`时传入一个自定义的排序算法。相关方法：
```java
public class TreeMap<K,V>
    extends AbstractMap<K,V>
    implements NavigableMap<K,V>, Cloneable, java.io.Serializable
{
    private final Comparator<? super K> comparator;
    public TreeMap() {
        comparator = null;
    }
    public TreeMap(Comparator<? super K> comparator) {
        this.comparator = comparator;
    }
    @SuppressWarnings("unchecked")
    final int compare(Object k1, Object k2) {
        return comparator==null ? ((Comparable<? super K>)k1).compareTo((K)k2)
            : comparator.compare((K)k1, (K)k2);
    }
}
```
当调用`key`的比较方法`compare`时，首先使用构造时传入的`Comparator`对象，如果构造时没有传则为`null`，则使用`key`实现的`Comparable`接口的`compareTo`方法比较。

如果使用`Comparator`对象的，需要针对这个类编写新的类实现`Comparator`接口，`Comparator`需要能够读取需要用于比较的`key`的成员，就必须实现相关的`getter`方法，直接在`key`中实现`Comparable`接口相对来说更为简单一些。如果多个`TreeMap`需要多种方式比较可以通过实现多个`Comparator`接口来做到。

实现`Comparable.compareTo`或者`Comparator.compare`接口时，都是如果小于则返回负数，通常是`-1`，相等返回`0`，大于返回正数，通常是`1`。实现时应该按照规范，相等时必须返回`0`，不然查找时就查找不到了。注意使用`TreeMap`就不强制要求实现`equals`和`hashCode`方法了。

`TreeMap`是按照升序排列的，也就是遍历得到的结果一定满足前者与后者比较结果为负。需要按照不同规则排序的话，可以实现不同的比较接口。

看一下`SortedMap`接口提供了哪些特有的方法，并且其实在`SortedMap`和`TreeMap`之间还有一层`NavigableMap`。主要是子`Map`和各种查找操作。
```java
public interface SortedMap<K,V> extends Map<K,V> {
    Comparator<? super K> comparator(); // 比较操作
    SortedMap<K,V> subMap(K fromKey, K toKey); // from inclusive, to exclusive
    SortedMap<K,V> headMap(K toKey);
    SortedMap<K,V> tailMap(K fromKey);
    K firstKey();
    K lastKey();
    Set<K> keySet(); // key升序集合
    Collection<V> values(); // 值的集合
    Set<Map.Entry<K, V>> entrySet(); // key升序排列的键值对集合
}

public interface NavigableMap<K,V> extends SortedMap<K,V> {
    Map.Entry<K,V> lowerEntry(K key); // 得到最大的key小于给定的key的键值对，或者没有这样的key则返回null
    K lowerKey(K key); // 同上一个不过返回的是key
    Map.Entry<K,V> floorEntry(K key); // 得到最大的key小于或等于给定key的键值对，没有返回null
    K floorKey(K key); // // 得到最大的小于或等于给定key的key
    Map.Entry<K,V> ceilingEntry(K key); // 最小的大于等于给定key的键值对
    K ceilingKey(K key); // 最小的大于等于给定key的key
    Map.Entry<K,V> higherEntry(K key); // 最小的大于给定key的键值对
    K higherKey(K key); // 最小的大于给定key的key
    Map.Entry<K,V> firstEntry(); // 最小key，也就是第一个key，空Map则返回null
    Map.Entry<K,V> lastEntry(); // 最大key，最后一个key，空Map返回null
    Map.Entry<K,V> pollFirstEntry(); // 移除最小key对应元素，返回该键值对，空Map返回null
    Map.Entry<K,V> pollLastEntry(); // 移除最大key对应元素
    NavigableMap<K,V> descendingMap(); // 返回逆序Map，修改元素会反应到原始Map
    NavigableSet<K> navigableKeySet(); // key的有序集合，升序排列
    NavigableSet<K> descendingKeySet(); // key的降序集合，
    NavigableMap<K,V> subMap(K fromKey, boolean fromInclusive,
                             K toKey,   boolean toInclusive); // 子Map，见名知意
    NavigableMap<K,V> headMap(K toKey, boolean inclusive); // 小于或等于给定key元素构成的Map
    NavigableMap<K,V> tailMap(K fromKey, boolean inclusive); // 大于或等于给定key元素构成的Map
    SortedMap<K,V> subMap(K fromKey, K toKey); // subMap(fromKey, true, toKey, false)
    SortedMap<K,V> headMap(K toKey); // headMap(toKey, false)
    SortedMap<K,V> tailMap(K fromKey); // tailMap(fromKey, true)
}
```

### 8.6 Properties

编写应用程序时，通常要读写配置文件，配置文件通常来说`Key-Value`是`String-String`类型的，因此可以用`Map<String, String>`来表示。如：
```
account=32767
username=tikot
```
java集合库提供了一个`Properties`来表示一组配置，由于历史遗留原因，`Properties`是从`Hashtable`派生的，但只需要用到`Properties`本身的方法。

Java默认配置文件以`.properties`为扩展名，以`#`为注释，如：
```
# account.properties
account=32767
username=tikot
```

**读写修改配置文件**：
```java
public class Main {
	public static void main(String[] args) throws Exception {
		String file = "account.properties";
		Properties props = new Properties();
		props.load(new java.io.FileInputStream(file));
		System.out.println(props.getProperty("account"));
		System.out.println(props.getProperty("username"));
		props.setProperty("locatoin", "mars");
		props.store(new FileOutputStream(file), "this is comment");
	}
}
```

相关方法：
- `load`从流读取配置
- `store`将配置写入流
- `getProperty()` `setProperty()` 获取和修改配置


总结：
- Java集合库提供的`Properties`用于读写配置文件`.properties`。`.properties`文件可以使用`UTF-8`编码
- 可以从文件系统、`classpath`或其他任何地方读取`.properties`文件。
- 读写时调用`getProperty()`、`setProperty()`方法，不要使用从基类重写的方法`put` `set`。
- `FileInputStream`表示字节流，使用表示字符流的`FileReader`重载版本指定字节编码可以更好的处理文件编码。

### 8.7 Set

如果只需要存储不重复的`key`，不需要存储`value`，则可以使用`Set`。定义：
```java
public interface Set<E> extends Collection<E> {
    // Query Operations
    int size();
    boolean isEmpty();
    boolean contains(Object o);
    Iterator<E> iterator();
    Object[] toArray(); // 转数组，元素按照迭代器顺序
    <T> T[] toArray(T[] a);
    // Modification Operations
    boolean add(E e);
    boolean remove(Object o);
    // Bulk Operations
    boolean containsAll(Collection<?> c);
    boolean addAll(Collection<? extends E> c);
    boolean retainAll(Collection<?> c);
    boolean removeAll(Collection<?> c);
    void clear();
    // Comparison and hashing
    boolean equals(Object o);
    int hashCode();
    @Override
    default Spliterator<E> spliterator() {
        return Spliterators.spliterator(this, Spliterator.DISTINCT);
    }
    @SuppressWarnings("unchecked")
    static <E> Set<E> of() {
        return (Set<E>) ImmutableCollections.EMPTY_SET;
    }
    // ... 多个参数和可变参数的of
    // 由Collection创建Set
    @SuppressWarnings("unchecked")
    static <E> Set<E> copyOf(Collection<? extends E> coll) {
        if (coll instanceof ImmutableCollections.AbstractImmutableSet) {
            return (Set<E>)coll;
        } else {
            return (Set<E>)Set.of(new HashSet<>(coll).toArray());
        }
    }
}
```

除了从`Collection`继承而来的方法外，主要操作为：
- `add` `remove` 添加移除
- `contains` `isEmpty`是否包含特定元素、判空

`Set`就相当于只存储`key`，不存储`value`的`Map`，经常使用`Set`来**去重**。

实现：
- `HashSet`无序，类似于`HashMap`是哈希表实现，所以需要`key`正确实现`equals`和`hashCode`方法。
- `TreeSet`有序，实现了`SortedSet`接口，同`TreeMap`红黑树实现，需要构造时传入`key`的`Comparator`或者`key`正确实现`Comparable`接口。

### 8.8 Queue

队列，即先进先出的有序表，定义：
```java
public interface Queue<E> extends Collection<E> {
    boolean add(E e); // 入队
    boolean offer(E e); // 入队
    E remove(); // 出队
    E poll(); // 出队
    E element(); // 队首元素
    E peek(); // 队首元素
}
```
相同操作的不同方法的区别仅在于队满或队空时的行为是抛异常还是仅返回一个`null`或`false`，`add` `remove` `element`会抛异常，`offer`队满(达到了容量限制的大小)时返回`false`，`poll`和`peek`队空时返回`null`。

注意应该避免把`null`添加到队列，不然`peek` `poll`返回`null`就无法判断是队空了还是返回了一个`null`元素。

可以注意到`LinkedList`实现了`Queue`接口，并且中间还有一层`Deque`。

### 8.9 PriorityQueue

即优先队列，`PriorityQueue`实现了`Queue`接口，对`PriorityQueue`调用`remove`或者`poll`，出队时总是优先级最高的元素。

我们需要提供比较接口：实现`Comparable`接口或者传入`Comparator`对象，以便能够通过比较确定优先级。

`PriorityQueue`是实现类，使用时直接使用`new`，直接使用实现的`Queue`接口的方法即可。

优先队列通常用堆实现，入队出队提供`O(logn)`的平均时间复杂度，`TreeMap`可以提供优先队列能够做到的所有操作，只是应该会占用更多空间，特定场景下还是可以使用`PriorityQueue`。


### 8.10 Deque

双端队列，也就是同时提供了堆和栈操作的队列，即同时提供队头队尾插入移除的操作。
|操作\接口|`Queue`|`Deque`|
|:-|:-:|:-:|
|添加元素到队尾	|`add(E e)` / `offer(E e)`|`addLast(E e)` / `offerLast(E e)`|
|取队首元素并删除|`E remove()` / `E poll()`|`E removeFirst()` / `E pollFirst()`|
|取队首元素但不删除|`E element()` / `E peek()`|	`E getFirst()` / `E peekFirst()`|
|添加元素到队首|无|	`addFirst(E e)` / `offerFirst(E e)`|
|取队尾元素并删除|无|	`E removeLast()` / `E pollLast()`|
|取队尾元素但不删除|无|	`E getLast()` / `E peekLast()`|

定义：`public interface Deque<E> extends Queue<E>`

`Deque`是从`Qeuee`派生的，所以其实也可以用`Queue`的`offer`/`poll`方法，其实就等同与`offerLast`/`pollFirst()`，但如果使用`Deque`接口，还是最好调用它自己的方法，这样更能明确表明自己在做什么事情。

实现类：
- `ArrayDeque`，数组实现。
- `LinkedList`，链表。

虽然像`LinkedList`这种实现了`List` `Queue` `Deque`等多个接口，但一般来说我们在使用时总是通过特定的接口来使用它，而不是直接持有一个`LinkedList`，因为持有接口说明代码的抽象层次更高，而接口本身定义的方法代表了特定的用途。

**面向抽象编程**：尽量持有接口，而不是具体的实现类。

### 8.11 Stack

栈，即后进先出表，定义：
```java
public class Stack<E> extends Vector<E> {
    public Stack() {
    }
    public E push(E item) { // 压栈
        addElement(item);

        return item;
    }
    public synchronized E pop() { // 出栈
        E       obj;
        int     len = size();

        obj = peek();
        removeElementAt(len - 1);

        return obj;
    }
    public synchronized E peek() { // 取栈顶元素
        int     len = size();

        if (len == 0)
            throw new EmptyStackException();
        return elementAt(len - 1);
    }
    public boolean empty() { // 判空
        return size() == 0;
    }
    public synchronized int search(Object o) { // 到栈顶距离，栈顶返回1
        int i = lastIndexOf(o);

        if (i >= 0) {
            return size() - i;
        }
        return -1;
    }
    @java.io.Serial
    private static final long serialVersionUID = 1224463164541339165L;
}
```

可以看到`Stack`已经是实现类了，而不是接口，派生自`Vector`。

`Vector`和`ArrayList`一样，都是`List`的动态数组实现，不同于`ArrayList`的是，它支持多线程的同步，同一时刻只能有一个线程能够写`Vector`，也就是`Vector`是线程安全的，但实现同步需要花费更多代价，所以性能不如`ArrayList`。

为什么`Stack`是实现类，而不是接口呢？前面其实也说过，`Vector`和`Stack`都是**历史遗留**的不再推荐使用的类型。因为已经有了名为`Stack`的类，基于兼容性考虑，没有再定义接口。日常使用的话双端队列`Deque`拥有所有栈该有的功能。

### 8.12 Iterator

Java的集合类可以使用`for each`循环：
```java
List<String> list = new ArrayList("hello", "world");
for (String s : list) {
    System.out.println(s);
}
```
但是实际上，java编译器并不知道如何遍历`List`，能够编译通过的原因是编译器把范围`for`循环改成了普通的`for`循环：
```java
for (Interator<String> it = list.iterator(); it.hasNext(); ) {
    System.out.println(it.next());
}
```

使用迭代器的好处在于，调用方总是可以通过统一的方式遍历所有集合，不必关心他们的内部存储结构。如果关心存储结构，那么遍历`ArrayList`就要使用下标，遍历链表就要使用表节点（因为使用下标会有效率问题）。但是使用迭代器可以将这两种方式统一起来，统一形式并且达到最好的效率，只是需要由实现类来实现迭代器的高效遍历访问。

先看一下`Interator`的定义：
```java
public interface Iterator<E> {
    boolean hasNext(); // 是否存在下一个元素
    E next(); // 得到下一个元素，如果没有则抛出NoSuchElementException
    // 移除上一个next返回的元素，每次next只能调用一次remove，不支持该操作抛 
    // UnsupportedOperationException，调用前没有调用next抛IllegalStateException
    default void remove() { 
        throw new UnsupportedOperationException("remove");
    }
    // 对每一个指定元素执行给定操作，直到结尾，迭代过程中修改元素会导致未定义行为，除非实现类定义了对应的并发策略
    default void forEachRemaining(Consumer<? super E> action) {
        Objects.requireNonNull(action);
        while (hasNext())
            action.accept(next());
    }
}
```
非常简单，只需要实现`hasNext`和`next`方法，就可以支持遍历了，如果要支持删除元素，还要实现`remove`，最后的`forEachRemaining`是给`for each`循环来用的，如果不需要支持并发通常不需要再在实现类重写。

实现一个简单的可变数组类作为例子：
```java
public class MyArray<T> implements Iterable<T>{
	private Object[] arr = null;
	private int size = 0;
	public MyArray(int capacity) {
		if (capacity > 0) {
			arr = new Object[capacity];
		}
		else {
			arr = new Object[8];
		}
		size = 0;
	}
	public MyArray() {
		arr = new Object[8];
		size = 0;
	}
	public boolean isEmpty() {
		return size == 0;
	}
	public T get(int index) {
		checkIndex(index);
		return (T)arr[index];
	}
	public void set(int index, T obj) {
		checkIndex(index);
		arr[index] = obj;
	}
	public void add(T obj) {
		if (size == arr.length) {
			grow();
		}
		arr[size++] = obj;
	}
	public T removeAt(int index) {
		checkIndex(index);
		T elem = (T)arr[index];
		for (int i = index+1; i < size; i ++) {
			arr[i-1] = arr[i];
		}
		arr[size-1] = null;
		size--;
		return elem;
	}
	private void grow() {
		int oldCapacity = arr.length;
		Object[] newArr = new Object[oldCapacity*2];
		for (int i = 0; i < arr.length; i ++) {
			newArr[i] = arr[i];
		}
		arr = newArr;
	}
	private void checkIndex(int index) {
		if (index < 0 || index >= size) {
			throw new IllegalArgumentException("Illegal index: " + index);
		}
	}
	// TODO : other method about equals, hashCode, subArray, searching, sorting, etc.
	
	@Override
	public Iterator<T> iterator() {
		return new MyArrayIterator();
	}
	
	private class MyArrayIterator implements Iterator<T> {
		private int index = 0;
		private boolean bNext = false;
		public MyArrayIterator() {
		}
		@Override
		public boolean hasNext() {
			return index < MyArray.this.size;
		}
		@Override
		public T next() {
			bNext = true;
			return (T)MyArray.this.get(index++);
		}
		@Override
		public void remove() {
			if (bNext == false) {
				throw new IllegalStateException("there is no last next() called.");
			}
			MyArray.this.removeAt(--index);
			bNext = false;
		}
	}
}
```
这只是最小功能简化，正常实现比如`ArrayList`要达到可用需要考虑比较多的东西。此时就可以用`for each`循环或者迭代器去迭代这个类了：
```java
MyArray<String> arr = new MyArray(10);
arr.add("hello");
arr.add("world");
arr.add("nice");
arr.removeAt(1);
for (Iterator<String> it = arr.iterator(); it.hasNext();) {
	System.out.println("elem: " + it.next());
	it.remove();
}
```

总结：
- `Iterator`是一种抽象的数据访问模型，好处有：
- 对任何集合都采用一种访问模型。
- 调用者对集合内部结构一无所知。
- 集合类返回的`Iterator`对象知道该如何迭代。


### 8.13 Collections

`Collections`是JDK提供的工具类，同样位于`java.util`包中，注意末尾有s，区别于`Collection`接口。它提供了一系列静态方法，能更方便地操作各种集合。

创建空集合：
```java
public static final <T> List<T> emptyList()
public static final <K,V> Map<K,V> emptyMap()
public static final <T> Set<T> emptySet()
```
- 注意返回的空集合是不可变集合，无法向其中添加或者删除元素。
- 也可以使用各个集合接口提供的`of(T...)`方法来创建空集合，比如`List.of()`和`Collections.emptyList()`就是等价的。

创建单元素集合：
```java
public static <T> List<T> singletonList(T o)
public static <K,V> Map<K,V> singletonMap(K key, V value)
public static <T> Set<T> singleton(T o) // 单元素Set
```
单元素集合也是不可变集合，不可添加元素，空集合和单元素集合都是有`Collections`的静态嵌套类实现。

排序：
```java
public static <T extends Comparable<? super T>> void sort(List<T> list)
public static <T> void sort(List<T> list, Comparator<? super T> c)
```
排序会改变元素，所以参数需要是可变的`List`。

洗牌：
```java
public static void shuffle(List<?> list)
public static void shuffle(List<?> list, Random rnd)
```
传入有序的`List`，随机打乱`List`内部元素顺序。

不可变集合：

`Collections`提供了方法将可变集合封装为不可变集合。都是有内部的静态嵌套类实现，实际上是通过创建代理对象，拦截掉所有修改方法实现。
```java
public static <T> List<T> unmodifiableList(List<? extends T> list)
public static <K,V> Map<K,V> unmodifiableMap(Map<? extends K, ? extends V> m)
public static <T> Set<T> unmodifiableSet(Set<? extends T> s)
```
然而改变原始的可变集合是可以进行修改的，并且会影响到封装后的不可变集合。

线程安全集合：
```java
public static <T> List<T> synchronizedList(List<T> list)
public static <K,V> Map<K,V> synchronizedMap(Map<K,V> m)
public static <T> Set<T> synchronizedSet(Set<T> s)
```
上述方法将线程不安全的集合变为线程安全的集合，Java5开始，引入了更高效的并发集合类，上述的同步方法已经没什么用了。

`Collections`还有很多其他方法。


## 9. IO

输入输出：
- 输入，即是从外部读入数据到内存。例如从磁盘、网络、用户输入等。读到内存之后无非就是用字节数组`byte[]`或者字符数组`char[]`表示。
- 输出，将数据从内存输出到外部。例如输出到磁盘、网络、屏幕等。输出也就是将`byte[]`或者`char[]`写到文件或者其他位置。
- `InputStream` / `OutputStream`是以字节为最小传输单位的输入输出流，也称字节流。
- `Reader` / `Writer`是以字符`char`为最小传输单位的输入输出流，也成字符流。本质上`Reader`和`Writer`就是能够自动编码解码的字节流。`Reader`读取是将字节流解码转换为字符流，`Writer`将数据写入前会先将字符流编码为字节流。
- 输入输出流是单向流动的。

同步IO与异步IO：
- 读写IO是代码必须等待数据返回后才继续执行后续代码，优点是代码简单，缺点是CPU效率低（因为CPU速度远高于IO速度）。
- 异步IO是指，读写IO时仅发送请求，然后立刻执行后续代码，优点是CPU执行效率高，缺点是代码编写复杂。

Java标准库提供了`java.io`同步IO以及`java.nio`异步IO。上述流相关的类都是同步IO的抽象类。这里只讨论同步IO。

## 9.1 File

Java用`java.io.File`来操作文件和目录，构建一个`File`对象需要传入路径。路径可以是绝对或者相对路径，或者绝对路径中使用`..`表示的相对路径。其中路径分隔符，windows中是`\\`，Linux中是`/`。

三种路径：
- `getPath` 传入路径
- `getAbsolutePath` 绝对路径，传入相对路径中的`.`或者`..`不会被展开，而是直接拼接到当前目录上。
- `getCanonicalPath` 规范路径，展开传入相对路径中的`.`或者`..`，得到文件的绝对路径。

因为Windows和Linux路径分隔符不同，在`File`中用静态字段`File.separator`字符串表示。

`File`既可以表示文件，也可以表示目录，构建`File`时，即使传入路径不存在，也不会出错，调用`File`对象某些方法时才会真正进行磁盘操作。

`File`属性
```java
public boolean isFile()
public boolean isDirectory()
public boolean isAbsolute()
public boolean isHidden()
```

文件读写权限和大小：
```java
public boolean canRead()
public boolean canWrite()
public boolean canExecute()
public boolean exists()
public long length() // 文件大小，如果是目录，返回值不确定
```
对目录而言，是否能够执行代表能够列出它包含的文件和子目录。

创建删除文件：创建文件是先检查文件，如果不存在则创建一个空文件，检查和创建对文件系统来说是原子操作。
```java
public boolean createNewFile() throws IOException
public boolean delete()
```

临时文件：使用`createTempFile`创建临时对象，如果调用了`deleteOnExit`则会在JVM退出时自动删除。
```java
public static File createTempFile(String prefix, String suffix) throws IOException
public static File createTempFile(String prefix, String suffix, File directory)
public void deleteOnExit()
```

遍历文件和目录：
```java
public String[] list()
public String[] list(FilenameFilter filter)
public File[] listFiles()
public File[] listFiles(FilenameFilter filter)
public File[] listFiles(FileFilter filter)
public static File[] listRoots() // 列出文件系统所有根目录
```

目录操作：
```java
public boolean mkdir() // 只能创建最后一级目录
public boolean mkdirs() // 如果中间目录不存在也会创建
public boolean delete() // 目录为空才能成功
```

java标准库还提供了`Path`对象，位于`java.nio.file`包，和`File`对象类似，但操作更为简单。如果需要对目录进行复杂的拼接遍历等操作，使用`Path`对象更为方便。




## TODO
- 包与模块详解
- 集合
- IO
- 日期与时间
- 单元测试
- 正则
- 加密与安全
- 多线程
- Maven
- 网络编程
- XML&JSON
- JDBC
- 函数式
- 设计模式
- Web开发
- Spring
- Spring Boot







