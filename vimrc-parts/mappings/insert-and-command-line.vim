" Exit insert mode
inoremap            jk              <Esc>
inoremap            kj              <Esc>

" Break undo sequence before performing <C-u>
inoremap            <C-u>           <C-g>u<C-u>

" Capitalize characters in word before the cursor
inoremap            <C-l>           <Esc>gUvb`]a

" Insert text from system clipboard as literal characters (instead of as if typed).
" Prevents 'clipboard hijacking' attacks.
inoremap            <C-r>+          <C-r><C-r>+
inoremap            <C-r>*          <C-r><C-r>*

" Insert path of current file
noremap!            <C-g><C-f>      <C-r>=(expand('%:h')==''?'.':expand('%:h'))<CR>/

" Insert date
inoremap <silent>   <C-g><C-t>
                                    \ <C-r>=repeat(complete(col('.'), map([
                                    \ "%A, %B %-d, %Y %-I:%M %p (%Z)",
                                    \ "%Y-%m-%d",
                                    \ "%Y %b %d",
                                    \ "%-I:%M %p",
                                    \ ], 'strftime(v:val)')), 0)<CR>

" vim: fdm=marker:colorcolumn+=21,37