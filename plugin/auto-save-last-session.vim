" TODO: Move vimrc#make_last_session to here
augroup make_session
  autocmd!
  autocmd VimLeave * call vimrc#make_last_session()
augroup end
