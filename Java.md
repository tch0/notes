<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [入门一下Java](#%E5%85%A5%E9%97%A8%E4%B8%80%E4%B8%8Bjava)
  - [0. 简介](#0-%E7%AE%80%E4%BB%8B)
    - [0.1 关于Java](#01-%E5%85%B3%E4%BA%8Ejava)
    - [0.2 开发环境](#02-%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83)
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
    - [1.10 数组](#110-%E6%95%B0%E7%BB%84)
    - [1.11 命令行参数](#111-%E5%91%BD%E4%BB%A4%E8%A1%8C%E5%8F%82%E6%95%B0)
  - [2. java面向对象](#2-java%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1)
    - [2.1 类和对象](#21-%E7%B1%BB%E5%92%8C%E5%AF%B9%E8%B1%A1)
    - [2.2 方法](#22-%E6%96%B9%E6%B3%95)
    - [2.3 继承](#23-%E7%BB%A7%E6%89%BF)
    - [2.4 多态](#24-%E5%A4%9A%E6%80%81)
    - [2.5 抽象类](#25-%E6%8A%BD%E8%B1%A1%E7%B1%BB)
    - [2.6 接口](#26-%E6%8E%A5%E5%8F%A3)
  - [TODO](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


# 入门一下Java

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


### 1.10 数组

- 定义: `type[]`
- 长度: `length`
- 取成员: `[]`
- range-for: `for(type val : arr)`
- 转换为`String`: `Arrays.toString()`，输出`[elem1, elem2, ..., elemLast]`，需要`import java.util.Arrays;`
- 排序: `Arrays.sort()`
- 多维数组: `type[][]`，即是数组的数组，不要求每个元素统一大小。
- 多为数组转字符串: `Arrays.deepToString()`

### 1.11 命令行参数

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
- 访问限定符：
    - `public`
    - `private`
    - `protected`
    - `default`
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
- `default`方法：接口中也可以有实现了的方法，此时就需要加`default`关键字，当然没有字段可以给它访问。目的是实现没必要在所有子类中重写的接口。



## TODO
- 包、作用域、模块
- java核心类
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







