# 如何方便地编辑公式



## Github支持公式

首先Github的Markdown文档：[GitHub Flavored Markdown Spec](https://github.github.com/gfm/)。


### 图片插入

- 简单粗暴。
- 繁琐，需要图床，Github放图片的话大一点就很慢。

### 装插件

Chrome浏览器插件：[mathjax-plugin-for-github](https://github.com/orsharir/github-mathjax)。

- 装了插件才可见。
- 不需要图床。
- 保留公式全部信息，编辑修改方便。

### 外链

**其一**：Codecogs
```
![](http://latex.codecogs.com/svg.latex?公式代码)
```
实例：![](http://latex.codecogs.com/svg.latex?E=c^2)

**其二**：Github自己的API
```
https://render.githubusercontent.com/render/math?math=
```
实例：![](https://render.githubusercontent.com/render/math?math=E=c^2)

注意事项：
- 不要有多余的空格，回车。
- 需要用`\\`表示`\`，因为要转义。

优缺点：
- 相对截图省力，外链图片，Github直接可预览。
- 过长，繁琐，需要转义，效果不算那么完美。
- 被绑定到了某个平台，不再是纯粹的![](https://render.githubusercontent.com/render/math?math=LaTeX)了。

找个python脚本[latex2pic.py](https://github.com/blmoistawinde/ml_equations_latex/blob/master/latex2pic.py)专门来做，自动化起来：
```python
import re
from urllib.parse import quote

if __name__ == "__main__":
    text = open("index.md",encoding="utf-8").read()

    parts = text.split("$$")

    for i, part in enumerate(parts):
        if i & 1:
            parts[i] = f'![math](https://render.githubusercontent.com/render/math?math={quote(part.strip())})'

    text_out = "\n\n".join(parts)

    lines = text_out.split('\n')
    for lid, line in enumerate(lines):
        parts = re.split(r"\$(.*?)\$", line)
        for i, part in enumerate(parts):
            if i & 1:
                parts[i] = f'![math](https://render.githubusercontent.com/render/math?math={quote(part.strip())})'
        lines[lid] = ' '.join(parts)
    text_out = "\n".join(lines)

    with open("readme.md", "w", encoding='utf-8') as f:
        f.write(text_out)
```
