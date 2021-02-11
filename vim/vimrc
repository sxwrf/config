"       修改日期: :2019-4-3 


"       插件管理
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

" nerdtree
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31


" YouCompleteMe相关配置
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                  "关闭语法提示
let g:ycm_complete_in_comments=1                   " 补全功能在注释中同样有效
let g:ycm_confirm_extra_conf=0                     " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 标签补全引擎
let g:ycm_min_num_of_chars_for_completion=1        " 从第一个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                         " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1           " 语法关键字补全
let g:ycm_goto_buffer_command = 'horizontal-split' " 跳转打开上下分屏

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "sh":1,
			\ "zsh":1,
			\ }

" ale 配置
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -std=gnu18'
let g:ale_cpp_gcc_options = '-Wall -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''


"基本设置 默认认文件类型C 自动缩进等 
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
set textwidth=80
set showcmd
set history=50
set cursorline
set t_Co=16
set scrolloff=8
set background=dark
set iskeyword+=-,_,%
set wildmenu
set wildmode=full

colorscheme  spacecamp

"自动命令
au BufNewFile *.c,*.s call Sethead()

"通用键位设置
let mapleader = "±"
nnoremap <F1> :NERDTreeMirror<CR>
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :vs $MYVIMRC<CR>
nnoremap <F4> :set hls!<CR>
inoremap <leader><leader> <C-w>
nnoremap <leader><leader> daw
nnoremap <leader>d vapd
nnoremap <leader>u gUaw
inoremap <leader>u <ESC>gUawea
inoremap <leader>n <C-n>
inoremap <leader>o <C-o>zz
nnoremap <leader>o zz
nnoremap <leader>r :call Gcc()<CR><CR>
inoremap <TAB> <C-R>=SkipPair()<CR>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
nnoremap <leader><left> <c-W><<c-W><<c-W><<c-W><<c-W><
nnoremap <leader><right> <c-W>><c-W>><c-W>><c-W>><c-W>
"

"编译文件
func! Gcc()
    exec "w"
    if &filetype=='c'
        exec "!gcc -Wall % -o %<"
        exec "!time ./%<"
    elseif &filetype=='asm' 
        exec "!as % -g -o %<.o --32"
        exec "!ld %<.o -o %<.exe -m elf_i386"
        exec "!./%<.exe"
    elseif &filetype=='pic' 
        exec "!pic % | groff | ps2eps > %<.es"
        exec "!pic % | groff | ps2eps > %<.pdf"
        exec "!evince -w %<.pdf"
    endif
endfunc

"按TAB跳出括号
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
