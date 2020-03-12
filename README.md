# portable-vimrc


我本人的vim配置文件，仅在工作中使用。

此配置纯属东拼西凑，如有雷同，概不负责。

此配置把一些只在图形化界面中使用的配置参数单独加到 gvimrc 中，以避免 vimrc 负荷过重:P

此配置在东拼西凑的基础上立求每项参数都能通俗易懂，所以基本没有用简写形式，而且每项都有注释（有些是自己的理解）。

此配置暂时只测试了 Mac 环境，之后会逐步测试其他平台。

## PRE-INSTALL:

此配置文件假设你对 vim 有一定了解，并且本地安装有

- [Git(1.7+)](http://git-scm.com) (Mac 上可用 [Homebrew](http://mxcl.github.com/homebrew/) 或 [MacPorts](http://www.macports.org) 安装, Windows 上也可安装 [msysgit](http://msysgit.github.com) 或 [gitHub for Windows](http://windows.github.com)，具体安装方式不再赘述。)
- [Vim(7.3+)](http://vim.sourceforge.net) 或 [MacVim(OS X)](https://github.com/b4winckler/macvim)
- [Python 2](http://www.python.org/getit/) (vim-powerline.vim 插件必须)
- [ack](http://betterthangrep.com) (ack.vim 插件必须)
- [Exuberant Ctags](http://ctags.sourceforge.net) (taglist.vim 插件必须)
- [gvimfullscreen_win32](https://github.com/derekmcloughlin/gvimfullscreen_win32) (Windows 全屏扩展)

## INSTALL:

直接打开 Vim，会有惊喜哟：）

不过，正常情况下，还是得按步骤来。

- 如果已经存在 ~/.vim 文件夹以及 .vimrc, .gvimrc，请先做备份。
- 运行 `git clone https://github.com/cz848/portable-vimrc.git ~/.vim`。
- 运行 `cd ~/.vim`
- 运行 `ln -s vimrc ~/.vimrc`
- 运行 `ln -s gvimrc ~/.gvimrc`
- 运行 `vim`，理论上即可自动安装插件。
- vimrc 默认使用 PowerlineSymbols 字体，请安装 `PowerlineFonts` 中的字体, 以得到最好的显示效果。
- 为了能在 Windows 下全屏，请下载 gvimfullscreen 扩展，把 dll 文件放到 gVim 的安装目录($VIMRUNTIME)。

## PLUGINS:

- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-monokai](https://github.com/sickill/vim-monokai)
- [vim-monokai-refined](https://github.com/jaromero/vim-monokai-refined)
- [html.vim](https://github.com/xenoterracide/html.vim)
- [html5.vim](https://github.com/othree/html5.vim)
- [MatchTag](https://github.com/vim-scripts/MatchTag)
- [JavaScript-syntax](https://github.com/vim-scripts/JavaScript-syntax)
- [vim-javascript-syntax](https://github.com/jelera/vim-javascript-syntax)
- [vim-json](https://github.com/leshill/vim-json)
- [vim-haml](https://github.com/tpope/vim-haml)
- [scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim)
- [css3-mod](https://github.com/vim-scripts/css3-mod)
- [jslint.vim](https://github.com/hallettj/jslint.vim)
- [syntastic](https://github.com/scrooloose/syntastic)
- [jshint.vim--Stelmach](https://github.com/vim-scripts/jshint.vim--Stelmach)
- [lint.vim](https://github.com/joestelmach/lint.vim)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
- [IndentAnything](https://github.com/vim-scripts/IndentAnything)
- [Javascript-Indentation](https://github.com/vim-scripts/Javascript-Indentation)
- [vim-javascript](https://github.com/pangloss/vim-javascript)
- [vim-jsbeautify](https://github.com/maksimr/vim-jsbeautify)
- [vim-indent-guide](https://github.com/nathanaelkane/vim-indent-guides)
- [snipmate.vim](https://github.com/msanders/snipmate.vim)
- [snipmate-snippets](https://github.com/honza/snipmate-snippets)
- [scss-snippets](https://github.com/kwaledesign/scss-snippets)
- [neocomplcache](https://github.com/Shougo/neocomplcache)
- [supertab](https://github.com/ervandew/supertab)
- [HTML-AutoCloseTag](https://github.com/LeonB/HTML-AutoCloseTag)
- [vim-autoclose](https://github.com/Townk/vim-autoclose)
- [sparkup](https://github.com/rstacruz/sparkup)
- [zencoding-vim](https://github.com/mattn/zencoding-vim)
- [templates.vim](https://github.com/vim-scripts/templates.vim)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
- [mru.vim](https://github.com/vim-scripts/mru.vim)
- [LargeFile](https://github.com/vim-scripts/LargeFile)
- [FencView.vim](https://github.com/vim-scripts/FencView.vim)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [ack.vim](https://github.com/mileszs/ack.vim)
- [L9](https://github.com/vim-scripts/L9)
- [cecutil](https://github.com/vim-scripts/cecutil)
- [vim-powerline](https://github.com/Lokaltog/vim-powerline)
- [Mark--Karkat](https://github.com/vim-scripts/Mark--Karkat)
- [fcitx.vim](https://github.com/vim-scripts/fcitx.vim)
- [restart.vim](https://github.com/tyru/restart.vim)
- [taglist.vim](https://github.com/vim-scripts/taglist.vim)

## KEY MAPS: 
- CTRL-h (全模式)跳到左边的窗口
- CTRL-l (全模式)跳到右边的窗口
- CTRL-j (全模式)跳到上边的窗口
- CTRL-k (全模式)跳到下边的窗口
- CTRL-w CTRL-w (全模式)光标在窗口循环
- F3 (全模式)开关 Nerdtree 窗口
- F9 (全模式) quickfix 打开缓冲区
- F10 (全模式)开关 lint 语法检查
- F11 (全模式) Windows 下切换 gvim 全屏
- ;; (全模式) Mac 下切换 vim 全屏
- Tab (Insert)跳出自动补全窗口
- CTRL-P (Normal)打开 CtrlP 搜索栏
- ;cc (Insert/Visual)注释
- ;cu (Insert/Visual)取消注释
- ;ff (全模式)格式化 javascript 文件

更多精彩请参考 vimrc，gvimrc 文件。

