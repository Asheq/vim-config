augroup override_colorscheme
  autocmd!
  autocmd ColorScheme *
        \  highlight Comment cterm=italic gui=italic
        \| highlight String cterm=italic gui=italic
        \| highlight NonText ctermbg=NONE guibg=NONE
augroup end

augroup set_stdin_buftype
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end

augroup make_session
  autocmd!
  autocmd VimLeave * call vimrc#make_last_session()
augroup end

augroup save_buffer
  autocmd!
  autocmd InsertLeave,TextChanged * nested call vimrc#save_buffer()
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end

augroup terminal_mods
  autocmd!
  autocmd TermOpen * setlocal nonumber | setlocal statusline=%{b:term_title} | startinsert
  autocmd BufEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
augroup end
