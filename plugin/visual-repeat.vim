" visual-repeat.vim
" Use . to dot-repeat on each line in the visually-selected text. Use @ to execute a macro on each
" line the visually-selected text.

xnoremap . :normal! .<CR>
xnoremap @ :call ExecuteMacroOverRange()<CR>

function! ExecuteMacroOverRange() range
  echo '@'.getcmdline()
  execute ":" . a:firstline . "," . a:lastline . "normal! @" . nr2char(getchar())
endfunction
