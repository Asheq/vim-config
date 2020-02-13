" asheq-code-dark (colorscheme inspired by VS Code)

" Initialization {{{
scriptencoding utf-8
set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="asheq-codedark"
" }}}

" Highlighting function {{{
function! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "highlight " . a:group . " guifg=" . a:fg
  endif
  if !empty(a:bg)
    exec "highlight " . a:group . " guibg=" . a:bg
  endif
  if !empty(a:attr)
    exec "highlight " . a:group . " gui=" . a:attr
  endif
  if !empty(a:sp)
    exec "highlight " . a:group . " guisp=" . a:sp
  endif
endfun
" }}}

" Color palette {{{
" Shades of gray {{{
let s:gray1             = '#1E1E1E' " cdBack, cdTabCurrent
let s:gray2             = '#222222' " cdCursorDarkDark (unused)
let s:gray3             = '#252526' " cdTabOutside, cdLeftDark (unused)
let s:gray4             = '#2D2D2D' " cdTabOther
let s:gray5             = '#2D2D30' " cdPopupBack
let s:gray6             = '#373737' " cdLeftMid (unused)
let s:gray7             = '#3D3D40' " cdPopupHighlightGray
let s:gray8             = '#3F3F46' " cdLeftLight (unused)
let s:gray9             = '#424242' " cdSplitThumb (unused)
let s:gray10            = '#444444' " cdSplitDark
let s:gray11            = '#4C4E50' " cdSearch
let s:gray12            = '#51504F' " cdCursorDark
let s:gray13            = '#5A5A5A' " cdLineNumber
let s:gray14            = '#808080' " cdGray
let s:gray15            = '#898989' " cdSplitLight (unused)
let s:gray16            = '#AEAFAD' " cdCursorLight
let s:gray17            = '#BBBBBB' " cdPopupFront
let s:gray18            = '#D4D4D4' " cdFront
" }}}

" Shades of slate {{{
let s:slate1            = '#073655' " cdPopupHighlightBlue
let s:slate2            = '#264F78' " cdSelection
let s:slate3            = '#49545F' " cdSearchCurrent (unused)
" }}}

" Basic colors {{{
let s:blue              = '#569CD6' " s:cdBlue
let s:darkBlue          = '#223E55' " s:cdDarkBlue (unused)
let s:lightBlue         = '#9CDCFE' " s:cdLightBlue
let s:blueGreen         = '#4EC9B0' " s:cdBlueGreen

let s:green             = '#608B4E' " s:cdGreen
let s:lightGreen        = '#B5CEA8' " s:cdLightGreen

let s:red               = '#F44747' " s:cdRed
let s:lightRed          = '#D16969' " s:cdLightRed

let s:yellow            = '#DCDCAA' " s:cdYellow
let s:yellowOrange      = '#D7BA7D' " s:cdYellowOrange

let s:orange            = '#CE9178' " s:cdOrange
let s:darkOrange        = '#6b342a' " CUSTOM

let s:pink              = '#C586C0' " s:cdPink

let s:violet            = '#646695' " s:cdViolet
let s:darkViolet        = '#444666' " CUSTOM
" }}}

" Diff Green and Red {{{
let s:diffRedDark       = '#4B1818' " s:diffRedDark
let s:diffRedLight      = '#6F1313' " s:diffRedLight (unused)
let s:diffRedLightLight = '#FB0101' " s:diffRedLightLight (unused)

let s:diffGreenDark     = '#373D29' " s:diffGreenDark
let s:diffGreenLight    = '#4B5632' " s:diffGreenLight (unused)

let s:diffVioletDark    = '#252838' " CUSTOM
let s:diffVioletLight   = '#40415f' " CUSTOM
" }}}
" }}}

" Normal {{{
" call <sid>hi('Normal'         , s:gray18       , s:gray1         , 'NONE'       , 'NONE')
" NOTE: When the Normal highlight is unspecified, vim will use the terminal's
" background and fogreground
" }}}

" No foreground or background {{{
" Editor elements {{{
call <sid>hi('MoreMsg'        , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('TabLineSel'     , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
" }}}

" Syntax groups {{{
call <sid>hi('Directive'      , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Format'         , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('PreProc'        , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Special'        , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Underlined'     , 'NONE'      , 'NONE'            , 'UNDERLINE'  , 'NONE')
" }}}
" }}}

" Foreground only {{{
" Editor elements {{{
call <sid>hi('Directory'      , s:blue      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('EndOfBuffer'    , s:gray1     , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('ErrorMsg'       , s:red       , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('FoldColumn'     , s:gray13    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('LineNr'         , s:gray12    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('NonText'        , s:yellow    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Question'       , s:blueGreen , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('SpellBad'       , s:violet    , 'NONE'            , 'UNDERCURL'  , 'NONE')
call <sid>hi('Title'          , s:blue      , 'NONE'            , 'BOLD'       , 'NONE')
call <sid>hi('WarningMsg'     , s:lightRed  , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Whitespace'     , s:gray13    , 'NONE'            , 'NONE'       , 'NONE')
" }}}

" Syntax groups {{{
call <sid>hi('Boolean'        , s:blue      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Comment'        , s:green     , 'NONE'            , 'ITALIC'     , 'NONE')
call <sid>hi('Error'          , s:red       , 'NONE'            , 'UNDERCURL'  , 'NONE')
call <sid>hi('Identifier'     , s:yellow    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Ignore'         , s:gray13    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Number'         , s:blue      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Statement'      , s:pink      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('String'         , s:orange    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Todo'           , s:green     , 'NONE'            , 'BOLDITALIC' , 'NONE')
call <sid>hi('Type'           , s:blue      , 'NONE'            , 'NONE'       , 'NONE')
" }}}

" Parentheses {{{
let g:rainbow_conf = {
      \	'guifgs': [s:lightBlue, s:yellowOrange]
      \}
" }}}
" }}}

" Background only {{{
" Cursorline
call <sid>hi('CursorLine'     , 'NONE'      , s:gray5           , 'NONE'       , 'NONE')

" Diff
call <sid>hi('DiffAdd'        , 'NONE'      , s:diffGreenDark   , 'NONE'       , 'NONE')
call <sid>hi('DiffDelete'     , 'NONE'      , s:diffRedDark     , 'NONE'       , 'NONE')
call <sid>hi('DiffText'       , 'NONE'      , s:diffVioletLight , 'NONE'       , 'NONE')
call <sid>hi('DiffChange'     , 'NONE'      , s:diffVioletDark  , 'NONE'       , 'NONE')

" Search
call <sid>hi('IncSearch'      , 'NONE'      , s:gray11          , 'NONE'       , 'NONE')
call <sid>hi('Search'         , 'NONE'      , s:darkOrange      , 'NONE'       , 'NONE')

" Other
call <sid>hi('MatchParen'     , 'NONE'      , s:gray12          , 'NONE'       , 'NONE')
call <sid>hi('QuickFixLine'   , 'NONE'      , s:slate1          , 'NONE'       , 'NONE')
call <sid>hi('Substitute'     , 'NONE'      , s:darkViolet      , 'NONE'       , 'NONE')
call <sid>hi('Visual'         , 'NONE'      , s:slate2          , 'NONE'       , 'NONE')
" }}}

" Foreground and background {{{

" Window borders
call <sid>hi('StatusLine'     , s:gray14    , s:gray10          , 'NONE'       , 'NONE')
call <sid>hi('StatusLineNC'   , s:gray14    , s:gray10          , 'NONE'       , 'NONE')
call <sid>hi('User1'          , s:gray18    , s:gray10          , 'NONE'       , 'NONE')
call <sid>hi('TabLine'        , s:gray14    , s:gray4           , 'NONE'       , 'NONE')

" Popup menu
call <sid>hi('Pmenu'          , s:gray17    , s:gray7           , 'NONE'       , 'NONE')
call <sid>hi('PmenuSel'       , s:gray17    , s:slate1          , 'NONE'       , 'NONE')
call <sid>hi('PmenuThumb'     , s:gray17    , s:gray17          , 'NONE'       , 'NONE')

" Sneak
call <sid>hi('Sneak'          , s:gray1     , s:green           , 'NONE'       , 'NONE')
call <sid>hi('SneakLabel'     , s:gray1     , s:blue            , 'NONE'       , 'NONE')

" Other
call <sid>hi('Cursor'         , s:gray12    , s:gray16          , 'NONE'       , 'NONE')
call <sid>hi('CursorLineNr'   , s:gray12    , s:gray5           , 'NONE'       , 'NONE')
call <sid>hi('Folded'         , s:gray1     , s:gray14          , 'NONE'       , 'NONE')
call <sid>hi('TermCursor'     , s:gray1     , s:green           , 'NONE'       , 'NONE')
call <sid>hi('TermCursorNC'   , s:gray18    , s:red             , 'NONE'       , 'NONE')
" }}}

" Linked {{{
" Editor elements {{{
highlight! link MsgSeparator  StatusLineNC
highlight! link SignColumn    StatusLineNC
highlight! link TabLineFill   StatusLineNC
highlight! link VertSplit     StatusLineNC

highlight! link SpellCap      SpellBad
highlight! link SpellLocal    SpellBad
highlight! link SpellRare     SpellBad

highlight! link ColorColumn   CursorLine
highlight! link CursorColumn  CursorLine

highlight! link VisualNOS     Visual
highlight! link WildMenu      Visual

highlight! link Conceal       NonText

highlight! link diffAdded     DiffAdd
highlight! link diffRemoved   DiffDelete

highlight! link diffIndexLine diffFile
highlight! link diffNewFile   diffFile

highlight! link ModeMsg       MoreMsg
highlight! link PmenuSbar     PMenu
highlight! link SneakScope    SneakLabel
highlight! link SpecialKey    Question
" }}}

" Syntax groups {{{
highlight! link Conditional     Statement
highlight! link Exception       Statement
highlight! link Keyword         Statement
highlight! link Label           Statement
highlight! link Operator        Statement
highlight! link Repeat          Statement

highlight! link Define          PreProc
highlight! link Include         PreProc
highlight! link Macro           PreProc
highlight! link PreCondit       PreProc

highlight! link Debug           Special
highlight! link Delimiter       Special
highlight! link SpecialChar     Special
highlight! link Tag             Special

highlight! link StorageClass    Type
highlight! link Structure       Type
highlight! link Typedef         Type

highlight! link Float           Number
highlight! link javascriptValue Number

highlight! link Character       String
highlight! link Constant        Boolean
highlight! link Function        Identifier
highlight! link SpecialComment  Comment
" }}}
" }}}

" Terminal colors {{{
if has('nvim')
  " Terminal colorscheme is 'solarized'
  let g:terminal_color_0  = '#002731'
  let g:terminal_color_1  = '#d01b24'
  let g:terminal_color_2  = '#728905'
  let g:terminal_color_3  = '#a57705'
  let g:terminal_color_4  = '#2075c7'
  let g:terminal_color_5  = '#c61b6e'
  let g:terminal_color_6  = '#259185'
  let g:terminal_color_7  = '#e9e2cb'

  let g:terminal_color_8  = '#001e26'
  let g:terminal_color_9  = '#bd3612'
  let g:terminal_color_10 = '#465a61'
  let g:terminal_color_11 = '#52676f'
  let g:terminal_color_12 = '#708183'
  let g:terminal_color_13 = '#5856b9'
  let g:terminal_color_14 = '#81908f'
  let g:terminal_color_15 = '#fcf4dc'
endif
" }}}

" Filetype-specific {{{
" TODO Check
" " Markdown:
" call <sid>hi('markdownBold', s:cdBlue, {}, 'bold', {})
" call <sid>hi('markdownCode', s:cdOrange, {}, 'none', {})
" call <sid>hi('markdownRule', s:cdBlue, {}, 'bold', {})
" call <sid>hi('markdownCodeDelimiter', s:cdOrange, {}, 'none', {})
" call <sid>hi('markdownHeadingDelimiter', s:cdBlue, {}, 'none', {})
" call <sid>hi('markdownFootnote', s:cdOrange, {}, 'none', {})
" call <sid>hi('markdownFootnoteDefinition', s:cdOrange, {}, 'none', {})
" call <sid>hi('markdownUrl', s:cdLightBlue, {}, 'underline', {})
" call <sid>hi('markdownLinkText', s:cdOrange, {}, 'none', {})
" call <sid>hi('markdownEscape', s:cdYellowOrange, {}, 'none', {})

" " JSON:
" call <sid>hi('jsonKeyword', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('jsonEscape', s:cdYellowOrange, {}, 'none', {})
" call <sid>hi('jsonNull', s:cdBlue, {}, 'none', {})
" call <sid>hi('jsonBoolean', s:cdBlue, {}, 'none', {})

" " HTML:
" call <sid>hi('htmlTag', s:cdGray, {}, 'none', {})
" call <sid>hi('htmlEndTag', s:cdGray, {}, 'none', {})
" call <sid>hi('htmlTagName', s:cdBlue, {}, 'none', {})
" call <sid>hi('htmlSpecialTagName', s:cdBlue, {}, 'none', {})
" call <sid>hi('htmlArg', s:cdLightBlue, {}, 'none', {})

" " CSS:
" call <sid>hi('cssBraces', s:cdFront, {}, 'none', {})
" call <sid>hi('cssInclude', s:cdPink, {}, 'none', {})
" call <sid>hi('cssTagName', s:cdYellowOrange, {}, 'none', {})
" call <sid>hi('cssClassName', s:cdYellowOrange, {}, 'none', {})
" call <sid>hi('cssPseudoClass', s:cdYellowOrange, {}, 'none', {})
" call <sid>hi('cssPseudoClassId', s:cdYellowOrange, {}, 'none', {})
" call <sid>hi('cssPseudoClassLang', s:cdYellowOrange, {}, 'none', {})
" call <sid>hi('cssIdentifier', s:cdYellowOrange, {}, 'none', {})
" call <sid>hi('cssProp', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('cssDefinition', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('cssAttr', s:cdOrange, {}, 'none', {})
" call <sid>hi('cssAttrRegion', s:cdOrange, {}, 'none', {})
" call <sid>hi('cssColor', s:cdOrange, {}, 'none', {})
" call <sid>hi('cssFunction', s:cdOrange, {}, 'none', {})
" call <sid>hi('cssFunctionName', s:cdOrange, {}, 'none', {})
" call <sid>hi('cssVendor', s:cdOrange, {}, 'none', {})
" call <sid>hi('cssValueNumber', s:cdOrange, {}, 'none', {})
" call <sid>hi('cssValueLength', s:cdOrange, {}, 'none', {})
" call <sid>hi('cssUnitDecorators', s:cdOrange, {}, 'none', {})

" " JavaScript:
" call <sid>hi('jsVariableDef', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('jsFuncArgs', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('jsRegexpString', s:cdLightRed, {}, 'none', {})
" call <sid>hi('jsThis', s:cdBlue, {}, 'none', {})
" call <sid>hi('jsOperatorKeyword', s:cdBlue, {}, 'none', {})
" call <sid>hi('jsDestructuringBlock', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('jsObjectKey', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('jsGlobalObjects', s:cdBlueGreen, {}, 'none', {})
" call <sid>hi('jsModuleKeyword', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('jsClassDefinition', s:cdBlueGreen, {}, 'none', {})
" call <sid>hi('jsClassKeyword', s:cdBlue, {}, 'none', {})
" call <sid>hi('jsExtendsKeyword', s:cdBlue, {}, 'none', {})
" call <sid>hi('jsExportDefault', s:cdPink, {}, 'none', {})
" call <sid>hi('jsFuncCall', s:cdYellow, {}, 'none', {})
" call <sid>hi('jsObjectValue', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('jsParen', s:cdLightBlue, {}, 'none', {})
" call <sid>hi('jsObjectProp', s:cdLightBlue, {}, 'none', {})

" " Git:
" call <sid>hi('gitcommitHeader', s:cdGray, {}, 'none', {})
" call <sid>hi('gitcommitOnBranch', s:cdGray, {}, 'none', {})
" call <sid>hi('gitcommitBranch', s:cdPink, {}, 'none', {})
" call <sid>hi('gitcommitComment', s:cdGray, {}, 'none', {})
" call <sid>hi('gitcommitSelectedType', s:cdGreen, {}, 'none', {})
" call <sid>hi('gitcommitSelectedFile', s:cdGreen, {}, 'none', {})
" call <sid>hi('gitcommitDiscardedType', s:cdRed, {}, 'none', {})
" call <sid>hi('gitcommitDiscardedFile', s:cdRed, {}, 'none', {})
" call <sid>hi('gitcommitOverflow', s:cdRed, {}, 'none', {})
" call <sid>hi('gitcommitSummary', s:cdPink, {}, 'none', {})
" call <sid>hi('gitcommitBlank', s:cdPink, {}, 'none', {})

" javascript:
highlight! link javaScriptNull       Type
highlight! link javaScriptIdentifier Statement
highlight! link javaScriptFunction   Statement

" vim:
highlight! link vimCommentTitle Comment
highlight! link vimUserFunc Special

" html:
call <sid>hi('htmlH1' , s:blue , 'NONE' , 'BOLD' , 'NONE')
call <sid>hi('htmlH2' , s:blue , 'NONE' , 'NONE' , 'NONE')

" markdown:
highlight! link mkdHeading htmlH2
highlight! link mkdListItem Statement
highlight! link mkdInlineURL Identifier
" }}}

" vim: fdm=marker
