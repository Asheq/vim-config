" Initialization {{{
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "asheq"
" }}}

" Highlighting function {{{
function! s:hl(group, style, fg, bg)
  execute 'highlight ' . a:group . ' gui=' . a:style . ' guifg=' . a:fg . ' guibg=' . a:bg . ' cterm=NONE ctermfg=NONE ctermbg=NONE'
endfunction
" }}}

" Color palette {{{
" Fifteen shades of gray (gruvbox dark, gray, light) {{{
" Not Used: #1d2021, #fbf1c7

let s:dark0          = '#282828'
let s:dark1          = '#32302f'
let s:dark2          = '#3c3836'
let s:dark3          = '#504945'
let s:dark4          = '#665c54'
let s:dark5          = '#7c6f64'
let s:gray           = '#928374'
let s:light5         = '#a89984'
let s:light4         = '#bdae93'
let s:light3         = '#d5c4a1'
let s:light2         = '#ebdbb2'
let s:light1         = '#f2e5bc'
let s:light0         = '#f9f5d7'
" }}}

" Ultra light colors {{{
let s:u_light_aqua   = '#b6f2cb'
let s:u_light_blue   = '#b5d6ef'
let s:u_light_green  = '#d0f2b5'
let s:u_light_orange = '#eea339'
let s:u_light_purple = '#dab1ef'
let s:u_light_red    = '#eeb3b5'
let s:u_light_yellow = '#efda3a'
" }}}

" Light colors (gruvbox bright) {{{
let s:light_aqua     = '#8ec07c'
let s:light_blue     = '#83a598'
let s:light_green    = '#b8bb26'
let s:light_orange   = '#fe8019'
let s:light_purple   = '#d3869b'
let s:light_red      = '#fb4934'
let s:light_yellow   = '#fabd2f'
" }}}

" Neutral colors (gruvbox neutral) {{{
let s:neutral_aqua   = '#689d6a'
let s:neutral_blue   = '#458588'
let s:neutral_green  = '#98971a'
let s:neutral_orange = '#d65d0e'
let s:neutral_purple = '#b16286'
let s:neutral_red    = '#cc241d'
let s:neutral_yellow = '#d79921'
" }}}

" Dark colors (gruvbox faded) {{{
let s:dark_aqua      = '#427b58'
let s:dark_blue      = '#076678'
let s:dark_green     = '#79740e'
let s:dark_orange    = '#af3a03'
let s:dark_purple    = '#8f3f71'
let s:dark_red       = '#9d0006'
let s:dark_yellow    = '#b57614'
" }}}

" Ultra dark colors {{{
let s:u_dark_aqua    = '#325e43'
let s:u_dark_blue    = '#054955'
let s:u_dark_green   = '#535009'
let s:u_dark_orange  = '#6e2401'
let s:u_dark_purple  = '#713159'
let s:u_dark_red     = '#780004'
let s:u_dark_yellow  = '#744c0c'
" }}}
" }}}

" Set colors based on &background {{{
" TODO: Utilize sharp0

if &background == 'light'
  let s:sharp = 'dark'
  let s:faded = 'light'
else
  let s:sharp = 'light'
  let s:faded = 'dark'
endif

for num in ['0', '1', '2', '3', '4', '5']
  execute 'let s:sharp' . num ' = ' . 's:' . s:sharp . num
  execute 'let s:faded' . num ' = ' . 's:' . s:faded . num
endfor

for color in ['aqua', 'blue', 'green', 'orange', 'purple', 'red', 'yellow']
  execute 'let s:u_faded_' . color ' = ' . 's:u_' . s:faded . '_' . color
  execute 'let s:faded_'   . color ' = ' . 's:'   . s:faded . '_' . color
  execute 'let s:sharp_'   . color ' = ' . 's:'   . s:sharp . '_' . color
  execute 'let s:u_sharp_' . color ' = ' . 's:u_' . s:sharp . '_' . color
endfor
" }}}

" Normal {{{
call s:hl('Normal'        , 'NONE'       , s:sharp3       , s:faded1)
" }}}

" Standard text {{{
call s:hl('Character'            , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Conditional'          , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Constant'             , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Debug'                , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Define'               , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Delimiter'            , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('DiffChange'           , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Directive'            , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Exception'            , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Format'               , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Function'             , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Identifier'           , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Ignore'               , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Include'              , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Keyword'              , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Label'                , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Macro'                , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Operator'             , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('PreCondit'            , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('PreProc'              , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Repeat'               , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Special'              , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('SpecialChar'          , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('SpecialComment'       , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Statement'            , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('StorageClass'         , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Structure'            , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Tag'                  , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Type'                 , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('Typedef'              , 'NONE'       , 'NONE'           , 'NONE')
call s:hl('UNDERLINE'            , 'NONE'       , 'NONE'           , 'NONE')
" }}}

" Text overlays {{{
call s:hl('Boolean'              , 'NONE'       , s:neutral_blue   , 'NONE')
call s:hl('Comment'              , 'ITALIC'     , s:neutral_aqua   , 'NONE')
call s:hl('Directory'            , 'BOLD'       , s:neutral_blue   , 'NONE')
call s:hl('Error'                , 'NONE'       , s:neutral_red    , 'NONE')
call s:hl('NonText'              , 'NONE'       , s:faded5         , 'NONE')
call s:hl('SpellBad'             , 'UNDERCURL'  , s:neutral_purple , 'NONE')
call s:hl('SpellLocal'           , 'UNDERCURL'  , s:neutral_blue   , 'NONE')
call s:hl('Title'                , 'NONE'       , s:neutral_purple , 'NONE')
call s:hl('Todo'                 , 'BOLDITALIC' , s:neutral_aqua   , 'NONE')
let g:rainbow_conf = {
      \	'guifgs': [s:faded_orange, s:faded_blue , s:faded_red , s:faded_green],
      \}
" }}}

" Background underlays {{{
call s:hl('CursorLine'           , 'NONE'       , 'NONE'           , s:faded2)
call s:hl('ColorColumn'          , 'NONE'       , 'NONE'           , s:faded3)
call s:hl('DiffAdd'              , 'NONE'       , 'NONE'           , s:u_faded_aqua)
call s:hl('DiffDelete'           , 'NONE'       , 'NONE'           , s:u_faded_red)
call s:hl('DiffText'             , 'NONE'       , 'NONE'           , s:u_faded_blue)
call s:hl('IncSearch'            , 'NONE'       , 'NONE'           , s:u_faded_orange)
call s:hl('MatchParen'           , 'BOLD'       , 'NONE'           , s:faded3)
call s:hl('QuickFixLine'         , 'NONE'       , 'NONE'           , s:u_faded_blue)
call s:hl('Search'               , 'NONE'       , 'NONE'           , s:u_faded_yellow)
call s:hl('Substitute'           , 'NONE'       , 'NONE'           , s:u_faded_purple)
call s:hl('Visual'               , 'NONE'       , 'NONE'           , s:u_faded_purple)
call s:hl('diffFile'             , 'NONE'       , 'NONE'           , s:u_faded_blue)
call s:hl('diffLine'             , 'NONE'       , 'NONE'           , s:faded4)
" }}}

" Complete {{{
call s:hl('ErrorMsg'             , 'NONE'       , s:faded1         , s:faded_red)
call s:hl('FoldColumn'           , 'NONE'       , s:neutral_blue   , s:faded3)
call s:hl('Folded'               , 'NONE'       , s:gray           , s:faded3)
call s:hl('LineNr'               , 'NONE'       , s:faded5         , s:faded3)
call s:hl('Pmenu'                , 'NONE'       , s:sharp3         , s:faded0)
call s:hl('PmenuSel'             , 'NONE'       , s:sharp1         , s:faded_aqua)
call s:hl('PmenuThumb'           , 'NONE'       , s:sharp3         , s:gray)
call s:hl('Sneak'                , 'NONE'       , s:sharp1         , s:faded_blue)
call s:hl('SneakLabel'           , 'NONE'       , s:sharp1         , s:faded_aqua)
call s:hl('StatusLine'           , 'NONE'       , s:faded5         , s:sharp2)
call s:hl('StatusLineNC'         , 'NONE'       , s:faded5         , s:sharp4)
call s:hl('TabLine'              , 'NONE'       , s:sharp4         , s:faded5)
call s:hl('TabLineSel'           , 'NONE'       , s:sharp3         , s:faded_blue)
call s:hl('TermCursor'           , 'NONE'       , s:sharp3         , s:faded_green)
call s:hl('TermCursorNC'         , 'NONE'       , s:faded1         , s:faded_red)
call s:hl('User1'                , 'NONE'       , s:faded1         , s:sharp2) " For bright section of statusline
call s:hl('WarningMsg'           , 'NONE'       , s:faded1         , s:faded_orange)
" }}}

" Linked {{{
highlight! link CursorColumn      CursorLine
highlight! link CursorLineNr      LineNr
highlight! link PmenuSbar         Pmenu
highlight! link SneakScope        SneakLabel
highlight! link SpellCap          SpellBad
highlight! link SpellRare         SpellLocal
highlight! link VisualNOS         Visual
highlight! link diffAdded         DiffAdd
highlight! link diffRemoved       DiffDelete
highlight! link gitcommitOverflow Error
highlight! link vimCommentTitle   Todo
highlight! link vimUserFunc       Statement

highlight! link Conceal           NonText
highlight! link SpecialKey        NonText
highlight! link Whitespace        NonText
highlight! link qfFileName        NonText
highlight! link qfLineNr          NonText

highlight! link MsgSeparator      StatusLineNC
highlight! link SignColumn        StatusLineNC
highlight! link TabLineFill       StatusLineNC
highlight! link VertSplit         StatusLineNC

highlight! link ModeMsg           WarningMsg
highlight! link MoreMsg           WarningMsg
highlight! link Question          WarningMsg

highlight! link Float             Boolean
highlight! link Number            Boolean
highlight! link String            Boolean

highlight! link diffIndexLine     diffFile
highlight! link diffNewFile       diffFile
" }}}

" Terminal colors {{{
" TODO: Set based on &background
if has('nvim')
  " Black
  let g:terminal_color_0  = s:faded1
  let g:terminal_color_8  = s:gray

  " Red
  let g:terminal_color_1  = s:faded_red
  let g:terminal_color_9  = s:sharp_red

  " Green
  let g:terminal_color_2  = s:faded_green
  let g:terminal_color_10 = s:sharp_green

  " Yellow
  let g:terminal_color_3  = s:faded_yellow
  let g:terminal_color_11 = s:sharp_yellow

  " Blue
  let g:terminal_color_4  = s:faded_blue
  let g:terminal_color_12 = s:sharp_blue

  " Magenta
  let g:terminal_color_5  = s:faded_purple
  let g:terminal_color_13 = s:sharp_purple

  " Cyan
  let g:terminal_color_6  = s:faded_aqua
  let g:terminal_color_14 = s:sharp_aqua

  " Light gray
  let g:terminal_color_7  = s:sharp5
  let g:terminal_color_15 = s:sharp2
endif
" }}}

" vim: fdm=marker
