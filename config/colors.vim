" colors.vim

try

  function! s:ModifyColorscheme()

    " TODO-LOW: GUI colors
    " Set sneak colors
    highlight Sneak cterm=bold ctermfg=white ctermbg=magenta
    highlight SneakLabel cterm=bold ctermfg=white ctermbg=green

    " Make Terminal-specific modifications
    if !has('gui_running')
      " Use default background of terminal for feeling of seamlessness
      " highlight Normal ctermbg=NONE
      " highlight FoldColumn ctermbg=NONE
      " highlight LineNr ctermfg=darkgray

      " Make spelling mistakes stand out less
      " highlight clear SpellBad
      " highlight clear SpellCap
      " highlight SpellBad cterm=undercurl
      " highlight SpellCap cterm=undercurl

      " Make currently-selected quickfix line readable
      " highlight QuickFixLine cterm=bold ctermfg=yellow ctermbg=NONE

      " Make sure highlighting for Search always shows on top of CursorLine (needed for denite)
      " highlight Search term=reverse cterm=reverse ctermbg=16 ctermfg=184
    endif

  endfunction

  autocmd ColorScheme * call s:ModifyColorscheme()

  " Set colorscheme
  colorscheme Tomorrow-Night

catch
endtry

" vim: fdm=marker
