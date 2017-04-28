" vim: fdm=marker

try
  colorscheme seoul256-light " Low contrast

  colorscheme PaperColor
  " colorscheme louver
  " colorscheme summerfruit
  " colorscheme lucius " A little booring

  if g:colors_name == 'onedark'
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7" }
    let s:black = { "gui": "#282C34", "cterm": "235", "cterm16": "0" }
    let s:comment_grey = { "gui": "#5C6370", "cterm": "59", "cterm16": "15" }
    call onedark#set_highlight("StatusLine", { "fg": s:black, "bg": s:white })
    call onedark#set_highlight("StatusLineNC", { "fg": s:black, "bg": s:comment_grey })
  endif

  if g:colors_name == 'PaperColor'
    highlight String guibg=#e6ebd2
  endif

catch
endtry
