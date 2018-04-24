" TODO: Refactor mappings
inoremap            jk              <Esc>
inoremap            kj              <Esc>

inoremap            <C-u>           <C-g>u<C-u>
" TODO: Should only work up to current cursor location, not entire word
inoremap            <C-l>           <Esc>gUiw`]a

" Insert text copied from system clipboard as literal characters (instead of as if typed)
" when using Ctrl-r in insert mode. This prevents 'clipboard hijacking' attacks.
inoremap            <C-r>+          <C-r><C-r>+
inoremap            <C-r>*          <C-r><C-r>*

" Insert date
" Credit: tpope
inoremap <silent>   <C-g><C-t>
                                    \ <C-r>=repeat(complete(col('.'), map([
                                    \ "%Y-%m-%d %H:%M:%S",
                                    \ "%Y-%m-%d",
                                    \ "%Y %b %d",
                                    \ "%d-%b-%y",
                                    \ "%a, %d %b %Y %H:%M:%S %z",
                                    \ "%a %b %d %T %Z %Y"
                                    \ ], 'strftime(v:val)')), 0)<CR>

" vim: fdm=marker:colorcolumn+=21,37
