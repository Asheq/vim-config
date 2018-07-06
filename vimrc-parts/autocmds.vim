augroup smart_cursorline
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
augroup end

augroup override_colorscheme
  autocmd!
  autocmd ColorScheme *
        \ highlight Comment       gui=italic
        \| highlight String       gui=italic
        \| highlight TermCursorNC guibg=#ff0000 guifg=#ffffff gui=NONE
        \| highlight TermCursor   guibg=#00ff00 guifg=#000000 gui=NONE

  autocmd ColorScheme nofrils-dark
        \ highlight Search       guibg=#777700 guifg=#000000
        \| highlight IncSearch   guibg=#ffff00 guifg=#000000
        \| highlight String      guifg=#d3b987 guibg=NONE
        \| highlight Statement   guifg=#b3deef guibg=NONE
        \| highlight Conditional guifg=#b3deef guibg=NONE
        \| highlight Function    guifg=#b3deef guibg=NONE
        \| highlight Identifier  guifg=#b3deef guibg=NONE
        \| highlight Keyword     guifg=#b3deef guibg=NONE
        \| highlight Type        guifg=#b3deef guibg=NONE
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

if has('nvim')
  augroup terminal_mods
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber

    " TODO: Are these useless?
    autocmd TermOpen * nnoremap <buffer> I I<C-a>
    autocmd TermOpen * nnoremap <buffer> A A<C-e>
    autocmd TermOpen * nnoremap <buffer> C i<C-k>
    autocmd TermOpen * nnoremap <buffer> D i<C-k><C-\><C-n>
    autocmd TermOpen * nnoremap <buffer> cc i<C-e><C-u>
    autocmd TermOpen * nnoremap <buffer> dd i<C-e><C-u><C-\><C-n>
  augroup end
endif
