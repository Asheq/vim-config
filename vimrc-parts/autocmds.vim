augroup set_stdin_buftype
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end

augroup make_session
  autocmd!
  autocmd VimLeave * call vimrc#make_last_session()
augroup end

augroup save_buffer
  " TODO: Add a way to disable so macros do not create so many entries in undo list
  autocmd!
  autocmd InsertLeave,TextChanged * nested call vimrc#save_buffer()
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end

if has('nvim')
  augroup terminal_mods
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup end
endif

augroup myflags
    autocmd!
    autocmd User Flags call Hoist("window", "%{&scrollbind?'[SB]':''}")
    autocmd User Flags call Hoist("window", "%{vimrc#get_window_cwd_flag()}")
    autocmd User Flags call Hoist("global", "%{vimrc#get_global_cwd_flag()}")
augroup END
