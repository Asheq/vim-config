" colors.vim

try
  colorscheme Tomorrow-Night-Bright

  highlight Normal guibg=NONE ctermbg=NONE
  highlight FoldColumn guibg=NONE ctermbg=NONE
  highlight LineNr guifg=#555555 ctermfg=darkgray

  highlight clear SpellBad
  highlight clear SpellCap
  highlight SpellBad cterm=undercurl
  highlight SpellCap cterm=undercurl
catch
endtry

" vim: fdm=marker
