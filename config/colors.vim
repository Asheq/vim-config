" colors.vim

try
  colorscheme Tomorrow-Night-Bright

  " Use default background of terminal
  highlight Normal ctermbg=NONE
  highlight FoldColumn ctermbg=NONE
  highlight LineNr ctermfg=darkgray

  " Make sure highlighting for Search always shows on top of CursorLine
  highlight Search term=reverse cterm=reverse ctermbg=16 ctermfg=184

  " Make spelling mistakes stand out less
  highlight clear SpellBad
  highlight clear SpellCap
  highlight SpellBad cterm=undercurl gui=undercurl
  highlight SpellCap cterm=undercurl gui=undercurl

  highlight User1 ctermfg=2 ctermbg=59
  highlight User2 ctermfg=5 ctermbg=59
  highlight User3 ctermfg=3 ctermbg=59
  highlight User4 ctermfg=4 ctermbg=59
  highlight User5 ctermfg=7 ctermbg=59

catch
endtry

" vim: fdm=marker
