" visual-to-new-buffer.vim

" TODO-HIGH: Figure out use cases and how to properly setup

function! s:VisualSelectionToNewBuffer()
    let ft = &ft
    let temp = @"
    silent normal! gvy
    split
    enew
    let &ft = ft
    normal! Vp
    let @" = temp
endfunction
command! VisualSelectionToNewBuffer call s:VisualSelectionToNewBuffer()
