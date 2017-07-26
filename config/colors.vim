" colors.vim

try

  function! s:ModifyColorscheme()
    " Use default background of terminal
    highlight Normal ctermbg=NONE
    highlight FoldColumn ctermbg=NONE
    highlight LineNr ctermfg=darkgray

    " Make spelling mistakes stand out less
    highlight clear SpellBad
    highlight clear SpellCap
    highlight SpellBad cterm=undercurl
    highlight SpellCap cterm=undercurl

    " Currently selected quickfix line
    highlight QuickFixLine cterm=bold ctermfg=yellow ctermbg=NONE

    " Make sure highlighting for Search always shows on top of CursorLine
    highlight Search term=reverse cterm=reverse ctermbg=16 ctermfg=184

    " User colors
    highlight User1 ctermfg=2 ctermbg=59
    highlight User2 ctermfg=5 ctermbg=59
    highlight User3 ctermfg=3 ctermbg=59
    highlight User4 ctermfg=4 ctermbg=59
    highlight User5 ctermfg=7 ctermbg=59

    " Sneak
    highlight Sneak      cterm=bold ctermfg=white ctermbg=green
    highlight SneakLabel cterm=bold ctermfg=white ctermbg=magenta

  endfunction

  autocmd ColorScheme * call s:ModifyColorscheme()

  " Set colorscheme
  colorscheme Tomorrow-Night-Bright

catch
endtry

" vim: fdm=marker
