<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [BNF与递归下降](#bnf%E4%B8%8E%E9%80%92%E5%BD%92%E4%B8%8B%E9%99%8D)
  - [BNF](#bnf)
  - [递归下降](#%E9%80%92%E5%BD%92%E4%B8%8B%E9%99%8D)
  - [左递归](#%E5%B7%A6%E9%80%92%E5%BD%92)
  - [消除左递归](#%E6%B6%88%E9%99%A4%E5%B7%A6%E9%80%92%E5%BD%92)
    - [消除直接左递归](#%E6%B6%88%E9%99%A4%E7%9B%B4%E6%8E%A5%E5%B7%A6%E9%80%92%E5%BD%92)
    - [消除间接左递归](#%E6%B6%88%E9%99%A4%E9%97%B4%E6%8E%A5%E5%B7%A6%E9%80%92%E5%BD%92)
    - [陷阱](#%E9%99%B7%E9%98%B1)
  - [四则运算器实例](#%E5%9B%9B%E5%88%99%E8%BF%90%E7%AE%97%E5%99%A8%E5%AE%9E%E4%BE%8B)
  - [EBNF](#ebnf)
    - [符号与约定](#%E7%AC%A6%E5%8F%B7%E4%B8%8E%E7%BA%A6%E5%AE%9A)
    - [示例](#%E7%A4%BA%E4%BE%8B)
    - [表示重复](#%E8%A1%A8%E7%A4%BA%E9%87%8D%E5%A4%8D)
  - [ABNF](#abnf)
    - [规则](#%E8%A7%84%E5%88%99)
    - [最终值](#%E6%9C%80%E7%BB%88%E5%80%BC)
    - [操作符](#%E6%93%8D%E4%BD%9C%E7%AC%A6)
    - [核心规则](#%E6%A0%B8%E5%BF%83%E8%A7%84%E5%88%99)
  - [TODO](#todo)
  - [参考](#%E5%8F%82%E8%80%83)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# BNF与递归下降

## BNF

巴科斯范式（Backus Normal Form，缩写为 BNF），又称为巴科斯-诺尔范式（Backus-Naur Form），是一种用于表示[上下文无关文法](https://zh.wikipedia.org/wiki/%E4%B8%8A%E4%B8%8B%E6%96%87%E6%97%A0%E5%85%B3%E6%96%87%E6%B3%95)的语言，上下文无关文法描述了一类形式语言。

广泛地使用于程序设计语言、指令集、通信协议的语法表示中。大多数程序设计语言或者形式语义方面的教科书都采用巴科斯范式。在各种文献中还存在巴科斯范式的一些变体，如[扩展巴科斯范式 EBNF](https://zh.wikipedia.org/wiki/%E6%89%A9%E5%B1%95%E5%B7%B4%E7%A7%91%E6%96%AF%E8%8C%83%E5%BC%8F) 或[扩充巴科斯范式 ABNF](https://zh.wikipedia.org/wiki/%E6%89%A9%E5%85%85%E5%B7%B4%E7%A7%91%E6%96%AF%E8%8C%83%E5%BC%8F)。


BNF文法是一种用递归的思想来表述计算机语言符号集的定义规则。

法则：
- `::=`表示定义。
- `""`双引号中内容表示字符。
- `<>`尖括号中表示必选内容。
- `|`两边是可选内容（多个选其一）。

其中用`<>`括起来的（出现在`::=`左边的）叫做**非终结符**，它们能用`::=`右边的式子替代，没有出现在`::=`就叫做**终结符**。一般终结符对应词法分析器输出的标记。

四则运算的BNF实例：
```BNF
<expr> ::= <expr> + <term>
        | <expr> - <term>
        | <term>

<term> ::= <term> * <factor>
        | <term> / <factor>
        | <factor>

<factor> ::= ( <expr> )
        | Number
```

当然这里的Number是已经被词法分析处理好的token。其中`+-*/()`都是符号，并没有严格加`""`，明白意思就行。

上述BNF文法中已经暗含了运算的优先级`()` > `*/` > `+-`

## 递归下降

当有了BNF就可以直接将其解释为[递归下降](https://zh.wikipedia.org/wiki/%E9%80%92%E5%BD%92%E4%B8%8B%E9%99%8D%E8%A7%A3%E6%9E%90%E5%99%A8)的代码，每一个非终结符用一个函数来解析，通过相互的递归调用完成最终解析，自顶向下直到每一个非终结符。

实现上来说比较简单，是实现语法分析的常用算法。

## 左递归

若一个非终结符号（non-terminal）r 有任何直接的文法规则或者透过多个文法规则，推导出的句型（sentential form）其中最左边的符号 又会出现r，则我们说这个非终结符号r是左递归的。

上面的例子中`<expr>`部分存在[左递归](https://zh.wikipedia.org/wiki/%E5%B7%A6%E9%81%9E%E6%AD%B8)，左递归的BNF文法无法直接使用递归下降来实现。因为最左端的递归式的解析过程又是以解析自己为开始的，从而导致无限递归。

也就是左递归每一步的调用都没有实质进展，而右递归就不一样，右递归中要解析完了前面的式子才会递归调用自己，每一步调用都会有实质进展，经过有限次调用一定能够解析完成。

**直接左递归**就是有直接的文法能够推导出在最左边出现的句型。
```BNF
<A> ::= <A> <B> | <C>
```
**间接左递归**是透过多个文法规则推导出在最左边出现自己的句型。
```BNF
<A> ::= <B> <C> | <C>
<B> ::= <A> <D> | <E>
```
沿着`<A> -> <B> <C> -> <A> <D> <C>` 这条路径推导就会出现左递归。


## 消除左递归

左递归的[维基百科](https://zh.wikipedia.org/wiki/%E5%B7%A6%E9%81%9E%E6%AD%B8)介绍了消除左递归的方法。这里直接搬运过来：

### 消除直接左递归

一个一般化的移除左递归的算法描述如下。

对于每一个如下规则（用BNF描述）：
```BNF
<A> ::= <A> B1 | <A> B2 | ... | <A> Bn | C1 | ... | Cn
```
其中`B1~Bn`是任意终结符与非终结符的序列，并且不为空字符串`<empty>`。`C1~Cn`是任意不与A开头的终结符与非终结符的序列。

**消除左递归后**可将`A`改为如下规则：
```BNF
<A> ::= C1 <A_tail> | C2 <A_tail> | ... | Cn <A_tail>
<A_tail> ::= <empty> | B1 <A_tail> | B2 <A_tail> | ... | Bn <A_tail>
```
其中新创建出来的非终结符`<A_tail>`被称为尾巴（tail）或者剩余（rest）。

例：考虑如下规则
```BNF
<expr> ::= <expr> + <expr> | <int> | <string>
```
可以改成：
```BNF
<expr> ::= <int> <expr_rest> | <string> <expr_rest>
<expr_rest> ::= <empty> | + <expr> <expr_rest>
```
可以进一步简写`<expr_rest>`为：
```BNF
<expr_rest> ::= <empty> | + <expr>
```

理解：
- `A`左递归到头一定是以`C1~Cn`作为开始。
- `C1~Cn`后面可以为空，也可以是`B1~Bn`和`<A_tail>`构成的序列。
- 将左递归转化为了右递归。

### 消除间接左递归

如果文法内不存在空字符串的生成（不存在`<A> ::= ...| <empty> | ...`这样的规则），而且不是循环的文法（不存在`<A> -> ... -> ... -> <A>`这样形式的规则），就可以用以下算法简化间接左递归：

- 从`i = 1`到`n`
    - 从`j = 1`到`i-1`
        - 设`<Aj>`的生成规则为 `<Aj> ::= B1 | ... | Bn`
        - 将所有规则`<Ai> ::= <Aj> C`换成`<Ai> ::= B1C | ... | BnC`以移除`<Ai>`规则中的左递归

其实就是从上往下，将间接左递归依次替换为直接左递归。

例：
```BNF
<A> ::= <B> C | D
<B> ::= <A> E | F
```
第一步：
```BNF
<A> ::= <A> E C | F C | D
<B> ::= <A> E | F
```
第二步：
```BNF
<A> ::= F C <A_tail> | D <A_tail>
<A_tail> ::= <empty> | E C <A_tail>
<B> ::= <A> E | F 
```

### 陷阱

上面的转换使用右递归的文法来避免掉左递归的出现；但是这样会改变规则的结合律。左递归会创造出向左的结合律；但是右递归则会创造出向右的结合律。

比如说一个这样的文法（也就是一个整数乘法、加法、括号混合的表达式）：
```
<expr> ::= <expr> + <term> | <term>
<term> ::= <term> * <factor> | <factor>
<factor> ::= ( <expr> ) | Int
```
去掉左递归后：
```
<expr> ::= <term> | <expr_tail>
<expr_tail> ::= <empty> | + <term> <expr_tail>
<term> ::= <factor> | <term_tail>
<term_tail> ::= <empty> | * <factor> <term_tail>
<factor> ::= ( <expr> ) | Int
```

处理一个`a+a+a`的式子为例，使用左递归文法会得到这样的分析树（parse tree）：
```
                            expr
                         /   |   \
                       expr  +   term
                     /  |  \        \
                 expr   +   term      factor
                  |          |         |
                 term        factor    Int
                  |          |
                factor       Int
                  |
                 Int  
```
这样的规则代表`(a+a)+a`，也就是左结合。

而采用右递归文法会得到这样的分析树：
```
                      expr
                   /        \
                 term       expr
                  |       /  |    \ 
                factor   +  term   expr_tail
                  |          |      |  \     \
                 Int       factor   +  term   expr_tail
                             |           |        |
                            Int        factor   <empty>
                                         |
                                        Int
```
这样的规则代表`a+(a+a)`，也就是右结合。

对加法这样的左结合与右结合结果相同的运算来说当然不会有影响，但是对于减法或者其他严格要求了左结合的运算来说结果就完全不对了。

几种解决这个问题的方法：
- 将规则重新改为左递归，使用能解析左递归的算法来编写程序，比如[LALR语法分析器](https://zh.wikipedia.org/wiki/LALR%E8%AF%AD%E6%B3%95%E5%88%86%E6%9E%90%E5%99%A8)。
- 使用更多的非终端符号来改写规则，以强迫文法合乎正确的结合。例子？
-  如果使用YACC 或者Bison，他们有所谓算符声明(operator declarations)， %left, %right and %nonassoc，这一些算符可以告诉语法分析器产生程式(parser generator)应该遵从哪一种结合。

其实应该是可以通过递归下降时的调用顺序来控制的，见下面的四则运算实例中减号运算符的实现。

## 四则运算器实例

消除左递归后的四则运算的BNF：
```BNF
<expr> ::= <term> <expr_tail>
<expr_tail> ::= + <term> <expr_tail>
              | - <term> <expr_tail>
              | <empty>

<term> ::= <factor> <term_tail>
<term_tail> ::= * <factor> <term_tail>
              | / <factor> <term_tail>
              | <empty>

<factor> ::= ( <expr> )
           | Number
```

在此之前为了先实现一个简单的词法分析单独解析整数，其他的token用字符表示。

```C++
enum {Number = 128};
int token = 0;
int token_val = 0;
char* src = NULL;

void next()
{
    while (*src == ' ' || *src == '\t')
    {
        src++;
    }
    token = *src++;
    if (token >= '0' && token <= '9')
    {
        token_val = token - '0';
        token = Number;
        while (*src >= '0' && *src <= '9')
        {
            token_val = token_val * 10 + *src - '0';
            src++;
        }
    }
    return;
}

void match(int tk)
{
    if (token != tk)
    {
        printf("expected token: %d(%c), got: %d(%c)\n", tk, tk, token, token);
        exit(-1);
    }
    next();
}
```
然后按照BNF实现递归下降即可：
```C++
int expr();
int factor()
{
    int value = 0;
    if (token == '(')
    {
        match('(');
        value = expr();
        match(')');
    }
    else
    {
        value = token_val;
        match(Number);
    }
    return value;
}

int term_tail(int lvalue)
{
    if (token == '*')
    {
        match('*');
        int value = lvalue * factor();
        return term_tail(value);
    }
    else if (token == '/')
    {
        match('/');
        int value = lvalue / factor();
        return term_tail(value);
    }
    else
    {
        return lvalue;
    }
}

int term()
{
    int value = factor();
    return term_tail(value);
}

int expr_tail(int lvalue)
{
    if (token == '+')
    {
        match('+');
        int value = lvalue + term();
        return expr_tail(value);
    }
    else if (token == '-')
    {
        match('-');
        int value = lvalue - term();
        return expr_tail(value);
    }
    else
    {
        return lvalue;
    }
}

int expr()
{
    int value = term();
    return expr_tail(value);
}
```
主函数与测试：
```C++
void test(char* str, int result)
{
    static count = 0;
    src = str;
    next();
    int actual = expr();
    printf("test %d %s, input: %s, expected result: %d, actual result : %d\n",
        count++, (actual == result) ? "passed" : "failed", str, result, actual);
}
int main()
{
    // test
    test("1+1", 2);
    test("1+2*3-4+5", 8);
    test("1-1-1", -1);
    test("(100+1)", 101);
    test("(10-5)/2*(8/4) + 6", 10);
    test("(2*(10+((10-5)/2*(8/4) + 6)))", 40);
}
```

这里实现中是不存在右结合问题的。

就四则运算来说，用运算符优先级加栈的方式实现会更加简单。

## EBNF

扩展巴科斯-瑙尔范式（EBNF, Extended Backus–Naur Form）是表达作为描述计算机编程语言和形式语言的正规方式的上下文无关文法的元语法(metalanguage)符号表示法。它是基本巴科斯范式(BNF)元语法符号表示法的一种扩展。

它最初由尼克劳斯·维尔特开发，最常用的 [EBNF](https://zh.wikipedia.org/wiki/%E6%89%A9%E5%B1%95%E5%B7%B4%E7%A7%91%E6%96%AF%E8%8C%83%E5%BC%8F) 变体由标准 ISO-14977 所定义。

### 符号与约定

符号表：
|用途|符号表示|解释|
|:-:|:-:|:-:|
|定义|`=`||
|串接|`,`|连接多个序列|
|终止|`;`|一个定义的结束|
|分隔|`\|`|表选择|
|可选|`[ ... ]`|出现0或1次|
|重复|`{ ... }`|出现0或任意次|
|分组|`( ... )`|表示优先级，防止歧义，`a | (b, c | d)`|
|双引号|`" ... "`|字符串，和`''`一样，要表示`"`字符就使用`'"'`|
|单引号|`' ... '`|字符串，和`""`一样，要表示`'`字符就使用`"'"`|
|注释|`(* ... *)`||
|特殊序列|`? ... ?`|特殊序列不由EBNF来解释|
|除外|`-`|除外某些情况，用来表示一个新集合|
|重复|`*`|放在一个单元前，`n * a`，将a重复n次|

1. 约定：
    - 扩展 BNF 每个元标识符都被写为用连字号连接起来的一个或多个字；
    - 结束于“-symbol” 的元标识符是扩展 BNF 的终结符的名字。
2. EBNF 的每个操作符的正常字符和它所蕴涵的优先级(顶部为最高优先级)为：
    ```EBNF
    * repetition-symbol
    - except-symbol
    , concatenate-symbol
    | definition-separator-symbol
    = defining-symbol
    ; terminator-symbol
    ```
    - 其他可能还不容易混淆，但需要特别注意串联优先级是高于选择的。如果要先选择后串联则需要使用分组，如`(a | b) , c`。
    - 不用空格做串联，所以一个非终结符中可以包含空格。

3. 下列括号对超越操作符的优先级：
    ```EBNF
    '  first-quote-symbol            first-quote-symbol  ' (* 终结符 *)
    "  second-quote-symbol          second-quote-symbol  " (* 终结符 *)
    (* start-comment-symbol          end-comment-symbol *) (* 注释 *)
    (  start-group-symbol              end-group-symbol  ) (* 分组 *)
    [  start-option-symbol            end-option-symbol  ] (* 可选 *)
    {  start-repeat-symbol            end-repeat-symbol  } (* 重复 *)
    ?  special-sequence-symbol   special-sequence-symbol ? (* 特殊序列 *)
    ```

EBNF中可以有多个序列串接起来，`|`只在其所在的序列起作用。EBNF描述能力比BNF更强：
- 终结符被严格的包围在引号 (`"..."` 或 `'...'`) 中。给非终结符的尖括号 (`"<...>"`)可以省略。
- 通常使用终止字符分号结束一个规则。
- 提供了定义重复次数，排除法选择(比如除了引号的所有字符)和注释等的增强机制。
- EBNF 在能定义的语言的意义上不比 BNF 更强大。在原理上用 EBNF 定义的任何文法都可以用 BNF 表达。

顺便一提，在markdown中BNF和EBNF都可以得到高亮支持。

EBNF可能还有一些扩展，此处不详述，遇到再说。

### 示例

四则运算示例：
```EBNF
expr = ([expr "+"] | [expr "-"]), term;
term = ([term "*"] | [term "/"]), factor;
factor = "(", expr, ")" | number;
```

消除左递归（在EBNF中，可以不使用空串，因为空串可以用`[]`可选的含义来代替），另外进一步描述number：
```EBNF
expr = term expr_tail;
expr_tail = [("+" | "-"), term];
term = factor term_tail;
term_tail = [("*" | "-"), factor];
factor = "(", expr, ")" | number;
number = "0" | ["-"], digit - "0", {digit};
digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
```

维基上的一个只允许赋值的简单编程语言例子：
```EBNF
 (* a simple program in EBNF − Wikipedia *)
 program = 'PROGRAM' , white space , identifier , white space ,
            'BEGIN' , white space ,
            { assignment , ";" , white space } ,
            'END.' ;
 identifier = alphabetic character , [ { alphabetic character | digit } ] ;
 number = [ "-" ] , digit , [ { digit } ] ;
 string = '"' , { all characters − '"' } , '"' ;
 assignment = identifier , ":=" , ( number | identifier | string ) ;
 alphabetic character = "A" | "B" | "C" | "D" | "E" | "F" | "G"
                      | "H" | "I" | "J" | "K" | "L" | "M" | "N"
                      | "O" | "P" | "Q" | "R" | "S" | "T" | "U"
                      | "V" | "W" | "X" | "Y" | "Z" ;
 digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
 white space = ? white space characters ? ;
 all characters = ? all visible characters ? ;
```
一个语法上正确的程序：
```
PROGRAM DEMO1 
BEGIN
  A0:=3;
  B:=45;
  H:=-100023;
  C:=A;
  D123:=B34A;
  BABOON:=GIRAFFE;
  TEXT:="Hello world!";
END.
```

对于 `?...?`特殊序列的解释超出了 EBNF 标准的范围，这些内容应该由写EBNF的人进行解释。

### 表示重复

```EBNF
aa = "A"; 
bb = 3 * aa, "B"; (*aa重复3次*)
cc = 3 * [aa], "C"; (*aa重复0~3次*)
dd = {aa}, "D"; (*aa重复0次或任意次*)
ee = aa, {aa}, "E"; (*aa重复至少1次*)
ff = 3 * aa, 3 * [aa], "F"; (*aa重复3~6次*)
gg = {3 * aa}, "D"; (*aa重复0次或3的整数倍数次*)
```

`3 * aa`就和`aa aa aa`等价，是一种简化写法，所以`3 * [aa]`表示`[aa], [aa], [aa]`而不是将`aa`是否存在确定下来之后再重复三次。

## ABNF

在计算机科学中，扩充巴科斯-瑙尔范式（ABNF）是一种基于巴科斯-瑙尔范式（BNF）的元语言，但它有自己的语法和派生规则。ABNF的原动原则是描述一种作为双向通信协议的语言的形式系统。

它是由[第68号互联网标准](http://www.rfc-editor.org/std/std68.txt)（"STD 68"，大小写样式按照原文）定义的，也就是RFC 5234，经常用于互联网工程任务组（IETF）通信协议的定义语言。

更多具体内容请查看[扩充巴科斯范式](https://zh.wikipedia.org/wiki/%E6%89%A9%E5%85%85%E5%B7%B4%E7%A7%91%E6%96%AF%E8%8C%83%E5%BC%8F)，下面的内容就是从这里搬过来的。

ABNF更好地用于描述通信协议中的形式系统，更清晰地定义了字符编码（其二进制值）、定量重复等规则。

### 规则

一个ABNF规范是一些推导规则的集合，书写为：

```ABNF
规则 = 定义;注释CR LF
```
其中：
- “规则”是不区分大小写的非最终符号，也就是**非终结符**
- “定义”由定义该规则的一系列符号组成
- “注释”用于记录
- “CR LF”（回车、换行）是位于行尾的字符，用来结束
- 规则名字是不区分大小写的: `<rulename>`, `<Rulename>`, `<RULENAME>`和`<rUlENamE>`都指的是同一个规则。规则名字由一个字母以及后续的多个字母、数字和连字符（减号）组成。
- 用尖括号（“<”，“>”）包围规则名并不是必需的（如同它们在BNF里那样），但是它们可以用来界定规则名，以方便识别出规则名。

### 最终值

也就是**终结符**，由一个或多个数值字符指定。

- **数值字符**可按下面的方式指定：先是一个百分号`%`，紧跟着基数（`b` = 二进制, `d` = 十进制, `x` = 十六进制），再其后是这个数值或数值串（用`.`来指示串联），比如b`CR LF`就可以用`%d13.10`或者 `%x0D.0A`表示。
- **字面文本**是通过包含在在双引号（`"`）中字符串来指定的。这些字符串是不区分大小写的，使用的字符集是ASCII。所以`"abc"`会匹配所有符合`("a" | "A"), ("b" | "B"), ("c" | "C")`（EBNF）的字符串。所以如果要严格匹配大小写，应该使用`%`与其编码严格表示。

### 操作符

|用途|符号表示|含义|
|:-:|:-:|:-|
|空白字符|空白字符本身|空白字符被用来分隔定义中的各个元素：要使空格被识别为分割符则必须明确的包含它（`%`或者`""`）|
|串联|`规则1 规则2`|用空白字串联两个或多个规则|
|选择|`/`|`规则1 / 规则2`，两者选其一。|
|增量选择|`=/`|`规则1 =/ 规则2`，增加规则1的补充选择|
|值范围|`%c##-##`|`%b`, `%d`, `%x`，`.`指示串联，`-`表示数值范围选择。`"0" / "1"`也可以表示为`%x30-31`|
|序列组合|`()`|`(规则1 规则2)`元素可以放置在圆括号中来将规则组合起来，该组合视为单个元素。|
|不定量重复|`m*n`|`m*n规则`可选的`m`给出要包含的元素的最小数目，默认为0；可选的`n`给出要包含的元素的最大数目，默认为无穷大|
|定量重复|`n规则`|定量重复n次|
|可选序列|`[规则]`|可选，也就是0或1次，等价于`0*1(规则)`|
|注释|`;`|`;comment`|


操作符优先级:
- 规则名、最终值
- 注释;
- 值范围%c##-##
- 重复*
- 组合 ()、可选[]
- 串联
- 选择 /

ABNF使用空白符而不是逗号来串联，同BNF/EBNF一样串联优先级高于选择。

### 核心规则

核心规则定义与标准中，可以直接用。

规则|形式定义|意义|
|:-|:-|:-|
|ALPHA|`%x41-5A / %x61-7A`|大写和小写ASCII字母（A-Z, a-z）|
|DIGIT|`%x30-39`|数字（0-9）|
|HEXDIG|`DIGIT / "A" / "B" / "C" / "D" / "E" / "F"`|十六进制数字（0-9, A-F, a-f）|
|DQUOTE|`%x22`|双引号|
|SP|`%x20`|空格|
|HTAB|`%x09`|横向制表符|
|WSP|`SP / HTAB`|空格或横向制表符|
|LWSP|`*(WSP / CRLF WSP)`|直线空白（晚于换行）|
|VCHAR|`%x21-7E`|可见（打印）字符|
|CHAR|`%x01-7F`|任何7-位US-ASCII字符，不包括NUL（%x00）|
|OCTET|`%x00-FF`|8位数据|
|CTL|`%x00-1F / %x7F`|控制字符|
|CR|`%x0D`|回车|
|LF|`%x0A`|换行|
|CRLF|`CR LF`|互联网标准换行|
|BIT|`"0" / "1"`|二进制数字|

总结：其实EBNF和ABNF规则都大同小异，侧重点不同，ABNF更侧重于网络传输，所以将字符编码作为最基本的非终结符以确保二进制位的正确性。

## TODO

这里只涉及BNF/EBNF/ABNF文法的规则以及递归下降实现。本科时没有上过编译原理这门课，有时间一定要补一下，包括但不限于：

- 上下文无关文法（CFG）
- PEG（[解析表达文法](https://zh.wikipedia.org/wiki/%E8%A7%A3%E6%9E%90%E8%A1%A8%E8%BE%BE%E6%96%87%E6%B3%95)），不同于CFG是另一中形式语言，关键区别就是PEG中的选择是有序的
- DFA/NFA
- LL分析器与LR分析器
- lex/yacc & flex/bison
- [Comparison of parser generators](https://en.wikipedia.org/wiki/Comparison_of_parser_generators)
- 写一个正则表达式的parser
- 沿着词法分析、语法分析、语义分析、代码优化、代码生成的标准路径写一个编译器

## 参考
- [手把手教你构建 C 语言编译器（4）- 递归下降](https://lotabout.me/2016/write-a-C-interpreter-4/)
- 维基百科。

