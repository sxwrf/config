" 2021-02-22  zo打开折叠 zc关闭 zi打开关闭所有折叠（取反）

"一：插件设置{{{1
"          1.vim-plug {{{2
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim'
call plug#end()
"}}}
"          2.nerdtree {{{2
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
"}}}
"          3.ale {{{2
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 10
let g:ale_echo_delay = 200
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -std=gnu18'
let g:ale_cpp_gcc_options = '-Wall -std=c++14'
let g:ale_completion_autoimport = 1
let g:ale_disable_lsp = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'
"}}}
"          4.tagbar {{{2
" Set width of the Tagbar window
let g:tagbar_width = 30
" consur stays on tagbar window, default is on vim window
let g:tagbar_autofocus = 1
"}}}
"}}}

"二：基本设置{{{1
set nocompatible
filetype plugin indent on
syntax on
set cindent
set autoindent
set fileencodings=utf-8,ucs-bom
set encoding=utf-8
set number
set ruler
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4 expandtab
set showcmd
set cmdheight=2
set history=50
set cursorline
set t_Co=16
set scrolloff=8
set iskeyword+=-,_,%
set wildmenu
set wildmode=full
set foldmethod=marker
set foldmarker={{{,}}}
set foldclose=
set background=dark
colorscheme  spacecamp
hi MatchParen ctermbg=none ctermfg=red
au BufNewFile *.c,*.s,*.go  call Sethead()

set fillchars=fold:\ 
set foldtext=substitute(getline(v:foldstart),'\"\\\|/\\*\\\|\\*/\\\|{\{{\\d\\=','','g')
"}}}

"三: 键位设置 {{{1
let mapleader = "±"
nnoremap <silent><F5>       :vs $MYVIMRC<CR>
nnoremap <silent><F6>       :w<cr>:source $MYVIMRC<CR>
nnoremap <silent><F2>       :TagbarToggle<CR>  
nnoremap <silent><F1>       :NERDTreeMirror<CR>
nnoremap <silent><F1>       :NERDTreeToggle<CR>
nnoremap <silent><F4>       :set hls!<CR>
inoremap <leader><leader>   <C-w>
nnoremap <leader><leader>   daw
nnoremap <leader>d          vapd
nnoremap <leader>u          gUaw
inoremap <leader>u          <ESC>gUawea
inoremap <leader>n          <C-n>
inoremap <leader>o          <C-o>zz
nnoremap <leader>o          zz
nnoremap <leader><left>     10<c-W><
nnoremap <leader><right>    10<c-W>>
nnoremap <leader><up>       10<c-W>+
nnoremap <leader><down>     10<c-W>-
nnoremap <leader>=          gg=G``
nnoremap j                  gj
nnoremap qq                 :wq<CR>
nnoremap k                  gk
inoremap (                  ()<ESC>i
inoremap [                  []<ESC>i
inoremap "                  ""<ESC>i
inoremap {                  {}<ESC>i
inoremap '                  ''<ESC>i
inoremap <silent><leader>j  <c-r>=strftime("%Y-%m-%d")<cr>
inoremap <TAB>              <C-R>=SkipPair()<CR>
"}}}

"四: 函数定义{{{1
"        1.一键编译{{{2
nnoremap <leader>r    :call Gcc()<CR><CR>
func! Gcc()
    exec "w"

    if &filetype=='c'
        exec "!gcc -Wall % -o %<"
        exec "!time ./%<"

    elseif &filetype=='asm' 
        exec "!as % -g -o %<.o --32"
        exec "!ld %<.o -o %<.exe -m elf_i386"
        exec "!./%<.exe"

    elseif &filetype=='markdown' 
        silent let l:a = system ("google-chrome ". expand('%'))

    elseif &filetype=='go' 
        exec "!go run %"
        exec "!"
    endif
endfunc
"}}}
"        2.跳出括号"{{{2
func! SkipPair()
    if 
                \ getline('.')[col('.') - 1] == ')' || 
                \ getline('.')[col('.') - 1] == ']' || 
                \ getline('.')[col('.') - 1] == '}' ||
                \ getline('.')[col('.') - 1] == '"' ||
                \ getline('.')[col('.') - 1] == "'" ||
                \ getline('.')[col('.') - 1] == ">" 
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunc
"}}}
"}}}
