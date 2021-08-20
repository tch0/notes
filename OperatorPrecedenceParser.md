<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [运算符优先级分析](#%E8%BF%90%E7%AE%97%E7%AC%A6%E4%BC%98%E5%85%88%E7%BA%A7%E5%88%86%E6%9E%90)
  - [前缀、中缀、后缀表达式](#%E5%89%8D%E7%BC%80%E4%B8%AD%E7%BC%80%E5%90%8E%E7%BC%80%E8%A1%A8%E8%BE%BE%E5%BC%8F)
  - [分析树](#%E5%88%86%E6%9E%90%E6%A0%91)
  - [优先级与结合性](#%E4%BC%98%E5%85%88%E7%BA%A7%E4%B8%8E%E7%BB%93%E5%90%88%E6%80%A7)
  - [中缀转后缀](#%E4%B8%AD%E7%BC%80%E8%BD%AC%E5%90%8E%E7%BC%80)
  - [计算后缀表达式](#%E8%AE%A1%E7%AE%97%E5%90%8E%E7%BC%80%E8%A1%A8%E8%BE%BE%E5%BC%8F)
  - [四则运算实例](#%E5%9B%9B%E5%88%99%E8%BF%90%E7%AE%97%E5%AE%9E%E4%BE%8B)
  - [直接计算中缀表达式](#%E7%9B%B4%E6%8E%A5%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%BC%80%E8%A1%A8%E8%BE%BE%E5%BC%8F)
  - [递归计算中缀表达式](#%E9%80%92%E5%BD%92%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%BC%80%E8%A1%A8%E8%BE%BE%E5%BC%8F)
  - [参考](#%E5%8F%82%E8%80%83)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 运算符优先级分析

运算符优先级分析是一种自底向上的**语法分析**方法。而递归下降是一种自顶向下的分析方法。在一般的语法分析过程中，两者都能够独立处理。但是对于表达式的处理，由于运算符较多且具有多层优先级，递归下降会显得复杂且不够有效率。对于其他程序结构：变量函数声明、固定结构声明等运算符优先级会显得不够直观。所以一般的语法分析过程会将两者结合使用，运算符优先级分析用来处理表达式，递归下降用来处理其他部分。

[另一篇笔记](BNF&RecursiveDescent.md)详细介绍了BNF以及相关扩展语言以及递归下降。

## 前缀、中缀、后缀表达式

[中缀表示法](https://zh.wikipedia.org/wiki/%E4%B8%AD%E7%BC%80%E8%A1%A8%E7%A4%BA%E6%B3%95)（或中缀记法）是一个通用的算术或逻辑公式表示方法， 操作符是以中缀形式处于操作数的中间（例：3 + 4）。

[前缀表示法](https://zh.wikipedia.org/wiki/%E6%B3%A2%E5%85%B0%E8%A1%A8%E7%A4%BA%E6%B3%95)也叫波兰表示法，是一种逻辑、算术和代数表示方法，其特点是操作符置于操作数的前面。如果操作符的元数（arity）是固定的，则语法上不需要括号仍然能被无歧义地解析。

[后缀表示法](https://zh.wikipedia.org/wiki/%E9%80%86%E6%B3%A2%E5%85%B0%E8%A1%A8%E7%A4%BA%E6%B3%95)，类似于前缀表达式，只是所有操作符置于操作数的后面。也成为逆波兰表达式。

中缀表达式中需要使用括号来确定运算顺序，比如`(1+2)*3`，加法优先级低于乘法，如果要先计算优先级更低的操作就必须使用括号。

而在运算符操作数确定的情况下（这里主要探讨二元运算符），前缀和后缀表达式就不存在这个问题，因此前缀和后缀表达式不需要括号来规定优先级。`(1+2)*3`改为前缀表达式为 `* + 1 2 3`。一个运算符后紧跟两个操作数，如果操作数是运算符，则是子表达式就需要先计算子表达式，已经暗含了计算顺序。同理后缀表达式为 `1 2 + 3 *`。从前往后计算的话前缀表达式是自顶向下的，而后缀表达式是自底向上的。



## 分析树

将一个表达式中运算符作为根节点，操作数或者子表达式作为子节点，递归的将一个表达式表示为树的话。就能得到其分析树。比如`(1+2)*3`：
```
        *
       / \
      +   3
     / \
    1   2
```
先序遍历这棵树就能得到前缀表达式，后序遍历就能得到后缀表达式，中序遍历则是中缀表达式。可以看做等价的结构，只有中缀表达式需要加括号表明计算顺序，但因为中缀表达式是最适合人类阅读的结构，所以依然是程序语言中最常见的结构。

当然计算中缀表达式就显得有点复杂，常见的做法是将其转换为后缀或者前缀表达式后再计算。

## 优先级与结合性

**优先级**指定运算的优先运算顺序，优先级越高应该越早计算，括号超越优先级或者说最高优先级。**结合性**是指从左往右运算还是从右往左运算。典型的比如[C语言运算符优先级](https://zh.cppreference.com/w/c/language/operator_precedence)。

某些运算符左结合右结合结果是相同的，比如加法、乘法，某些是不同的比如减法、除法。相同优先级的运算符原则上应该具有相同的结合性。

在C语言中，运算符的优先级和结合性派生自文法，是自然而然的。
- 前缀的的一元运算符都是左结合，因为也只能左结合。`*&p`。
- 后缀的一元运算符都是右结合。
- 二元运算符基本都是左结合。
- 二元的右结合运算符只有赋值和一些复合赋值的运算符。所有可以有这种语句`a = b = 10;`。

## 中缀转后缀

以中缀转后缀表达式为例。以一个存放运算符的栈就可以实现，算法：
- 遍历中缀表达式，遇到左括号时压栈。
- 遇到操作数时直接输出。
- 遇到运算符时，从栈顶开始依次将优先级高于或等于当前运算符的运算符出栈输出，直到栈空、遇到左括号（括号是用来划定运算顺序的运算符，不看做一般意义的运算符，但具有最高的优先级）、遇到更低优先级的运算符。才将当前运算符压栈。
- 遇到右括号时，依次出栈运算符知道遇到左括号，然后将左括号出栈。
- 知道表达式遍历完，依次出栈输出栈中所有运算符。

注意：出栈运算符是是直到遇到等于当前运算符优先级还是小于当前运算符优先级应该取决于当前运算符结合性，左结合就小于，右结合就等于。越先输出就越先计算。

例：`(1+2)*3`，左括号压栈，1输出，+压栈，输出2，右括号时+出栈，*压栈，输出3，输出*，结果`1 2 + 3 *`。

## 计算后缀表达式

计算后缀表达式同样使用一个保存中间结果的栈就可以完成，算法：
- 遍历后缀表达式，遇到操作数入栈。
- 遇到操作符就从出栈需要个数的操作数（这就需要没有歧义，也就是一个操作符数量固定），计算完成后将计算结果压栈。直到结束。
- 从栈顶取出运算结果。

例；`1 2 + 3 *`，1和2压栈，遇到+，出栈2和1，得到2压栈，3压栈，遇到*，出栈3和2，计算得到6。

## 四则运算实例

以四则运算为例实现表达式解析：中缀转后缀，再通过后缀表达式计算。

先实现词法分析：
```C++
class Calculator
{
public:
    Calculator() : str(NULL), token(0), token_val(0) {}

    int getResult();
    int getPriority(int token); // 获取运算符优先级，用于比较
    void next();
    bool calculate(const char* s); // 直接计算，跳过中间转逆波兰的过程
    bool toPostfix(const char * s, string& postfix);    // 将中缀表达式转换为后缀表达式（逆波兰表达式）
    bool calculatePostfix(const char* s); // 计算逆波兰表达式

private:
    enum { Number = 128 };
    const char* str;
    int token;
    int token_val;
    int result;
};

void Calculator::next()
{
    token = 0;
    while (str && (token = *str))
    {
        str++;
        if (token >= '0' && token <= '9')
        {
            token_val = token - '0';
            token = Number;
            while (*str >= '0' && *str <= '9')
            {
                token_val = token_val * 10 + *str - '0';
                str++;
            }
            return;
        }
        else if (token != ' ' && token != '\t')
        {
            return;
        }
    }
}
```

中缀转后缀：
```C++
bool Calculator::toPostfix(const char *s, string& postfix)
{
    if (s == NULL || *s == 0)
    {
        cout << "invalid input";
        return false;
    }
    str = s;
    stack<int> opStack;
    next();
    while (token)
    {
        if (token == Number)
        {
            postfix += to_string(token_val);
            postfix += " ";
        }
        else if (token == '(' || token == '+' || token == '-' || token == '*' || token == '/')
        {
            while (!opStack.empty() && opStack.top() != '(' && getPriority(opStack.top()) >= getPriority(token))
            {
                // 栈中运算符优先级大于等于当前运算符，则先输出栈中的运算符，例外就是左括号时不输出（留着)来匹配），也就是直到遇到一个优先级更低的运算符
                postfix += opStack.top();
                postfix += " ";
                opStack.pop();
            }
            opStack.push(token);
        }
        else if (token == ')') // 找到匹配的左括号，输出()中间的内容
        {
            while (!opStack.empty() && opStack.top() != '(')
            {
                postfix += opStack.top();
                postfix += " ";
                opStack.pop();
            }
            if (opStack.empty())
            {
                cout << "miss left (" << endl;
                return false;
            }
            else
            {
                opStack.pop();
            }
        }
        else if (token != 0) // token == 0表示结束
        {
            cout << "invalid token " << token << endl;
            return false;
        }
        next();
    }
    while (!opStack.empty())
    {
        if (opStack.top() == '(')
        {
            cout << "miss right )" << endl;
            return false;
        }
        postfix += opStack.top();
        postfix += " ";
        opStack.pop();
    }
    return true;
}
```
需要以一种方式确定运算符优先级：
```C++
int Calculator::getPriority(int token)
{
    if (token == '(')
    {
        return 3;
    }
    else if (token == '*' || token == '/')
    {
        return 2;
    }
    else if (token == '+' || token == '-')
    {
        return 1;
    }
    return -1;
}
```
计算后缀表达式；
```C++
bool Calculator::calculatePostfix(const char * s)
{
    if (s == NULL || *s == 0)
    {
        cout << "invalid input reverse polish" << endl;
        return false;
    }
    str = s;
    stack<int> numStack;
    next();
    while (token)
    {
        if (token == Number)
        {
            numStack.push(token_val);
        }
        else if (token == '+' || token == '-' || token == '*' || token == '/')
        {
            if (numStack.size() < 2)
            {
                cout << "miss numbers" << endl;
                return false;
            }
            int num2 = numStack.top();
            numStack.pop();
            int num1 = numStack.top();
            numStack.pop();
            if (token == '+')
            {
                result = num1 + num2;
            }
            else if (token == '-')
            {
                result = num1 - num2;
            }
            else if (token == '*')
            {
                result = num1 * num2;
            }
            else if (token == '/')
            {
                result = num1 / num2;
            }
            numStack.push(result);
        }
        else if (token != 0) // token == 0表示结束
        {
            cout << "invalid token " << token << endl;
            return false;
        }
        next();
    }
    if (numStack.size() >= 2)
    {
        cout << "miss operators" << endl;
        return false;
    }
    else
    {
        return true;
    }
}
```

需要注意，在表达式合法的情况下，计算简单而优雅，表达式非法时如果要提供详细的错误信息1则需要仔细处理各种情况。

在上面的算法中，转后缀的过程中，只能识别括号没有匹配的错误，其他非法的表达式能够合法转为后缀，只能在后缀表达式计算时才能识别出来，比如缺少或者多了操作数的情况。而这时已经没有了原始的中缀表达式，已经不能确定具体错误的位置了，可能会进行错误的中间计算直到最后才能确定发生了错误。

## 直接计算中缀表达式

结合中缀转后缀计算后缀的过程，使用两个栈，一个保存运算符，一个保存操作数，就可以在直接计算中缀表达式。

将转后缀过程中遇到运算符输出改为遇到运算符就出栈两个操作数，运算并压栈即可。最后在依次出栈运算符然后取出操作数计算，计算最终结果。

那么四则运算就可改成：
```C++
bool Calculator::calculate(const char* s)
{
    if (s == NULL || *s == 0)
    {
        cout << "invalid input" << endl;
        return false;
    }
    str = s;
    stack<int> numStack;
    stack<int> opStack;
    int last_token = 0; // 增加last_token辅助判断表达式是否合法，比如不能出现两个相连的number和两个相连的非括号运算符或者(*与/+)这种情况都是非法的。

    next();
    while (token)
    {
        if (token == Number)
        {
            numStack.push(token_val);
        }
        else if (token == '+' || token == '-' || token == '*' || token == '/')
        {
            if (numStack.empty()) // 需要两个操作数，但前面没有操作数
            {
                cout << "miss numbers" << endl;
                return false;
            }
            if (opStack.empty() || opStack.top() == '(')
            {
                opStack.push(token);
            }
            else
            {
                while (!opStack.empty() && opStack.top() != '(' && getPriority(opStack.top()) >= getPriority(token))
                {
                    if (numStack.size() >= 2) // 需要两个操作数
                    {
                        int num2 = numStack.top();
                        numStack.pop();
                        int num1 = numStack.top();
                        numStack.pop();
                        int lastOp = opStack.top();
                        if (lastOp == '+')
                        {
                            result = num1 + num2;
                        }
                        else if (lastOp == '-')
                        {
                            result = num1 - num2;
                        }
                        else if (lastOp == '*')
                        {
                            result = num1 * num2;
                        }
                        else if (lastOp == '/')
                        {
                            result = num1 / num2;
                        }
                        else
                        {
                            cout << "invalid operator " << (char)lastOp << endl;
                            return false;
                        }
                        numStack.push(result);
                        opStack.pop();
                    }
                    else
                    {
                        cout << "miss numbers" << endl;
                        return false;
                    }
                }
                opStack.push(token);
            }
        }
        else if (token == '(')
        {
            opStack.push(token);
        }
        else if (token == ')') // 找到匹配的左括号，计算括号中表达式的值
        {
            while (!opStack.empty() && opStack.top() != '(')
            {
                int lastOp = opStack.top();
                opStack.pop();
                if (numStack.size() >= 2)
                {
                    int num2 = numStack.top();
                    numStack.pop();
                    int num1 = numStack.top();
                    numStack.pop();
                    if (lastOp == '+')
                    {
                        result = num1 + num2;
                    }
                    else if (lastOp == '-')
                    {
                        result = num1 - num2;
                    }
                    else if (lastOp == '*')
                    {
                        result = num1 * num2;
                    }
                    else if (lastOp == '/')
                    {
                        result = num1 / num2;
                    }
                    else
                    {
                        cout << "invalid operator " << (char)lastOp << endl; // 不会走到这
                        return false;
                    }
                    numStack.push(result);
                }
                else
                {
                    cout << "miss numbers" << endl;
                    return false;
                }
            }
            if (opStack.empty())
            {
                cout << "miss left (" << endl;
                return false;
            }
            opStack.pop();
        }
        else if (token != 0)
        {
            cout << "invalid token " << token << endl;
            return false;
        }
        last_token = token;
        next();
    }
    // 计算最终结果
    while (!opStack.empty())
    {
        int lastOp = opStack.top();
        if (lastOp == '(')
        {
            cout << "miss right )" << endl;
            return false;
        }
        opStack.pop();
        if (numStack.size() >= 2)
        {
            int num2 = numStack.top();
            numStack.pop();
            int num1 = numStack.top();
            numStack.pop();
            if (lastOp == '+')
            {
                result = num1 + num2;
            }
            else if (lastOp == '-')
            {
                result = num1 - num2;
            }
            else if (lastOp == '*')
            {
                result = num1 * num2;
            }
            else if (lastOp == '/')
            {
                result = num1 / num2;
            }
            else
            {
                cout << "invalid operator " << (char)lastOp << endl;
                return false;
            }
            numStack.push(result);
        }
        else
        {
            cout << "miss numbers" << endl;
            return false;
        }
    }
    // 最终结果存放在栈顶，且应该仅有一个元素
    if (numStack.size() != 1)
    {
        cout << "invalid expression" << endl;
        return false;
    }
    return numStack.top();
    return true;
}
```
上述代码报错位置能够得到更进一步确定，存在一些可以简化的冗余。

## 递归计算中缀表达式

上述的过程可以改成递归的，可以将保存运算符的栈隐含的函数递归调用栈中，操作数和中间结果的保存则可以用递归调用中的局部变量来加以保存。

```C++
#include <iostream>
#include <stack>
using namespace std;

enum Token
{
    // 一元运算符不涉及, 从Lor到Mul/Div/Mod优先级依次升高
    Number = 128,
    Lor,            // ||
    Land,           // &&
    Or,             // |
    Xor,            // ^
    And,            // &
    Eq, Ne,         // == !=
    Lt, Le, Gt, Ge, // < <= > >=
    Shl, Shr,       // << >>
    Add, Sub,       // + -
    Mul, Div, Mod,  // *   * / %优先级相同
    Top
};

class Expression
{
public:
    Expression();
    void next();
    bool match(int tk);
    void expression(int level);
    bool calculate(const char* s);
    int getResult() { return result; }
    int getHasResult() { return hasResult; }
    void test(const char * s, bool valid, int expected);
private:
    const char* str;
    int token;
    int token_val;
    int result;
    bool hasResult;
};

Expression::Expression() : str(NULL), token(0), token_val(0), result(0), hasResult(false)
{
}

// 词法分析
void Expression::next()
{
    token = 0;
    while (str && (token = *str))
    {
        str++;
        while (token == ' ' || token == '\t')
        {
            token = *str++;
        }
        
        if (token >= '0' && token <= '9')
        {
            token_val = token - '0';
            token = Number;
            while (*str >= '0' && *str <= '9')
            {
                token_val = token_val * 10 + *str - '0';
                str++;
            }
        }
        else if (token == '*') token = Mul;
        else if (token == '/') token = Div;
        else if (token == '%') token = Mod;
        else if (token == '+') token = Add;
        else if (token == '-') token = Sub;
        else if (token == '<')
        {
            if (*str == '<') { token = Shl; str++; }
            else if (*str == '=') { token = Le; str++; }
            else token = Lt;
        }
        else if (token == '>')
        {
            if (*str == '>') { token = Shr; str++; }
            else if (*str == '=') { token = Ge; str++; }
            else token = Gt;
        }
        else if (token == '!')
        {
            if (*str == '=') { token = Ne; str++; }
        }
        else if (token == '=')
        {
            if (*str == '=') { token = Eq; str++; }
        }
        else if (token == '&')
        {
            if (*str == '&') { token = Land; str++; }
            else token = And;
        }
        else if (token == '|')
        {
            if (*str == '|') { token = Lor; str++; }
            else token = Or;
        }
        else if (token == '^') token = Xor;
        return;
    }
}

bool Expression::match(int tk)
{
    if (token == tk)
    {
        next();
        return true;
    }
    else
    {
        cout << "expected token: ";
        if (token >= 128)
        {
            cout << token << endl;
        }
        else
        {
            cout << (char)token << endl;
        }
        return false;
    }
}

// 1 + 2*5/3 - (2 - 3) --> 5
void Expression::expression(int level)
{
    if (hasResult)
    {
        cout << "lack of operator" << endl; // 常理来说不会到这里
        return;
    }
    if (token == Number)
    {
        match(Number);
        result = token_val;
        hasResult = true;
    }
    // ()
    else if (token == '(')
    {
        match('(');
        expression(Lor);

        if (!hasResult)
        {
            cout << "miss expression in ()" << endl;
            return;
        }
        
        if (!match(')'))
        {
            hasResult = false;
            return;
        }
    }
    // 其他一元运算符支持...

    // 二元运算符
    while (token >= level)
    {
        int tmpResult = 0;
        if (hasResult)
        {
            tmpResult = result;
            hasResult = false;
        }
        else
        {
            cout << "binary operator " << token << " miss left operand" << endl;
            return;
        }

        if (token == Add)
        {
            match(Add);
            expression(Mul); // 应该用更高优先级中最低的那一个
            if (!hasResult)
            {
                cout << "miss right operands for +" << endl;
                return;
            }
            result = tmpResult + result;
        }
        else if (token == Sub)
        {
            match(Sub);
            expression(Mul);
            if (!hasResult)
            {
                cout << "miss right operands for -" << endl;
                return;
            }
            result = tmpResult - result;
        }
        else if (token == Mul)
        {
            match(Mul);
            expression(Top);
            if (!hasResult)
            {
                cout << "miss right operands for *" << endl;
                return;
            }
            result = tmpResult * result;
        }
        else if (token == Div)
        {
            match(Div);
            expression(Top);
            if (!hasResult)
            {
                cout << "miss right operands for /" << endl;
                return;
            }
            result = tmpResult / result;
        }
        else if (token == Mod)
        {
            match(Mod);
            expression(Top);
            if (!hasResult)
            {
                cout << "miss right operands for %" << endl;
                return;
            }
            result = tmpResult % result;
        }
        else
        {
            cout << "invalid token : " << token << endl;
            hasResult = false;
            return;
        }
    }
}

bool Expression::calculate(const char* s)
{
    if (s == NULL || *s == 0)
    {
        cout << "null input" << endl;
        return false;
    }
    str = s;
    hasResult = false;
    // 当前运算符优先级设置为最低的Lor，只是为了在此基础上任何运算都会开始，这个最终的Lor运算是不做的
    next();
    expression(Lor);
    if (hasResult && token != 0) // 一个表达式解析成功，但是没有到达末尾
    {
        cout << "expression has extra string" << endl;
        hasResult = false;
    }
    return hasResult;
}

void Expression::test(const char * s, bool valid, int expected = 0)
{
    static int count = 1;
    calculate(s);
    bool passed = (valid == hasResult && !valid) || (valid == hasResult && valid && expected == result);
    cout << "test " << count++ << (passed ? " passed, " : " failed, ")
        << "expected: " << (valid ? "valid " : "invalid ") << expected << ", "
        << "actual: " << (hasResult ? "valid " : "invalid ") << result << endl;
}


int main()
{
    Expression expr;
    expr.test("1 + 2*5/3 - (2 - 3)", true, 5);
    expr.test("100 + 200 + (300 * 10 - 2000 - 500 *4/(200/100)) *10 - 100 * 2", true, 100);
    expr.test("(1)", true, 1);
    expr.test("(1+5%3%3*4-1)/5+10", true, 11);
    expr.test("100+20-30*2/4+100%30/10*(100+10%10)", true, 205);
    
    expr.test("1*", false, 0);
    expr.test("+1", false, 0);
    expr.test("()", false, 0);
    expr.test("100 100", false, 0);
    expr.test("", false, 0);
    return 0;
}
```

递归实现中是找到一个运算符后向右递归计算比自己优先级高的，而不是向左查找。

**注意结合性的影响**，如果右结合就需要向右计算等于或高于当前优先级的，如果左结合只需要计算高于当前优先级的。由于计算时是计算了大于等于当前运算符优先级的所有运算符，所以这个点体现在传入右边表达式的当前运算符优先级上，左结合的应该传递更高一个等级的运算符，右结合的话就传递当前即可。开始计算时从最低开始。

因为要区分不同运算符，必须使用不同枚举值，用来代指更高优先级的运算符应该选用高一级的同类优先级运算符中枚举值最小的那一个。

这样实现，报错信息可以很充分，也可以很容易的扩展。

## 参考

- [Operator-precedence parser - Wikipedia](https://en.wikipedia.org/wiki/Operator-precedence_parser)
- [C语言的运算符优先级](https://zh.cppreference.com/w/c/language/operator_precedence)
- [手把手教你构建 C 语言编译器（8）- 表达式](https://lotabout.me/2016/write-a-C-interpreter-8/)