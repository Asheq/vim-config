augroup save_buffer
  " TODO-WAIT: Add a way to disable so macros do not create so many entries in undo list
  " TODO-NOW: Move vimrc#save_buffer to here
  autocmd!
  autocmd InsertLeave,TextChanged * nested call vimrc#save_buffer()
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end

