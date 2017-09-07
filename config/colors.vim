" colors.vim

try

  function! s:ModifyColorscheme()

    " TODO-LOW: GUI colors
    " Set sneak colors
    highlight Sneak cterm=bold ctermfg=white ctermbg=magenta
    highlight SneakLabel cterm=bold ctermfg=white ctermbg=green

    " Set user colors
    highlight User3 ctermbg=White ctermfg=Black guibg=#c5c8c6 guifg=#1d1f21
    highlight User1 ctermbg=DarkMagenta ctermfg=Black guibg=#b294bb guifg=#1d1f21
    highlight User2 ctermbg=Yellow ctermfg=Black guibg=#f0c674 guifg=#1d1f21
    highlight User4 ctermbg=DarkCyan ctermfg=Black guibg=#8abeb7 guifg=#1d1f21
    highlight User5 ctermbg=Cyan ctermfg=Black guibg=#1d1f21 guifg=#1d1f21
    highlight User6 ctermbg=DarkGreen ctermfg=Black guibg=#8e9659 guifg=#1d1f21

    " Make Terminal-specific modifications
    if !has('gui_running')
      " Use default background of terminal for feeling of seamlessness
      " highlight Normal ctermbg=NONE
      " highlight FoldColumn ctermbg=NONE
      " highlight LineNr ctermfg=darkgray

      " Make spelling mistakes stand out less
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
  colorscheme Tomorrow-Night

catch
endtry

" vim: fdm=marker
