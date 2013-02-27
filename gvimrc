" vim: set et sw=4 ts=4 sts=4 fdm=marker ff=unix fenc=utf8 nobomb:
" =========
" 图形界面
" =========
" 默认配色
"color desert
set background=dark

"设置菜单语言
if has("multi_byte")
    set langmenu=zh_cn
endif

" 禁止默认的快捷键
macmenu &File.New\ Window key=<nop>

if has('gui_running')
    " 只显示菜单
    "set guioptions=mcr
    set guioptions-=b       "隐藏底部滚动条
    set guioptions-=R       "隐藏右边滚动条
    set guioptions-=r
    set guioptions-=L       "隐藏左边滚动条
    set guioptions-=l
    set guioptions-=T       "隐藏工具栏
    "set guioptions-=m      "隐藏菜单栏
    set t_Co=256
endif

"在所有模式下都允许使用鼠标，还可以是n,v,i,c等
if has('mouse')
    set mouse=a             "允许使用鼠标
endif

if has("win32") || has("win64")
    " Windows 兼容配置
    source $VIMRUNTIME/mswin.vim

    " f11 最大化
    map <f11> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>

    " 字体配置
    exec 'set guifont='.iconv('Courier_New', &enc, 'gbk').':h11:cANSI'
    "set guifont=Droid\ Sans\ Mono:h14
    exec 'set guifontwide='.iconv('微软雅黑', &enc, 'gbk').':h11'

    " 自动最大化窗口
    autocmd GUIEnter * simalt ~x

elseif has("unix") && !has("gui_macvim")
    "默认字体
    set guifont=Courier\ 10\ Pitch\ 11
    set guifontwide=YaHei\ Consolas\ Hybrid\ 11

elseif has("mac") || has("gui_macvim")
    "默认字体
    set guifont=Monaco:h14
    set guifontwide=Microsoft\ YaHei:h14

    "全屏配置
    let s:lines=&lines
    let s:columns=&columns
    function! FullScreenEnter()
        winpos 0 0
        set lines=999 columns=999
        set fu
    endfunction
    function! FullScreenLeave()
        let &lines=s:lines
        let &columns=s:columns
        set nofu
    endfunction
    function! FullScreenToggle()
        if &fullscreen
            call FullScreenLeave()
        else
            call FullScreenEnter()
        endif
    endfunction
    " 打开时全屏
    autocmd GUIEnter * call FullScreenEnter()

    " 按 <Leader><Leader> 切换全屏
    map <Leader><Leader>  :call FullScreenToggle()<cr>
endif


" ============
" 功能配置
" ============

" 保存/载入会话，便于项目管理
set sessionoptions+=unix,slash  " 让会话文件同时兼容unix 和 Windows 的vim使用

"存取会话内容
function! GetSessionPath(...)
    if !exists("a:1") || a:1 == 0
        let path = ""
    else
        let path = ".".a:1
    endif
    if has('win32') || has('win64')
        let path = '$HOME/session'.path
    else
        let path = '~/.session'.path
    endif
    return path
endfunction
function! GetSession(...)
    if argc() == 0 "在vim不带参数时执行
        let path=0
        if exists("a:1") "如果有带参数
            let path=a:1
        endif
        let path=GetSessionPath(path)
        let success=0
        if filereadable(expand(path.".vim"))
            execute "source ".path.".vim"
            let success+=1
        endif
        if filereadable(expand(path.".viminfo"))
            execute "rviminfo ".path.".viminfo"
            let success+=1
        endif
        if success == 2
            echo "load success: ".path
        endif
    endif
endfunction

function! SetSession(...)
    let path=0
    if exists('a:1')
        let path=a:1
    endif
    let path=GetSessionPath(path)
    execute "mksession! ".path.".vim"
    execute "wviminfo! ".path.".viminfo"
    echo "save success: ".path
endfunction
" 输入:LOAD path 载入会话
command! -nargs=* LOAD call GetSession(<f-args>)
" 输入:SAVE path 保存会话
command! -nargs=* SAVE call SetSession(<f-args>)
" 自动保存/载入会话
" autocmd VimEnter * LOAD
" autocmd VimLeave * SAVE
" nnoremap <C-S-s> SAVE<cr>
" nnoremap <C-S-o> LOAD<cr>

autocmd! bufwritepost gvimrc source %:p "自动命令，保存时重载配置
