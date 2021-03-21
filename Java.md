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
  - [TODO](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


# 入门一下Java

Java教程：[廖雪峰Java教程](https://www.liaoxuefeng.com/wiki/1252599548343744)

Eclipse教程：[Eclipse 教程](https://www.runoob.com/eclipse/eclipse-tutorial.html)

写在前面：仅仅是关键性知识点的笔记，用来串联和查阅，并不系统也并不细节。

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
- `Ctrl+F2` 终止调试，结束调试
- `Ctrl+R` 运行至行
- `Ctrl+Alt+B` 跳过所有断点，也就是无效化所有断点
- `Drop to Frame` 拖放至帧(这什么破翻译，真就直译？)，跳转到当前执行函数的开头开始执行，不会改变一个全局数据原有的值，只是切换了栈帧。
- 跳过、跳出、运行至行等能够运行多行的操作执行过程中遇到断点都会断住。
- 首选项-调试-单步执行过滤，过滤不需要关注的类。
- 配合调用堆栈(调试窗口)、本地变量监视、条件断点、表达式求值，常用的调试操作也就这些了。

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

说实话有些快捷键感觉有点太啰嗦，一点都起不到快捷的作用，说的就是`Alt+Sift+Q`加上一个键的那一堆，也懒得自己改，不要增加太多心智负担，记住常用的就好。如`Ctrl+O`, `F3`, `Ctrl+T`加上常用的调试快捷键就行。说句实话没有VS用起来那么舒服。

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
- 多为数组转字符串: `Arrays.deepToString()`

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

对引用变量`==`判等时，含义是判断是否指向同一个对象。判断内容相等需要使用`equals`方法。在java中，通常称函数为方法(mtthod)，因为函数必定是某个类的成员，不管是不是静态。

浮点数不要直接判等，通常判断差值是否在精度范围内。

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
如果要返回多个值，还可以用`{}`包起来，最后用`yield`返回。

这种结构存在的意义是什么呢？我感觉并没有那么清晰。算是一个语法糖，可用可不用。


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

不同于C++，Java中称数据成员为**字段**(field)，称成员函数为**方法**(method)。


### 2.1 类和对象

- 关键字: `class`
- 指代对象自身: `this`引用变量
- 引用类型: 创建类对象实例都是使用引用变量来使用，可以理解为指向堆区域对象的指针，但是毕竟java没有指针(但的确有一个与空指针语义相同的`null`)，也就没有解引用和直接在栈上实例化的操作。C++通过多重指针、指针引用等可以精确控制一个对象的生存周期，持有关系等任何行为。
- 单从语义上理解java的引用和C++非常像，不同的是java中可以更改引用指向的对象，还可以指向`null`，就像是C++指针和引用的融合一样。
- 构造方法(Constructor): 无返回值，当然不定义的话编译器会生成一个函数体为空的无参默认构造方法，定义之后便不再生成默认构造。光凭想象就可以想到不用管理内存之后相比C++会少掉多少考虑拷贝构造、移动构造、赋值运算符这类的事情，瞬间好像就轻松起来了。
- 默认构造时各种类型默认值: 不同于C++如果不给初始化，对于没有构造函数的内置类型(整型浮点指针)，分配内存之后那块区域里面存什么值，成员就会是什么值。java中理所当然会执行默认初始化，引用初始化为`null`，数值类型用默认值`0`，`boolean`则是`false`。
- 初始化: java可以直接在类内成员定义时给初始值。执行顺序理所当然是先初始化为字段默认值或定义时给定的值，然后在执行构造方法。
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
    - 同C++一致的是，方法重载只与参数列表(类型和顺序)有关，和返回值，访问修饰符无关系。C++中函数重载之后其实就是成为了不同的函数，经过名称修饰之后符号是不同的。那么java有没有类似于名称修饰一类的东西呢？是如何保证调用时正确跳转到对应的函数入口地址的呢？
    - 重载函数返回值类型不必相同。
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
- 根类：`Object`，没有父类的类都会自动继承自`Object`。  
- 继承方式仅有一种，不像C++一样还有私有保护公有继承，虽然我从来未在工作中碰到过私有和保护继承就是了，无用的东西都可以剃掉，好耶！
- java不像C++一样多继承，也就是一个类只能有一个基类。一般来说的确是如此呢！这样的话继承关系就会是一棵真正的树，不会有多个基类。
- 其实也可以变相的多继承：`class C implements A,B`。只要A和B必须是接口(`interface`)。
- 调用基类构造：`super(args);`，也即是用`super`指代这个对象中的基类部分。引用父类字段或者方法时使用。
- 当然子类不会继承父类所有构造函数，不写的话默认构造是编译器生成，此时调基类的默认构造，即是构造函数第一句添加`super();`，如果基类没有默认构造，那么是编不过的。
- 访问限定：和C++的公有继承如出一辙，子类无法访问父类`private`，可以访问`protected`和`public`。
- 不要在派生类中定义和基类字段同名的字段。当然并非语法上禁止，只是工程实践中不要这么做比较好，子类作用于会覆盖基类作用域，然后局部方法作用域会覆盖类作用域，你总可以使用`this.val`、`super.val`来区分它们。在C++允许多继承所以使用`baseclass::val/baseclass::func`。
- 阻止继承：`sealed`配合`permits`关键字只允许指定的类继承该类，`public sealed class Shape permits Rect, Circle, Triangle`，这个操作有点意思。
- 使用`final`修饰类表明该类不能再被继承。同C++。`final calss A extends B`。
- 类型转换：向上转换必然成功，向下转换如果类型匹配则可以成功，不匹配则会失败抛异常。很好理解。
- 判断是否是指定类型：`instanceof`，返回`boolean`，完全匹配的类型或者基类都会返回`true`。RTTI有了，好耶！语法层面支持真棒！C++某些时候还要自己去实现RTTI就很烦了。
    - 用法：`obj instanceOf Type`，返回`boolean`。
    - Java14开始：`obj instanceOf Type s`，返回`boolean`。且可直接使用转换后的变量`s`。但是好像在本地Eclipse/Java SE15上显示`preview feature and disabled by default`呢？好吧。
- 继承与组合：is与has的关系要区分清楚当然不用多说。has关系不应该用继承。
- 覆写(Override)：
    - 在C++中，只有虚函数可以重写，和重载一样，判断标准依然是函数参数列表（方法签名）。如果重写了一个并非虚函数的函数，那么也就不能称之为重写，非虚函数不会在虚表中，也就不会有多态，调用指针/引用/变量类型确定调用了哪一个。
    - 在Java中，所有函数皆是虚函数，其实也就是没有虚函数的概念，所有普通函数皆可以被重写。除非显式使用`final`阻止重写，不然都可以重写，使用了`final`再在子类中重写会编不过。当然如果是方法签名相同但返回值不同的重写，当然会报错。
    - `@Override`放在方法前，可以让编译器帮助检查是否进行了正确的覆写。如果是重写，但是方法名写错了，就会报错，如果不加，那么就会有基类方法和子类接口写错的方法同时可用。懂了，防呆设计！怪不得都说Java可靠性高，新手不容易犯错。当然，这是非必须的。
    - 看起来并没有那种能够在子类重写父类同名方法但又能使其不具有多态性的行为。这不是废话吗？

### 2.4 多态

- java中不存在在栈中实例化对象，所以都取决于运行时类型就是了，运行时是什么类型，就调那个类型的方法，可能是重写的基类方法，也可能是继承自基类的方法，总之是运行时类型所决定，当然要能够编过，那必然要编译时类型能够调用该方法才行。也就是说要使用基类重写的方法，需要是用这个基类方法重写自的那个类或者派生链条中间的类的引用。总感觉我在说一堆废话。
- 根类`Object`重要方法：
    - `toString`，将对象输出为`String`。
    - `equals`，两对象判等。貌似并没有重写`operator==`这种选项，看来C++的确自由度要更高那么一点点，当然心智负担也要高那么亿点点。
    - `hashCode`，计算对象哈希值，java赛高！
- 子类调用基类方法：`super.method`。
- 字段加`final`之后表示在初始化之后不能更改。有点像C++`const`成员，只能在构造函数初始化列表中赋值，或者C++11之后的类内初始值。

### 2.5 抽象类

- 声明：`abstract`同时用于类和方法。放在类返回值前和`class`前。方法也就称之为**抽象方法**。
- 抽象类无法实例化，和C++抽象类同样的，还是类，也可以有成员，也可以有构造、被派生。但不能多继承。
- 面向抽象编程：尽量引用顶层抽象类，不关心具体子类型。本质：
    - 上层代码只定义规范。
    - 不需要子类就可以实现业务逻辑。
    - 具体的业务逻辑由不同的子类实现，调用者并不关心。
- 定义了抽象方法的类必须定义为抽象类。不实现抽象方法，子类依然是抽象类。

### 2.6 接口

- 关键字：`interface`。
- 对标C++的纯虚函数，当然C++允许多继承，所以纯虚类和普通抽象类并无太大区别，可以构造、可以有成员。但java只有接口类允许多继承，那么当然就不能由只有一个的基类引用`super`来完成构造，那么必然就不能有正常属于普通类对象的字段和构造。
- 其实写了构造也能编过，会被识别为一个普通方法提示缺少返回值，而不是构造。写了字段也没有问题，貌似被当做了静态字段来处理。别说细节还挺多。经过求证接口的字段会自动`public final static`。
- 实现接口类时，需要使用`implements`。
- 同时派生一个类，并实现接口：`class A extends B implements C,D`。`super`将指代B，没有B的话就是默认的`Object`。
- `default`方法：接口中也可以有实现了的方法，此时就需要加`default`关键字，当然没有字段可以给它访问。目的是实现没必要在所有子类中重写的接口。派生类中可以不进行重写。
- 接口中所有方法默认`public abstract`，不需要显示写出。
- 接口可以继承另一个接口，同样使用`extends`。

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
- 进入到`String`的声明里面可以看到内部是怎么存储一个字符串的，早期可能会直接使用`char`数组，但那样的话对于只有ASCII字符构成的字符串内存空间不够友好，现在内部有区分编码，但可以发现都是`final`修饰的，也就是赋值之后即不可变。而我们在外部不需要关心`String`内是怎么存储的。
```java
public final class String
    implements java.io.Serializable, Comparable<String>, CharSequence,
               Constable, ConstantDesc {
     private final byte[] value;
     private final byte coder; // 0 - LATIN1, 1 - UTF16
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
- 因为编辑操作修改直接，并返回`this`，所以可以连起来调用，就像`std::cout <<`一样。

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
	private int value;
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
- 打开编译开关：`--source 15 --enable-preview`才能不适用，不然会报错。
- Eclipse中首选项—Java编译器—Enable preview features for Java15。

经过测试以上选项都并不会解决问题。TODO，理解就行。

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

TODO...






## TODO
- 模块详解
- 异常处理
- 反射
- 注解
- 泛型
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







