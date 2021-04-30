<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**目录**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Git学习笔记](#git%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0)
  - [0. Git学习资料](#0-git%E5%AD%A6%E4%B9%A0%E8%B5%84%E6%96%99)
  - [1. Git初见：安装与配置（Get Started）](#1-git%E5%88%9D%E8%A7%81%E5%AE%89%E8%A3%85%E4%B8%8E%E9%85%8D%E7%BD%AEget-started)
    - [1.1 Git核心特点](#11-git%E6%A0%B8%E5%BF%83%E7%89%B9%E7%82%B9)
    - [1.2 安装Git](#12-%E5%AE%89%E8%A3%85git)
    - [1.3 安装后配置Git](#13-%E5%AE%89%E8%A3%85%E5%90%8E%E9%85%8D%E7%BD%AEgit)
    - [1.4 获取帮助](#14-%E8%8E%B7%E5%8F%96%E5%B8%AE%E5%8A%A9)
  - [2. Git基本功：基础功能](#2-git%E5%9F%BA%E6%9C%AC%E5%8A%9F%E5%9F%BA%E7%A1%80%E5%8A%9F%E8%83%BD)
    - [2.1 创建Git仓库](#21-%E5%88%9B%E5%BB%BAgit%E4%BB%93%E5%BA%93)
    - [2.2 忽略列表](#22-%E5%BF%BD%E7%95%A5%E5%88%97%E8%A1%A8)
    - [2.3 记录更新到git仓库](#23-%E8%AE%B0%E5%BD%95%E6%9B%B4%E6%96%B0%E5%88%B0git%E4%BB%93%E5%BA%93)
    - [2.4 查看提交历史](#24-%E6%9F%A5%E7%9C%8B%E6%8F%90%E4%BA%A4%E5%8E%86%E5%8F%B2)
    - [2.5 撤销操作](#25-%E6%92%A4%E9%94%80%E6%93%8D%E4%BD%9C)
    - [2.6 远程仓库](#26-%E8%BF%9C%E7%A8%8B%E4%BB%93%E5%BA%93)
    - [2.7 标签](#27-%E6%A0%87%E7%AD%BE)
    - [2.8 Git技巧](#28-git%E6%8A%80%E5%B7%A7)
  - [3. Git必杀技：分支](#3-git%E5%BF%85%E6%9D%80%E6%8A%80%E5%88%86%E6%94%AF)
    - [3.1 什么是分支](#31-%E4%BB%80%E4%B9%88%E6%98%AF%E5%88%86%E6%94%AF)
    - [3.2 管理分支](#32-%E7%AE%A1%E7%90%86%E5%88%86%E6%94%AF)
    - [3.3 如何利用分支管理开发的工作流程](#33-%E5%A6%82%E4%BD%95%E5%88%A9%E7%94%A8%E5%88%86%E6%94%AF%E7%AE%A1%E7%90%86%E5%BC%80%E5%8F%91%E7%9A%84%E5%B7%A5%E4%BD%9C%E6%B5%81%E7%A8%8B)
    - [3.4 远程分支](#34-%E8%BF%9C%E7%A8%8B%E5%88%86%E6%94%AF)
    - [3.5 分支的衍合](#35-%E5%88%86%E6%94%AF%E7%9A%84%E8%A1%8D%E5%90%88)
  - [4. 服务器上的Git](#4-%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8A%E7%9A%84git)
    - [4.1 协议](#41-%E5%8D%8F%E8%AE%AE)
    - [4.2 通过ssh协议架设Git服务器](#42-%E9%80%9A%E8%BF%87ssh%E5%8D%8F%E8%AE%AE%E6%9E%B6%E8%AE%BEgit%E6%9C%8D%E5%8A%A1%E5%99%A8)
    - [4.3 生成SSH公钥](#43-%E7%94%9F%E6%88%90ssh%E5%85%AC%E9%92%A5)
    - [4.4 Git服务器架设流程](#44-git%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%9E%B6%E8%AE%BE%E6%B5%81%E7%A8%8B)
    - [4.5 公共访问](#45-%E5%85%AC%E5%85%B1%E8%AE%BF%E9%97%AE)
    - [4.6 GitWeb](#46-gitweb)
    - [4.7 Gitosis](#47-gitosis)
    - [4.8 Git托管服务](#48-git%E6%89%98%E7%AE%A1%E6%9C%8D%E5%8A%A1)
  - [5. 分布式Git](#5-%E5%88%86%E5%B8%83%E5%BC%8Fgit)
    - [5.1 分布式工作流程](#51-%E5%88%86%E5%B8%83%E5%BC%8F%E5%B7%A5%E4%BD%9C%E6%B5%81%E7%A8%8B)
    - [5.2 为项目做贡献](#52-%E4%B8%BA%E9%A1%B9%E7%9B%AE%E5%81%9A%E8%B4%A1%E7%8C%AE)
    - [5.3 管理自己的项目](#53-%E7%AE%A1%E7%90%86%E8%87%AA%E5%B7%B1%E7%9A%84%E9%A1%B9%E7%9B%AE)
  - [TODO](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Git学习笔记

## 0. Git学习资料

- Git官网书籍资料：[ProGit](https://git-scm.com/book/en/v2)
- [ProGit中文翻译](http://iissnan.com/progit/)（本文参考）
- [菜鸟教程](https://www.runoob.com/git/git-tutorial.html)（极简使用教程）
- [廖雪峰Git教程](https://www.liaoxuefeng.com/wiki/896043488029600)

## 1. Git初见：安装与配置（Get Started）

### 1.1 Git核心特点

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

### 1.2 安装Git

- 下载：[https://git-scm.com/](https://git-scm.com/)
- Windows安装：为所有用户安装，记得勾选添加到环境变量。
- Linux安装：
    - `yum install git-core`
    - `apt install git`
    - 编译安装：见[这里](http://iissnan.com/progit/html/zh/ch1_4.html)。

### 1.3 安装后配置Git

安装后需要配置Git工作环境，更新后沿用配置，也可以随时使用同样命令更改配置。

- 命令：`git config`
- 不同级别配置、存放位置：

|配置级别|Windows配置文件|Linux配置文件|Git选项|作用范围|
|:-:|:-:|:-:|:-:|:-:|
|系统|`安装目录/etc/gitconfig`|`/etc/gitconfig`|`--system`|所有用户|
|全局|`$HOME`，即用户根目录，一般来说`C:\Users\your-user-name\.gitconfig`|`~/.gitconfig`|`--global`|当前用户|
|本地|`.git/config`|`.git/config`|`--local`|本地仓库|

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

### 1.4 获取帮助
- `git help <verb>`
- `git <verb> --help`
- `man git-<verb>`
- Windows中可以使用前两者，会打开本地网页帮助文档。
- Linux中三者同样效果，打开对应的man手册。


## 2. Git基本功：基础功能

最基本最常用的Git命令。

### 2.1 创建Git仓库

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

### 2.2 忽略列表


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


### 2.3 记录更新到git仓库

Git仓库中的文件状态：
1. 已跟踪（tracked）：已纳入版本管理。
2. 未跟踪（untracked）：未纳入版本管理。

![Git的文件状态变化周期](Images/git_file_lifecycle.png)

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

### 2.4 查看提交历史

查看提交记录命令：`git log`。每次提交记录中都会显示：SHA-1校验和，作者和邮箱，提交时间，提交说明。
- 添加选项`-p`显示提交文件差异。
- `-2`只显示最近两次更新。
- `--stat`仅显示简要的增改行数统计
- 另外`--pretty`提供了不同的参数:`oneline`,`short`,`full`,`fuller`可以显示不同风格的记参数还可以是`format`用于自己定制要显示的记录格式，这样的输出方便后期编程提取（哇，细节太多。常用格式占位和说明：
    ```
    %H  提交对象（commit）的完整哈希字串
    %h  提交对象的简短哈希字串
    %T  树对象（tree）的完整哈希字串
    %t  树对象的简短哈希字串
    %P  父对象（parent）的完整哈希字串
    %p  父对象的简短哈希字串
    %an 作者（author）的名字
    %ae 作者的电子邮件地址
    %ad 作者修订日期（可以用 -date= 选项定制格式）
    %ar 作者修订日期，按多久以前的方式显示
    %cn 提交者(committer)的名字
    %ce 提交者的电子邮件地址
    %cd 提交日期
    %cr 提交日期，按多久以前的方式显示
    %s  提交说明
    ```
    用法：`git log --pretty=format:"%h - %an , %ar : %s"`。还要细心注意作者和提交者的区不得不说细节真的到位，也是真的多。
- `--graph`选项：可以显示ASCII图形表示的分支合并历史。

常用选项和含义：
```
选项            说明
-p              按补丁格式显示每个更新之间的差异。
--word-diff     按 word diff 格式显示差异。
--stat          显示每次更新的文件修改统计信息。
--shortstat     只显示 --stat 中最后的行数修改添加移除统计。
--name-only     仅在提交信息后显示已修改的文件清单。
--name-status   显示新增、修改、删除的文件清单。
--abbrev-commit 仅显示 SHA-1 的前几个字符，而非所有的 40 个字符。
--relative-date 使用较短的相对时间显示（比如，“2 weeks ago”）。
--graph         显示 ASCII 图形表示的分支合并历史。
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
--since, --after    仅显示指定时间之后的提交。
--until, --before   仅显示指定时间之前的提交。
--author            仅显示指定作者相关的提交。
--committer         仅显示指定提交者相关的提交。
```

不得不说，使用命令行去显示，查看和搜索记录就不是那么的方便，显得有点繁琐且选项众多，增大了记忆负担。使用图形化的界面查看提交历史可能看起来会更清晰简单一些。使用`gitk`或者`git-gui`也可以清晰的使用图形界面查看提交信息。这两个好像还不是一个东西，值得研究一下，后续再展开。

### 2.5 撤销操作

- 修正最后一次提交：`git commit --amend`
- 取消暂存的文件：`git restore --staged <file>`。执行`git status`是有已暂存的文件时提示中便会显示这个命令。或者`git reset head <file>`。我的提示前者，可能老版本会提示后者，都能用。
- 放弃本地文件修改：`git restore <file>`，或者`git checkout -- <file>`。所以同一个功能为什么有不同命令，版本更新追加的吗？如果放弃本地所有文件修改`git checkout .`。
- 所有已经提交的数据都会被记录，都可以被恢复。可能失去的数据，只可能是没有提交的数据。当然前提是你不能把版本库删了，而且其他人也没有克隆。

### 2.6 远程仓库

- 要和别人协助开发，版本库当然不能只位于本地。远程仓库指托管到网络上的仓库。可能只读，可能可以写。管理远程仓库，以便推送拉取数据，分享各自最新工作进展。
- 查看当前远程仓库：`git remote`。克隆一个项目后，默认远程仓库名是`origin`。如果本地通过`git init`创建，则没有远程仓库。
    - 远程仓库不一定非得位于远程，同样可以从本地仓克隆，被克隆的仓库就是`origin`。
    - 一个本地仓库可以有多个远程仓库。`-v`可以全部列出。
- 添加远程仓库：`git remote add [remote-name] [url]`。此时就可以用这个`[remote-name]`指代远程仓库了。
- 从远程仓库抓取数据：`git fetch [remote-name]`。将远程仓库所有数据抓取到本地仓库，完成后可在本地访问仓库所有分支。
- 如果设置了某个分支用于跟踪远程仓库的某个分支（如何设置？注意观察提示信息。），那么使用`git pull`将会自动抓取远程分支合并到本地仓库中当前分支。完成命令`git pull [remote-name] [branch-name]`。
- 默认情况下`git clone`就是自动创建本地`master`分支用于追踪远程`master`分支。克隆会自动使用`master`分支和远程仓库`origin`名称。（关于分支，暂时不清楚，后续详细了解。）
- 推送数据到远程仓库：`git push [remote-name] [branch-anme]`。
- 查看远程仓库详细信息：`git remote show [remote-name]`。
- 远程仓库重命名：`git remote rename [old-remote] [new-remote]`。
- 移除远程仓库：`git remote rm/remove [remote-name]`。

### 2.7 标签

打标签：对某一个时间节点上的版本打上标签，比如发布版本时（如V1.0等）。

- 用法：`git tag [-a | -s | -u <keyid>] [-f] [-m <msg> | -F <file>] [-e] <tagname> [<commit> | <object>]`。
- 列出所有标签：`git tag`。或者`git tag -l`。
- 两种标签：轻量级（LightWeight）和含附注的（Annotated）。轻量级标签就是一个指向特定提交对象的引用。含附注标签则是存储在版本库中的独立对象，有自身的校验和信息，包含着标签的名字，电子邮件地址和日期，以及标签说明。
- 创建一个含附注的标签：`git tag -a [tag-name] -m "message"`。轻量标签的话直接使用：`git tag [tag-name]`。给特定版本指定标签则最后一个参数指定为该版本（用校验和代表）。
- 显示标签信息：`git show [tag-name]`。轻量级标签则只会显示打上标签的那个版本的信息，含附注的标签则会显示附注信息。
- 列出所有标签：`git tag -l`。
- 删除标签：`git tag -d [tag-name]`。
- 推送到远端仓库时默认不会推送标签，使用`git push [remote-name] [branch-name] [tag-name]`推送单个标签，使用`--tags`推送所有新增标签。拉取时会将标签拉下来。
- 问题：我本地删除了标签的话，要怎么将标签删除推送到远端仓库呢？试了`-d`删除，直接`push --tags`没有用。

### 2.8 Git技巧
- 自动补全，安装后应该就有了，Windows上安装Git Bash和Linux安装Git应该是直接就可以使用的。如果需要自定义：[看这里](http://iissnan.com/progit/html/zh/ch2_7.html)。
- Git命令别名：
    ```
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status
    git config --global alias.unstage 'reset HEAD --'
    git config --global alias.last 'log -1 HEAD'
    git config --global alias.visual '!gitk' // 外部命令需要加一个!
    ```


## 3. Git必杀技：分支

使用分支可以从主线开发流程中独立出一个开发流程来，然后在不影响主线的同时并行开发。在其他版本控制系统（VCS）中，通常需要创建一个源代码工作目录的完整副本。

但将Git的分支模型称为必杀技也是因为这点将Git和其他VCS家族区分了出来，Git的分支难以置信的轻量。创建可以快速完成，在不同分支间切换也同样可以快速完成。

Git鼓励在工作流程中频繁使用分支与合并，理解分支并熟练运用，将真正改变你开发的方式。（如是说，我很期待）

### 3.1 什么是分支

在了解什么是分支前，先必须回顾Git如何保存数据：Git不保存差异，而是保存一系列文件快照。Git中提交时，会保存一个提交对象，该对象包含一个指向暂存区域快照的指针，并且包含本次提交作者等附属信息，0个或者多个改提交对象的父对象指针：首次提交无祖先，普通提交一个祖先，两个或多个分支合并产生的提交则有多个祖先。

暂存操作会对每一个文件计算SHA-1校验和，然后把当前版本文件快照保存到Git仓库（使用Blob类型对象存储这些快照。是一个文件一个Blob对象吗？），将校验和加入暂存区域。

然后使用`git commit`新建一个提交对象前，Git会先计算每一个子目录的校验和，然后将这些目录存储为Git仓库中的树（tree）对象。然后创建的提交对象，除了包含相关提交信息之外，还包含指向这个树对象（这个树对象可能不是根目录吗？如果只更改了一个子目录中的内容。）的指针。有了树对象，就可以重现快照的内容了。

![单个提交对象在仓库中的数据结构](Images/git_commit_object.png)

做一些修改后再次提交，本地提交对象会包含一个指向上次提交的指针。

![多个提交对象链接关系](Images/git_commit_object_link.png)

现在来看什么是**分支**（branch），分支本质上就是指向某个提交对象的可变指针。

![分支](Images/git_commit_object_branch.png)

那么创建分支其实就是创建一个新的指向当前提交对象的指针。也就是说创建一个分支只需要写入一个40字节的SHA-1校验和的成本。这就和其他新建分支需要备份所有项目文件到特定目录的VCS区别开来。
- 创建新分支命令：`git branch [branch-name] [commit]`。

![当前版本上创建新分支](Images/git_commit_object_branches.png)

那么Git如何知道当前在那个分支上工作呢？答案是**HEAD指针**，HEAD指针是指向当前正在工作的本地分支的指针。`git branch`只会创建新分支，但并不会自动切换到新分支，
- 切换到分支：`git checkout [branch-name]`。

![创建并切换到testing分支之后进行了一次提交](Images/git_commit_obejct_HEAD_pointer.png)

### 3.2 管理分支

分支操作：
- 创建新分支：`git branch [new-branch-name] [commit]`。
- 切换当前工作目录要跟踪的分支：`git checkout [branch-name]`。
- 创建新分支同时切换：`git checkout -b [new-branch]`。
- 合并分支到当前分支：`git merge [branch-name]`。

合并时如果当前HEAD指向的版本是要合并的版本的祖先的话，那么就代表要合并的分支是直接在当前版本上做的修改，中间未进行过其他修改，直接将当前分支的指针移动到要合并的提交对象即可，不会有冲突。但如果当前分支有提交，并且有冲突（比如两条线中都修改了同一个文件的同一个位置），逻辑上来说冲突只能由人来解决。Git做了合并，但没有提交，会停下来等待你来解决冲突，此时文件状态是**unmerged/未合并**。可以使用`git mergetool [file]`来编辑文件处理冲突，默认合并工具是`vimdiff`（暂时不会用）。

管理分支：
- `git branch`
    - 不加选项：列出所有分支与当前分支。
    - `-d`：删除分支。删除还未合并的分支时会提示错误。`-D`则会忽略这个直接删除。
    - `--merged` 和 `--no-merged`筛选已经与**当前分支**合并的分支与未合并的分支。

### 3.3 如何利用分支管理开发的工作流程

使用Git可以管理各种工作流程：

- 长期分支：在master分支只保留最稳定的代码，而在develop平行分支（也可以是多个分不同层次稳定性的分支）中管理后续的开发。等到经过充分测试确保代码稳定之后再逐步合并到master分支上来。

- 特性分支：在任何规模的项目中都可以使用，指一个短期的用来实现某个单一特性或与其相关工作的分支。比如修复一个紧急问题，添加一个新功能等。等到开发全部完成经过测试之后再将所有提交合并到主干/master上来。

当然目前所述都是本地分支，完全不涉及和服务器的交互。

### 3.4 远程分支

远程分支（remote branch）就是对远程仓库的分支的索引。他们是一些无法移动的本地分支，在Git进行网络交互时更新。用`remote-repo-name/branch-name`这种形式表示远程分支。

一个本地仓库可以有多个远程仓库，一个远程从仓库也可以有多个分支，所有当然可以有多个远程分支。当执行`git fetch`时远程分支就会被获取到本地。

- 如果在本地创建了分支，并且需要与其他人分享，那么就要推送分支到远程仓库。使用命令：`git push origin [local-branch-name]:[remote-branch-name]`。
- 克隆仓库是会自动创建本地`master`分支用来跟踪`origin/master`，所以`git push`和`git pull`一开始就可以正常工作。
- 跟踪远程分支：
    - `git checkout --track origin/[remote-branch]`
    - `git checkout -b [local-branch] origin/[remote-branch]`，本地分支名称不同于要跟踪的远程分支。
- 删掉远程分支：`git push origin :[remote-branch]`，仅仅是把本地分支推送到远程时将本地分支的位置留空。


### 3.5 分支的衍合

把一个分支的修改整合到另一个分支有两种方法，`merge`合并和`rebase`衍合（好像也称作**变基**）。

前面提到过，如果要合并的两个分支沿共同祖先产生了分叉，那么合并时就会产生一个新的提交对象。如果没有分叉，那么就只是单纯的分支指针移动。

![合并分叉的分支](Images/git_rebase_merge.png)

还有一种选择就是`rebase`，效果就是把C3（要合并的分支`experiment`的所有提交对象）的变化在C4（当前`master`分支的最后一个提交对象）中打一个补丁(patch)，生成一个新的合并提交对象C3'（每一个分支的提交对象打一次补丁在`master`生成一个对应提交对象），然后**改写**`expriment`的提交历史，使之成为`master`的直接下游。

![rebase](Images/git_rebase_rebase.png)

- 命令：`git rebase master`。执行效果是将当前分支衍合到`master`分支的上去。此时再执行合并直接移动`master`指针即可完成。


衍合操作得到了一个整洁的提交历史，看起来所有修改都是在一条线上顺序进行的，但同样将分支中的提交历史提到了`master`中。`rebase`之后`master`和其他分支的提交历史是完全一致的，分支也就没有了存在的必要。从这个角度来看，这个操作可以在要删除分支的前提下保留提交历史。

一种应用场景：本地分支开发后`rebase`到`origin/master`再提交，维护者就不需要做任何整合工作。

一看衍合这种操作就能理解这肯定是具有风险的，因为分支的历史被修改了。

- 衍合的风险：**一旦分支中的提交对象发布到公共仓库，就千万不要对该分支进行衍合操作。**

在进行衍合的时候，实际上抛弃了一些现存的提交对象而创造了一些类似但不同的新的提交对象。如果你把原来分支中的提交对象发布出去，并且其他人更新下载后在其基础上开展工作，而稍后你又用 `git rebase` 抛弃这些提交对象，把新的重演后的提交对象发布出去的话，你的合作者就不得不重新合并他们的工作，这样当你再次从他们那里获取内容时，提交历史就会变得一团糟。所以`rebase`原则上只应该在本地分支上做，做完之后即删掉本地分支。

如果把衍合当成一种在**推送之前清理提交历史的手段**，而且仅仅衍合那些**尚未公开的提交对象**，就没问题。如果衍合那些已经公开的提交对象，并且已经有人基于这些提交对象开展了后续开发工作的话，就会出现叫人沮丧的麻烦。

总结：
- `rebase`操作把当前分支衍合到目标分支上。也就是说仅修改被衍合分支的提交对象。
- `rebase`仅修改被衍合的分支指针和该分支的提交对象，不修改衍合到的分支的任何对象。
- 衍合之后没有分叉，即可直接合并。
- 衍合再合并和合并得到的结果是相同的，仅历史提交的拓扑关系不同。
- 衍合再合并之后两个分支是完全相同的，即可把被衍合的分支删掉。
- 衍合会修改提交对象，重算SHA-1校验和，和衍合前分支上的历史提交不是同一个提交对象。
- 如果有冲突，衍合是在衍合时处理冲突，并且衍合后衍合到的分支同样会被移动，没有冲突则不会移动（是这样吗？本地测试是这样的），合并则是在合并时处理冲突。
- 使用下来VSCode的Git支持做得是真的方便。图形化操作减少脑力负担，就算硬要敲命令内部也集成了终端，一点也不割裂。


## 4. 服务器上的Git

多人开发时为了方便，就需要在服务器上创建一个远程的仓库共享给所有人用以拉取和推送自己的工作内容。通常称这个共享的仓库为Git服务器。当然技术上是可以从个人仓库里拉取和推送修改内容，但是这样很容易和本地工作混淆，当然也可以在本地创建仓库作为远程仓库，然后克隆一次之后就不会了。

这一节主要内容是如何架设Git服务器。当然不想自己架设维护服务器的话，选择Github或者Gitee这种代码托管也是完全可以达到同样目的的。

远程仓库通常是一个裸仓库（bare repository），即没有工作目录的仓库，因为我们不需要在这个仓库上直接修改提交。简单来说，就是只包含`.git`子目录的内容。

### 4.1 协议

Git可以使用的四种传输协议：本地传输、SSH协议、Git协议、HTTP协议。

**本地协议**： 远程仓库就在硬盘的另一个目录，需要团队每一个成员都拥有对共享文件系统拥有访问权。
使用方法：
```bash
# 克隆一个仓库下来
git clone /git/project.git # 直接复制
git clone file:///git/project.git # 网络传输
# 对现有仓库添加远程仓库
git remote add origin /git/project.git
```
优点：方便简单，也方便同时获取其他人工作内容。
缺点：难以控制不同位置的访问权限，通过NFS（网络文件系统）不一定是最快的。

**SSH协议**：唯一一个同时支持读写操作的网络协议（HTTP和Git都是只读的），同时也需要验证授权。
使用：
```bash
git clone ssh://user@server/project.git
git clone user@server:project.git
```
优点：如果要对网络仓库有写权限，ssh协议基本是必须的。架设简单，管理方便。访问安全，所有数据传输都是经过授权和加密的。高效，传输时会压缩数据。
缺点：不能实现匿名访问，所以ssh不利于开源。如果是公司团队开发，ssh已经足够，如果需要开源，那么除了为自己架设ssh协议外，还需要提供匿名访问。

**Git协议**：这是一个包含在Git软件包里的特殊协议，它会监听一个提供类似于ssh服务的特定端口（9418），而且无需任何授权。如果你的仓库打算支持Git协议，需要先创建 `git-daemon-export-ok` 文件 — 它是协议进程提供仓库服务的必要条件 — 但除此之外该服务没有任何安全措施。要么所有人都可以克隆Git仓库，要么谁也不能。要开发推送也是可以的，不过没有授权，所以能访问的人都有同样的权限。

优点：现存最快的传输协议，它使用与 SSH 协议相同的数据传输机制，但省去了加密和授权的开销。
缺点：缺少授权，所以不能作为访问Git仓库的唯一方法。一般的做法是，同时提供ssh接口，让开发者拥有推送权限。需要单独的守护进程与端口开放（大型企业级防火墙通常会封锁这个少见的端口）。

**HTTP/HTTPS协议**：架设便捷，基本上，只需要把 Git 的裸仓库文件放在 HTTP 的根目录下，配置一个特定的 post-update 挂钩（hook）就可以搞定。每个能访问 Git 仓库所在服务器上 web 服务的人都可以进行克隆操作。

搭建：
```bash
cd /var/www/htdocs/
$ git clone --bare /path/to/git_project gitproject.git
$ cd gitproject.git
$ mv hooks/post-update.sample hooks/post-update
$ chmod a+x hooks/post-update
```
然后克隆仓库：
```bash
git clone http://example.com/gitproject.git
```
经过HTTP进行推送也是可以实现的，不过不常见太复杂略过。

优点：易于架设，HTTP占用服务器资源少，一般只用静态HTTP服务提供所有数据。HTTP如此常见，以至于企业级防火墙都允许通信。
缺点：客户端效率低，HTTP协议传输体积和网络开销大。


### 4.2 通过ssh协议架设Git服务器

架设之前肯定要导出现有仓库为裸仓库（使用`-bare`选项，不包含工作目录），目录名通常以`.git`结尾。
```bash
git clone --bare my_project my_project.git
```
其实clone操作相当于`git init` + `git fetch`。当然如果从头开始还没有本地仓库的话，直接`git init --bare`即可。整体的效果的话大致相当于`.git`目录的拷贝：
```bash
cp -Rf my_project/.git my_project.git
```

**将裸仓库移动到服务器上**：
假设已经有了一个git.example.com的服务器，当然没有解析域名只有IP（局域网或者公网IP）也是可以的，架设服务器的教程网络上汗牛充栋，不赘述；并可以通过ssh访问：
```bash
scp -r my_project.git user@git.example.com:/opt/git # scp是linux下跨机器复制文件的常用命令
```
简单来说传输到服务器器即可，不一定需要如此传输。现在有了ssh访问权限之后，即可以克隆远程仓库到本地：
```bash
git clone user@git.example.com:/opt/git/my_project.git
```
如果ssh用户对目录有写权限，那么他现在就可以推送本地的修改了。如果仅有几个人在一个不公开的项目上工作，那么一个ssh服务器与裸仓库便足够了。

**权限控制**：如果想一部分人只读，一部分人可写，那么使用服务器操作系统的本地文件访问控制机制即可（关于这点，还不是很清楚，Linux也没有那么深入，需要深入了解ssh协议和命令，TODO。）

建立访问权方法：其一，每个人建立一个账户，设定密码。其二，主机上建立一个git账户，每个写权限的人发送一个SSH公钥，然后将其加入git账户的`~/.ssh/authorized_keys`文件。这并不会影响提交的数据：访问主机用的身份(git账户)不会影响提交对象的提交者信息(`git config user.name/user.email`)。另外，使用其他的SSH授权机制也可以达到相同效果。


### 4.3 生成SSH公钥

大多数 Git 服务器都会选择使用 SSH 公钥来进行授权。系统中的每个用户都必须提供一个公钥用于授权，没有的话就要生成一个。生成公钥的过程在所有操作系统上都差不多。 首先先确认一下是否已经有一个公钥了。SSH 公钥默认储存在账户的主目录下的`~/.ssh`目录下的`id_rsa.pub`或者`id_dsa.pub`文件。有`.pub`后缀的是公钥，另一个同名文件是密钥/私钥。

如果还没有或者甚至还没有`.ssh`目录，那么可以使用`ssh-keygen`命令生成，生成过程中会提示输入密码，如果输入了，则使用这个ssh key推送到远程仓库是需要输入密码，也就是生成过程中指定的那个。否则的话不需要，用户名则是不需要输入。

注册了Github之后，将这个SSH key配置到Github上（Setting -> SSH and GPG keys）之后就可以本地推送到github了。

### 4.4 Git服务器架设流程

假设你已经有了一台服务器，还没有的话那就去[腾讯云](https://cloud.tencent.com/)或者[阿里云](https://cn.aliyun.com/)百元一年左右的价格就可以购买一台入门级的VPS，这时候会得到一个公网IP。一般选择Linux操作系统，如Ubuntu/CentOS等，和本地虚拟机、实体机上的装的Linux系统、WSL等操作起来并没有区别。使用[XShell](https://www.netsarang.com/en/xshell/)，[Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/)等远程连接工具即可连接使用。当然在做下面所有事情之前你需要确保已经安装`git`与`openssh-server`。

1. 首先创建名为`git`的用户，也就是ssh路径里`@`符号前的那个用户名。创建`.ssh`目录。
    ```bash
    sudo adduser git
    su git
    cd ~
    mkdir .ssh
    ```
2. 把要授权的开发者的公钥添加到`git`用户的`~/.ssh/authorized_keys`文件。公钥看起来是这样的（就是本地用`ssh-keygen`生成的`id_rsa.pub`文件内容）：
    ```
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCB007n/ww+ouN4gSLKssMxXnBOvf9LGt4L
    ojG6rs6hPB09j9R/T17/x4lhJA0F3FR1rP6kYBRsWj2aThGw6HXLm9/5zytK6Ztg3RPKK+4k
    Yjh6541NYsnEAZuXz0jTTyAUfrtU3Z5E003C4oxOj6H0rfIF1kKI9MAQLMdpGW1GYEIgS9Ez
    Sdfd8AcCIicTDWbqLAcU4UpkaX8KyGlLwsNuuGztobF8m72ALC/nLF6JLtPofwFBlgc+myiv
    O7TCUSBdLQlgMVOFq1I2uPWQOkOWQAHukEOmfjy2jctxSDBQ220ymjaNsHT4kgtZg2AYYgPq
    dAv8JggJICUvax2T9va5 gsg-keypair
    ```
    逐个添加到文件尾部即可。
3. 创建裸仓库之后本地克隆下来或者添加远程仓库就可以推送修改了。远程：
    ```bash
    cd /opt/git # 当然可以在任何有权限可以读写的目录创建
    mkdir project.git
    cd project.git
    git --bare init
    ```
    本地：（用`gitserver`替代主机，实际使用时替换为你的服务器IP）
    ```bash
    git clone git@gitserver:/opt/git/project.git
    cd myproject
    touch Readme.md
    git commit -am 'first commit : add Readme.md'
    git push origin master
    ```
    再登录到服务器上`git log`即可看到提交记录了。
4. 至此就搭建完毕了，非常快捷与简单。然后再做一些权限配置，使用`git`自带的`git-shell`工具限制`git`用户的活动范围。只要把它设置为`git`用户的登录shell，那么该用户就无法使用普通的bash或者其他shell程序。编辑`/etc/passwd`文件：
    ```bash
    sudo vim /etc/passwd
    ```
    找到文件末尾类似`git:x:1000:1000::/home/git:/bin/sh`这样的行，将其中的`bin/sh`改为`usr/bin/git-shell`。
    现在`git`用户只能通过SSH连接来推送和获取Git仓库，而不能直接使用主机Shell。如果`ssh git@gitserver`直接进行普通SSH登录则会报错。这样的话就只能通过其他用户远程连接，连接后也不能切换到`git`用户来创建仓库。

### 4.5 公共访问

配置好了ssh协议访问，如果是开源项目，可能还需要你匿名的读取访问。或许对小型的配置来说最简单的方法是运行一个静态Web服务（任何Web服务都可以达到同样的效果：Apache, Nginx, etc.）。将根目录设定为Git仓库所在位置，使用前面提到的`post-update`钩子。

1. 首先开启钩子，就是重命名`post-update`的样本文件。
    ```bash
    cd project.git/hooks
    mv post-update.sample post-update
    chmod a+x ./post-update
    ```
    该文件核心内容如下：
    ```
    exec git-update-server-info
    ```
    意思是当通过 SSH 向服务器推送时，Git 将运行这个 `git-update-server-info `命令来更新匿名 HTTP 访问获取数据时所需要的文件。

2. 把文档根目录设为 Git 项目所在的根目录。然后假定DNS服务已经配置好后，会把`.gitserver`请求发送到这台主机。另外需要将仓库所在目录的Unix用户组设置为`www-data`，这样web服务才可以读取仓库。
    ```bash
    chgrp -R www-data /opt/git
    ```
    接下来就可以在本地匿名使用HTTP协议访问仓库了：
    ```bash
    git clone http://git.gitserver/project.git # http://gitserver/git/project.git 这样可以吗？
    ```
    当然这需要配置服务器设置。这里省略了，根据具体使用的Web服务器配置方法不同。

另一个提供非授权访问的简单方法是开启一个 Git 守护进程，也就是使用Git协议来匿名访问。

### 4.6 GitWeb

现在已经可以读写或者匿名只读访问了，如果能有一个简单的Web界面访问的话就更好了。

Git自带了一个命令可以做到，使用类似`lighttpd`或者`webrick`这样轻量级的服务器启动一个临时进程，，可以到项目目录中键入`git instaweb`来启动。

如果要用 `lighttpd` 以外的程序来启动 `git instaweb`，可以通过 `--httpd` 选项指定：
```bash
git instaweb -httpd=webrick # 这会在1234端口开一个HTTPD服务
git instaweb -httpd=webrick --stop # 关闭服务时添加--stop选项即可
```

- 这里暂时还没有跑起来：还缺一些前置知识，待后续不补充。
- TODO：了解Web服务器相关内容。什么是CGI？Web服务器的配置和使用，Apache和Nginx？

### 4.7 Gitosis

把用户公钥保存在`authorized_keys`中，对团队人数不多时，是比较有效的，当团队达到一定规模，管理起来可能就会非常痛苦。并且这种情况所有用户都会拥有对Git仓库的读写权限，无法更为有效精细的管理。

这时候就需要使用Gitosis了，有趣的是权限的修改并非通过网页设置，而是通过管理一个特殊的Git仓库来实现。

安装Gitosis：
```bash
# 依赖
apt install python-setuptools
# 从 Gitosis 项目主页克隆并安装
git clone https://github.com/tv42/gitosis.git
cd gitosis
sudo python setup.py install

# 待补全，暂时没有需求，属于具体应用，需要修改现有的authorized_keys
```
TODO：后续的Gitolite和Git守护进程（使用Git协议提供匿名访问）暂不涉及。


### 4.8 Git托管服务

[托管服务列表](https://git.wiki.kernel.org/index.php/GitHosting)

当然最广闻人知的必然是世界上最大的程序员交友网站[Github](https://github.com)。

当然使用就不必多说了，添加SSH Key，创建仓库，克隆或者添加远程仓库，提交。和Git服务器并无二致，也不需要操心去配置Git服务器。


## 5. 分布式Git

前面已经有了基本的本地工作流程。但是作为项目贡献者时，怎样做才能方便维护者采纳更新，作为项目维护者，又怎么样有效管理大量贡献者的提交呢？

### 5.1 分布式工作流程

Git与传统的集中式版本控制系统（CVCS）不同，因为是分布式的，所以开发者可以互相分享自己的代码，流程多样灵活。
集中常见的工作流程：

**集中式工作流**：单点协作模型，一个存放代码仓库的中心服务器，可以接受所有开发者提交代码。所有开发者都是普通节点，作为仓库的消费者，平时工作就是和中心仓库同步数据。

![集中式工作流](Images/git_workflow_centralized.png)

那么当两个人同时修改了同一个地方，就有可能产生冲突，第二个提交的人就需要在推送之前先拉取数据解决冲突。团队不大的话完全可以采用这种工作流程，使用也非常广泛。

**集成管理员工作流**：由于Git允许使用多个远程仓库，开发者可以建立自己的公共仓库，将数据共享给其他人。这种情况通常有一个代表官方发布的项目仓库（blessed repository），开发者由此仓库克隆自己的公共仓库（developer public），推送自己的提交。维护者有自己本地的克隆仓库，将所有公共仓库作为远程仓库添加进来，测试无误后合并到主干，再推送到官方仓库。

![集成管理员工作流](Images/git_workflow_Integrated_administrator.png)

GitHub网站上多采用这种工作流，要贡献代码时先fork项目到自己的列表，成为自己的公共仓库，然后更新提交之后，然后提起Pull Request，等待维护者接受你的贡献。这种工作方式下你可以按照你自己的节奏工作，不必等待维护者处理你的更新，维护者也可以按照自己的节奏，任何时候都可以来处理别人贡献的代码。

**司令官与副官工作流**：一般超大型项目才会采用，比如Linux内核。各个集成管理员分别负责集中项目中的特定部分，称为副官（lieutenant）。这些集成管理员上方还有负责统筹的总集成管理员，成为司令官（dictator），维护仓库以提供所有协作者拉取最新集成的项目代码。

![司令官与副官工作流](Images/git_workflow_dictator_and_lieutenaut.png)

这种分而治之的项目管理职责也清晰，不易出错，项目极为庞杂或者需要多级别管理时才会体现出优势。

除了这些工作流，实际工作中为了满足各式各样的需求，会需要各种不同的工作方式。


### 5.2 为项目做贡献

那作为项目贡献者，又有那些常见的工作模式呢？

Git如此灵活，人们的协作方式也可以各种各样，没有固定不变的范式可循。具体到个人，项目所选的工作流程，参与者规模，提交权限等都会影响具体操作的细节。

比如说影响较大的团队规模，如果几百个人工作的仓库，每天可能有几十上百个提交，那么你的提交可能会由于其他人的更新而变得过时甚至无法运行偏离原有逻辑。那么如何确保代码最新，且每次提交后逻辑正确无误呢？几个人的小团队就不需要为这种问题烦恼。

**提交指南**：代码提交需要规范以方便管理，项目管理时应该需要制定提交规范，不一而足。列举一些常见的点：
- 不要提交多余的空白字符。
- 每次提交限定于完成一次逻辑功能。可以的话，适当分解为多次小提交，以便每次提交都易于理解。这样做便于其他人复阅代码，取消某个特定问题的修复等。
- 提交说明撰写，要清晰简洁易理解易跟踪搜索，项目规范不一而足。

可以看一看Git本身的项目提交：`git log --no-merges`。
是时候把Git克隆下来了：`git clone git://git.kernel.org/pub/scm/git/git.git`，仓库共140MB左右，没有我想象中那么大。TODO：后续有时间回滚并读一下源码。

**私有小型团队**：仅在一台服务器上提交的话其实与使用SVN等CVCS工作流并无太大差别。但还是有一些区别，比如如果你当前版本不是最新，那么需要先`git fetch origin`之后合并到本地(`git merge origin/master`)之后再提交，而SVN提交后会自动在服务器进行合并。有冲突的的话需要先解决再提交。最后的本地的仓库历史类似于：

![仓库](Images/git_work_with_git_rebase.png)

当然也可以`rebase`，那就成一条直线了。

最简单的协作方式之一：在自己的特性分支中工作一段时间，完成后合并到自己的`master`分支，或者直接在`master`中修改提交，拉取并合并`origin/master`的更新，再推向远程服务。最后的提交一般都是分叉的而不是线性的（不同于SVN上在同一个分支上提交时完全线性的提交历史）。

**私有团队间协作**：几个小组分别负责若干特性开发和集成时，每个特性签出一个分支，项目组成员在分支上工作，并把工作推送到服务器，然后项目组管理员负责在项目完成后集成到`master`分支并提交到远程。看起来是很清晰的，只是如果同时在多个项目间工作时，因为都在一个本地，千万要记住自己当前工作的分支，不要提交错了。

推送本地分支提交到追踪的远程分支：`git push origin [local-branch]:[remote-branch]`。


**公开项目**：如果不是项目的直接维护者，只是想贡献一些代码，没有直接推送到主仓库的权限，那么就需要把工作成果提交给项目维护人。当然在Github中使用 fork + PR 的方式解决这个问题。另外也可以通过电子邮件发送补丁完成提交。

具体流程：
- 克隆项目仓库。
- fork这个仓库，然后将fork之后的仓库同时添加为本地仓库的远端仓库。
- 创建特性分支，修改提交，推送到自己fork的仓库`git push myfork featureA`。这样如果项目维护者未采纳贡献，也不需要回退自己的`master`，因为你的提交还在远程分支上。
- 通知项目管理员，让他来抓取你的代码，也就是 Pull Request。
- 如果管理员采纳或者选择了你的提交，那么就会被合并到项目主干上。
- 这是如果要开始第二项特性开发，就先保持自己`master`与`origin/master`同步，签出新分支继续开始工作。

这样的做法方便又灵活，采纳和丢弃都轻而易举。多个特性的开发修改互不干扰，不用担心特性代码交叉混杂。

如果开发期间管理员接受了其他人的提交，导致合并无法正确干净地完成，那么你需要将特性分支衍合到最新的`origin/master`，解决冲突后，重新提交发起PR。或者在PR前都选择先衍合到最新的`origin/master`？

也可以将`git request-pull origin/master myfork`的结果发送给管理员以通知采纳。

**公开的大型项目**：许多大型项目都会立有一套自己的接受补丁流程，你应该注意下其中细节。但多数项目都允许通过开发者邮件列表接受补丁。

工作流程类似于：为每个补丁创建独立的特性分支，而不同之处在于如何提交这些补丁。不需要创建自己可写的公共仓库，也不用将自己的更新推送到自己的服务器，你只需将每次提交的差异内容以电子邮件的方式依次发送到邮件列表中即可。

- 使用`git format-patch`生成mbox格式的文件作为附件发送给管理员。
- 甚至可以通过配置直接使用`git send-email`来发送补丁。这些内容具体现在并无太大作用，具体贡献时按照项目约定的流程来即可。


### 5.3 管理自己的项目

不了解也没有做过，不展开说，总结要点：
- 使用`git apply`或者`git am`采纳别人的补丁。
- 合并其他人提交时，将其他人仓库添加为远程仓库，拉取提交为特性分支，决定代码取舍，集成到主干，删除特性分支。
- 大型项目还需要`master`稳定分支确保发布代码的稳定与`develop`开发分支来接受其他人代码。
- 签名、生成版本号、发布、制作简报等内容以后有机会再详细了解不详述。


## TODO

待长期使用总结，有用到之后再补充。

- Git服务器相关内容补充：GitWeb，HTTP访问，Git协议等
- 更多Git托管服务内容补充
- Git工具
- 自定义Git
- Git与其他VCS的交互
- 底层原理
- GUI：git-gui，gitk，etc
- 主流IDE的Git集成
- 操作细节
    - diff
    - merge
    - etc
- 使用体验，待长期使用后总结
- etc
