augroup make_session
  autocmd!
  autocmd VimLeave * call vimrc#make_last_session()
augroup end
