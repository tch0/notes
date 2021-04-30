# 如果没有math.h我们可以干什么？

参考：[没有math.h我们能干啥？-知乎文章-王希](https://zhuanlan.zhihu.com/p/20085048)

## 0. math.h里面有什么？

打开GCC编译的`include`目录找到`math.h`打开可以看到，常用的数学函数如下：
```C++
_CRTIMP double __cdecl sin (double); // 正弦
_CRTIMP double __cdecl cos (double); // 余弦
_CRTIMP double __cdecl tan (double); // 正切
_CRTIMP double __cdecl sinh (double); // 双曲正弦
_CRTIMP double __cdecl cosh (double); // 双曲余弦
_CRTIMP double __cdecl tanh (double); // 双曲正切
_CRTIMP double __cdecl asin (double); // 反正弦
_CRTIMP double __cdecl acos (double); // 反余弦
_CRTIMP double __cdecl atan (double); // 反正切
_CRTIMP double __cdecl atan2 (double, double); // 反正切
_CRTIMP double __cdecl exp (double); // e为底指数
_CRTIMP double __cdecl log (double); // e为底对数
_CRTIMP double __cdecl log10 (double); // 10为底对数
_CRTIMP double __cdecl pow (double, double); // 实数的实数次方
_CRTIMP double __cdecl sqrt (double); // 开方
_CRTIMP double __cdecl ceil (double); // 向负无穷方向取整
_CRTIMP double __cdecl floor (double); // 向正无穷方向取整
_CRTIMP double __cdecl fabs (double); // 绝对值
_CRTIMP double __cdecl ldexp (double, int); // 计算前者乘以e的后面这个数次方的乘积
_CRTIMP double __cdecl frexp (double, int*); // 将实数分解为x*2^exp次方形式
_CRTIMP double __cdecl modf (double, double*); // 得到一个浮点数的整数和小数部分
_CRTIMP double __cdecl fmod (double, double); // 实数对实数求余
```

- 比较有用的函数
    - 三角函数：sin, cos, tan
    - 反三角函数：asin, acos, atan, atan2
    - 双曲函数：sinh, cosh, tanh
    - 绝对值：abs, fabs
    - 求余：mod, fmod, modf
    - 开方: sqrt
    - 幂函数：pow, powf
    - 指数函数：exp
    - 对数函数：log, log10
    - 取整函数：ceil, floor

## 1. 基本常数
```C++
#define PI 3.14159265358979323846
#define e 2.7182818284590452354
#define ln_2 0.69314718055994530942
#define ln_10 2.30258509299404568402
```

这些宏预处理展开之后会作为双精度浮点型也就是`double`字面值，一般来说长度是64位，其中1位符号位，11位指数位，52位尾数位。换算成十进制的话尾数部分有效位数能够达到15~16位左右。为保证达到IEEE754双精度浮点数能表示的精度极限，常量的定义最好至少定义到小数点后16位。如果需要更高的精度请使用`long double`字面值。

## 2. 取绝对值

不必多说，有手就行。
```C++
double fabs(double x)
{
    return x > 0 ? x : -x;
}
```
或者使用宏：
```C++
#define fabs(x) ((x) > 0 ? (x) : (-x))
```
当然定义为宏的话，传入表达式可能会造成重复计算，所以还是最好定义为函数。

## 3. 实数的整数次方和实数的实数次方

实数的整数次方，快速幂就行。
```C++
double pow(double a, int n)
{
    if (n < 0)
        return 1/pow(a,-n);
    double res = 1.0;
    while (n)
    {
        if (n&1)
            res *= a;
        a *= a;
        n >>= 1;
    }
    return res;
}
```
然后根据实数的整数次方求实数的实数此方，根据 $a^x = \exp (x \ln a)$，那么只有有了`exp`以e为底的指数函数和`ln`以e为底的对数函数，那么就可以实现了。
```C++
double exp(double x); // e^x
double ln(double x); // ln(x)
double powf(double a, double x)
{
    return exp(x*ln(a));
}
```
这里需要e为底指数函数，和e为底对数函数，先声明，后续来实现。


## 4. e为底指数



## TODO

- 标准库函数实现分析
- BenchMark



