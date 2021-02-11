nnoremap <leader><leader>c vapk:s/^/#<CR>
nnoremap <leader><leader>b vapk:s/#/<CR>
nnoremap <leader>c 0i#<ESC>
nnoremap <leader>b 0x<ESC>
inoremap ## #{{{<ESC>o#}}}<ESC>?#<CR>na

iabbrev of movl $5, %eax<CR>movl $miaoshufu, %ebx<CR>movl $0, %ecx<CR>movl $0666, %edx<CR>int $0x80
iabbrev rf movl $3, %eax<CR>movl $miaoshufu, %ebx<CR>movl $buffer, %ecx<CR>movl $len, %edx<CR>int $0x80
iabbrev wf movl $4, %eax<CR>movl $buffer, %ecx<CR>movl $len, %edx<CR>int $0x80
iabbrev cf movl $6, %eax<CR>movl $miaoshufu, %ebx<CR>int $0x80
iabbrev rt movl $1, %eax<CR>int $0x80

"asm模板{{{
func! Sethead()
    let b:line=0
    let b:line+=1 | call setline(b:line,"# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #")
    let b:line+=1 | call setline(b:line,"#")
    let b:line+=1 | call setline(b:line,"#       文件名: ".expand("%"))
    let b:line+=1 | call setline(b:line,"#       作者: sxwrf@hotmail.com   创建日期: ".strftime("%F %R"))
    let b:line+=1 | call setline(b:line,"#       修改日期: ")
    let b:line+=1 | call setline(b:line,"#       功能: ")
    let b:line+=1 | call setline(b:line,"#")
    let b:line+=1 | call setline(b:line,"#       接收参数: ")
    let b:line+=1 | call setline(b:line,"#       返回参数: ")
    let b:line+=1 | call setline(b:line,"#       调用函数: ")
    let b:line+=1 | call setline(b:line,"#       被以下模块调用: ")
    let b:line+=1 | call setline(b:line,"#")
    let b:line+=1 | call setline(b:line,"# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #")
    let b:line+=1 | call setline(b:line,"")
    let b:line+=1 | call setline(b:line, ".section .data")
    let b:line+=1 | call setline(b:line, ".section .bss")
    let b:line+=1 | call setline(b:line, ".section .text")
    let b:line+=1 | call setline(b:line, ".globl _start")
    let b:line+=1 | call setline(b:line, "_start:")
    let b:line+=1 | call setline(b:line, "")
    let b:line+=1 | call setline(b:line, "")
    let b:line+=1 | call setline(b:line, "")
    let b:line+=1 | call setline(b:line, "")
    let b:line+=1 | call setline(b:line, "movl $1, %eax")
    let b:line+=1 | call setline(b:line, "movl $0, %ebx")
    let b:line+=1 | call setline(b:line, "int $0x80")
    unlet b:line
    normal gg=G
endfunc
"}}}
