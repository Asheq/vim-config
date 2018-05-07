augroup MyVimrc
  autocmd!
augroup END

" When vim reads from stdin (example: foo | vim -), treat the resulting buffer as 'file-less'
autocmd MyVimrc StdinReadPost * :set buftype=nofile

autocmd MyVimrc VimLeave * call vimrc#make_last_session()

autocmd MyVimrc ColorScheme * highlight Comment cterm=italic gui=italic | highlight String cterm=italic gui=italic
