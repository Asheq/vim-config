if exists(':terminal')
  " Exit to normal mode.
  tnoremap          <Esc> <C-\><C-n>
  tnoremap          <A-[> <Esc>

  " Navigate between windows.
  tnoremap <silent> <A-h> <C-\><C-n>:call vimrc#win_move('h')<cr>
  tnoremap <silent> <A-j> <C-\><C-n>:call vimrc#win_move('j')<cr>
  tnoremap <silent> <A-k> <C-\><C-n>:call vimrc#win_move('k')<cr>
  tnoremap <silent> <A-l> <C-\><C-n>:call vimrc#win_move('l')<cr>

  " Paste from register.
  tnoremap <expr> <C-\><C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif
