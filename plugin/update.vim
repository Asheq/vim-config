" update.vim
" The :Update command unifies what is considered by Vim as two separate tasks: saving existing files
" and saving non-existing files.
" If you execute :Update and the current buffer exists as a file, :update is invoked. If the file does not
" exist, ':saveas' is invoked.

" Recommended Mapping:
" nnoremap <silent> <leader>w :Update<CR>

command! Update call s:Update()

function! s:Update() abort
  let buffer_name = bufname('%')
  if buffer_name == ''
    call feedkeys(":saveas \<C-d>")
  else
    update
  endif
endfunction

