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
```
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
```
<A> ::= <A> <B> | <C>
```
**间接左递归**是透过多个文法规则推导出在最左边出现自己的句型。
```
<A> ::= <B> <C> | <C>
<B> ::= <A> <D> | <E>
```
沿着`<A> -> <B> <C> -> <A> <D> <C>` 这条路径推导就会出现左递归。


## 消除左递归

左递归的[维基百科](https://zh.wikipedia.org/wiki/%E5%B7%A6%E9%81%9E%E6%AD%B8)介绍了消除左递归的方法。这里直接搬运过来：

### 消除直接左递归

一个一般化的移除左递归的算法描述如下。

对于每一个如下规则（用BNF描述）：
```
<A> ::= <A> B1 | <A> B2 | ... | <A> Bn | C1 | ... | Cn
```
其中`B1~Bn`是任意终结符与非终结符的序列，并且不为空字符串`<empty>`。`C1~Cn`是任意不与A开头的终结符与非终结符的序列。

**消除左递归后**可将`A`改为如下规则：
```
<A> ::= C1 <A_tail> | C2 <A_tail> | ... | Cn <A_tail>
<A_tail> ::= <empty> | B1 <A_tail> | B2 <A_tail> | ... | Bn <A_tail>
```
其中新创建出来的非终结符`<A_tail>`被称为尾巴（tail）或者剩余（rest）。

例：考虑如下规则
```
<expr> ::= <expr> + <expr> | <int> | <string>
```
可以改成：
```
<expr> ::= <int> <expr_rest> | <string> <expr_rest>
<expr_rest> ::= <empty> | + <expr> <expr_rest>
```
可以进一步简写`<expr_rest>`为：
```
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
```
<A> ::= <B> C | D
<B> ::= <A> E | F
```
第一步：
```
<A> ::= <A> E C | F C | D
<B> ::= <A> E | F
```
第二步：
```
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
```
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

## TODO

这里只涉及BNF文法的规则以及递归下降实现。本科时没有上过编译原理这门课，有时间一定要补一下，包括但不限于：
- EBNF/ABNF
- 上下文无关文法
- DFA/NFA
- LL分析器与LR分析器
- lex/yacc & flex/bison
- [Comparison of parser generators](https://en.wikipedia.org/wiki/Comparison_of_parser_generators)
- 写一个正则表达式的parser
- 从词法、语法、语义分析、代码生成的路径写一个编译器。

## 参考
- [手把手教你构建 C 语言编译器（4）- 递归下降](https://lotabout.me/2016/write-a-C-interpreter-4/)

