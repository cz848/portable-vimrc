" ==============
" Vundle管理插件
" ==============
let hasVundle=1
let root = '~/.vim/bundle/vundle'
let src = 'http://github.com/gmarik/vundle.git'

if !isdirectory(expand(root))
    echo 'Installing Vundle...'
    exec '!mkdir -p '.root
    exec '!git clone '.src.' '.root
    let hasVundle=0
endif

"filetype off
runtime macros/matchit.vim

exec 'set runtimepath+='.root
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
" Version
Bundle 'tpope/vim-fugitive'

" Color
Bundle 'sickill/vim-monokai'

" Syntax
Bundle 'xenoterracide/html.vim'
Bundle 'othree/html5.vim'
Bundle 'MatchTag'
Bundle 'JavaScript-syntax'
"Bundle 'Enhanced-Javascript-syntax'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-haml'
"Bundle 'cakebaker/scss-syntax.vim'
Bundle 'css3-mod'

" Syntax check
"Bundle 'hallettj/jslint.vim'
"Bundle 'scrooloose/syntastic'
"Bundle 'jshint.vim--Stelmach'
Bundle 'joestelmach/lint.vim'

" Indent
"Bundle 'IndentAnything'
"Bundle 'Javascript-Indentation'
"Bundle 'pangloss/vim-javascript'
Bundle 'jsbeautify'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'ervandew/supertab'

" Complete
"Bundle 'HTML-AutoCloseTag'
Bundle 'Townk/vim-autoclose'
"Bundle 'kwaledesign/scss-snippets'
"Bundle 'Shougo/neocomplcache'

" File
Bundle 'scrooloose/nerdtree'
"Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mru.vim'
Bundle 'LargeFile'
Bundle 'FencView.vim'
Bundle 'kien/ctrlp.vim'

" Search
Bundle 'mileszs/ack.vim'

" Library
"Bundle 'L9'
"Bundle 'cecutil'

" Plugin
Bundle 'Lokaltog/vim-powerline'
Bundle 'The-NERD-Commenter'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'mattn/zencoding-vim'
"Bundle 'templates.vim'
"Bundle 'Mark'
"Bundle 'fcitx.vim'
Bundle 'restart.vim'
Bundle 'taglist.vim'

"实现全能补全功能，并打开文件类型检测
filetype plugin indent on       " required!

"au VimEnter * BundleInstall  " 开始安装
if hasVundle == 0
    echo "Installing Bundles..."
    :BundleInstall
endif
