inoremap { {<CR>}<ESC>O
nnoremap <leader><leader>c vapk:s/^/\/\/<CR>
nnoremap <leader><leader>b vapk:s/\/\//<CR>
nnoremap <leader>c 0i//<ESC>
nnoremap <leader>b :s/\/\//<CR><ESC>
inoremap ## /* */<ESC>F s

iabbrev #< #include <><ESC>h
iabbrev #i #include "<ESC>
iabbrev #d #define 

func! Sethead()
    let b:numline=0
    let b:numline+=1 | call setline(b:numline,"/*    文件名: ".expand("%"))
    let b:numline+=1 | call setline(b:numline,"*    修改日期: ".strftime("%Y-%m-%d"))
    let b:numline+=1 | call setline(b:numline,"*/")
    let b:numline+=1 | call setline(b:numline,"")
    let b:numline+=1 | call setline(b:numline, "#include <stdio.h>")
    let b:numline+=1 | call setline(b:numline, "")
    let b:numline+=1 | call setline(b:numline, "int main(){")
    let b:numline+=1 | call setline(b:numline, "")
    let b:numline+=1 | call setline(b:numline, "}")
    normal gg=G
endfunc
"
