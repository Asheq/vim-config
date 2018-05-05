" When vim reads from stdin (example: foo | vim -), treat the resulting buffer as 'file-less'
autocmd StdinReadPost * :set buftype=nofile

autocmd VimLeave * call vimrc#make_last_session()
