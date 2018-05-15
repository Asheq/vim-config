" When colorscheme is set, override it.
augroup overridecolorscheme
  autocmd!
  autocmd ColorScheme * highlight Comment cterm=italic gui=italic
        \| highlight String cterm=italic gui=italic
        \| highlight NonText ctermbg=NONE guibg=NONE
augroup end

" When reading from standard input (e.g. foo | vim -), treat buffer as 'file-less'.
augroup setstdinbuftype
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end

" When exiting vim, make a session.
augroup makesession
  autocmd!
  autocmd VimLeave * call vimrc#make_last_session()
augroup end

" After changes, save buffer.
" When vim gains focus or buffer is entered, check for changes and reload.
augroup savebuffer
  autocmd!
  autocmd InsertLeave,TextChanged * nested call vimrc#save_buffer()
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end
