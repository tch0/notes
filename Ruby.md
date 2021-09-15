<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [7周7语言](#7%E5%91%A87%E8%AF%AD%E8%A8%80)
- [Ruby](#ruby)
  - [环境配置](#%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE)
  - [语法快速入门](#%E8%AF%AD%E6%B3%95%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8)
  - [编程模型](#%E7%BC%96%E7%A8%8B%E6%A8%A1%E5%9E%8B)
  - [条件与循环](#%E6%9D%A1%E4%BB%B6%E4%B8%8E%E5%BE%AA%E7%8E%AF)
  - [鸭子类型](#%E9%B8%AD%E5%AD%90%E7%B1%BB%E5%9E%8B)
  - [阶段总结](#%E9%98%B6%E6%AE%B5%E6%80%BB%E7%BB%93)
  - [函数](#%E5%87%BD%E6%95%B0)
  - [数组](#%E6%95%B0%E7%BB%84)
  - [哈希表](#%E5%93%88%E5%B8%8C%E8%A1%A8)
  - [代码块和yield](#%E4%BB%A3%E7%A0%81%E5%9D%97%E5%92%8Cyield)
  - [定义类](#%E5%AE%9A%E4%B9%89%E7%B1%BB)
  - [Mixin](#mixin)
  - [模块、枚举和集合](#%E6%A8%A1%E5%9D%97%E6%9E%9A%E4%B8%BE%E5%92%8C%E9%9B%86%E5%90%88)
  - [阶段总结](#%E9%98%B6%E6%AE%B5%E6%80%BB%E7%BB%93-1)
  - [元编程](#%E5%85%83%E7%BC%96%E7%A8%8B)
  - [开放类](#%E5%BC%80%E6%94%BE%E7%B1%BB)
  - [method_missing](#method_missing)
  - [模块](#%E6%A8%A1%E5%9D%97)
  - [Ruby总结](#ruby%E6%80%BB%E7%BB%93)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 7周7语言

书籍[七周七语言：理解多种编程范型](https://book.douban.com/subject/10555435/)的读书笔记。用来串联与总结，要想详细还得读完全书。

因为书本身比较短仅245页，所以缩短为7天7语言。重点在于理解和体会编程范式，体会一门语言的精髓之处，而不是掌握一个语言的全部，要想7周掌握7种编程语言那肯定是不现实的。

探索一门语言时应该关注什么：
- 类型模型：强类型(Java)还是弱类型(C)，静态类型(Java)还是动态类型(Python)，本书中全部都是强类型。类型模型将会影响你对问题的处理方式，还会控制语言的运行方式。
- 编程范式：基于逻辑、面向对象、面向过程、函数式还是多种范式的综合。基于逻辑的编程语言（Prolog）、两门完全支持面向对象思想的语言（Ruby和Scala）、四门带有函数式特性的语言（Scala、Erlang、Clojure和Haskell）及一门原型语言（Io）。里有Scala这样的多范型（multiparadigm）语言，也有Clojure这种多方法（multimethod）语言，后者甚至允许你实现自定义范型。学习新的编程范式将会是一个重点。
- 怎么和语言交互：解释器、虚拟机、命令行交互、单文件编程、项目组织与管理。
- 语言的判断结构与核心数据结构：很多语言使用和if、while这种常规结构不同的判断结构，集合是每一门编程语言的核心数据结构。无论用哪一类语言，都必须全面、透彻地理解集合。
- 语言的高级核心特性：并发编程的高级特性、独一无二的高级结构、性能强劲的虚拟机、针对特定问题的编程模型等。

7门语言：
- Ruby：面向对象，重点是**Ruby元编程**（metaprogramming）。
- Io：原型语言，最简语法，拥有兼具简单性和语法一致性的**并发结构**，还有着独一无二、韵味无穷的**消息分发机制**。小众语言，与商业无缘。
- Prolog：**基于逻辑**的经典编程语言。
- Scala：运行在Java虚拟机上，为Java系统引入了强大的**函数式编程**思想，同时保留了面向对象特性。
- Erlang：历史悠久，**函数式**，在**并发**、分布式编程、容错等诸多方面都有优异表现。
- Clojure：运行在Java虚拟机上，**Lisp方言**，书中唯一在版本数据库中使用同一种策略管理并发的语
言。拥有全书最灵活的**编程模型**。
- Haskell：书中唯一的**纯函数式语言**，拥有令人艳羡的**类型模型**。

仅用几个关键字概括一门语言是无法做到的，还需了解之后细细品味。

关注重点：
- 除了Ruby和Prolog之外，另外5门语言都有强大的并发模型，并发应该是一个关注重点。
- 4门语言都有函数式编程，这是另一个关注重点。
- 新的不熟悉的编程范式也应该重点关注。

涉及的范围：
- 环境配置，供读者以及作者以后参考。（书中未给出）
- 限于命令行交互式编程或者单文件编程，不会深入包管理以及项目组织与管理。
- 只涉及关心的核心语法，不是编程参考书，不会全面解读一门语言，某些不关心的核心语法甚至都不会解读。

实践要求：
- 每门语言的实践目标应该是完成一个超越基本语法的任务。比如Ruby当然需要写一些元编程的代码。
- 独立思考并完成课后习题很重要。

# Ruby

[Ruby](https://zh.wikipedia.org/wiki/Ruby)由松本行弘大约在1993年左右发明。语言角度来看，Ruby是**解释型、面向对象、动态类型**的原因。运行在解释器上而非由编译器编译执行，类型绑定发生在运行时而非编译期，面向对象的特性：封装继承多态当然也都支持。执行速度谈不上高效，但是Ruby的编程效率却很高。Ruby变得流行的原因很大程度上是因为Ruby编写的Web框架 [Ruby on Rails](https://rubyonrails.org/) 非常受欢迎。


## 环境配置

浏览器搜索Ruby，找到官网，截止目前最新稳定版本是3.0.2，上一个稳定版是2.7.4，入门阶段装哪个版本无所谓。
- Windows上直接运行安装包，一键安装，记得勾选添加环境变量。
- Linux上使用包管理器，Ubuntu为例，`sudo apt install ruby`即可。

版本：
```
ruby -v
```

[Ruby文档](https://www.ruby-lang.org/zh_cn/documentation/)中包含了多个快速入门教程、API参考文档、手册、开发环境介绍。挑选一些进行阅读是很有必要的，开始前在其中选一个15、20或者30分钟的交互式入门教程熟悉一下语法是比较好的。

进入命令行交互环境：
```shell
irb
```
经典HelloWorld：
```ruby
puts 'hello,world!'
```

Linux上和Windows上是同理的，任选一个作为实验环境就行。

配置文件执行与调试环境：
- 这里选择VSCode安装Ruby插件以及Ruby solargraph（需要首先运行`gem install solargraph`安装）插件，以支持代码补全、智能提示、鼠标悬停文档。
- 文件后缀：`.rb` `.rbw`一般使用前者。
- 执行：`ruby hello.rb` 或点击运行按钮

作为脚本执行：
```ruby
#!/usr/bin/env ruby
```

## 语法快速入门

注释：
```ruby
# single line comment, like python
```

函数：
```ruby
def hello(name = "world") # 默认参数
    puts "hello #{name}" # ""字符串中使用#{var}插入变量
end

hello("world")
hello # 无参数可以不加括号
```

类：
```ruby
class Person
    attr_accessor :name#,:age
    def initialize(name = "nobody", age = 10) # constructor
        @name = name
        @age = age
    end
    def hello()
        puts "Hello, #{@name}" # @name instance variable
    end
    def bye
        puts "Bye, #{@name}"
    end
end

if __FILE__ == $0 # __FILE__ is current script, $0 is first start argument
    mary = Person.new("mary")
    if mary.respond_to?("hello") # true
        mary.hello
    end
    if mary.respond_to?("hi") # false
        mary.hi
    end
    if mary.respond_to?("age") # false
        puts(mary.age)
    else
        puts("can not access age")
    end
    if mary.respond_to?("name") # true
        puts(mary.name)
    end
    
    puts(Person.instance_methods(false)) # print all functions of Person
    
    mary.name = nil # nil is like null
    mary.bye
end
```
类的内部使用`@`访问实例字段，使用`attr_accessor`控制外部是否可以访问字段。提供类反射方法`instance_methods`获取类的所有方法，实例方法`respond_to?`询问是否可以从外部访问实例的字段和方法。

最后得到的结果：一个数组`[:hello, :bye, :name, :name=]`，其中`name`用来获取，`name=`用来赋值。所以其实字段还是使用对应生成的方法（也就是其他编程语言中比如C#/Java中所说的属性）来获取和设置的。

入口的技巧：如果当前是启动文件则执行。

解释型语言，动态类型，没有执行到的部分有运行时错误（比如找不到方法），也不会报错。

循环：
```ruby
names = ["Nagato Yuki", "Suzumiya Haruhi"] # array
if names.respond_to?("each") # true for array
    names.each do |name|
        puts("Long tim no see, #{name}")
    end
end
```

就等价于C++中：
```c++
vector<string> names = {"Nagato Yuki", "Suzumiya Haruhi"};
for (auto name : names)
{
    cout << "Long tim no see, " << name << ".\n";
}
```

在`each`内部实际上会自动调用`yield "Nagato Yuki"`和`yield "Suzumiya Haruhi"`。

## 编程模型

面向对象，Ruby中一切皆是对象，就连单独的数也是。
```shell
irb(main):005:0> x = 4
=> 4
irb(main):006:0> x > 5
=> false
irb(main):007:0> false
=> false
irb(main):008:0> false.class
=> FalseClass
irb(main):009:0> 4.class
=> Integer
irb(main):010:0> 1.0.class
=> Float
```

## 条件与循环

`true` `false`是对象，并且是**一等对象**。每个语句表达式都会有返回值，如果没有，就返回`nil`。交互环境下会打印出来。

条件：
```ruby
x = 4
unless x > 4
    puts "x <= 4"
end
puts "x <= 4" if not x > 4
puts "x <= 4" if !(x > 4)

if x >= 4
    puts "x >= 4"
end
```

两种形式：
```ruby
(if/unless condition statements end)
(statements if/unless condition) # single line format
```

`unless`就是`if`反义，也可以用`not` `!`表示反义，到底清不清晰好不好理解就见仁见智了。毕竟我觉得自由度变高了是需要更多心智负担的。

条件判断时除了`nil`和`false`其他都是`true`，也就是说**0也是true**。

循环：
```ruby
x = 1
sum = 0
while x <= 100
    sum += x
    x = x + 1
end
puts(sum) # 5050

x = 0
sum = 0
sum = sum + (x = x + 1) until x == 100
puts(sum) # 5050

x = 0
sum = 0
sum = sum + (x = x + 1) while x < 100
puts(sum) # 5050
```
`while` `until`，`until`就是`do while`。同样两种写法等价，单行形式只能有一条语句。

逻辑运算符：`&& and` `|| or` `! not`，`&& ||`短路求值。`& |`也是逻辑运算符，只不过是非短路版本，会将所有表达式求值。一般使用前者。

## 鸭子类型

>什么是鸭子类型？鸭子类型表述为当看到一只鸟走起来像鸭子、游泳起来像鸭子、叫起来也像鸭子，那么这只鸟就可以被称为鸭子。（在只关心鸭子的这几个特性的情况下）。鸭子类型是编程语言中动态类型语言中的一种设计风格，一个对象的特征不是由父类决定，而是通过对象的方法决定的。

Ruby是**强类型**的，也就是**类型安全**的，当某些操作错误使用了类型时，将得到一个错误。

```ruby
irb(main):006:0> 4 + "hello"
(irb):6:in `+': String can't be coerced into Integer (TypeError)
```

- 这是运行时而非编译期检查的。(某些语法上的错误是能够在运行前（编译期？）进行检查的！)。因此从最严格的角度来说，Ruby不是强类型语言，不过一般情况下，Ruby表现得像一门强类型语言。
- 也就是说Ruby是**动态类型**，尝试执行代码时才进行类型检查。（在完整的多趟编译/解释过程中，类型检查应该是在语义分析过程中，而不是语法分析）。
- 这种类型系统也有自己的优势，就是鸭子类型的应用。例：
```ruby
a = ["100", 10.0]
sum = 0
a.each do |num|
    num = num.to_i # duck type, every type of num which has a to_i method can run this code
    sum = sum + num
end

puts(sum)
```
字符串和浮点数都可以转化为整数，这是因为Ruby中一切皆是对象，都能调用`to_i`。其中还动态改变了num的语言，这也是动态类型的特点。面向对象中的重要思想就是：面对接口而不是实现编程，利用鸭子类型，实现这一原则仅需极少的工作就可以轻松完成。使用鸭子类型，可以在不使用继承的情况下实现多态。

## 阶段总结

内容总结：
- Ruby是解释型语言，一切皆是对象，且易于获取对象的任何信息，如对象的各方法及所属类。
- 动态类型语言，它是鸭子类型的，且行为通常和强类型语言毫无二致。
- 感受上来说和Python非常地像。
- 用end显式表示块的结束。

## 函数

- 不像Java或者C#那样，定义一个函数必须构建一个类，像python一样可以直接构建函数。
- 函数也是对象，也可以作为参数传递。
- 每个函数都会返回结果，如果没有显示指定。函数就将返回退出函数前最后处理的表达式的值。


```ruby
def fib(n)
    if n <= 0
        return 0
    elsif n == 1
        return 1
    else
        return fib(n-1) + fib(n-2)
    end
end

puts(fib(10))
```

函数调用时的括号可以省略，甚至函数定义时的括号也可以省略（不推荐）。

## 数组

```ruby
irb(main):001:0> a = ["Catholly", "Nephren", "Lilia"]
=> ["Catholly", "Nephren", "Lilia"]
irb(main):002:0> a[0]
=> "Catholly"
irb(main):003:0> a[-1]
=> "Lilia"
irb(main):004:0> a[1..2]
=> ["Nephren", "Lilia"]
irb(main):005:0> (0..1).class
=> Range
irb(main):006:0> a[0] = "Rhantolk"
=> "Rhantolk"
irb(main):007:0> a[3]
=> nil
irb(main):008:0> a.size
=> 3
irb(main):009:0> a.class
=> Array
irb(main):010:0> a[4] = 0
=> 0
irb(main):011:0> a
=> ["Rhantolk", "Nephren", "Lilia", nil, 0]
```

使用`[]`定义，类型是`Array`，可以通过下标获取，并且提供了灵活的`Range`来获取范围。数组中元素不要求类型相同，多维数组就是数组的数组。数组有及其丰富的API，可以将其当做队列、链表、栈、集合来使用。

## 哈希表

```ruby
irb(main):001:0> dict = {1 => 2, "hello" => "world", :a => 10, :f => 15}
=> {1=>2, "hello"=>"world", :a=>10, :f=>15}
```

使用`{}` 配合`=>`定义，同样使用`[]`获取元素。哈希表的键和值都可以是任意类型。还可以在其中引入**符号**（Symbol）：前面带有冒号的标识符。尽管两个同值字符串在物理上不同，但相同的符号却是同一物理对象。

```ruby
irb(main):007:0> "string".object_id
=> 280
irb(main):008:0> "string".object_id
=> 300
irb(main):009:0> :a.object_id
=> 768028
irb(main):010:0> :a.object_id
=> 768028
irb(main):011:0> :a.class
=> Symbol
```

使用散列表可以有一些很有用的应用，比如Ruby虽然不支持命名参数，但可以用散列表来模拟它。

```ruby
def fun(options = {})
    if (options[:hello] == :world)
        puts("hello,world!")
    elsif
        puts("world is crazy")
    end
end

fun :hello => "yes" # omit () and {}
fun({:hello => :world})
```

## 代码块和yield

代码块是**没有名字的函数**。它可以作为参数传递给函数或方法。代码块有两种形式：
- `{}`或者`do / end`。
- 惯例是单行使用`{}`，多行使用`do / end`。仅仅是惯例而已，其实用于代码块时是等价的。

```ruby
3.times {puts "hello,world!"}

10.times do |i|
    print i, ' '
end
```
这里将代码块作为了参数传递给了实例方法`Integer.times`。实现是从0遍历到该整数，每次使用`yield`返回一个整数。如果没有参数给定，那么返回一个Enumerator。
```ruby
irb(main):013:0> 2.times
=> #<Enumerator: ...>
irb(main):015:0> 10.times do |i| print i, ' ' end
0 1 2 3 4 5 6 7 8 9 => 10
```

```ruby
class Integer
    def my_times
        i = self
        while i > 0
            i = i - 1
            yield i
        end
    end
end

10.my_times do |i|
    if !i.nil?
        print i, ' '
    elsif
        puts "nil"
    end
end
```
其中`my_times`的定义**打开现有的类，向其中添加一个方法**，这就有点黑魔法的味道了！这里是和`times`返回的值是反过来的。

它用`yield`调用代码块，每次`yield`都会调用外面的代码块一次，如果`yield`不返回值，那么外面的代码块就会获取到`nil`，外部的代码块通过`|*args|`的形式来获取`yield *args`的值。

代码块还可直接用作**一等参数**，不需要包装在任何结构中，需要使用`&`：
```ruby
def call_block(&block)
    block.call
    puts(block.class) # Proc
end

def pass_block(&block)
    call_block(&block)
end
pass_block {puts "hello"}
```

我们说过万物皆对象，代码块其实就是一个`Proc`对象。

Ruby中代码块不仅可以用于循环，还可以用于延迟执行。
```ruby
execute_at_noon {puts 'hello'}
```

- 可以看到其实`yield`和回调其实是一回事，`yield`就是在`yield`的位置执行外部传入的函数块，而回调则是显式地传入了函数。
- 使用`yield`的话参数是空的，但如果调用时有参数又相当于传入了参数，应该考虑调用时没有传函数块和传了函数块的行为有什么区别。比如`times`实现。个人感觉主要用于函数实现中有循环的情况会比较适用。
- 使用回调的话，可以做到和`yield`同样的事情。`yield`算是一个很甜的语法糖，还有许多细节比如函数参数个数需要细细考究。

用回调做到`my_times`的事情：
```ruby
class Integer
    def my_times2(&block)
        i = self
        while i > 0
            i = i - 1
            block.call i, i*i
        end
    end
end

10.my_times2 do |i, j|
    print i, ' ', j, ' '
end
```

- 经过试验可以确定`yield`和回调其实就是等价的，`yield`也是可以返回多个值的。如果调用的函数块获取的参数多于yield返回值数量或者回调`call`调用实参数量，那么没有对应到的部分会获取到`nil`。如果参数多了，多了的部分会被省略，也就是说不检查参数数量是否匹配，可见其灵活性。
- 有一点区别就是当没有函数块传入时，yield语法提示是`no block given (yield) (LocalJumpError)`，回调的提示是`undefined method 'call' for nil:NilClass (NoMethodError)`。回调的方式可以通过判断`block.nil?`来判断是否为空，但yield语法还不知道怎么判断传入函数块为空。

**疑问**：使用yield语法时参数列表是空的是怎么判断有没有函数块参数传入的？

**华点发现**：一个空格引起的问题，开`-w`选项会报warning，这本身是一种歧义。函数调用可以不加括号真的很拉风，不过需要注意优先级，一个好习惯是运算符两边总是应该加空格。可以看一下这份[ruby-style-guide](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhCN.md)。
```ruby
arr = []
arr.push 0
a = arr.last + 1 # 1
b = arr.last +1 # [0], equals to arr.last(+1), 
```

## 定义类

前面其实已经用了许多内置的类了，`Integer Float String Range Proc Symbol`等。

```ruby
irb(main):001:0> 4.class
=> Integer
irb(main):002:0> 4.class.superclass
=> Numeric
irb(main):003:0> 4.class.superclass.superclass
=> Object
irb(main):004:0> 4.class.superclass.superclass.superclass
=> BasicObject
irb(main):005:0> 4.class.superclass.superclass.superclass.superclass
=> nil
irb(main):006:0> 4.0.class
=> Float
irb(main):007:0> 4.0.class.superclass
=> Numeric
irb(main):010:0> 4.class.class
=> Class
irb(main):011:0> 4.class.class.superclass
=> Module
irb(main):012:0> 4.class.class.superclass.superclass
=> Object
irb(main):013:0> 4.class.class.superclass.superclass.superclass
=> BasicObject
```

自定义的类将派生自`Object`。所有的类的共同祖先都是`Object`然后是`BasicObject`。一个类同时也是一个模块，`Class`派生自`Module`，有点抽象！

上述的不为`nil`的表达式都表示一个`Class`对象，用来标识一个类。 

实现一个简易的树，支持外部定义访问方式：
```ruby
class Tree
    attr_accessor :children, :node_name # from Module
    def initialize(name, children=[])
        @children = children
        @node_name = name
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

t = Tree.new("Catholly", [Tree.new("Nephren", [Tree.new("Tiat")]), Tree.new("Lilia")])

puts("visiting a node")
t.visit {|node| puts node.node_name}

puts("visiting entire tree")
t.visit_all {|node| puts node.node_name}
```
如果用`yield`的话会不太好理解，并且很繁杂，因为多层函数调用中的`yield`时不会自动传递出来，需要手动接收了之后再`yield`出来。不然执行时就会报`no block for yield`。
```ruby
class Tree
    attr_accessor :children, :node_name # from Module
    def initialize(name, children=[])
        @children = children
        @node_name = name
    end

    def visit_all
        visit {|c| yield c}
        children.each {|c| c.visit_all {|c| yield c}}
    end

    def visit
        yield self
    end
end
```

`each`在没有函数块时会返回一个`Enumerator`，所以要手动`yield`每一个子节点。

类定义的惯例：
- 大写字母开头，驼峰命名。也就是大驼峰。
- 实例变量和方法以小写字母开头，采用下划线命名法。常量采用全大写形式。
- 用于测试逻辑的方法和函数一般要加上`?`。

规则：
- 实例变量在类中访问前面必须加`@`。类变量前面加`@@`。
- `attr`关键字用于定义实例变量和访问变量的同名方法。`attr_accessor`定义实例变量、
访问方法和设置方法。前者也可以定义设置方法，只是需要多传入一个`true`，`attr :children, true`
- `initialize`是构造函数。


## Mixin

面向对象的语言利用继承，可以将行为传播到相似对象上。想要继承并不相似的多种行为可以通过多继承实现(C++支持，java不支持)。

ruby中通过Mixin可以动态地给类添加方法：
```ruby
module ToFile
    def filename
        "objct_#{self.object_id}.txt"
    end

    def to_f
        File.open(filename, 'w') {|f| f.write(to_s)}
    end
end

class Person
    include ToFile
    attr_accessor :name, :age
    def initialize(name, age)
        @name = name
        @age = age
    end

    def to_s
        "#{name} #{age}"
    end
end

p = Person.new("Nehpren", 13)
p.to_f
```

首先定义了一个模块，通过`include`包含进来到`Person`类中，Person就拥有了`filename` `to_f`两个方法。

稍微扩展一下，就可以实现对象的文件保存与从文件读取：
```ruby
module FileName
    def filename
        "objct_#{self.object_id}.txt"
    end
end

module ToFile
    include FileName
    def to_f
        File.open(filename, 'w') {|f| f.write(to_s)}
    end
end

module FromFile
    include FileName
    def from_f
        File.open(filename, 'r') {|f| from_s(f.read)}
    end
end

class Person
    include ToFile
    include FromFile
    attr_accessor :name, :age
    def initialize(name, age)
        @name = name
        @age = age
    end

    def to_s
        "#{@name} #{@age}"
    end

    def from_s(s)
        a = s.split(' ')
        @name = a[0]
        @age = a[1].to_i
    end
end

p = Person.new("Nephren", 13)
p.to_f
p.from_f
puts p
```
这里读写的文件名依赖对象的`objct_id`，所以前后必须是同一个对象，可以进一步改写。

利用这种嵌入Mixin的方式，可以先编写类主体，然后嵌入其他功能。可以编写自己的通用嵌入方法，合理添加到已定义的类中。

ruby是动态类型、鸭子类型的，所以继承就被弱化了，通过嵌入就可以实现完全一样的功能。

## 模块、枚举和集合

Ruby中两个重要的Mixin：枚举（enumerable）和比较（comparable）。让类可枚举，就需要实现`each`方法，让类可比较，就需要实现`<=>`操作符。常见类比如字符串、整数等已经实现了这两个方法。

```ruby
irb(main):003:0> "begin" <  "end"
=> true
irb(main):004:0> "begin" <=> "end"
=> -1
irb(main):005:0> a = [4, 5, 1]
=> [4, 5, 1]
irb(main):006:0> a.sort
=> [1, 4, 5]
irb(main):007:0> a
=> [4, 5, 1]
irb(main):008:0> a.any? {|i| i > 0}
=> true
irb(main):009:0> a.select {|i| i % 2 == 0}
=> [4]
irb(main):010:0> a.max
=> 5
irb(main):011:0> a.member?(1)
=> true
```

常用类比如`String Array`已经实现了许多有用的方法。选择、排序、查找、包含、枚举、最大最小值等。

数组成员实现`<=>`之后才可以排序，很好理解。

## 阶段总结

- 代码块就是匿名函数。
- `yield`就是一个接受代码块的语法糖。
- 内建的各种结合类型提供了方便的操作。
- ruby是单继承，但Mixin嵌入，打开类定义，加入新方法可以使面向对象变得非常灵活。因为是鸭子类型，多继承能做的ruby都能做。

## 元编程

改变一门语言的本来面目和行为方式，你才算真正掌握了赋予编程无穷乐趣的魔法。这就是Ruby的**元编程**（metaprogramming）。

元编程，说白了就是**写能写程序的程序**。

## 开放类

你可以在任何时候改变任何类的定义，常见于给类添加行为。

比如：
```ruby
class NilClass
    def blank?
        true
    end
end
class String
    def blank?
        self.size == 0
    end
end
```
添加`blank?`方法就可以将`nil`和空字符串调用同一个方法来判空了。

有了随时重定义任何类或对象的自由，我们就能写出极为通俗易懂的代码。甚至可以随意修改内建的类的定义，需要谨慎处理，这甚至可能会让Ruby瘫痪。

## method_missing

Ruby找不到某个方法时，会调用一个特殊的调试方法显示诊断信息。该特性不仅让Ruby更易于调试，有时还能实现一些不易想到的有趣行为。

通过`method_missing`可以获取到未找到的方法的名称和参数。
```ruby
class Roman
    def self.method_missing name, *args # name is call method name, *args is arguments
        roman = name.to_s
        roman.gsub!("IV", "IIII")
        roman.gsub!("IX", "VIIII")
        roman.gsub!("XL", "XXXX")
        roman.gsub!("XC", "LXXXX")
        (roman.count('I') +
        roman.count('V') * 5 +
        roman.count('X') * 10 +
        roman.count('L') * 50 +
        roman.count('C') * 100)
    end
end

puts Roman.X
puts Roman.XC
puts Roman.XII
puts Roman.X
```

这样写调用任何Roman的方法都不会报错了，这样调试起来也会更难，需要谨慎使用。

## 模块

Ruby最流行的元编程方式还要属模块。仅在模块中写上寥寥数行代码，就可以实现def或attr_accessor关键字的功能。你还可以通过一些令人惊叹的方式扩展类定义，其中一种技术是设计自己的DSL（domain-specific language，领域特定语言），再用DSL定义自己的类。

比如写一个解析CSV文件的类：
```ruby
class ActAsCsv
    def read
        file = File.new(self.class.to_s.downcase + '.txt')
        @headers = file.gets.chomp.split(', ')

        file.each do |row|
            @result << row.chomp.split(', ')
        end
    end

    def headers
        @headers
    end
    def csv_contents
        @result
    end
    def initialize
        @result = []
        read
    end
end

class RubyCsv < ActAsCsv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
```

当然这里并没有解析完CSV文件的所有情况，比如一个值有空格需要用双引号包起来，其中有双引号还要用`""`转义。这里不处理这些细节。

上面的代码就是一个普通的实现，下面使用**宏(macro)**来实现同样的行为。
```ruby
class ActAsCsv
    def self.act_as_csv
        define_method "read" do
            file = File.new(self.class.to_s.downcase + '.txt')
            @headers = file.gets.chomp.split(', ')
            file.each do |row|
                @result << row.chomp.split(', ')
            end
        end
        define_method "headers" do
            @headers
        end
    
        define_method "csv_contents" do
            @result
        end
    
        define_method "initialize" do
            @result = []
            read
        end
    end
end

class RubyCsv < ActAsCsv
    act_as_csv
end
```

元编程发生在`act_as_csv`宏中，可以在子类实现中选择是否需要添加该功能。但其实这样看起来和通过继承实现也没有什么两样。

接下来在模块中，同样的行为如何实现：
```ruby
module ActAsCsv
    def self.included(base)
        base.extend ClassMethods
    end
end

module ClassMethods
    def act_as_csv
        include InstanceMethods
    end
end

module InstanceMethods
    attr_accessor :headers, :csv_contents
    def read
        @csv_contents = []
        file = File.new(self.class.to_s.downcase + '.txt')
        @headers = file.gets.chomp.split(', ')
        file.each do |row|
            @csv_contents << row.chomp.split(', ')
        end
    end
    def initialize
        read
    end
end

class RubyCsv # do not use inheritance
    include ActAsCsv
    act_as_csv
end
```

其实看起来就是把继承放在了模块里面，然后不需要继承只需要包含模块，调用模块中函数就能够做到添加函数。

只要一个模块被另一个模块包含，就会调用该模块的`included`方法。类也是模块，在`ActAsCsv`模块的`included`方法中扩展了名为`base`的目标类（即调用时的`RubyCsv`类）。通过模块`ClassMethods`为`RubyCsv`类添加了`act_as_csv`方法。在`act_as_csv`类方法中又打开了`RubyCsv`类，添加了模块`InstanceMethods`中定义的实例方法。

这样就有了一个会写程序的程序，说实话还是不是很能get到这个点的威力在什么地方，可能还需要一个更加有力的例子来说明问题。

所有这些元编程技术的有趣之处在于，程序可以根据它应用时的状态而改变。

元编程功能：
- 利用Ruby定义自己的语法。
- 动态地改变类。


练习，上述例子基础上可以根据每列的名称作为函数名作用于每行上：
```ruby
module ActAsCsv
    def self.included(base)
        base.extend ClassMethods
    end
end

module ClassMethods
    def act_as_csv
        include InstanceMethods
    end
end

module InstanceMethods
    attr_accessor :headers, :csv_contents
    def read
        @csv_contents = []
        file = File.new(self.class.to_s.downcase + '.txt')
        @headers = file.gets.chomp.split(', ')
        file.each do |row|
            @csv_contents << row.chomp.split(', ')
        end
    end
    def initialize
        read
    end
    def each
        csv_contents.each {|row| yield CsvRow.new(@headers, row)}
    end
end

class CsvRow
    attr_accessor :row
    def initialize(headers, row)
        @headers = headers
        @row = row
    end
    def method_missing(name, *args, &block)
        index = @headers.index(name.to_s)
        @row[index] if index # != nil # only nil and false is false to if, 0 is true
    end
end

class RubyCsv # do not use inheritance
    include ActAsCsv
    act_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one} # print all elements in column "one"
```

## Ruby总结

- 动态类型、强类型、解释执行。
- 提供了多种条件循环写法供选择。
- 鸭子类型，更方便地实现多态。
- 万物皆对象，看一下什么才是真正的面向对象啊！
- 完备的内建类型和常用数据结构支持。
- 函数块非常有趣，写法也非常有创造性。
- `yield`语法糖。
- 开放类结合Mixin太强大了。
- 元编程才算是精髓。
- 很多语法都没有介绍，比如for循环，Ruby中并不推荐使用for循环（指仅有的foreach循环），因为for循环能做到的事用一个`each`配合函数块就能做到，只是写法不一样，而且for循环好像还有副作用。

可继续探究：
- 补完语法细节。
- 内置类型、库API。
- 正则表达式。
- 多线程、并发。
- 网络编程、数据库。
- Ruby On Rails。

Ruby优劣势：
- 脚本语言，编码效率高，Web开发Ruby On Rails有史以来最成功的Web开发框架之一。
- 性能表现一般，但据说最新版本[Ruby3x3](https://blog.heroku.com/ruby-3-by-3)有极大性能改进。
- 过于自由，相比python这种你只有一种最佳实践的设计哲学，Ruby是你可以有多种完成一件事的方式，说不上谁好谁坏，对于geek来说这可以是优势，对于团队开发也能是劣势，见仁见智。

感受：
- 给我最大的惊喜主要有两点：
    - 函数块和万物皆对象的纯粹面向对象思想。
    - 开放类以及鸭子类型带来的灵活的多态。
- 元编程还不熟悉，感觉就是各种动态修改类的方式，需要更多实践才能更好体会。
- 用了一天多的时间，看来还是有点低估了。

深入资料阅读：
- [ruby-doc](https://ruby-doc.org/) 更多的语法细节与文档。
- [ruby-style-guide](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhCN.md) 一份编程风格指南。
- [Ruby教程 | 菜鸟教程](https://www.runoob.com/ruby/ruby-tutorial.html) 一份中文入门教程。
