" update.vim
" :Update

command! Update call s:Update()

function! s:Update() abort
    let buffer_name = bufname('%')
    if buffer_name == ''
        call feedkeys(":saveas \<C-d>")
    else
        update
    endif
endfunction

