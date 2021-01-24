# Git使用教程

## Git学习资料

- Git官网书籍资料：[ProGit](https://git-scm.com/book/en/v2)
- [ProGit中文翻译](http://iissnan.com/progit/)
- [菜鸟教程](https://www.runoob.com/git/git-tutorial.html)
- [廖雪峰Git教程](https://www.liaoxuefeng.com/wiki/896043488029600)


## 安装与配置（Get Started）

### Git核心特点

- 分布式版本管理软件，本地保存版本库所有信息。
- 直接记录快照，而非文件差异。如果一个文件在该版本没有变化，则只对上一次快照做一个链接。
- 近乎所有操作都是本地完成：从版本库中读取数据，做差异运算，提交。
- 数据完整性：保存到Git版本库前，都会进行所有内容校验和计算(checksum)，并将结果作为唯一标识和索引，数据传输或者磁盘损坏导致数据不完整都会立刻被察觉。使用SHA-1哈希值：40个16进制字符，作为保存到Git数据库的索引。
- 多数操作仅对数据库添加数据，一旦提交快照就不用再担心数据丢失。
- 文件的三种状态：已提交(commited)，已修改(Modified)，已暂存(Staged)。
- 三个工作区域：工作目录，暂存区，本地仓库。
- Git版本库保存位置：`.git`目录。
- 基本Git工作流程：
    1. 工作目录修改文件。
    2. 对修改文件进行快照，保存到暂存区。
    3. 提交更新到Git版本库。

### 安装Git

- 下载：[https://git-scm.com/](https://git-scm.com/)
- Windows安装：为所有用户安装，记得勾选添加到环境变量。
- Linux安装：
    - `yum install git-core`
    - `apt install git`
- 编译Git：见[这里](http://iissnan.com/progit/html/zh/ch1_4.html)。

### 安装后配置Git

安装后需要配置Git工作环境，更新后沿用配置，也可以随时使用同样命令更改配置。

- 命令：`git config`
- Windows中配置文件存放位置：
    1. `$HOME`，即用户根目录，未做更改的话就是：`C:\Users\your-user-name\.gitconfig`，`--global`选项。
    2. `安装目录/etc/gitconfig`也有配置，系统配置，`--system`。
    3. 项目配置：`.git/config`，`--local`。
- Linux中存放位置
    1. `~/.gitconfig`，用户家目录下，当前用户，`--global`选项时读取。
    2. `/etc/gitconfig`，所有用户使用，`--system`选项时读取。
    3. 当前项目配置`.git/config`文件，仅针对当前项目有效，`--local`。
- 每个级别的配置会覆盖上一级的同名变量，所以对一个项目，项目配置 > 用户配置 > 系统配置。
- 用户信息：
    - `git config --global user.name "your-name"`
    - `git config --global user.email "your-email"`
- 不同级别的配置选项：
```   
--global              use global config file
--system              use system config file
--local               use repository config file
--worktree            use per-worktree config file
```
- 查看配置信息，`--list`，直接编辑配置文件`--edit`。

### 获取帮助
- `git help <verb>`
- `git <verb> --help`
- `man git-<verb>`
- Windows中可以使用前两者，会打开本地网页帮助文档。
- Linux中三者同样效果，打开对应的man手册。


## Git基础

最基本最常用的Git命令。

### 创建Git仓库

- 将已有文件添加到Git版本控制：在你的工作目录中初始化新仓库，拷贝文件到git目录，直接在需要进行版本管理的工作目录进行初始化，提交为初始版本。
```shell
git init
cp [your-file] ./
git add *
git commit -m "initial projet version"
```
- 从现有仓库克隆，完整克隆仓库的所有提交历史。
```shell
git clone [url] [local-repo-name]
```

### 忽略列表


忽略某些文件：无需进行版本管理的文件，将其列入`.gitignore`中，将不会再进行跟踪，`git status`时将不再显示其未跟踪状态。一般情况下我们可以选择将项目生成的二进制文件，临时文件，自己本地特有但不需要进行版本管理的文件加入忽略列表。
```
*.[oa]
*~
```
`.gitignore`格式规范：
- 所有空行或以注释符号`#`号开头的行被忽略。
- 可以使用标准的glob模式匹配。
- 匹配模式后加`/`说明要忽略目录。
- 可以在要忽略的文件或者目录模式前加`!`取反。

**glob模式**是指Shell使用的简化的正则表达式。规则：
- `*`号匹配零个或者多个任意字符。不包括表示目录的`/`或者`\`(Windows中)。`**`则可以匹配任意字符，包括目录。
- `[abc]`匹配任意一个方括号中的字符，`[0-9]`匹配0到9的任意一个字符。
- `?`匹配一个任意字符。

例子：
```shell
# 忽略所有.a文件，除了lib.a
*.a
!lib.a
# 忽略TODO文件和bulid文件夹
/TODO
/bulid/
# 忽略doc/目录下的所有txt文件和忽略doc/以及其子目录下所有txt文件
doc/*.txt
doc/**/*.txt
```


### 记录更新到git仓库

Git仓库中的文件状态：
1. 已跟踪（tracked）：已纳入版本管理。
2. 未跟踪（untracked）：未纳入版本管理。

![Git的文件状态变化周期](https://git-scm.com/book/en/v2/images/lifecycle.png)

Git的版本管理操作：
- 检查当前Git仓库文件状态：`Git status`。
- 添加文件到暂存区：`git add`。这个命令用于跟踪未跟踪文件，暂存已修改文件。
- 比较工作区相对暂存区差异：`git diff`。即是修改后还没有暂存起来的内容。
- 比较已经暂存的内容相较上次提交（版本库内最新内容）之间的差异：`git diff --cached`或者`git diff --staged`。
- 提交更新：`git commit`，Git会进入默认编辑器提示你输入提交信息。编辑器一般是vim，有由`git config core.editor`指定。编辑时注释中会包含此次提交改动的文件信息。加入`-v`选项则文件的具体差异都会显示在提示中，帮助你更好的编写提交信息，提交时注释会被丢弃。加入`-m`选项则直接在其后添加提交信息参数，用`""`包含，则不会进入编辑。得到的提示信息如下：
    ```
    [master 60dcae0] update ignore list & hello.c
    2 files changed, 9 insertions(+)
    ```
    - 提示中告诉你提交到了那个分支，本次提交的SHA-1校验和是多少（只是开头的一部分），有多少文件被修改，多少行被添加修改删除。
- 提交时跳过使用暂存区域：`git commit -a -m "commit message"`，跳过`git add`步骤。
- 从Git中移除文件：`git rm`，从跟踪清单（确切地说从暂存区域）移除，同时从本地删除，这样提交时就会从将文件从版本库删除了。仅删除本地文件的话不会从暂存区域移除。
- 如果只想从版本库移除，而不想从本地删除，则使用`git rm --cached [file]`，保留本地文件，移除暂存区文件（不再跟踪），下次提交时即可生效。使用`git rm`也可以使用文件模式匹配规则。并且git在Shell之上也有自己的扩展模式匹配规则（不展开说）。
- 移动文件：`git mv [file_from] [file_to]`，仓库中的元数据并不会体现出这是一次改名操作。不过Git会推断出发生了什么。其实运行`git mv readme.md readme.txt`就相当于（必须先`rm`再`add`）：
    ```shell
    mv readme.md readme.txt
    git rm readme.md
    git add readme.txt
    ```
    分开操作git也会意识到这是一次改名操作，怎么做到的？思考。

### 查看提交历史

查看提交记录命令：`git log`。每次提交记录中都会显示：SHA-1校验和，作者和邮箱，提交时间，提交说明。
- 添加选项`-p`显示提交文件差异。
- `-2`只显示最近两次更新。
- `--stat`仅显示简要的增改行数统计
- 另外`--pretty`提供了不同的参数:`oneline`,`short`,`full`,`fuller`可以显示不同风格的记参数还可以是`format`用于自己定制要显示的记录格式，这样的输出方便后期编程提取（哇，细节太多。常用格式占位和说明：
    ```
    %H	提交对象（commit）的完整哈希字串
    %h	提交对象的简短哈希字串
    %T	树对象（tree）的完整哈希字串
    %t	树对象的简短哈希字串
    %P	父对象（parent）的完整哈希字串
    %p	父对象的简短哈希字串
    %an	作者（author）的名字
    %ae	作者的电子邮件地址
    %ad	作者修订日期（可以用 -date= 选项定制格式）
    %ar	作者修订日期，按多久以前的方式显示
    %cn	提交者(committer)的名字
    %ce	提交者的电子邮件地址
    %cd	提交日期
    %cr	提交日期，按多久以前的方式显示
    %s	提交说明
    ```
    用法：`git log --pretty=format:"%h - %an , %ar : %s"`。还要细心注意作者和提交者的区不得不说细节真的到位，也是真的多。
- `--graph`选项：可以显示ASCII图形表示的分支合并历史。

常用选项和含义：
```
选项	        说明
-p              按补丁格式显示每个更新之间的差异。
--word-diff     按 word diff 格式显示差异。
--stat	        显示每次更新的文件修改统计信息。
--shortstat     只显示 --stat 中最后的行数修改添加移除统计。
--name-only     仅在提交信息后显示已修改的文件清单。
--name-status	显示新增、修改、删除的文件清单。
--abbrev-commit	仅显示 SHA-1 的前几个字符，而非所有的 40 个字符。
--relative-date	使用较短的相对时间显示（比如，“2 weeks ago”）。
--graph	        显示 ASCII 图形表示的分支合并历史。
--pretty        使用其他格式显示历史提交信息。可用的选项包括 oneline，short，full，fuller 和 format（后跟指定格式）。
--oneline       --pretty=oneline --abbrev-commit 的简化用法。
```

- `-<n>`限制显示提交次数。
- `--since`,`--until`给定时间限制。
- 还可以搜索：`--author`搜索指定作者，`--grep`按关键字搜索。
相关选项：
```
选项                说明
-(n)                仅显示最近的 n 条提交
--since, --after	仅显示指定时间之后的提交。
--until, --before	仅显示指定时间之前的提交。
--author            仅显示指定作者相关的提交。
--committer         仅显示指定提交者相关的提交。
```

不得不说，使用命令行去显示，查看和搜索记录就不是那么的方便，显得有点繁琐且选项众多，增大了记忆负担。使用图形化的界面查看提交历史可能看起来会更清晰简单一些。使用`gitk`或者`git-gui`也可以清晰的使用图形界面查看提交信息。这两个好像还不是一个东西，值得研究一下。


TODO: 撤销操作，远程仓库，标签，etc.
