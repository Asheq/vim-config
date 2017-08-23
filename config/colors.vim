" colors.vim

" TODO-HIGH: gui colors

try

  function! s:ModifyColorscheme()

    " Set sneak colors
    highlight Sneak cterm=bold ctermfg=white ctermbg=magenta
    highlight SneakLabel cterm=bold ctermfg=white ctermbg=green

    " Set user colors
    highlight User3 ctermbg=White ctermfg=Black
    highlight User1 ctermbg=DarkMagenta ctermfg=Black
    highlight User2 ctermbg=Yellow ctermfg=Black
    highlight User4 ctermbg=DarkCyan ctermfg=Black
    highlight User5 ctermbg=Cyan ctermfg=Black
    highlight User6 ctermbg=DarkGreen ctermfg=Black

    " Set Special highlight
    highlight Special ctermfg=Magenta

    " Make Terminal-specific modifications
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

      " Make currently-selected quickfix line readable
      highlight QuickFixLine cterm=bold ctermfg=yellow ctermbg=NONE

      " Make sure highlighting for Search always shows on top of CursorLine (needed for denite)
      highlight Search term=reverse cterm=reverse ctermbg=16 ctermfg=184
    endif

  endfunction

  autocmd ColorScheme * call s:ModifyColorscheme()

  " Set colorscheme
  colorscheme Tomorrow-Night-Bright

catch
endtry

" vim: fdm=marker
