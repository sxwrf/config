"输入法
function! Fcitx2en()
      let l:a = system("fcitx-remote -c")
endfunction

autocmd InsertLeave * call Fcitx2en()
