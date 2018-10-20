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
let s:dark0_hard  = '#1d2021'
let s:dark0       = '#282828'
let s:dark0_soft  = '#32302f'
let s:dark1       = '#3c3836'
let s:dark2       = '#504945'
let s:dark3       = '#665c54'
let s:dark4       = '#7c6f64'

let s:gray    = '#928374'

let s:light0_hard = '#f9f5d7'
let s:light0      = '#fbf1c7'
let s:light0_soft = '#f2e5bc'
let s:light1      = '#ebdbb2'
let s:light2      = '#d5c4a1'
let s:light3      = '#bdae93'
let s:light4      = '#a89984'

let s:bright_red     = '#fb4934'
let s:bright_green   = '#b8bb26'
let s:bright_yellow  = '#fabd2f'
let s:bright_blue    = '#83a598'
let s:bright_purple  = '#d3869b'
let s:bright_aqua    = '#8ec07c'
let s:bright_orange  = '#fe8019'

let s:neutral_red    = '#cc241d'
let s:neutral_green  = '#98971a'
let s:neutral_yellow = '#d79921'
let s:neutral_blue   = '#458588'
let s:neutral_purple = '#b16286'
let s:neutral_aqua   = '#689d6a'
let s:neutral_orange = '#d65d0e'

let s:faded_red      = '#9d0006'
let s:faded_green    = '#79740e'
let s:faded_yellow   = '#b57614'
let s:faded_blue     = '#076678'
let s:faded_purple   = '#8f3f71'
let s:faded_aqua     = '#427b58'
let s:faded_orange   = '#af3a03'
" }}}

" General UI {{{
" Normal
call s:hl('Normal'       , 'NONE'     , s:dark2          , s:light0_soft)

" Miscellaneous (Normal background)
call s:hl('QuickFixLine' , 'UNDERLINE', 'NONE'           , 'NONE')
call s:hl('MatchParen'   , 'BOLD'     , 'NONE'           , 'NONE')
call s:hl('NonText'      , 'NONE'     , s:light4         , 'NONE')
call s:hl('Conceal'      , 'BOLD'     , s:light4         , 'NONE')
call s:hl('Directory'    , 'NONE'     , s:neutral_green  , 'NONE')
call s:hl('Todo'         , 'BOLD'     , s:neutral_aqua   , 'NONE')
call s:hl('WarningMsg'   , 'NONE'     , s:neutral_red    , 'NONE')
call s:hl('ErrorMsg'     , 'BOLD'     , s:neutral_red    , 'NONE')
call s:hl('Question'     , 'NONE'     , s:faded_purple   , 'NONE')
call s:hl('Title'        , 'NONE'     , s:faded_yellow   , 'NONE')

" Spell
call s:hl('SpellBad'     , 'undercurl', s:neutral_purple , 'NONE')
call s:hl('SpellCap'     , 'undercurl', s:neutral_purple , 'NONE')
call s:hl('SpellLocal'   , 'undercurl', s:neutral_blue   , 'NONE')
call s:hl('SpellRare'    , 'undercurl', s:neutral_blue   , 'NONE')

" Pmenu
call s:hl('Pmenu'        , 'NONE'     , 'NONE'           , s:light0_hard)
call s:hl('PmenuSbar'    , 'NONE'     , 'NONE'           , s:light0_hard)
call s:hl('PmenuSel'     , 'NONE'     , 'NONE'           , s:bright_aqua)
call s:hl('PmenuThumb'   , 'NONE'     , 'NONE'           , s:gray)

" CursorLine
call s:hl('CursorLine'   , 'NONE'     , 'NONE'           , s:light1 )
call s:hl('CursorColumn' , 'NONE'     , 'NONE'           , s:light1 )
call s:hl('ColorColumn'  , 'NONE'     , 'NONE'           , s:light1 )

" LineNr and Folded
call s:hl('CursorLineNr' , 'BOLD'     , s:light4         , s:light2)
call s:hl('LineNr'       , 'NONE'     , s:light4         , s:light2)
call s:hl('Folded'       , 'NONE'     , s:gray           , s:light2)
call s:hl('FoldColumn'   , 'NONE'     , s:neutral_blue   , s:light2)

" Visual
call s:hl('Visual'       , 'NONE'     , 'NONE'           , s:light2)

" StatusLine
call s:hl('StatusLineNC' , 'NONE'     , s:light3         , s:dark0_hard)
call s:hl('StatusLine'   , 'NONE'     , s:dark4          , s:light0_hard)
call s:hl('User1'        , 'NONE'     , s:bright_blue    , s:light3)

" Term Cursor
call s:hl('termCursor'   , 'NONE'     , 'NONE'           , s:neutral_green)
call s:hl('termCursorNC' , 'NONE'     , 'NONE'           , s:neutral_red)

" WildMenu
call s:hl('WildMenu'     , 'NONE'     , 'NONE'           , s:bright_aqua)

" Search
call s:hl('IncSearch'    , 'NONE'     , s:dark2          , s:bright_orange)
call s:hl('Search'       , 'NONE'     , s:dark2          , s:bright_yellow)

" Substitute
call s:hl('Substitute'   , 'NONE'     , 'NONE'           , s:bright_purple)

" Diff
call s:hl('DiffAdd'      , 'REVERSE'  , s:neutral_green  , 'NONE')
call s:hl('DiffChange'   , 'REVERSE'  , s:neutral_aqua   , 'NONE')
call s:hl('DiffDelete'   , 'REVERSE'  , s:neutral_red    , 'NONE')
call s:hl('DiffText'     , 'REVERSE'  , s:neutral_yellow , 'NONE')

" Linked to StatusLine
highlight! link TabLine StatusLineNC
highlight! link TabLineSel StatusLine
highlight! link TabLineFill StatusLineNC
highlight! link MsgSeparator StatusLineNC
highlight! link VertSplit StatusLineNC
highlight! link SignColumn StatusLineNC

" Linked to NonText
highlight! link Whitespace NonText
highlight! link SpecialKey NonText

" Linked to Visual
highlight! link VisualNOS Visual

" Linked to Question
highlight! link MoreMsg Question
highlight! link ModeMsg Question
" }}}

" Syntax {{{
call s:hl('Boolean'       , 'NONE'   , s:bright_blue , 'NONE')
call s:hl('Character'     , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Comment'       , 'NONE'   , s:neutral_aqua , 'NONE')
call s:hl('Conditional'   , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Constant'      , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Debug'         , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Define'        , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Delimiter'     , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Directive'     , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Error'         , 'NONE'   , s:bright_red  , 'NONE')
call s:hl('Exception'     , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Float'         , 'NONE'   , s:bright_blue , 'NONE')
call s:hl('Format'        , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Function'      , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Identifier'    , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Ignore'        , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Include'       , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Keyword'       , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Label'         , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Macro'         , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Number'        , 'NONE'   , s:bright_blue , 'NONE')
call s:hl('Operator'      , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('PreCondit'     , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('PreProc'       , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Repeat'        , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Special'       , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('SpecialChar'   , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('SpecialComment', 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Statement'     , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('StorageClass'  , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('String'        , 'Italic' , s:bright_blue , 'NONE')
call s:hl('Structure'     , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Tag'           , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Type'          , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Typedef'       , 'NONE'   , 'NONE'         , 'NONE')
call s:hl('Underlined'    , 'NONE'   , 'NONE'         , 'NONE')
" }}}

" Plugin specific {{{
let g:rainbow_conf = {
      \	'guifgs': [s:neutral_orange, s:neutral_blue, s:neutral_red, s:neutral_green],
      \}

call s:hl('Sneak'     , 'NONE', 'NONE', s:bright_blue)
call s:hl('SneakLabel', 'NONE', 'NONE', s:bright_blue)
call s:hl('SneakScope', 'NONE', 'NONE', s:bright_aqua)
" }}}

" Terminal colors {{{
if has('nvim')
  let g:terminal_color_0 = s:light0_soft
  let g:terminal_color_8 = s:gray

  let g:terminal_color_1 = s:bright_red
  let g:terminal_color_9 = s:neutral_red

  let g:terminal_color_2 = s:bright_green
  let g:terminal_color_10 = s:neutral_green

  let g:terminal_color_3 = s:bright_yellow
  let g:terminal_color_11 = s:neutral_yellow

  let g:terminal_color_4 = s:bright_blue
  let g:terminal_color_12 = s:neutral_blue

  let g:terminal_color_5 = s:bright_purple
  let g:terminal_color_13 = s:neutral_purple

  let g:terminal_color_6 = s:bright_aqua
  let g:terminal_color_14 = s:neutral_aqua

  let g:terminal_color_7 = s:dark4
  let g:terminal_color_15 = s:dark1
endif
" }}}

" Language specific {{{
highlight link vimUserFunc Statement
" }}}

" Git {{{
" git
call s:hl('diffAdded'    , 'NONE' , s:neutral_green  , 'NONE')
call s:hl('diffRemoved'  , 'NONE' , s:neutral_red    , 'NONE')
call s:hl('diffFile'     , 'NONE' , s:neutral_yellow , 'NONE')
call s:hl('diffIndexLine', 'NONE' , s:neutral_yellow , 'NONE')
call s:hl('diffNewFile'  , 'NONE' , s:neutral_yellow , 'NONE')
call s:hl('diffLine'     , 'NONE' , s:neutral_purple , 'NONE')
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

" vim: fdm=marker
