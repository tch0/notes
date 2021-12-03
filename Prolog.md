<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Prolog语言](#prolog%E8%AF%AD%E8%A8%80)
  - [环境搭建](#%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA)
  - [基本要素](#%E5%9F%BA%E6%9C%AC%E8%A6%81%E7%B4%A0)
  - [填空](#%E5%A1%AB%E7%A9%BA)
  - [Unification](#unification)
  - [递归](#%E9%80%92%E5%BD%92)
  - [列表和元组](#%E5%88%97%E8%A1%A8%E5%92%8C%E5%85%83%E7%BB%84)
  - [列表和数学运算](#%E5%88%97%E8%A1%A8%E5%92%8C%E6%95%B0%E5%AD%A6%E8%BF%90%E7%AE%97)
  - [经典问题](#%E7%BB%8F%E5%85%B8%E9%97%AE%E9%A2%98)
  - [看一些常见问题](#%E7%9C%8B%E4%B8%80%E4%BA%9B%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)
    - [斐波那契数列](#%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B0%E5%88%97)
    - [阶乘](#%E9%98%B6%E4%B9%98)
    - [翻转列表](#%E7%BF%BB%E8%BD%AC%E5%88%97%E8%A1%A8)
    - [查找列表最大最小值](#%E6%9F%A5%E6%89%BE%E5%88%97%E8%A1%A8%E6%9C%80%E5%A4%A7%E6%9C%80%E5%B0%8F%E5%80%BC)
    - [列表排序](#%E5%88%97%E8%A1%A8%E6%8E%92%E5%BA%8F)
  - [数独问题](#%E6%95%B0%E7%8B%AC%E9%97%AE%E9%A2%98)
  - [八皇后问题](#%E5%85%AB%E7%9A%87%E5%90%8E%E9%97%AE%E9%A2%98)
  - [总结](#%E6%80%BB%E7%BB%93)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Prolog语言

Prolog（Programming in Logic的缩写）是一种逻辑编程语言。它创建在逻辑学的理论基础之上， 最初被运用于自然语言等研究领域。现在它已广泛的应用在人工智能的研究中，它可以用来建造专家系统、自然语言理解、智能知识库等。

Prolog语言的理论基础创建于爱丁堡大学的罗伯特·科瓦尔斯基对霍恩子句（Horn Clause）的程序性解释，最早由艾克斯-马赛大学的Alain Colmerauer与Phillipe Roussel等人于60年代末研究开发。1972年被公认为是Prolog语言正式诞生的年份，自1972年以后，分支出多种Prolog的方言。最主要的两种方言为爱丁堡和艾克斯-马赛。最早的Prolog解释器由Roussel建造，而第一个Prolog编译器则是David Warren编写的。

Prolog是声明式编程语言(decalarative language)，向Prolog提供一些事实（fact）和推论（inference），并让它为你推断一个问题。

基本构建单元：
- 事实：关于真实世界的基本断言。（$A = True$）
- 规则：关于真实世界的一些事实的推论。($A \to B$)
- 查询：查询一个真实世界的问题。($B = True?$)

分别对应于并同有头（无体、有体）和无头的霍恩子句，[霍恩子句](https://zh.wikipedia.org/wiki/%E9%9C%8D%E6%81%A9%E5%AD%90%E5%8F%A5)是Prolog的基础。

可以使用这门基于逻辑的语言表达和提出问题。需要改变思考方式，因为Prolog并不像通常用的命令式编程语言。

事实和规则被放入一个知识库（knowledge base），Prolog编译器的功能就是将这个知识库编译成适于高效查询的形式。Prolog更多地是作为一门领域特定语言（DSL），而不是通用的编程语言，应该趁早放弃用它去做一些通用的功能。可以用看待SQL的眼光来看待它。

声明式语言的魅力在于，只要把问题准确地描述出来（这就是所有要做的事情，而不像其他编程语言描述的是解决问题的方案和过程），那么就会得到答案，当然前提是问题可以被描述并且有答案。

阅读：
- [一个Prolog教程](https://zhzluke96.github.io/prolog-tut-cn/)
- [阮一峰的网络日志 - Prolog 语言入门教程](http://ruanyifeng.com/blog/2019/01/prolog.html)
- [GNU Prolog手册](http://gprolog.org/manual/gprolog.html)
- [一个Prolog教程整合](https://zhuanlan.zhihu.com/p/136762642)
- 书籍：The Craft of Prolog

## 环境搭建

Prolog有多种方言实现，这里使用GNU Prolog，并且介绍的部分都是不同方言的交集。

搜索GNU Prolog找到官网，下载二进制：
- 安装并添加环境变量，Windows下有自己的控制台`gprolog`，`gplc`是命令行编译器。
- Linux：`sudo apt install gprolog`，`gprolog/prolog`进入控制台，`gplc`编译。
- Linux中也可以选择安装SWI prolog：`sudo apt install swi-prolog`，命令`swipl`，差不太多。

VS Code选个合适的插件，能高亮就行，插件并不多，不要求太多。

文件后缀：`.pl .plo .prolog`

编译：
```shell
gplc file.pl
```

交互环境下编译：
```
| ?- ['filename.pl'].
| ?- [filename].
```
编译完就可以向它提问题了，对这个语言的运作方式就是你问我答，你给prolog编写了事实和推论，然后查询一个问题，它会回答你`yes no`。

传统艺能：
```prolog
hello :- write('Hello World!'), nl.
```
编译，执行：
```shell
gplc hello.pl
./hello
```
这时候就会进入交互执行环境下，再输入hello才会打印出来：
```
GNU Prolog 1.4.5 (64 bits)
Compiled Feb 23 2020, 20:14:50 with gcc
By Daniel Diaz
Copyright (C) 1999-2020 Daniel Diaz
| ?- hello.
Hello World!

yes
```

## 基本要素

- 原子（Atom）：一个类似于Ruby中Symbol的固定值，小写字母开头的符号就是原子，值不能改变。
- 变量：一个词以大写字母或者下划线开始则时变量，值可以改变。
- 范围注释：`/* */`
- 行注释：`% ...`
- `.`作为语句结尾。

例子：
```prolog
% facts
likes(a, b).
likes(c, b).
likes(d, e).

% rules / inferences
friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).
```
前面的是事实，后面的是推论的规则，含义就是喜欢同一个东西的人是朋友。交互环境中编译：
```prolog
| ?- ['hello.pl'].
```
然后就可以进行查询了：
```
| ?- likes(a, b).

yes
| ?- likes(c, b).

yes
| ?- likes(c, d).

no
| ?- likes(a, c).

no
| ?- friend(a, b).

no
| ?- friend(a, c).

yes
| ?- friend(a, a).

no
```
既可以查询已经定义的事实，也可以让Prolog帮你根据事实推论一个事件是否成立。`\+`表示取反，所以这里排除了自己和自己做朋友的情况。

推论中：
- `:-`左边的称为子目标（subgoal）。
- `:-`右边的就是这个子目标的规则，`,`分隔，所有规则为真这个子目标才为真。
- `\+`表示取反。

## 填空

Prolog的能力远不止让他帮你做选择题。可以使用逻辑引擎为一个查询寻找所有可能的匹配，就是是让它做填空题。为了做到这一点，需要在查询中指定变量。

例子：
```prolog
% food.pl
% facts
things_type(banana, fruit).
things_type(apple, fruit).
things_type(tomato, fruit).
things_type(beans, vegetable).
things_type(tomato, vegetable).
things_type(knife, kitchenware).
things_type(pot, kitchenware).
food_category(fruit).
food_category(vegetable).

% inferences
is_exact_food(X) :- food_category(Y), things_type(X, Y).
is_food(X) :- food_category(X).
is_food(X) :- is_exact_food(X).
```

编译，使用一个变量`What`来查询：
```
| ?- is_food(What).

What = fruit ? a

What = vegetable

What = banana

What = apple

What = tomato

What = beans

What = tomato

no
| ?- is_exact_food(What).

What = banana ? a

What = apple

What = tomato

What = beans

What = tomato

(1 ms) no
| ?- is_food(knife).

no
| ?- things_type(tomato, What).

What = fruit ? a

What = vegetable

yes
| ?- things_type(What, fruit). 

What = banana ? a

What = apple

What = tomato

no
```
感觉上来说做的事情就是一个遍历搜索。

做填空题会停一下：`Action (; for next solution, a for all solutions, RET to stop) ? `。

因为某些时候可能我们只需要其中一个解，某些时候需要所有解，有多种情况时Prolog提供了选项供选择。

为方便起见，如果在剩余部分中Prolog检测不到其他可选项，你将看到一个yes。如果Prolog在未经更多计算的情况下不能立刻断定是否还有更多选项，那么它将提示你查询下一个并返回no。

简单来说，Prolog就是一个帮助你进行推论的工具，这可能比自己写通用的程序简单，但同时也可能使你放弃寻找更优秀的算法而依赖于Prolog的能力，从而沦为单纯描述问题的工具人。

只能说编码一条规则和推论是简单的，难点可能是对问题的抽象、建模和准确描述。

## Unification

书中将其翻译为合一，我只能说看到这词鬼能想到是什么玩意？

合一的意思是找出那些使规则两侧匹配的值，合一在规则的两侧都能工作。

书中举了个简单的例子，但好像也没有说清楚什么是Unification。应该就是说`=`两侧的值要匹配。

## 递归

和命令式语言描述过程的递归不同，Prolog中递归就是声明的递归：

例子：建模JOJO中乔斯达家族的人物关系。
```prolog
% father(a, b) means a is father of b
father(georgeJoestar, jonathanJoestar).
father(jonathanJoestar, georgeJoestar_the_second).
father(georgeJoestar_the_second, josefJoestar).
father(josefJoestar, higashikataJosuke).
father(josefJoestar, holyJoestar).
father(kujoJotaro, kujoJolyne).
mother(erinaJoestar, georgeJoestar_the_second).
mother(lisaLisa, josefJoestar).
mother(susieQ, holyJoestar).
mother(holyJoestar, kujoJotaro).

% recursive inferences
ancestor(X, Y) :- father(X, Y).
ancestor(X, Y) :- mother(X, Y).
ancestor(X, Y) :- father(X, Z), ancestor(Z, Y).
ancestor(X, Y) :- mother(X, Z), ancestor(Z, Y).
```

很好理解的递归定义。

测试：
```
| ?- ancestor(lisaLisa, Who).

Who = josefJoestar ? a

Who = higashikataJosuke

Who = holyJoestar

Who = kujoJotaro

Who = kujoJolyne

(1 ms) no
| ?- ancestor(Who, kujoJotaro).

Who = holyJoestar ? a

Who = georgeJoestar

Who = jonathanJoestar

Who = georgeJoestar_the_second

Who = josefJoestar

Who = erinaJoestar

Who = lisaLisa

Who = susieQ

no
```
感觉结果就是深度优先搜索的结果。这个问题用树来建模一样很简单。

注意避免死递归，比如这种：
```prolog
couple(X, Y) :- couple(Y, X).
```

Prolog会优化尾递归，所以如果可以的话，将递归的子目标放到规则的末尾可以进行优化。

## 列表和元组

- 列表是变长容器：`[1, 2, 3]`指定列表。
- 元组和定长容器：`(1, 2, 3)`指定元组。
- 当`=`两侧都是元组或者列表时，要匹配就需要长度和每个元素都匹配。

```
| ?- (1, 2, 3) = (1, 2, 3).

yes
| ?- [1, 2, 3] = (1, 2, 3).

no
| ?- (A, B) = (1, 2, 3).

A = 1
B = (2,3)

yes
| ?- (A, B, C) = (1, 2, 3).

A = 1
B = 2
C = 3

yes
| ?- (A, B, C) = (1, 2).

no
| ?- (A, 2, C) = (1, B, 3).

A = 1
B = 2
C = 3

yes
| ?- () = ().
uncaught exception: error(syntax_error('user_input:2 (char:55) expression expected'),read_term/3)
| ?- [A, B] = [1, 2, 3].

no
| ?- [A, B, C] = [1, 2, 3].

A = 1
B = 2
C = 3

yes
| ?- [2, 2, 3] = [A, A, C].

A = 2
C = 3

yes
| ?- [1, 2, 3] = [A, A, C].

no
| ?- [] = [].

yes

```

列表和元组在某些匹配规则上是有区别的！
- 可以用`[Head|Tail]`匹配不为空的列表，其中`Head`匹配第一个元素，`Tail`匹配剩余的元素构成的列表，可以为空。元组则不行。
```
| ?- [1] = [Head | Tail].

Head = 1
Tail = []

yes
| ?- [1, 2, 3, 4] = [Head | Tail].

Head = 1
Tail = [2,3,4]

yes
| ?- [] = [Head | Tail].          

no
| ?- [a, b, c] = [A | [B | C]].

A = a
B = b
C = [c]

yes
```
- 在元组中也有类似语法。不过不需要`|`，大小不匹配时就是尝试用更短的元组最末尾的元素去匹配另一个元组的剩余末尾元素构成的元组。下面例子可以看出只有最后一个元素有这个规则。列表则不行。
```
| ?- (A, B, C) = (a, b, c, d).

A = a
B = b
C = (c,d)

yes
| ?- (A, B, (C, D)) = (a, b, c, d).

A = a
B = b
C = c
D = d

yes
| ?- (A, B, C, D) = ((a, b), c, d).

no
| ?- (A, B, C) = ((a, b), c, d).   

A = (a,b)
B = c
C = d

yes
| ?- (1, (2, 3), 4, 4) = (A, B, C).

A = 1
B = (2,3)
C = (4,4)

yes
| ?- ((1, 2), 3, 4) = (1, 2, 3, 4). 

no
```


- `_`是一个通配符，可以和任何对象匹配。含义就是我不关心这个位置上是什么。
```
| ?- [a, b, c, d, e] = [_, _ | [Head | _]].

Head = c

yes
```

- 以上就是Prolog的核心数据结构列表和元组和匹配（Unification，合一）的工作方式。

## 列表和数学运算

例子：计数、求和、求平均值。
```prolog
count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0, []).
sum(Sum, [Head|Tail]) :- sum(Total, Tail), Sum is Head + Total.

average(Average, List) :- count(Count, List), sum(Sum, List), Average is Sum / Count.
```
这样求平均值有个问题是，0的时候会除0报错。可以和计数、求和同样方法改为：
```prolog
average(0, []).
average(Average, [Head|Tail]) :- count(Count, [Head, Tail]), sum(Sum, [Head, Tail]), Average is Sum / Count.
```

都是利用递归实现的，求值时用`is`而不是`=`，如果用`=`，那么比如`[1, 2]`得到的长度会是`0+1+1`而并未求出值。


`append`规则：`append(List1, List2, List3)`如果List2**附加**到List1上与List3匹配，那么这个规则为真。
```
| ?- append([], [], []).

yes
| ?- append([1, 2], [3], [1, 2, 3]).

yes
| ?- append([1, 2], [2, 10], What).

What = [1,2,2,10]

yes
```

可以正向用其附加一个列表到另一个上，也可以已知附加的结果和其中一个得到另一个，也可以只给出附加结果，得到所有可能列表的组合。
```
| ?- append(List1, List2, [1, 2, 3, 4]).

List1 = []
List2 = [1,2,3,4] ? a

List1 = [1]
List2 = [2,3,4]

List1 = [1,2]
List2 = [3,4]

List1 = [1,2,3]
List2 = [4]

List1 = [1,2,3,4]
List2 = []

yes
| ?- append(List1, [4], [1, 2, 3, 4]).

List1 = [1,2,3]

yes
| ?- append([1, 2], What, [1, 2, 3, 4]).

What = [3,4]

yes
```
一个规则给了我们四种能力：判断列表附加是否正确、列表求差、列表附加、求一个列表可能的所有附加组合。**正向和反向都可以使用**，足可见其强大。

来尝试写一个类似的规则，叫做`concatenate`：
```prolog
% implement a inference concatenate(List1, List2, List3) just like append
concatenate([], List, List).
concatenate([Head | Tail1], List, [Head | Tail2]) :- concatenate(Tail1, List, Tail2).
```

简洁得令人难以置信，非常地优雅！在prolog中用递归还真有推公式的感觉，需要练习才能熟练。

测试：
```
| ?- concatenate([], [], []).

yes
| ?- concatenate([], [1], [1]).

yes
| ?- concatenate([1, 2], What, [1, 2, 3, 4, 5]).

What = [3,4,5]

yes
| ?- concatenat([1, 2], [4, 5], What).

What = [1,2,4,5]

yes
| ?- concatenate(List1, List2, [1, 2, 3, 4, 5]).

List1 = []
List2 = [1,2,3,4,5] ? a

List1 = [1]
List2 = [2,3,4,5]

List1 = [1,2]
List2 = [3,4,5]

List1 = [1,2,3]
List2 = [4,5]

List1 = [1,2,3,4]
List2 = [5]

List1 = [1,2,3,4,5]
List2 = []

no
```

能用递归解决的问题在Prolog中看来都很方便。

比如要求三个列表的组合都可以简单灵活地实现：可以看到规则中的值数量不同可以看做不同的规则，因为参数数量是精确匹配的。
```prolog
% base on concatenate(List1, List2, List3) above
% first implementation, good
concatenate([], List1, List2, List3) :- concatenate(List1, List2, List3).
concatenate([Head | Tail1], List1, List2, [Head | Tail2]) :- concatenate(Tail1, List1, List2, Tail2).

% second implementation, bad and wrong, dead recursion
concatenate2(List1, List2, List3, List4) :- concatenate(List1, List2, ListTemp), concatenate(ListTemp, List3, List4).
```

后者看起来并不是一个好的实现，分析一下递归树，后者的时间和空间复杂度可能达到了$O(2^N)$，在求四个值的列表的三个子数组的排列时栈溢出了。而前者有更好的表现，应该注意递归**尽量使用尾递归**，就算不能使用尾递归也要尽量保证只有一个递归式，不然复杂度很可能达到指数级，是程序可用性大大降低。而后者就像斐波那契数列的递归实现一样做了大量无用计算。
```prolog
| ?- concatenate2(List1, List2, List3, [1, 2, 3, 4]).

List1 = []
List2 = []
List3 = [1,2,3,4] ? a

List1 = []
List2 = [1]
List3 = [2,3,4]

List1 = []
List2 = [1,2]
List3 = [3,4]

List1 = []
List2 = [1,2,3]
List3 = [4]

List1 = []
List2 = [1,2,3,4]
List3 = []

List1 = [1]
List2 = []
List3 = [2,3,4]

List1 = [1]
List2 = [2]
List3 = [3,4]

List1 = [1]
List2 = [2,3]
List3 = [4]

List1 = [1]
List2 = [2,3,4]
List3 = []

List1 = [1,2]
List2 = []
List3 = [3,4]

List1 = [1,2]
List2 = [3]
List3 = [4]

List1 = [1,2]
List2 = [3,4]
List3 = []

List1 = [1,2,3]
List2 = []
List3 = [4]

List1 = [1,2,3]
List2 = [4]
List3 = []

List1 = [1,2,3,4]
List2 = []

Fatal Error: global stack overflow (size: 32768 Kb, reached: 32765 Kb, environment variable used: GLOBALSZ)
List3 = []
```

而前者尾递归再加复杂度不高（具体是prolog做的，用的DFS还是BFS呢？我也不知道！）数据很大时都不会挂。经过进一步分析后者应该是死递归了，看来递归真的不是随便就能写得健壮的！

感觉好像递归写得不好动不动栈溢出给你看啊！一定要注意，**终止条件时一定要仅仅只能够匹配终止的规则**，如果也还能匹配通用规则，那么终止条件虽然也能被搜索到，但通用规则成功匹配之后可能就会死递归。

比如规则`increaseList(Min, Max, [Min, Min + 1, ..., Max])`:
```prolog
increasingList(Min, Min, [Min]).
increasingList(Min, Max, [Min | List]) :- Min1 is Min + 1, increasingList(Min1, Max, List).
```
如果这样实现，终止条件时同时匹配就死递归了。比如`increaseList(1, 1, What)`匹配了前者，但同时也匹配了后者，匹配后者就向上累加死递归了，应该更改成：
```prolog
% create List with increasing numbers [Min, Min + 1, ..., Max]
increasingList(Min, Min, [Min]).
increasingList(Min, Max, [Min | List]) :- Min1 is Min + 1, Min < Max, increasingList(Min1, Max, List).
```
测试：
```prolog
What = [0,1] ? a

(1 ms) no
| ?-  increasingList(0, 100, What).

What = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100] ? a

(1 ms) no
```

回去测试`concatenate`：
```prolog
% test of concatenate
concatenateList(List1, List2, List3, Min, Max) :- increasingList(Min, Max, List4), concatenate(List1, List2, List3, List4).
```
执行并输出所有结果：
```prolog
| ?- concatenateList(List1, List2, List3, 1, 100).

...

List1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]
List2 = []
List3 = []

(387 ms) no
```
可以看出程序写得高效Prolog还是非常强大的。这个结果组合的数量应该是$101*101 = 5050$。根据以往控制台输出的经验，大批量IO的效率并不高，大部分时间可能是花在了IO上。不知道有没有方法只计算不输出？

如何避免死递归：递归因为没有用条件判断走一个分支就返回确保不能走另一个分支，所以**所有的情况应该互斥**，添加新的递归规则时把已有的递归进入条件叠加起来取反加到规则右侧就行。

## 经典问题

鸡兔同笼问题：经典解方程问题，可太适合Prolog了。TODO。

地图着色问题：典型应用，TODO。


## 看一些常见问题

鉴于Prolog的推理属性，来实现一些常见数（搜）学（索）题巩固一下：

### 斐波那契数列

最直白的递归版本；
```prolog
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Res) :- N > 1, fibonacci(N-1, A), fibonacci(N-2, B), Res is A + B.
```
但你会发现这样除了0和1都不会工作，因为`N-1 N-2`没有放在谓词`is`中所有不会进行计算。比如计算`fibonacci(2, What)`是，找`fibonacci(2-1, A) fibonacci(2-2, B)`找不到，因为`2-1 2-2`都没有计算出来。啊这！

修改之后：
```prolog
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Res) :- N > 1, N1 is N-1, N2 is N-2, fibonacci(N1, A), fibonacci(N2, B), Res is A + B.
```
我们都知道这样递归是很低效的，改进：
```prolog
fib2(0, 0).
fib2(1, 1).
fib2(N, Res) :- N > 1, fibonacci2(N, [Res | _]).
fibonacci2(0, [0]).
fibonacci2(1, [1, 0]).
fibonacci2(N, [Res | Tail]) :- N > 1, N1 is N-1, fibonacci2(N1, Tail), Tail = [A | [B | _]], Res is A + B.
```
`fibonacci2`得到整个数列，除`N>1`外更改任何一个规则的顺序都不能得到结果。在过程中，我尝试过的错误解决方案：
```prolog
fibonacci2(0, [0]).
fibonacci2(1, [1, 0]).
fibonacci2(N, [Res | Tail]) :- N > 1, N1 is N-1, Tail = [A | [B | _]], Res is A + B, fibonacci2(N1, Tail).
```
这样做是无法得到结果的，错误：`uncaught exception: error(instantiation_error,(is)/2)`。分析了原因应该是，以`fibonacci2(2)`为例，此时`Res Tail A B`未知，`Res`依赖`A B`，`A B`依赖`Tail`，`Tail`依赖已知的`N1`，环环相扣。就是说只要有了`Tail`就能推导出结果。但是此时`Tail`的推导放到了最后，但它是被依赖的源头，应该放到一开始，并且是N1需要已知。也没人讲，毕竟没有系统学习，看来还是要踩过坑才能明白。

递归编写总结：**编写递归时根据依赖关系排列规则，不要用让要推导的变量依赖未知的变量**。

这里编写的规则都只能正推，不能已知数列反推是第几项。要如何才能反推呢？只能说太麻烦了，普通编程语言中查个表就完事了。


### 阶乘

```prolog
% factorial
factorial(0, 1).
factorial(N, Res) :- N > 0, N1 is N-1, factorial(N1, Tmp), Res is N * Tmp.
```

### 翻转列表

```prolog
% reverse a list
reverseList([], []).
reverseList([Head | Tail], ReversedList) :- reverseList(Tail, ReversedTail), append(ReversedTail, [Head], ReversedList).
```

### 查找列表最大最小值

```prolog
% util : get min value of two values
min(Val1, Val2, Min) :- Val1 > Val2, Min is Val2.
min(Val1, Val2, Min) :- \+(Val1 > Val2), Min is Val1.

max(Val1, Val2, Max) :- Val1 < Val2, Max is Val2.
max(Val1, Val2, Max) :- \+(Val1 < Val2), Max is Val1.

% find min of list
minElement([Head | []], Min) :- Min is Head.
minElement([Head | Tail], Min) :- \+Tail = [], minElement(Tail, MinOfTail), min(Head, MinOfTail, Min).

% find max of list
maxElement([Head | []], Max) :- Max is Head.
maxElement([Head | Tail], Max) :- \+Tail = [], maxElement(Tail, MaxOfTail), max(Head, MaxOfTail, Max).
```

好像有内置的`min`和`max`。

### 列表排序

```prolog
q:- L=[33,18,2,77,18,66,9,25], (sortcsj(L,P), write(P), nl). 

sortcsj(L,S) :-  permutation(L,S), ordered(S).  /* L為原list, S為排序好的list, 此為permutation關係(built-in) */

ordered([]).      /* 表empty list視為排序好的list */
ordered([_|[]]).  /* 只有一元素之list視為排序好的list */
ordered([A|[B|T]]) :- A =< B, ordered([B|T]). /* 此规则約束所謂的排序好是指前項元素小於或等於後一項元素 */

:- initialization(q).
```

维基百科上给出的，排序还是那些套路，归并、快排、选择之流，不写了就。


## 数独问题

首先决定查询的形式：`sudoku(Puzzle, Solution)`，用一个列表表示难题，下划线表示未知数字，如果存在解决方法则提供，不存在当然得到no。

比如4x4数独为例：
```prolog
sudoku([_, _, 2, 3,
        _, _, _, _,
        _, _, _, _,
        3, 4, _, _],
        Solution).
```

我们要做的事情就是准确描述规则，而不必考虑求解的算法。
```prolog
valid([]).
valid([Head | Tail]) :- % Head will be list
        fd_all_different(Head), % built-in predicate indicate all elements in a list are different from each other.
        valid(Tail).


sudoku(Puzzle, Solution) :- 
        % rule1: 16 units, range of numbers: 1-4
        Solution = Puzzle,
        Puzzle = [S11, S12, S13, S14,
                  S21, S22, S23, S24,
                  S31, S32, S33, S34,
                  S41, S42, S43, S44],
        fd_domain(Puzzle, 1, 4),        % built-in predicate fd_domain(List, LowerBound, UpperBound)

        % rule2: all rows, columns and squares are valid
        Row1 = [S11, S12, S13, S14],
        Row2 = [S21, S22, S23, S24],
        Row3 = [S31, S32, S33, S34],
        Row4 = [S41, S42, S43, S44],
        
        Col1 = [S11, S21, S31, S41],
        Col2 = [S12, S22, S32, S42],
        Col3 = [S13, S23, S33, S43],
        Col4 = [S14, S24, S34, S44],
        
        Square1 = [S11, S12, S21, S22],
        Square2 = [S13, S14, S23, S24],
        Square3 = [S31, S32, S41, S42],
        Square4 = [S33, S34, S43, S44],

        valid([Row1, Row2, Row3, Row4,
               Col1, Col2, Col3, Col4,
               Square1, Square2, Square3, Square4]).
```

Prolog比较擅长解决这种易于表达但难于解决的约束问题。

## 八皇后问题

8x8的格子里面有八个皇后（国际象棋），编号1~8，皇后之间不能位于同一行，同一列，同一条对角线（两个方向），求出所有八个皇后的放置方式（横纵坐标1到8表示）。源于国际象棋的问题：在棋盘上方八个皇后，使其中任何一个都无法吃掉其他。

```prolog
% eight queens problem
% queens' number from 1 to 8
% coordinate is (x, y)
/*
board
    1 2 3 4 5 6 7 8 rows
1   *
2   
3
4
5
6
7
8
columns
*/

% every queen is valid
valid_queen((Row, Col)) :-
        Range = [1, 2, 3, 4, 5, 6, 7, 8],
        member(Row, Range), member(Col, Range).

% every queens in the board is valid
valid_board([]).
valid_board([Head | Tail]) :- valid_queen(Head), valid_board(Tail).

% get the list of the row of every queen
rows([], []).
rows([(Row, _) | QueensTail], [Row | RowsTail]) :- rows(QueensTail, RowsTail).
% get the list of the column of every queen
cols([], []).
cols([(_, Col) | QueensTail], [Col | ColsTail]) :- cols(QueensTail, ColsTail).
% get diagonals value from left-top to right-bottom, represent with x - y
diags1([], []).
diags1([(Row, Col) | QueensTail], [Diagonal | DiagonalsTail]) :-
        Diagonal is Col - Row,
        diags1(QueensTail, DiagonalsTail).
% get diagonals value from left-bottom to right-top, represent with x+y
diags2([], []).
diags2([(Row, Col) | QueensTail], [Diagonal | DiagonalsTail]) :-
        Diagonal is Col + Row,
        diags2(QueensTail, DiagonalsTail).

% eight queens
eight_queens(Board) :- 
        length(Board, 8),
        valid_board(Board),

        rows(Board, Rows),
        cols(Board, Cols),
        diags1(Board, Diags1),
        diags2(Board, Diags2),

        % rules
        fd_all_different(Rows),
        fd_all_different(Cols),
        fd_all_different(Diags1),
        fd_all_different(Diags2).

% query:
% eight_queens([(1, A), (2, B), (3, C), (4, D), (5, E), (6, F), (7, G), (8, H)]).
```

八皇后问题如果将皇后视作等同的话，最终有92种解法。本地测试上面的程序求解大概在25秒左右。

8皇后因为一定是每个都在不同行，所以可以固定行，简化大量计算：
```prolog
% eight queens problem
% queens' number from 1 to 8
% coordinate is (x, y)

% every queen is valid
valid_queen((_, Col)) :- Range = [1, 2, 3, 4, 5, 6, 7, 8], member(Col, Range).

% every queens in the board is valid
valid_board([]).
valid_board([Head | Tail]) :- valid_queen(Head), valid_board(Tail).

% get the list of the column of every queen
cols([], []).
cols([(_, Col) | QueensTail], [Col | ColsTail]) :- cols(QueensTail, ColsTail).
% get diagonals value from left-top to right-bottom, represent with x + y
diags1([], []).
diags1([(Row, Col) | QueensTail], [Diagonal | DiagonalsTail]) :-
        Diagonal is Col + Row,
        diags1(QueensTail, DiagonalsTail).
% get diagonals value from left-bottom to right-top, represent with x+y
diags2([], []).
diags2([(Row, Col) | QueensTail], [Diagonal | DiagonalsTail]) :-
        Diagonal is Col + Row,
        diags2(QueensTail, DiagonalsTail).

% eight queens
eight_queens(Board) :- 
        Board = [(1, _), (2, _), (3, _), (4, _), (5, _), (6, _), (7, _), (8, _)],
        valid_board(Board),

        cols(Board, Cols),
        diags1(Board, Diags1),
        diags2(Board, Diags2),

        % rules
        fd_all_different(Cols),
        fd_all_different(Diags1),
        fd_all_different(Diags2).

% query:
% eight_queens([(1, A), (2, B), (3, C), (4, D), (5, E), (6, F), (7, G), (8, H)]).
```
优化到了20秒以内。只能说搜索的能力确实强大。

## 总结

- 语法细节都还不甚了解，暂时不准备深入。
- DSL，适用场景有限。
- 声明式语言，通过深度优先的决策树求解问题，只需要描述问题，不需要描述解决方案。
- 递归很核心很有用，写好需要一些技巧。
- 对于某些约束问题很方便，作为通用语言已经几乎没有意义。

可以深入的点：
- 更多语法、库、内建的规则、方法。
- 阅读第三方的经典实践，阅读应用于现实的代码。

TODO：
- 对文中的笑话建模，建模为一个简单的边带权重的有向图，找最短路径，设定有多条最短路径时的解决方式。
