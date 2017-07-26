" visual-search.vim
" Use * or # to search using the visually-selected text.
" Credit: godlygeek/vim-files/plugin/vsearch.vim

xnoremap * :<C-u>call VSetSearch()<CR>/<CR>
xnoremap # :<C-u>call VSetSearch()<CR>?<CR>

function! VSetSearch()
    let temp = @@
    normal! gvy
    let @/ = '\m\c\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    " Use this line instead of the above to match across lines
    " let @/ = '\m\c\V' . substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
    call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
    let @@ = temp
endfunction
