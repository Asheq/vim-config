" Colorscheme is inspired by gruvbox.

" Initialization {{{
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "asheq"
" }}}

" Highlighting function {{{
function! s:hl(group, gui, fg, bg)
  execute 'highlight ' . a:group . ' gui=' . a:gui . ' guifg=' . a:fg . ' guibg=' . a:bg
endfunction
" }}}

" Color palette {{{
let s:bg0_dark     = '#181818' " original = '#1d2021'
let s:bg0          = '#282828'
let s:bg0_light    = '#32302f'
let s:bg1          = '#3c3836'
let s:bg2          = '#504945'
let s:bg3          = '#665c54'
let s:bg4          = '#7c6f64'

let s:gray         = '#928374'

let s:fg4          = '#a89984'
let s:fg3          = '#bdae93'
let s:fg2          = '#d5c4a1'
let s:fg1          = '#ebdbb2'
let s:fg0          = '#fbf1c7'

let s:aqua         = '#8ec07c'
let s:blue         = '#83a598'
let s:green        = '#b8bb26'
let s:orange       = '#fe8019'
let s:purple       = '#d3869b'
let s:red          = '#fb4934'
let s:yellow       = '#fabd2f'

let s:aqua_dark    = '#689d6a'
let s:blue_dark    = '#458588'
let s:green_dark   = '#98971a'
let s:orange_dark  = '#d65d0e'
let s:purple_dark  = '#b16286'
let s:red_dark     = '#cc241d'
let s:yellow_dark  = '#d79921'

let s:yellow_light = '#ffd063' " new
" }}}

" General UI {{{
" Normal
call s:hl('Normal'       , 'NONE'     , s:fg1          , s:bg0)

" NonText
call s:hl('NonText'      , 'NONE'     , s:bg2          , 'NONE')

" CursorLine
call s:hl('CursorLine'   , 'NONE'     , 'NONE'         , s:bg0_dark)
call s:hl('CursorColumn' , 'NONE'     , 'NONE'         , s:bg0_dark)
call s:hl('ColorColumn'  , 'NONE'     , 'NONE'         , s:bg0_dark)

" QuickFixLine
call s:hl('QuickFixLine' , 'UNDERLINE', 'NONE'         , 'NONE')

" LineNr
call s:hl('LineNr'       , 'NONE'     , s:gray         , s:bg1)
call s:hl('CursorLineNr' , 'BOLD'     , 'NONE'         , s:bg1)

" Folded
call s:hl('Folded'       , 'NONE'     , s:gray         , s:bg1)
call s:hl('FoldColumn'   , 'NONE'     , s:blue         , s:bg1)

" StatusLine
call s:hl('StatusLineNC' , 'NONE'     , s:bg0_dark     , s:gray)
call s:hl('StatusLine'   , 'NONE'     , s:bg0_dark     , s:gray)
call s:hl('User1'        , 'NONE'     , s:fg0          , s:gray)

" Search
call s:hl('IncSearch'    , 'REVERSE'  , s:yellow       , 'NONE')
call s:hl('Search'       , 'REVERSE'  , s:aqua         , 'NONE')

" Cursor
call s:hl('termCursor'   , 'NONE'     , s:bg0          , s:green)
call s:hl('termCursorNC' , 'NONE'     , s:bg0          , s:red)

" Other
call s:hl('Visual'       , 'NONE'     , 'NONE'         , s:bg3)
call s:hl('Directory'    , 'NONE'     , s:green        , 'NONE')
call s:hl('MatchParen'   , 'BOLD'     , 'NONE'         , s:bg1)
call s:hl('WildMenu'     , 'BOLD'     , s:bg0_dark     , s:blue)
call s:hl('Conceal'      , 'BOLD'     , s:fg0          , 'NONE')

" Pmenu
call s:hl('Pmenu'        , 'NONE'     , s:fg1          , s:bg2)
call s:hl('PmenuSbar'    , 'NONE'     , 'NONE'         , s:bg2)
call s:hl('PmenuSel'     , 'NONE'     , s:bg2          , s:blue)
call s:hl('PmenuThumb'   , 'NONE'     , 'NONE'         , s:bg4)

" Msg
call s:hl('ErrorMsg'     , 'BOLD'     , s:bg0          , s:red)
call s:hl('WarningMsg'   , 'BOLD'     , s:red          , 'NONE')
call s:hl('Question'     , 'BOLD'     , s:yellow       , 'NONE')
call s:hl('Title'        , 'BOLD'     , s:green        , 'NONE')

" Spell
call s:hl('SpellBad'     , 'undercurl', s:blue         , 'NONE')
call s:hl('SpellCap'     , 'undercurl', s:aqua         , 'NONE')
call s:hl('SpellLocal'   , 'undercurl', s:purple       , 'NONE')
call s:hl('SpellRare'    , 'undercurl', s:purple       , 'NONE')

" Diff
call s:hl('DiffAdd'      , 'REVERSE'  , s:green        , s:bg0)
call s:hl('DiffChange'   , 'REVERSE'  , s:aqua         , s:bg0)
call s:hl('DiffDelete'   , 'REVERSE'  , s:red          , s:bg0)
call s:hl('DiffText'     , 'REVERSE'  , s:yellow       , s:bg0)

" TabLine
call s:hl('TabLineSel'   , 'BOLD'     , s:bg0_dark     , s:fg1)

" Linked to StatusLine
highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight! link MsgSeparator StatusLine
highlight! link VertSplit StatusLineNC
highlight! link SignColumn StatusLineNC

" Linked to NonText
highlight! link Whitespace NonText
highlight! link SpecialKey NonText

" Linked to Search
highlight! link Substitute Search

" Linked to Visual
highlight! link VisualNOS Visual

" Linked to Question
highlight! link MoreMsg Question
highlight! link ModeMsg Question
highlight! link Todo Question
" }}}

" Syntax {{{
call s:hl('Boolean'       , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Character'     , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Comment'       , 'NONE'     , s:blue  , 'NONE')
call s:hl('Conditional'   , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Constant'      , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Debug'         , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Define'        , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Delimiter'     , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Directive'     , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Error'         , 'NONE'     , s:red   , 'NONE')
call s:hl('Exception'     , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Float'         , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Format'        , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Function'      , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Identifier'    , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Ignore'        , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Include'       , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Keyword'       , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Label'         , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Macro'         , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Number'        , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Operator'      , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('PreCondit'     , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('PreProc'       , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Repeat'        , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Special'       , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('SpecialChar'   , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('SpecialComment', 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Statement'     , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('StorageClass'  , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('String'        , 'ITALIC'   , 'NONE'  , 'NONE')
call s:hl('Structure'     , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Tag'           , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Type'          , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Typedef'       , 'NONE'     , 'NONE'  , 'NONE')
call s:hl('Underlined'    , 'NONE'     , 'NONE'  , 'NONE')
" }}}

" Language specific {{{
highlight link vimUserFunc Statement
" }}}

" Git {{{
" git
call s:hl('diffAdded'    , 'NONE' , s:green  , 'NONE')
call s:hl('diffRemoved'  , 'NONE' , s:red    , 'NONE')
call s:hl('diffFile'     , 'NONE' , s:yellow , 'NONE')
call s:hl('diffIndexLine', 'NONE' , s:yellow , 'NONE')
call s:hl('diffNewFile'  , 'NONE' , s:yellow , 'NONE')
call s:hl('diffLine'     , 'NONE' , s:purple , 'NONE')
" diffSubname
" gitDiffAdded
" gitDiffRemoved
" gitDateHeader
" gitIdentityHeader
" gitIdentityKeyword
" gitNotesHeader
" gitReflogHeader
" gitKeyword
" gitIdentity
" gitEmailDelimiter
" gitEmail
" gitDatee
" gitMode
" gitHashAbbrev
" gitHash
" gitReflogMiddle
" gitReference
" gitStage
" gitType

" gitcommit
highlight! link gitcommitOverflow WarningMsg
" gitcommitBlank
" gitcommitArrow
" gitcommitFile
" gitcommitUnmergedFile
" gitcommitSelectedFile
" gitcommitHeader
" gitcommitNoChanges
" gitcommitType
" gitcommitUnmergedType
" gitcommitSelectedType
" gitcommitBranch
" gitcommitOnBranch
" gitcommitUnmerged
" gitcommitSummary
" gitcommitComment
" gitcommitUntracked
" gitcommitDiscarded
" gitcommitSelected
" gitcommitNoBranch
" gitcommitDiscardedType".s:fmt_none
" gitcommitUntrackedFile".s:fmt_bold
" gitcommitDiscardedFile".s:fmt_bold
" gitcommitDiscardedArrow
" gitcommitSelectedArrow
" gitcommitUnmergedArrow
" }}}

" Terminal colors {{{
if has('nvim')
  let g:terminal_color_0 = s:bg0
  let g:terminal_color_8 = s:gray

  let g:terminal_color_1 = s:red_dark
  let g:terminal_color_9 = s:red

  let g:terminal_color_2 = s:green_dark
  let g:terminal_color_10 = s:green

  let g:terminal_color_3 = s:yellow_dark
  let g:terminal_color_11 = s:yellow

  let g:terminal_color_4 = s:blue_dark
  let g:terminal_color_12 = s:blue

  let g:terminal_color_5 = s:purple_dark
  let g:terminal_color_13 = s:purple

  let g:terminal_color_6 = s:aqua_dark
  let g:terminal_color_14 = s:aqua

  let g:terminal_color_7 = s:fg4
  let g:terminal_color_15 = s:fg1
endif
" }}}

" Plugin specific {{{
let g:rainbow_conf = {
      \	'guifgs': [s:orange, s:blue_dark, s:red, s:green],
      \}

call s:hl('Sneak', 'NONE', 'NONE', s:blue_dark)
call s:hl('SneakLabel', 'NONE', 'NONE', s:blue_dark)
" }}}

" vim: fdm=marker
