if exists(':terminal')
  " Exit to normal mode.
  tnoremap          <Esc> <C-\><C-n>
  tnoremap          <A-[> <Esc>

  " Paste from register.
  tnoremap <expr> <C-\><C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

  " Meta Mappings {{{
  tnoremap <silent> <A-h> <C-\><C-n>:call vimrc#win_move('h')<cr>
  tnoremap <silent> <A-j> <C-\><C-n>:call vimrc#win_move('j')<cr>
  tnoremap <silent> <A-k> <C-\><C-n>:call vimrc#win_move('k')<cr>
  tnoremap <silent> <A-l> <C-\><C-n>:call vimrc#win_move('l')<cr>
  tnoremap <silent> <A-n> <C-\><C-n>:enew<CR>
  tnoremap <silent> <A-m> <C-\><C-n>:terminal<CR>
  tnoremap          <A-c> <C-\><C-n><C-w>c
  tnoremap          <A-x> <C-\><C-n><C-w>x
  tnoremap          <A-z> <C-\><C-n><C-w>\|<C-w>_i
  tnoremap          <A-=> <C-\><C-n><C-w>=i
  tnoremap          <A-H> <C-\><C-n><C-w>Hi
  tnoremap          <A-J> <C-\><C-n><C-w>Ji
  tnoremap          <A-K> <C-\><C-n><C-w>Ki
  tnoremap          <A-L> <C-\><C-n><C-w>Li
  tnoremap          <A-o> <C-\><C-n><C-w>oi
  " }}}
endif
