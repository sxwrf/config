" Vim color file
"
set bg=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "mycolors"

hi Character	        ctermfg=7
hi Conditional          ctermfg=7
hi Constant             ctermfg=7	
hi Normal               ctermfg=none
hi Repeat               ctermfg=7
hi Structure	        ctermfg=13
hi StorageClass         ctermfg=13
hi Type                 ctermfg=11
hi Statement            ctermfg=7
hi Operator             ctermfg=1
hi Todo                 ctermfg=9
hi Label                ctermfg=1
hi PreProc              ctermfg=4
hi PreCondit            ctermfg=1	
hi Special         	    ctermfg=1	
hi String               ctermfg=7
hi Number	            ctermfg=7
hi Comment              ctermfg=8
hi Option               ctermfg=5
hi Define               ctermfg=5
hi Event                ctermfg=2
hi Function             ctermfg=12
hi Error                ctermbg=7 ctermfg=9
