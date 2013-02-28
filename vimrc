" vim: set et sw=4 ts=4 sts=4 fdm=marker ff=unix fenc=utf8 nobomb:
" =========
" 基本配置
" =========
" {{{
set nocompatible                    " 不和vi模式兼容
set title                           " vim(终端)只显示文件名
set ttyfast                         " 设置快速终端。注意: 如果你通过远程或者慢速的连接访问Vim，建议你避免快速终端

set imdisable                       " 关闭输入法

set history=600                     " 保留历史记录
set nobackup                        " 取消自动备份

" 禁止错误时控制台响铃
set noerrorbells
set novisualbell
set t_vb=                           " 置空错误铃声的终端代码
set tm=500

set backspace=indent,eol,start      " 插入模式下使用 <BS>、<Del> <C-W> <C-U>，不兼容vi

syntax enable
syntax on                           "设置开启语法高亮

"设定vim环境文件夹
if has('win32') || has('win64')
    let $VIMFILES = $VIM.'/vimfiles'
elseif has("unix") || has('mac')
    let $VIMFILES = '~/.vim'
endif

" 用Vundle实现插件自动化安装
let isAutoInstallPlugins = 1
if isAutoInstallPlugins && filereadable(expand($VIMFILES.'/bundles.vim'))
    source $VIMFILES/bundles.vim
endif
" }}}

" =========
" 环境配置
" =========
" {{{
"界面元素
try
    colorscheme Monokai-Refined         "默认配色
catch
    try
        colorscheme desertEx
    catch
        colorscheme desert
    endtry
endtry
set guifont=PowerlineSymbols:h14    "默认字体(for powerline)
set guifont=Monaco:h14              "默认字体
set linespace=2                     "设置行高

" 标签页
set tabpagemax=20
set showtabline=2

" 命令行与状态行
" 获取当前目录
function! GetPWD()
    return substitute(getcwd(), "", "", "g")
endfunction
set cmdheight=1                 "命令行高
set laststatus=2                "始终显示状态行
set showcmd                     "状态行显示目前所执行的指令
"set stl=[File]%F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ %=\ [Line]%l,%c\ %=\ %P\ [PWD]%r%{GetPWD()}%h " 设置状态行显示的信息，用powerline时此行请注释

" 开启缩进
set autoindent
set smartindent

" 制表符
set tabstop=4                   "制表符的长度，统一为4个空格的宽度
set expandtab                   "用空格代替制表符
set smarttab
set shiftwidth=4                "用<<、>>调整缩进时的宽度
set softtabstop=4               " 使得按退格键时可以一次删掉 4 个空格
"针对html,js文件设置制表符格式
autocmd FileType html set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4

set matchpairs=(:),{:},[:],<:>,":",':'              "匹配括号的规则，增加针对html的<>

set list                                            "tab和行尾用特殊字符表示
set listchars=tab:>.,trail:⠿,extends:»,precedes:«   "设置行首尾空白符的占位字符

" set cursorline                                    "高亮光标所在行
set cursorcolumn                                    "高亮光标所在列

set wildmenu                                        "在输入命令时列出匹配项目（自动补全）
set wildignore+=.git,.git/*,*/.git/*                "忽略.git文件
set wildignore+=*.o,*~,*.pyc                        "忽略编译的文件
set wildignore+=*/tmp/*,*.so,*.swp,*.zip            " MacOSX/Linux，忽略临时目录/文件
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe         " Windows，忽略临时目录/文件，可执行文件

set lazyredraw                                      "执行宏的时候不需重绘（优化）

" 行控制
"set linebreak
set textwidth=120
set wrap

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 设置文本和注释的换行方式:
" t  文本自动换行
" c  注释自动换行,同时自动在行首添加注释标记
" r  当添加新行时自动添加注释符
" o  当用O和o开始新的一行时自动在行首添加注释符
" q  允许使用gq来格式化文本
" 2  第二行缩进两个字符
" v  采用老的vi换行方式,当你输入空格时换行
" b  在达到textwidth以前当输入空格时换行
" l  在插入模式下不换行,只用gq来完成相应的工作
set formatoptions+=crqvn

set autoread                        " 自动重新读入
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h:gs/ /\\ / | endif "切换当前窗口的当前路径到当前打开文件所在路径(不包含/tmp/)

" 代码折叠
set foldenable                      "打开默认折叠
set foldmethod=syntax               "设置为语法折叠
set foldnestmax=3                   " 折叠深度
set foldcolumn=0                    " 设置折叠区域的宽度
setlocal foldlevel=1                " 设置折叠层数为
" set foldclose=all                 " 设置为自动关闭折叠

"搜索设置
set noignorecase smartcase
set incsearch                       "实时显示搜索结果
set hlsearch                        "高亮结果
"搜索时正则设置哪些元字符要加反斜杠：
"magic(\m)：除了 $ . * ^ 之外其他元字符都要加反斜杠。
"nomagic(\M)：除了 $ ^ 之外其他元字符都要加反斜杠。
"这个设置也可以在正则表达式中通过 \m \M 开关临时切换。
set magic
" }}}

" =================
" 多语言环境
" 默认为 UTF-8 编码
" =================
" {{{
if has("multi_byte")
    set helplang=cn "设置帮助语言为中文
    set encoding=utf-8 "查找编码的规则
    set fileencodings=utf-8,gb18030,gbk,gb2312,cp936,big5,euc-jp,euc-kr,latin1,chinese "自动识别编码，正确显示中文
    set formatoptions+=mM "正确地处理中文字符的折行和拼接
    set nobomb " 不使用 Unicode 签名

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif

    if has("win32") | has('win64')
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
        let &termencoding=&encoding
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
" }}}

" ============
" 功能配置
" ============
" {{{
autocmd! BufWritePost vimrc source %:p "定义了一个自动命令，保存时重载配置

set diffexpr=MyDiff()
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" 保存文件时转换tab为空格，并自动删除行尾空格
autocmd BufWritePre *.css,*.scss,*.sass,*.styl,*.less,*.haml,*.htm,*.html,*.js,*.php silent! retab | silent! %s/\s\+$//ge

" 记录缓冲区，并恢复上次文件编辑的位置
set viminfo='10,\"100,:20,%,n~/.viminfo
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
" 设置字典 dict/文件的路径
autocmd FileType javascript setlocal dictionary=$VIMFILES/dict/javascript.dict
autocmd FileType css,scss setlocal dictionary=$VIMFILES/dict/css.dict
autocmd FileType html setlocal dictionary=$VIMFILES/dict/html.dict
autocmd FileType php setlocal dictionary=$VIMFILES/dict/php.dict
"自动完成
set complete+=k                 "增加字典自动完成
set completeopt=longest,menu

" 对js默认折叠
" autocmd FileType javascript setlocal foldenable
autocmd FileType javascript call JavaScriptFold()
" autocmd FileType javascript setlocal nocindent

function! JavaScriptFold()
    setlocal foldmethod=syntax
    setlocal foldlevelstart=1
    syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setlocal foldtext=FoldText()
endfunction

" 增加 ActionScript 语法支持
autocmd BufNewFile,BufRead,BufEnter,WinEnter,FileType *.as setfiletype actionscript

" css3语法支持
autocmd BufNewFile,BufRead,BufEnter,WinEnter,FileType *.css set filetype=css syntax=css3

" 各种文件全能补全，快捷方式^x^o
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css,scss set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" vim7.3 新增永久撤消功能
if has('persistent_undo')
    set undofile
    " 设置撤消文件存放目录
    if has('gui_macvim') || has('unix')
        let undo='$HOME/.vimundodir'
    else
        let undo='$VIMFILES/vimundodir'
    endif
    " 如果不存在则创建目录
    if !isdirectory(expand(undo))
        if has('unix') || has('mac')
            execute '!mkdir '.undo
        else
            execute '!md '.undo
        endif
    endif
    execute "set undodir=".undo
    set undolevels=1000
    set undoreload=10000
endif
" }}}

" ============
" 快捷方式
" ============
" {{{
let mapleader=";"
let g:mapleader=";"

inoremap <silent> <ESC> <ESC>:set imdisable<CR> " 退出插入模式时关闭输入法

"调试映射
autocmd FileType javascript,html imap <C-z> window.console&&console.log();<esc>hi
autocmd FileType javascript,html nmap <C-z> owindow.console&&console.log();<esc>hi
autocmd FileType javascript,html imap <C-l> alert();<esc>hi
autocmd FileType javascript,html nmap <C-l> oalert();<esc>hi
" 快捷补全，比如按$a替换为alert();
autocmd FileType javascript,html inoremap <buffer> $l window.console&&console.log();<esc>hi
autocmd FileType javascript,html inoremap <buffer> $a alert();<esc>hi

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>
" remap cmd+n to new tab
map <D-n> :tabnew<CR>
" map cmd+1~9 to switch tab 1~9
for i in range(1, 9)
    execute "nnoremap <D-".i."> ".i."gt"
endfor

" 在文件名上按gf时，在新的tab中打开
map gf :tabnew <cfile><CR>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动光标到上方窗口,需要<C-w><C-w>k,现在重映射为<C-k>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>0 :set filetype=vim<CR>
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>

" 重载当前文件
map <F5> :e%<CR>
nmap <F5> :e%<CR>
imap <F5> :e%<CR>
vmap <F5> :e%<CR>
cmap <F5> :e%<CR>
" }}}

" ============
" 插件配置
" ============
" {{{

" jsLint for Vim {{{
" let g:jslint_highlight_color  = '#996600'
" " 指定 jsLint 调用路径，通常不用更改
" let g:jslint_command = $VIMFILES.'/bundle/jslint.vim/bin'
" " 指定 jsLint 的启动参数，可以指定相应的配置文件
" let g:jslint_command_options = '-nofilelisting -nocontext -nosummary -nologo -process'
" " 指定快捷键
" map <F10> :call JavascriptLint()<CR>
" imap <F10> <esc>:call JavascriptLint()<CR>
"}}}

" Jsbeautify {{{
" 格式化 JavaScript 文件
" autocmd FileType javascript map <F12> :call g:Jsbeautify()<CR>
" }}}

" mark.vim {{{
" 给各种tags标记不同的颜色，便于观看调式的插件。
" \m  标记或去除标记光标处的单词
" \r  输入正则，用于搜索
" \n  清除当前标记，或清除所有高亮的标记
" \*  当前MarkWord的下一个     \#  当前MarkWord的上一个
" \/  所有MarkWords的下一个    \?  所有MarkWords的上一个
" }}}

" NERD_tree.vim {{{
" 以树状方式浏览系统中的文件和目录
" :NERDtree 打开NERD_tree        :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
let NERDTreeWinSize=22
let NERDTreeIgnore=['\.o$','\.bak$']  "隐藏.o，.bak文件
"设定文件浏览器目录为当前目录
set browsedir=buffer
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
vmap <F3> <ESC>:NERDTreeToggle<CR>
cmap <F3> <ESC>:NERDTreeToggle<CR>
" }}}

" NERD_commenter.vim {{{
" 给代码添加注释
" [count]<leader>cc 光标以下count行逐行添加注释(7,cc)
" [count]<leader>cu 光标以下count行逐行取消注释(7,cu)
" [count]<leader>cm 光标以下count行尝试添加块注释(7,cm)
" <leader>cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看
"定义快捷键
if has('mac') || has('gui_macvim')
    map <D-/> <Plug>NERDCommenterToggle
    imap <D-/> <C-O><Plug>NERDCommenterToggle
    vmap <D-/> <Plug>NERDCommenterToggle
else
    map <M-/> <Plug>NERDCommenterToggle
    imap <M-/> <C-O><Plug>NERDCommenterToggle
    vmap <M-/> <Plug>NERDCommenterToggle
endif
" }}}

" MRU {{{
let MRU_Max_Entries=1000
map <F9> :MRU<CR>
imap <F9> <C-O>:MRU<CR>
vmap <F9> <C-O>:MRU<CR>
cmap <F9> <C-O>:MRU<CR>
" }}}

" Powerline {{{
set t_Co=256
let g:Powerline_symbols='fancy'
" }}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType="<C-n>"
let g:SuperTabContextDefaultCompletionType="<C-n>"
" }}}

" FencView {{{
let g:fencview_autodetect = 1
" }}}

" Taglist {{{
let g:tlist_javascript_settings = 'javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'
" }}}

" ctrlP

" Sparkup {{{
let g:sparkupExecuteMapping='<D-e>'
let g:sparkupNextMapping='<D-m>'
" }}}

" lint.vim {{{
let lint_default = 0
map <F10> :LintVimToggle<CR>
imap <F10> <esc>:LintVimToggle<CR>
" }}}

" Indent Guide {{{
" 默认快捷键<leader>ig
let g:indent_guides_guide_size=1
" }}}

" }}}
