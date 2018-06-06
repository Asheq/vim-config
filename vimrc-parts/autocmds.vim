augroup override_colorscheme
  autocmd!
  autocmd ColorScheme *
        \  highlight Comment cterm=italic gui=italic
        \| highlight String cterm=italic gui=italic
        \| highlight NonText ctermbg=NONE guibg=NONE
        \| highlight TermCursorNC ctermbg=red guibg=#ff0000 ctermfg=white guifg=#ffffff cterm=NONE gui=NONE
        \| highlight TermCursor ctermbg=blue guibg=#00ff00 ctermfg=black guifg=#000000 cterm=NONE gui=NONE
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
  autocmd TermOpen * setlocal nonumber
  autocmd TermOpen * setlocal statusline=%{b:term_title}
  autocmd TermOpen * startinsert
  autocmd TermOpen * nnoremap <buffer> I I<C-a>
  autocmd TermOpen * nnoremap <buffer> A A<C-e>
  autocmd TermOpen * nnoremap <buffer> C i<C-k>
  autocmd TermOpen * nnoremap <buffer> D i<C-k><C-\><C-n>
  autocmd TermOpen * nnoremap <buffer> cc i<C-e><C-u>
  autocmd TermOpen * nnoremap <buffer> dd i<C-e><C-u><C-\><C-n>

  autocmd BufEnter term://* startinsert
  autocmd WinEnter term://* startinsert
augroup end
