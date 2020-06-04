let s:goyo = 0

function! goyo#execute()
    if s:goyo
        call s:goyo_off()
        let s:goyo = 0
    else
        call s:goyo_on()
        let s:goyo = 1
    endif
endfunction

function! s:goyo_off()
    let &colorcolumn = s:colorcolumn
    let &foldcolumn = s:foldcolumn
    let &laststatus = s:laststatus
    let &number = s:number
    let &ruler = s:ruler
    let &showtabline = s:showtabline
endfunction

function! s:goyo_on()
    let s:colorcolumn = &colorcolumn
    let s:foldcolumn = &foldcolumn
    let s:laststatus = &laststatus
    let s:number = &number
    let s:ruler = &ruler
    let s:showtabline = &showtabline
    set colorcolumn-=+1
    set foldcolumn=12
    set laststatus=0
    set nonumber
    set noruler
    set showtabline=0
endfunction
