" TODO: use kana/vim-operator-user?
" TODO: Release on github
" Use gs as an operator to source vimscript. To use a different set of keys than gs, insert the
" following mappings in your vimrc and tweak as desired.

" Default Mappings:
" xmap gs  <Plug>SourceVimscript
" nmap gs  <Plug>SourceVimscript
" nmap gss <Plug>SourceVimscriptLine

xnoremap <silent> <Plug>SourceVimscript     :<C-u>call <SID>go(visualmode())<CR>
nnoremap <silent> <Plug>SourceVimscript     :<C-u>set opfunc=<SID>go<CR>g@
nnoremap <silent> <Plug>SourceVimscriptLine :<C-u>set opfunc=<SID>go<Bar>exe 'norm! 'v:count1.'g@_'<CR>

if !hasmapto('<Plug>SourceVimscript') || maparg('gs', 'n') ==# ''
  xmap gs  <Plug>SourceVimscript
  nmap gs  <Plug>SourceVimscript
  nmap gss <Plug>SourceVimscriptLine
endif

function! s:go(type) abort
  let saved_unnamed_register = @@
  if a:type ==# 'v' || a:type ==# 'V'
    normal! gvy
  elseif a:type ==# 'char'
    normal! `[v`]y
  elseif a:type ==# 'line'
    normal! `[V`]y
  else
    return
  endif
  @"
  let @@ = saved_unnamed_register
endfunction
