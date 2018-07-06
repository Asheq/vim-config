highlight clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "asheq"

" Normal
highlight Normal         gui=NONE      guifg=#ebdbb2 guibg=#282828

" NonText
highlight NonText        gui=NONE      guifg=#504945 guibg=NONE

" CursorLine
highlight CursorLine     gui=NONE      guifg=NONE    guibg=#3c3836

" StatusLine
highlight StatusLine     gui=NONE      guifg=#282828 guibg=#ebdbb2
highlight StatusLineNC   gui=NONE      guifg=#9b8b62 guibg=#181818

" Search
highlight IncSearch      gui=reverse   guifg=#fe8019 guibg=#282828
highlight Search         gui=reverse   guifg=#fabd2f guibg=#282828

" Cursor
highlight Cursor         gui=reverse   guifg=NONE    guibg=NONE
highlight TermCursor     gui=NONE      guifg=#000000 guibg=#00ff00
highlight TermCursorNC   gui=NONE      guifg=#ffffff guibg=#ff0000

" Other
highlight Conceal        gui=NONE      guifg=#83a598 guibg=NONE
highlight Visual         gui=NONE      guifg=NONE    guibg=#665c54
highlight Directory      gui=bold      guifg=#b8bb26 guibg=NONE
highlight MatchParen     gui=bold      guifg=NONE    guibg=#665c54
highlight WildMenu       gui=NONE      guifg=#282828 guibg=#83a598

" Pmenu
highlight Pmenu          gui=NONE      guifg=#ebdbb2 guibg=#504945
highlight PmenuSbar      gui=NONE      guifg=NONE    guibg=#504945
highlight PmenuSel       gui=bold      guifg=#504945 guibg=#83a598
highlight PmenuThumb     gui=NONE      guifg=NONE    guibg=#7c6f64

" Msg
highlight ErrorMsg       gui=bold      guifg=#282828 guibg=#fb4934
highlight ModeMsg        gui=bold      guifg=#fabd2f guibg=NONE
highlight Question       gui=bold      guifg=#fe8019 guibg=NONE
highlight Title          gui=bold      guifg=#b8bb26 guibg=NONE
highlight WarningMsg     gui=bold      guifg=#fb4934 guibg=NONE

" Spell
highlight SpellBad       gui=undercurl guifg=NONE    guibg=NONE guisp=#83a598
highlight SpellCap       gui=undercurl guifg=NONE    guibg=NONE guisp=#fb4934
highlight SpellLocal     gui=undercurl guifg=NONE    guibg=NONE guisp=#8ec07c
highlight SpellRare      gui=undercurl guifg=NONE    guibg=NONE guisp=#d3869b

" Diff
highlight DiffAdd        gui=reverse   guifg=#b8bb26 guibg=#282828
highlight DiffChange     gui=reverse   guifg=#8ec07c guibg=#282828
highlight DiffDelete     gui=reverse   guifg=#fb4934 guibg=#282828
highlight DiffText       gui=reverse   guifg=#fabd2f guibg=#282828

" Linked
highlight! link TabLineSel   StatusLine
highlight! link CursorLineNr StatusLine
highlight! link MsgSeparator StatusLine
highlight! link TabLine      StatusLineNC
highlight! link LineNr       StatusLineNC
highlight! link TabLineFill  StatusLineNC
highlight! link FoldColumn   StatusLineNC
highlight! link Folded       StatusLineNC
highlight! link VertSplit    StatusLineNC
highlight! link SignColumn   StatusLineNC
highlight! link ColorColumn  CursorLine
highlight! link CursorColumn CursorLine
highlight! link Substitute   Search
highlight! link QuickFixLine Search
highlight! link Whitespace   NonText
highlight! link SpecialKey   NonText
highlight! link MoreMsg      ModeMsg
highlight! link VisualNOS    Visual
highlight! link Todo         Directory

" Syntax 'on'
highlight Comment        gui=NONE      guifg=#928374 guibg=NONE

" Syntax 'off'
highlight Boolean        gui=NONE      guifg=NONE    guibg=NONE
highlight Character      gui=NONE      guifg=NONE    guibg=NONE
highlight Conceal        gui=NONE      guifg=NONE    guibg=NONE
highlight Conditional    gui=NONE      guifg=NONE    guibg=NONE
highlight Constant       gui=NONE      guifg=NONE    guibg=NONE
highlight Debug          gui=NONE      guifg=NONE    guibg=NONE
highlight Define         gui=NONE      guifg=NONE    guibg=NONE
highlight Delimiter      gui=NONE      guifg=NONE    guibg=NONE
highlight Directive      gui=NONE      guifg=NONE    guibg=NONE
highlight Exception      gui=NONE      guifg=NONE    guibg=NONE
highlight Float          gui=NONE      guifg=NONE    guibg=NONE
highlight Format         gui=NONE      guifg=NONE    guibg=NONE
highlight Function       gui=NONE      guifg=NONE    guibg=NONE
highlight Identifier     gui=NONE      guifg=NONE    guibg=NONE
highlight Ignore         gui=NONE      guifg=NONE    guibg=NONE
highlight Include        gui=NONE      guifg=NONE    guibg=NONE
highlight Keyword        gui=NONE      guifg=NONE    guibg=NONE
highlight Label          gui=NONE      guifg=NONE    guibg=NONE
highlight Macro          gui=NONE      guifg=NONE    guibg=NONE
highlight Number         gui=NONE      guifg=NONE    guibg=NONE
highlight Operator       gui=NONE      guifg=NONE    guibg=NONE
highlight PreCondit      gui=NONE      guifg=NONE    guibg=NONE
highlight PreProc        gui=NONE      guifg=NONE    guibg=NONE
highlight Repeat         gui=NONE      guifg=NONE    guibg=NONE
highlight SpecialChar    gui=NONE      guifg=NONE    guibg=NONE
highlight SpecialComment gui=NONE      guifg=NONE    guibg=NONE
highlight Special        gui=NONE      guifg=NONE    guibg=NONE
highlight Statement      gui=NONE      guifg=NONE    guibg=NONE
highlight StorageClass   gui=NONE      guifg=NONE    guibg=NONE
highlight String         gui=NONE      guifg=NONE    guibg=NONE
highlight Structure      gui=NONE      guifg=NONE    guibg=NONE
highlight Tag            gui=NONE      guifg=NONE    guibg=NONE
highlight Title          gui=NONE      guifg=NONE    guibg=NONE
highlight Typedef        gui=NONE      guifg=NONE    guibg=NONE
highlight Type           gui=NONE      guifg=NONE    guibg=NONE
highlight Underlined     gui=NONE      guifg=NONE    guibg=NONE
