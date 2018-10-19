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
let s:fg0_hard     = '#181818' " original = '#1d2021'
let s:fg0          = '#282828'
let s:fg0_soft     = '#32302f'
let s:fg1          = '#3c3836'
let s:fg2          = '#504945'
let s:fg3          = '#665c54'
let s:fg4          = '#7c6f64'

let s:gray         = '#928374'

let s:bg4          = '#a89984'
let s:bg3          = '#bdae93'
let s:bg2          = '#d5c4a1'
let s:bg1          = '#ebdbb2'
let s:bg0_soft     = '#f7edc3'
let s:bg0          = '#fbf1c7'
let s:bg0_hard     = '#fff5cb'

let s:aqua         = '#8ec07c'
let s:blue         = '#83a598'
let s:green        = '#b8bb26'
let s:orange       = '#fe8019'
let s:purple       = '#d3869b'
let s:red          = '#fb4934'
let s:yellow       = '#fabd2f'

let s:aqua_hard    = '#689d6a'
let s:blue_hard    = '#458588'
let s:green_hard   = '#98971a'
let s:orange_hard  = '#d65d0e'
let s:purple_hard  = '#b16286'
let s:red_hard     = '#cc241d'
let s:yellow_hard  = '#d79921'
" }}}

" General UI {{{
" Normal
call s:hl('Normal'       , 'NONE'     , s:fg1         , s:bg1)

" Miscellaneous (Normal background)
call s:hl('QuickFixLine' , 'UNDERLINE', 'NONE'        , 'NONE')
call s:hl('MatchParen'   , 'BOLD'     , 'NONE'        , 'NONE')
call s:hl('Directory'    , 'NONE'     , s:green_hard  , 'NONE')
call s:hl('NonText'      , 'NONE'     , s:bg3         , 'NONE')
call s:hl('Conceal'      , 'BOLD'     , s:fg0         , 'NONE')
call s:hl('Todo'         , 'BOLD'     , s:aqua_hard   , 'NONE')
call s:hl('WarningMsg'   , 'NONE'     , s:red         , 'NONE')
call s:hl('Question'     , 'NONE'     , s:purple_hard , 'NONE')
call s:hl('Title'        , 'NONE'     , s:green_hard  , 'NONE')

" Spell
call s:hl('SpellBad'     , 'undercurl', s:purple_hard , 'NONE')
call s:hl('SpellCap'     , 'undercurl', s:aqua_hard   , 'NONE')
call s:hl('SpellLocal'   , 'undercurl', s:blue_hard   , 'NONE')
call s:hl('SpellRare'    , 'undercurl', s:blue_hard   , 'NONE')

" Pmenu
call s:hl('Pmenu'        , 'NONE'     , 'NONE'        , s:bg0)
call s:hl('PmenuSbar'    , 'NONE'     , 'NONE'        , s:bg0)
call s:hl('PmenuSel'     , 'NONE'     , 'NONE'        , s:blue)
call s:hl('PmenuThumb'   , 'NONE'     , 'NONE'        , s:bg2)

" CursorLine
call s:hl('CursorLine'   , 'NONE'     , 'NONE'        , s:bg2 )
call s:hl('CursorColumn' , 'NONE'     , 'NONE'        , s:bg2 )
call s:hl('ColorColumn'  , 'NONE'     , 'NONE'        , s:bg2 )

" Visual
call s:hl('Visual'       , 'NONE'     , 'NONE'        , s:bg2)

" LineNr and Folded
call s:hl('CursorLineNr' , 'BOLD'     , s:fg4         , s:bg3)
call s:hl('LineNr'       , 'NONE'     , s:gray        , s:bg3)
call s:hl('Folded'       , 'NONE'     , s:gray        , s:bg3)
call s:hl('FoldColumn'   , 'NONE'     , s:blue_hard   , s:bg3)

" StatusLineNC
call s:hl('StatusLineNC' , 'NONE'     , s:bg1         , s:gray)
call s:hl('User1'        , 'NONE'     , s:bg1         , s:fg3)

" StatusLine
call s:hl('StatusLine'   , 'NONE'     , s:bg1         , s:fg0)

" Term Cursor
call s:hl('termCursor'   , 'NONE'     , 'NONE'        , s:green)
call s:hl('termCursorNC' , 'NONE'     , 'NONE'        , s:red)

" WildMenu
call s:hl('WildMenu'     , 'NONE'     , 'NONE'        , s:blue)

" Search
call s:hl('IncSearch'    , 'REVERSE'  , s:yellow_hard , 'NONE')
call s:hl('Search'       , 'REVERSE'  , s:aqua_hard   , 'NONE')

" Diff
call s:hl('DiffAdd'      , 'REVERSE'  , s:green_hard  , 'NONE')
call s:hl('DiffChange'   , 'REVERSE'  , s:aqua_hard   , 'NONE')
call s:hl('DiffDelete'   , 'REVERSE'  , s:red_hard    , 'NONE')
call s:hl('DiffText'     , 'REVERSE'  , s:yellow_hard , 'NONE')

" ErrorMsg
call s:hl('ErrorMsg'     , 'NONE'     , s:bg0         , s:red)

" Linked to StatusLine
highlight! link TabLine StatusLineNC
highlight! link TabLineSel StatusLine
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
" }}}

" Syntax {{{
call s:hl('Boolean'       , 'NONE'   , s:blue      , 'NONE')
call s:hl('Character'     , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Comment'       , 'NONE'   , s:aqua_hard , 'NONE')
call s:hl('Conditional'   , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Constant'      , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Debug'         , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Define'        , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Delimiter'     , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Directive'     , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Error'         , 'NONE'   , s:red       , 'NONE')
call s:hl('Exception'     , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Float'         , 'NONE'   , s:blue      , 'NONE')
call s:hl('Format'        , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Function'      , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Identifier'    , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Ignore'        , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Include'       , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Keyword'       , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Label'         , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Macro'         , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Number'        , 'NONE'   , s:blue      , 'NONE')
call s:hl('Operator'      , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('PreCondit'     , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('PreProc'       , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Repeat'        , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Special'       , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('SpecialChar'   , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('SpecialComment', 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Statement'     , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('StorageClass'  , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('String'        , 'Italic' , s:blue      , 'NONE')
call s:hl('Structure'     , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Tag'           , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Type'          , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Typedef'       , 'NONE'   , 'NONE'      , 'NONE')
call s:hl('Underlined'    , 'NONE'   , 'NONE'      , 'NONE')
" }}}

" Language specific {{{
highlight link vimUserFunc Statement
" }}}

" Git {{{
" git
call s:hl('diffAdded'    , 'NONE' , s:green_hard  , 'NONE')
call s:hl('diffRemoved'  , 'NONE' , s:red_hard    , 'NONE')
call s:hl('diffFile'     , 'NONE' , s:yellow_hard , 'NONE')
call s:hl('diffIndexLine', 'NONE' , s:yellow_hard , 'NONE')
call s:hl('diffNewFile'  , 'NONE' , s:yellow_hard , 'NONE')
call s:hl('diffLine'     , 'NONE' , s:purple_hard , 'NONE')
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

  let g:terminal_color_1 = s:red_hard
  let g:terminal_color_9 = s:red

  let g:terminal_color_2 = s:green_hard
  let g:terminal_color_10 = s:green

  let g:terminal_color_3 = s:yellow_hard
  let g:terminal_color_11 = s:yellow

  let g:terminal_color_4 = s:blue_hard
  let g:terminal_color_12 = s:blue

  let g:terminal_color_5 = s:purple_hard
  let g:terminal_color_13 = s:purple

  let g:terminal_color_6 = s:aqua_hard
  let g:terminal_color_14 = s:aqua

  let g:terminal_color_7 = s:fg4
  let g:terminal_color_15 = s:fg1
endif
" }}}

" Plugin specific {{{
let g:rainbow_conf = {
      \	'guifgs': [s:orange_hard, s:blue_hard, s:red_hard, s:green_hard],
      \}

call s:hl('Sneak'     , 'NONE', s:bg0, s:blue_hard)
call s:hl('SneakLabel', 'NONE', s:bg0, s:blue_hard)
call s:hl('SneakScope', 'NONE', s:bg0, s:aqua_hard)
" }}}

" vim: fdm=marker
