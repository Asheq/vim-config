augroup auto_checktime
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end
