" Override colorscheme
augroup modifycolorscheme
  autocmd ColorScheme * highlight Comment cterm=italic gui=italic
        \| highlight String cterm=italic gui=italic
        \| highlight NonText ctermbg=NONE guibg=NONE
augroup end

" When reading from standard input (e.g. foo | vim -), treat buffer as 'file-less'
augroup setstdinbuftype
  autocmd!
  autocmd StdinReadPost * :set buftype=nofile
augroup end

" When exiting vim, make a session that can be restored later
augroup makesession
  autocmd!
  autocmd VimLeave * call vimrc#make_last_session()
augroup end

" Save the current buffer after any changes
augroup savebuffer
  autocmd!
  autocmd InsertLeave,TextChanged * nested call vimrc#save_buffer()
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end
