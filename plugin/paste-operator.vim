" " TODO: Release on github
" " Use gp as an operator to paste over a region of text without clobbering the default register. To
" " use a different set of keys than gp, insert the following mappings in your vimrc and tweak as
" " desired.

" " Default Mappings:
" " xmap gp  <Plug>Paste
" " nmap gp  <Plug>Paste
" " nmap gpp <Plug>PasteLine

" xnoremap <silent> <Plug>Paste     :<C-u>call <SID>paste(visualmode())<CR>
" nnoremap <silent> <Plug>Paste     :<C-u>set opfunc=<SID>paste<CR>g@
" nnoremap <silent> <Plug>PasteLine :<C-u>set opfunc=<SID>paste<Bar>exe 'norm! 'v:count1.'g@_'<CR>

" if !hasmapto('<Plug>Paste') || maparg('gs', 'n') ==# ''
"   xmap gp  <Plug>Paste
"   nmap gp  <Plug>Paste
"   nmap gpp <Plug>PasteLine
" endif

" function! s:paste(type) abort
"   let saved_unnamed_register = @@
"   if a:type ==# 'v' || a:type ==# 'V'
"     normal! gvp
"   elseif a:type ==# 'char'
"     normal! `[v`]p
"   elseif a:type ==# 'line'
"     normal! `[V`]p
"   else
"     return
"   endif
"   let @@ = saved_unnamed_register
" endfunction
