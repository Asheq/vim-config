" When vim reads from stdin (example: foo | vim -), treat the resulting buffer as file-less
autocmd StdinReadPost * :set buftype=nofile

" autocmd VimLeave * execute ':silent mksession! ' . vimrc#get_cache_dir('sessions') . '/temp'
