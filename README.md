portable-vimrc
=========

##README:

我本人的vim配置文件，仅在工作中使用。
此配置纯属东拼西凑，如有雷同，概不负责。
此配置把一些只在图形化界面中使用的配置参数单独加到 gvimrc 中，以避免 vimrc 负荷过重:P
此配置在东拼西凑的基础上立求每项参数都能通俗易懂，所以基本没有简写，而且每项都有注释（有些是自己的理解）。
此配置暂时只测试了 Mac 环境，之后会逐步测试其他平台。

##PRE-INSTALL:

此配置文件假设你对 vim 有一定了解，并且本地安装有 Git(1.7+), Vim(7.3+) 或 MacVim(OS X), Python 2(vim-powerline.vim 插件需要 python 环境), ack(ack.vim插件必须), ctags(taglist.vim插件必须)。

##INSTALL:

如果已经存在 ~/.vim 文件夹以及 .vimrc, .gvimrc，请先做备份。
运行 git clone https://github.com/cz848/portable-vimrc.git ~/.vim。
运行 vim，理论上即可自动安装插件。
vimrc 默认使用 PowerlineSymbols 字体，请安装 PowerlineFonts/PowerlineSymbols.ttf 中的字体, 以得到最好的显示效果。

##PLUGINS:

" Version
- vim-fugitive'

" Color
- sickill/vim-monokai'

" Syntax
- xenoterracide/html.vim'
- othree/html5.vim'
- MatchTag'
- JavaScript-syntax'
"- Enhanced-Javascript-syntax'
- leshill/vim-json'
- tpope/vim-haml'
"- cakebaker/scss-syntax.vim'
- css3-mod'

" Syntax check
"- hallettj/jslint.vim'
"- scrooloose/syntastic'
"- jshint.vim--Stelmach'
- joestelmach/lint.vim'

" Indent
"- IndentAnything'
"- Javascript-Indentation'
"- pangloss/vim-javascript'
- jsbeautify'
"- ervandew/supertab'

" Complete
"- HTML-AutoCloseTag'
- Townk/vim-autoclose'
"- kwaledesign/scss-snippets'
"- Shougo/neocomplcache'

" File
- scrooloose/nerdtree'
"- jistr/vim-nerdtree-tabs'
- mru.vim'
- LargeFile'
- FencView.vim'
- kien/ctrlp.vim'

" Search
- mileszs/ack.vim'

" Library
"- L9'
"- cecutil'

" Plugin
- Lokaltog/vim-powerline'
- The-NERD-Commenter'
- rstacruz/sparkup', {'rtp': 'vim/'}
"- mattn/zencoding-vim'
"- templates.vim'
"- Mark'
"- fcitx.vim'
- restart.vim'
- taglist.vim'

- vundle                ` vim 插件管理工具。
- fugitive.vim
- ack.vim
- nerdtree
- ctrlp
- The-NERD-Commenter
- Indent Guides
- vim-powerline
- taglist
vim-json

vim-less

vim-web-indent

HTML-AutoCloseTag

css3-mod

zencoding-vim

sudo.vim

vim-markdown

常用快捷键:

CTRL-h (全模式)跳到左边的窗口。
CTRL-l (全模式)跳到右边的窗口。
CTRL-j (全模式)跳到上边的窗口。
CTRL-k (全模式)跳到下边的窗口。
CTRL-w CTRL-w (全模式)光标在窗口循环。
F4 (全模式)开关 Nerdtree 窗口
F5 (全模式)开关 tagbar 窗口
F6 (全模式)开关 Gundo 窗口
F12 (Insert)跳过一个字符
Tab (Normal)跳转到 minibufexpl 栏
,w (Normal)快速保存
,q (Normal)关闭当前buffer
CTRL-P (Normal)打开 CtrlP 搜索栏
,cc (Insert/Visual)注释
,cu (Insert/Visual)取消注释
,/ (Normal)清除高亮的搜索结果
w!! (Command)对需要 sudo 的文件进行写操作
,a (Normal)快速打开 C 语言文件对应的头文件
更多自定义的快捷键请参考vimrc文件。
