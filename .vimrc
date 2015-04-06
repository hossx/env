syntax on
syntax enable
source ~/.chm.vim
set nu
set incsearch
imap <CR> <ESC>
vmap <CR> <ESC>
set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,chinese,big5,euc-jp,euc-kr,latin1
set nowrap
"set fdm=indent
nmap <F3> :Tlist<CR>
nmap <F2> :WMToggle<CR>
nmap <F4> :set spell<CR>
nmap <F5> :set nospell<CR>
imap <F4> <ESC>:set spell<CR>a
imap <F5> <ESC>:set nospell<CR>a
nmap <F6> :set paste<CR>
nmap <F7> :set nopaste<CR>
imap <F6> <ESC>:set paste<CR>
imap <F7> <ESC>:set nopaste<CR>
nmap <F8> :%s/\s\+$//g<CR>
map <F12> :ConqueTermSplit bash<CR>
let g:ConqueTerm_EscKey = '<NL>'
filetype plugin indent on
"set completeopt=longest,menu
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"
imap <TAB> <C-n>
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
let Tlist_Sort_Type = "name" " order by
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript
set autoindent
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set et
"set wrap
nmap j gj
nmap k gk
set colorcolumn=81,121
hi ColorColumn ctermbg=darkgrey guibg=darkgrey
set tags=tags;/
"colorschem desert
set helplang=cn

"--ctags setting--
map <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags
set tags+=~/GATE_7.1/src/tags
set tags+=~/work/src/tz/tags

"let g:NERDTree_title="[NERD Tree]"

"--winmanager setting--
"let g:winManagerWindowLayout='TagList|FileExplorer,BufExplorer'
let g:winManagerWindowLayout="NERDTree|TagList"
let g:bufExplorerMaxHeight=30
let g:winManagerWidth=50
"nmap wm :WMToggle<CR>
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
let g:persistentBehaviour=0 "如果所有编辑文件都关闭了，退出vim

"--Tlist setting--
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在左边，1的话就是显示在右边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
"let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动退出vim
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0
nmap tl :Tlist<CR>

let mapleader="," "Set mapleader

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavArrows = 1

nmap be :BufExplorer<CR>

autocmd BufNewFile *.sh,*.py,*.cpp,*.java,*.js exec ":call SetTitle()"

func SetTitle()
    if &filetype == 'sh'
        call setline(1, "#!/bin/sh")
        call setline(2, "#")
        call setline(3, "# Copyright 2014 Coinport Inc. All Rights Reserved.")
        call setline(4, "# Author: c@coinport.com (Chao Ma)")
    elseif &filetype == 'python'
        call setline(1, "#!/usr/bin/python")
        call setline(2, "# -*- coding: utf-8 -*-")
        call setline(3, "#")
        call setline(4, "# Copyright 2014 Coinport Inc. All Rights Reserved.")
        call setline(5, "")
        call setline(6, "__author__ = 'c@coinport.com (Ma Chao)'")
        call setline(7, "")
        call setline(8, "def main():")
        call setline(9, "    pass")
        call setline(10, "")
        call setline(11, "if __name__ == '__main__':")
        call setline(12, "    main()")
    else
        call setline(1, "/**")
        call setline(2, " * Copyright 2014 Coinport Inc. All Rights Reserved.")
        call setline(3, " * Author: c@coinport.com (Chao Ma)")
        call setline(4, " */")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

au! BufRead,BufNewFile *.thrift setfiletype thrift
