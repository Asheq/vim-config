" colors.vim

try

  function! s:ModifyColorscheme()

    " Terminal-specific modifications
    if !has('gui_running')
      " Use default background of terminal for feeling of seamlessness
      highlight Normal ctermbg=NONE
      highlight FoldColumn ctermbg=NONE
      highlight LineNr ctermfg=darkgray

    " Make spelling mistakes stand out less than default
      highlight clear SpellBad
      highlight clear SpellCap
      highlight SpellBad cterm=undercurl
      highlight SpellCap cterm=undercurl

      " Currently selected quickfix line
      highlight QuickFixLine cterm=bold ctermfg=yellow ctermbg=NONE

      " Make sure highlighting for Search always shows on top of CursorLine
      highlight Search term=reverse cterm=reverse ctermbg=16 ctermfg=184
    endif

    " Sneak
    highlight Sneak cterm=bold gui=bold ctermfg=white ctermbg=magenta guifg=black guibg=magenta
    highlight SneakLabel      cterm=bold gui=bold ctermfg=white ctermbg=green guifg=black guibg=green

    " User colors
    highlight User1 ctermfg=2 ctermbg=59 guifg=green guibg=#4d5057
    highlight User2 ctermfg=3 ctermbg=59 guifg=orange guibg=#4d5057
    highlight User3 ctermfg=5 ctermbg=59 guifg=violet guibg=#4d5057
    highlight User4 ctermfg=4 ctermbg=59 guifg=cyan guibg=#4d5057
    highlight User5 ctermfg=7 ctermbg=59 guifg=white guibg=#4d5057

  endfunction

  autocmd ColorScheme * call s:ModifyColorscheme()

  " Set colorscheme
  colorscheme Tomorrow-Night-Bright

catch
endtry

" vim: fdm=marker
