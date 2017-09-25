" colors.vim

try

  function! s:ModifyColorscheme()

    " Set sneak colors
    highlight Sneak cterm=bold ctermfg=white ctermbg=201 gui=bold guifg=#ffffff guibg=#ff00ff
    highlight SneakLabel cterm=bold ctermfg=white ctermbg=33 gui=bold guifg=#ffffff guibg=#0087ff

    " Make currently-selected quickfix line distinguishable from search
    highlight QuickFixLine cterm=bold ctermfg=11 ctermbg=NONE gui=bold guifg=#f3e430 guibg=NONE

    " Make Terminal-specific modifications
    if !has('gui_running')

      " Make spelling mistakes less prominent
      highlight clear SpellBad
      highlight clear SpellCap
      highlight SpellBad cterm=undercurl
      highlight SpellCap cterm=undercurl

      " Make sure highlighting for Search always shows on top of CursorLine (needed for denite)
      " highlight Search term=reverse cterm=reverse ctermbg=16 ctermfg=184
    endif

  endfunction

  autocmd ColorScheme * call s:ModifyColorscheme()

  " Set colorscheme
  set background=dark
  colorscheme paramount

catch
endtry

" vim: fdm=marker
