#portable-vimrc
=========

##README:

我本人的vim配置文件，仅在工作中使用。

此配置纯属东拼西凑，如有雷同，概不负责。

此配置把一些只在图形化界面中使用的配置参数单独加到 gvimrc 中，以避免 vimrc 负荷过重:P

此配置在东拼西凑的基础上立求每项参数都能通俗易懂，所以基本没有用简写形式，而且每项都有注释（有些是自己的理解）。

此配置暂时只测试了 Mac 环境，之后会逐步测试其他平台。

##PRE-INSTALL:

此配置文件假设你对 vim 有一定了解，并且本地安装有

- [Git(1.7+)](http://git-scm.com) (Mac 上可用 [Homebrew](http://mxcl.github.com/homebrew/) 或 [MacPorts](http://www.macports.org) 安装, Windows 上也可安装 [msysgit](http://msysgit.github.com) 或 [gitHub for Windows](http://windows.github.com)，具体安装方式不再赘述。)
- [Vim(7.3+)](http://vim.sourceforge.net) 或 [MacVim(OS X)](https://github.com/b4winckler/macvim)
- [Python 2](http://www.python.org/getit/) (vim-powerline.vim 插件需要 python 环境)
- [ack](http://betterthangrep.com) (ack.vim插件必须)
- [Exuberant Ctags](http://ctags.sourceforge.net) (taglist.vim插件必须)
- [gvimfullscreen_win32](https://github.com/derekmcloughlin/gvimfullscreen_win32) （windows 全屏扩展）

##INSTALL:

直接打开 Vim，会有惊喜哟：）

不过，正常情况下，还是得按步骤来。

- 如果已经存在 ~/.vim 文件夹以及 .vimrc, .gvimrc，请先做备份。
- 运行 `git clone https://github.com/cz848/portable-vimrc.git ~/.vim`。
- 运行 `cd ~/.vim`
- 运行 `ln -s vimrc ~/.vimrc`
- 运行 `ln -s gvimrc ~/.gvimrc`
- 运行 `vim`，理论上即可自动安装插件。
- vimrc 默认使用 PowerlineSymbols 字体，请安装 PowerlineFonts/PowerlineSymbols.ttf 中的字体, 以得到最好的显示效果。
- 为了能在 windows 下全屏，请下载 gvimfullscreen 扩展，把 dll 文件放到 gvim 的安装目录($VIMRUNTIME)。

##PLUGINS:

- [vim-fugitive]
- [vim-monokai]
- [html.vim]
- [html5.vim]
- [MatchTag]
- [JavaScript-syntax]
- [vim-json]
- [vim-haml]
- [css3-mod]
- [lint.vim]
- [jsbeautify]
- [vim-indent-guide]
- [supertab]
- [vim-autoclose]
- [nerdtree]
- [mru.vim]
- [LargeFile]
- [FencView.vim]
- [ctrlp.vim]
- [ack.vim]
- [vim-powerline]
- [The-NERD-Commenter]
- [sparkup]
- [restart.vim]
- [taglist.vim]

##KEY MAPS:

- CTRL-h (全模式)跳到左边的窗口。
- CTRL-l (全模式)跳到右边的窗口。
- CTRL-j (全模式)跳到上边的窗口。
- CTRL-k (全模式)跳到下边的窗口。
- CTRL-w CTRL-w (全模式)光标在窗口循环。
- F3 (全模式)开关 Nerdtree 窗口
- F9 (全模式) quickfix 打开缓冲区
- F10 (全模式)开关 lint 语法检查
- F11 (全模式) windows 下切换 gvim 全屏
- ;; (全模式) Mac 下切换 vim 全屏
- Tab (Insert)跳出自动补全窗口
- CTRL-P (Normal)打开 CtrlP 搜索栏
- ;cc (Insert/Visual)注释
- ;cu (Insert/Visual)取消注释
- ;ff (全模式)格式化 javascript 文件

更多精彩请参考 vimrc，gvimrc 文件。
