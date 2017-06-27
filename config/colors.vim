" colors.vim

try
  colorscheme Tomorrow-Night-Bright

  " Use default background of terminal
  highlight Normal ctermbg=NONE
  highlight FoldColumn ctermbg=NONE
  highlight LineNr ctermfg=darkgray

  " Make sure highlighting for Search always shows on top of CursorLine
  highlight Search term=reverse cterm=reverse ctermbg=16 ctermfg=184 guibg=#000000 guifg=#e7c547

  " Make spelling mistakes stand out less
  highlight clear SpellBad
  highlight clear SpellCap
  highlight SpellBad cterm=undercurl gui=undercurl
  highlight SpellCap cterm=undercurl gui=undercurl
catch
endtry

" vim: fdm=marker
