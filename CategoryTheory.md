<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [范畴论了解](#%E8%8C%83%E7%95%B4%E8%AE%BA%E4%BA%86%E8%A7%A3)
  - [背景知识——群](#%E8%83%8C%E6%99%AF%E7%9F%A5%E8%AF%86%E7%BE%A4)
    - [群（Group）](#%E7%BE%A4group)
    - [群同态（group homomorphism）](#%E7%BE%A4%E5%90%8C%E6%80%81group-homomorphism)
    - [群同构（group isomorphism）](#%E7%BE%A4%E5%90%8C%E6%9E%84group-isomorphism)
    - [生成新群](#%E7%94%9F%E6%88%90%E6%96%B0%E7%BE%A4)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

提示：本文含有少量公式，可安装[MathJax Plugin for Github](https://github.com/orsharir/github-mathjax)浏览器插件提供公式渲染，但这样做并非直接解析源文本，而是在Markdown渲染结果的基础之上做，终究存在一些蛋疼的问题：
- 很多时候公式中的$ * $被Markdown渲染成了斜体标签`<em>`，导致显示问题。避免这个问题可以在公式中的$ * $两端加上空格。
- $\LaTeX$中大括号需要使用`\{`转义，但Markdown渲染为html网页时本身就会对其进行一次转义。所以只有`\\{`或者`\\\{`才能被Mathjax正常解析为左花括号，而`\{`就什么都没有了。
- 不是原生引入的Mathjax所以没办法，不应该本末倒置为了Mathjax能够渲染而使用不规范不正确的$\LaTeX$语法，既然绕不过最好还是克隆到本地查看吧。

# 范畴论了解

简单了解一下范畴论，也谈不上入门，不求深入。主要是为了对Haskell中各种类型类有更好的理解。

符号一览：

|符号|含义|$\LaTeX$写法|
|:-:|:-:|:-:|
|$\not$|符号取反|`\not`|
|$\subset \subseteq$|集合关系|`\subset \subseteq`|
|$\land \lor \lnot$|逻辑与、或、非|`\land \lor \lnot`|
|$\ni \in \notin \not\ni$|元素与集合关系|`ni \in \notin \not\ni`|
|$\to \Rightarrow \Leftrightarrow$|函数、逻辑推导|`\to \Rightarrow \Leftrightarrow`|
|$\forall \exists$|全称、存在量词|`\forall \exists`|
|$\mathcal{ABHG}$|手写体字母，表示群|`\mathcal{ABHG}`|
|$\sim \cong$|等价、同构|`\sim \cong`|
|$f\circ g$|函数、群同态复合|`f \circ g`|


纯数学家研究的是不同的抽象结构，但如果我们把不同的数学结构，如群、偏序、拓扑空间等，进行进一步的抽象，研究结构之上的结构，这就是**范畴**（category）。若再度抽象，我们就得到了**函子**（functor），再往上就是**自然变换**（natural transformation）。范畴论还可以继续研究抽象的抽象，直至无穷。

## 背景知识——群

背景知识的背景知识：集合、函数、关系。

### 群（Group）

**定义1**：有着非空集合$G$和它的一个二元运算$*$，若满足：
- **封闭性**： $\forall a,b\in G \exists c \in G(a * b = c)$。
- **结合律**： $\forall x,y,z \in G((x * y) * z = x * (y * z))$ 。
- **单位元存在**：$\exists e \in G \forall x \in G(x * e = x = e * x)$ ， $e$称之为单位元，也称幺元。
- **逆元存在**：$\forall x \in G \exists y\in G(x * y = e = y * e)$，称$x$和$y$为互逆元素，简称逆元（inverse），$y$可以记做$x^{-1}$。

则称$G$对$x$构成一个**群**。

记法：
- 三个要素$G$，$*$，$e$的三元组。
- 有记做$(G, *)$的，有记做$ (G, *, e)$的。随意？只要能理解就行，在没有歧义的情况下也可以简写做$G$。

通常称：
- $G$上的的二元运算 $* $ 为乘法，称 $a*b$ 为 $a$ 和 $b$ 的积，简写做 $ab$。
- 群$G$元素个数有限，在称为有限群，反之无限群，有限群的元素个数称为有限群的阶。

运算：
- $g\in G, H \subseteq G$，定义$g* H = \{gh|h\in H\}$，简写作 $gH$， $H*g = \{hg|h\in H\}$，简写作 $Hg$。
- $A,B \subseteq G$，定义$A*B = \{ab|a\in A, b\in B\}$，简写做$AB$。
- $H\subseteq G$，记 $H^{-1} = \{h^{-1}|h\in H\}$。

替换定理：若$(G, *)$是群，那么$\forall g \in G(gG = Gg = G)$。

子群：若$(G, *, e)$是群，那么$H$是$G$的非空子集且$(H, *, e)$也是群，那么称$H$为$G$的**子群**（subgroup）。

子群的判定：$HH=H\land H^{-1}=H \Leftrightarrow H是G的子群$。

例：
- 整数对加法运算，以$0$为单位元构成群，记做$(Z,+,0)$。
- 非零实数对乘法，以$1$为单位元构成群。

### 群同态（group homomorphism）

**定义2**：群$(G, *, e)$到群$(G^{'}, *^{'}, e^{'})$的一个群同态，是定义在集合$G$上（定义域），以$G^{'}$元素为取值（陪域）的函数$f$，使得：
- $\forall x,y \in G(f(x*y) = f(x) *^{'} f(y))$
- $f(e) = e^{'}$

则称$f : G\to G^{'}$称之为底层函数（underlying function），而记$f:(G,*,e)\to (G^{'}, *^{'}, e^{'})$为**同态**。

例：
- 任何群到单位群 $1$ 的映射都可以视为一个同态。
- 从整数群到有理数群存在这样的一个同态：$h:(Z,+,0) \to (Q,+,0)$ 。这个同态是**单射**（injective），但不是**满射**（surjective）。

**定理1**：
- 设 $\mathcal{G} = (G, *, e)$，那么存在一个**单位同态**（identity homomorphism）$1_{\mathcal{G}}:\mathcal{G}\to\mathcal{G}$，把$\mathcal{G}$中所有元素投射给自己。
- 对于两个同态$f:\mathcal{G}\to\mathcal{H},g:\mathcal{H}\to\mathcal{J}$，总可以将其复合构成新同态 $g\circ f:\mathcal{G}\to\mathcal{J}$。
- 同态的**合成**/**复合**（composition）是**结合**的（associative），即满足结合律。
- 符号说明：$\mathcal{G}$是手写体的$G$，写法`\mathcal{G}`。

### 群同构（group isomorphism）

**定义3**：如果底层函数是一个**双射**（bijection），那么称群同态为群同构，记做 $\mathcal{G}\cong \mathcal{H}$。若源和目标时同一个群，称之为**自同构**（automorphism）。

说明：
- 对于函数$f:A\to B$。
- 单射（injection，一对一）：$\forall a,b\in A(f(a) = f(b)\Rightarrow a = b)$。
- 满射（surjection，映上）：$\forall y\in B \exists x\in A(f(x) = y)$。
- 双射（bijection，一一对应）：即是单射，又是满射则称为双射。即陪域$B$中所有元素都是$A$中唯一的一个元素的像。

**定理2**：一个群同态$f:\mathcal{G}\to \mathcal{H}$是一个同构当且仅当它有一个**双边逆元**（two-sieded inverse），即$\exists f^{'}:\mathcal{H}\to \mathcal{G}(f^{'}\circ f = 1_{\mathcal{G}},f\circ f^{'}=1_{\mathcal{H}})$。

**定理3**：群之间的同构关系是群之间的**等价关系**（equivalence relation）。

说明：
- 等价关系：设$R$是非空集合$A$上的二元关系，若$R$自反、对称、传递，则称$R$是$A$上的等价关系。
- 自反性：$\forall a\in A((a, a)\in R)$。
- 对称性：$(a,b)\in R\land a\neq b \Rightarrow (b, a)\in R$。
- 传递性：$(a, b)\in R\land (b, c)\in R \Rightarrow (a, c)\in R$。
- 若$(a, b)\in R$，则称$a$等价于$b$，记做$a\sim b$。
- 定理3也就是说：群的同构具有自反、对称、传递性。

### 生成新群

子群：从群 $\mathcal{G} = (G , * , e)$ 中取出部分元素 $G^{'}$，使其对于群运算 $ * $ 闭合，且 $G^{'}$ 的**逆元**（inverse）也是 $G$ 的逆元。那么称$\mathcal{G}^{'}=(G^{'}, * , e)$是$\mathcal{G} = (G , * , e)$的一个**子群**（subgroup）。

两个群的积：对于两个群 $(G, * ,e)$和$(G^{'}, * ^{'},e^{'})$，设$H$为配对元素 $\langle x,y\rangle$ （就是二元组），定义 $d=\langle e, e^{'}\rangle$，又有 $\forall x\in G,y\in G^{'}(\langle x,x^{'}\rangle\star\langle y,y^{'}\rangle = \langle x * y,x^{'} * y^{'}\rangle)$，那么称群 $\mathcal{H} = (H,\star,d)$ 为群 $(G, * ,e)$ 和群 $(G^{'}, * ^{'},e^{'})$ 的**积**（product）。