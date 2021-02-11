if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=AsmIndent()
setlocal indentkeys+=o,O,*<Return>,0[,],0;,0#,=,!^F,*<ESC>,*<CR>,*<SPACE>

function! AsmIndent()
    let l:cline = getline(v:lnum)

        "段设置
    if l:cline =~ '^\s*\.\(equ\)\|\(globl\)\|\(include\)\|\(section\)\+.*$'
        return 0

        "数据类型
    elseif l:cline =~ '^\s*\.\(ascii\)\|\(asciz\)\|\(byte\)\|\(double\)\|\(float\)\|\(int\)\|\(long\)\|\(octa\)\|\(quad\)\|\(short\)\|\(single\)\|\(long\)\+.*$'
        return 8

        "注释
    elseif l:cline =~ '^#.*'
        return 0
        "标签
    elseif l:cline =~ '^\s*\S\+:.*'
        return 4 
    endif

    return 8 
endfunction
exec "normal gg=G"
