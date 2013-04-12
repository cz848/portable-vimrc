" vim: set et sw=4 ts=4 sts=4 ff=unix fenc=utf8:
" ==============
" Vundle管理插件
" ==============
let hasVundle=1
let root = expand($VIMFILES.'/bundle/vundle')
let src = 'http://github.com/gmarik/vundle.git'

if !isdirectory(expand(root))
    echo 'Installing Vundle...'
    echo ''
    execute 'silent !mkdir '.root
    execute 'silent !git clone '.src.' '.root
    let hasVundle=0
endif

"filetype off
runtime macros/matchit.vim

execute 'set runtimepath+='.root
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
" Version
Bundle 'tpope/vim-fugitive'

" Color
Bundle 'sickill/vim-monokai'
Bundle 'jaromero/vim-monokai-refined'

" Syntax
Bundle 'xenoterracide/html.vim'
Bundle 'othree/html5.vim'
Bundle 'MatchTag'
" Bundle 'JavaScript-syntax'
"Bundle 'jelera/vim-javascript-syntax'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-haml'
"Bundle 'cakebaker/scss-syntax.vim'
Bundle 'css3-mod'

" Syntax check
"Bundle 'hallettj/jslint.vim'
"Bundle 'scrooloose/syntastic'
"Bundle 'jshint.vim--Stelmach'
Bundle 'joestelmach/lint.vim'

" Comment
Bundle 'scrooloose/nerdcommenter'

" Indent
"Bundle 'IndentAnything'
"Bundle 'Javascript-Indentation'
"Bundle 'pangloss/vim-javascript'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'nathanaelkane/vim-indent-guides'

" Complete
" Bundle 'msanders/snipmate.vim'
" Bundle 'honza/snipmate-snippets'
"Bundle 'kwaledesign/scss-snippets'
"Bundle 'Shougo/neocomplcache'
Bundle 'ervandew/supertab'
" Bundle 'LeonB/HTML-AutoCloseTag'
Bundle 'Townk/vim-autoclose'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'mattn/zencoding-vim'
"Bundle 'templates.vim'

" File manage
Bundle 'scrooloose/nerdtree'
"Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mru.vim'
Bundle 'LargeFile'
Bundle 'FencView.vim'
Bundle 'kien/ctrlp.vim'

" Search
if executable('ack')
    Bundle 'mileszs/ack.vim'
endif

" Library
"Bundle 'L9'
"Bundle 'cecutil'

" General
Bundle 'Lokaltog/vim-powerline'
"Bundle 'Mark--Karkat'
"Bundle 'fcitx.vim'
Bundle 'tyru/restart.vim'
if executable('ctags')
    Bundle 'taglist.vim'
endif

" 开始安装
if hasVundle == 0
    echo 'Installing Bundles...'
    echo ''
    :BundleInstall
endif

"实现全能补全功能，并打开文件类型检测
" filetype plugin indent on

