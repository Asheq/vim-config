" asheq-code-dark (colorscheme inspired by VS Code)

" Initialization
" ============================================================================
scriptencoding utf-8
set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="asheq-codedark"

" Highlighting function
" ============================================================================
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

" Color palette
" ============================================================================
" Shades of gray
" ----------------------------------------------------------------------------
let s:gray1             = '#1E1E1E' " cdBack, cdTabCurrent
let s:gray2             = '#222222' " cdCursorDarkDark (unused)
let s:gray3             = '#252526' " cdTabOutside, cdLeftDark (unused)
let s:gray4             = '#2D2D2D' " cdTabOther
let s:gray5             = '#2D2D30' " cdPopupBack
let s:gray6             = '#373737' " cdLeftMid (unused)
let s:gray7             = '#3D3D40' " cdPopupHighlightGray
let s:gray8             = '#3F3F46' " cdLeftLight (unused)
let s:gray9             = '#424242' " cdSplitThumb
let s:gray10            = '#444444' " cdSplitDark
let s:gray11            = '#4C4E50' " cdSearch
let s:gray12            = '#51504F' " cdCursorDark
let s:gray13            = '#5A5A5A' " cdLineNumber
let s:gray14            = '#808080' " cdGray
let s:gray15            = '#898989' " cdSplitLight
let s:gray16            = '#AEAFAD' " cdCursorLight
let s:gray17            = '#BBBBBB' " cdPopupFront
let s:gray18            = '#D4D4D4' " cdFront

" Shades of slate
" ----------------------------------------------------------------------------
let s:slate1            = '#073655' " cdPopupHighlightBlue
let s:slate2            = '#264F78' " cdSelection
let s:slate3            = '#49545F' " cdSearchCurrent

" Basic colors
" ----------------------------------------------------------------------------
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
let s:darkOrange        = '#6b342a' " CUSTOM (unused)

let s:pink              = '#C586C0' " s:cdPink

let s:violet            = '#646695' " s:cdViolet
let s:darkViolet        = '#444666' " CUSTOM

" Diff Green and Red
" ----------------------------------------------------------------------------
let s:diffRedDark       = '#4B1818' " s:diffRedDark
let s:diffRedLight      = '#6F1313' " s:diffRedLight
let s:diffRedLightLight = '#FB0101' " s:diffRedLightLight (unused)

let s:diffGreenDark     = '#373D29' " s:diffGreenDark
let s:diffGreenLight    = '#4B5632' " s:diffGreenLight

let s:diffVioletDark    = '#252838' " CUSTOM
let s:diffVioletLight   = '#40415f' " CUSTOM

" Normal
" ----------------------------------------------------------------------------
" NOTE: In the terminal, use the terminal's default background and foreground
" colors
if has('gui') || has("gui_vimr")
    call <sid>hi('Normal'         , s:gray18       , s:gray1         , 'NONE'       , 'NONE')
endif

" No foreground or background
" ============================================================================
" Editor elements
" ----------------------------------------------------------------------------
call <sid>hi('MoreMsg'        , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('TabLineSel'     , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')

" Syntax groups
" ----------------------------------------------------------------------------
call <sid>hi('Directive'      , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Format'         , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('PreProc'        , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Special'        , 'NONE'      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Underlined'     , 'NONE'      , 'NONE'            , 'UNDERLINE'  , 'NONE')

" Foreground only
" ============================================================================
" Editor elements
" ----------------------------------------------------------------------------
call <sid>hi('Directory'      , s:blue      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('ErrorMsg'       , s:red       , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('FoldColumn'     , s:gray15    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('LineNr'         , s:gray12    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('NonText'        , s:gray13    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Question'       , s:blueGreen , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('SpellBad'       , 'NONE'      , 'NONE'            , 'UNDERCURL'  , s:red)
call <sid>hi('SpellCap'       , 'NONE'      , 'NONE'            , 'UNDERCURL'  , s:orange)
call <sid>hi('SpellLocal'     , 'NONE'      , 'NONE'            , 'UNDERCURL'  , s:violet)
call <sid>hi('SpellRare'      , 'NONE'      , 'NONE'            , 'UNDERCURL'  , s:violet)
call <sid>hi('Title'          , s:blue      , 'NONE'            , 'BOLD'       , 'NONE')
call <sid>hi('Folded'         , s:gray13    , 'NONE'            , 'ITALIC'     , 'NONE')
call <sid>hi('VertSplit'      , s:gray10    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('WarningMsg'     , s:lightRed  , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Whitespace'     , s:gray13    , 'NONE'            , 'NONE'       , 'NONE')

" Syntax groups
" ----------------------------------------------------------------------------
call <sid>hi('Boolean'        , s:blue      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Comment'        , s:green     , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Error'          , s:red       , 'NONE'            , 'UNDERCURL'  , 'NONE')
call <sid>hi('Identifier'     , s:yellow    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Ignore'         , s:gray13    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Number'         , s:blue      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Statement'      , s:pink      , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('String'         , s:orange    , 'NONE'            , 'NONE'       , 'NONE')
call <sid>hi('Todo'           , s:green     , 'NONE'            , 'BOLD'       , 'NONE')
call <sid>hi('Type'           , s:blue      , 'NONE'            , 'NONE'       , 'NONE')

" Parentheses
" ----------------------------------------------------------------------------
let g:rainbow_conf = {
            \	'guifgs': ['cyan', 'orange', 'lightgreen', 'red']
            \}

" Background only
" ============================================================================
" Cursorline
call <sid>hi('CursorLine'     , 'NONE'      , s:gray5           , 'NONE'       , 'NONE')

" Diff
call <sid>hi('DiffAdd'        , 'NONE'      , s:diffGreenDark   , 'NONE'       , 'NONE')
call <sid>hi('DiffDelete'     , 'NONE'      , s:diffRedDark     , 'NONE'       , 'NONE')
call <sid>hi('DiffText'       , 'NONE'      , s:diffVioletLight , 'NONE'       , 'NONE')
call <sid>hi('DiffChange'     , 'NONE'      , s:diffVioletDark  , 'NONE'       , 'NONE')

" Search
call <sid>hi('IncSearch'      , s:gray9     , s:yellowOrange    , 'NONE'       , 'NONE')
call <sid>hi('Search'         , 'NONE'      , 'NONE'            , 'UNDERLINE'  , 'NONE')

" Other
call <sid>hi('MatchParen'     , 'NONE'      , s:gray12          , 'NONE'       , 'NONE')
call <sid>hi('QuickFixLine'   , 'NONE'      , s:slate1          , 'NONE'       , 'NONE')
call <sid>hi('Substitute'     , 'NONE'      , s:darkViolet      , 'NONE'       , 'NONE')
call <sid>hi('Visual'         , 'NONE'      , s:slate2          , 'NONE'       , 'NONE')
call <sid>hi('Match'          , 'NONE'      , s:slate3          , 'NONE'       , 'NONE')

" Other uses of the current word under the cursor
" ----------------------------------------------------------------------------
call <sid>hi('illuminatedWord', 'NONE'      , s:slate3          , 'NONE'       , 'NONE')

" Foreground and background
" ============================================================================

" Window borders
call <sid>hi('StatusLine'             , s:gray14    , s:gray10          , 'NONE' , 'NONE')
call <sid>hi('StatusLineNC'           , s:gray14    , s:gray10          , 'NONE' , 'NONE')
call <sid>hi('User1'                  , s:gray18    , s:gray10          , 'NONE' , 'NONE')
call <sid>hi('User2'                  , s:lightBlue , s:gray14          , 'NONE' , 'NONE')
call <sid>hi('TabLine'                , s:gray14    , s:gray4           , 'NONE' , 'NONE')

" Popup menu
call <sid>hi('Pmenu'                  , s:gray17    , s:gray7           , 'NONE' , 'NONE')
call <sid>hi('PmenuSel'               , s:gray17    , s:slate1          , 'NONE' , 'NONE')
call <sid>hi('PmenuThumb'             , s:gray17    , s:gray17          , 'NONE' , 'NONE')

" Sneak
call <sid>hi('Sneak'                  , s:gray1     , s:green           , 'NONE' , 'NONE')
call <sid>hi('SneakLabel'             , s:gray1     , s:blue            , 'NONE' , 'NONE')

" Sandwich
call <sid>hi('OperatorSandwichAdd'    , 'NONE'      , s:diffGreenLight  , 'NONE' , 'NONE')
call <sid>hi('OperatorSandwichDelete' , 'NONE'      , s:diffRedLight    , 'NONE' , 'NONE')
call <sid>hi('OperatorSandwichChange' , 'NONE'      , s:diffVioletLight , 'NONE' , 'NONE')

" Other
call <sid>hi('Cursor'                 , s:gray12    , s:gray16          , 'NONE' , 'NONE')
call <sid>hi('CursorLineNr'           , s:gray12    , s:gray5           , 'NONE' , 'NONE')
call <sid>hi('TermCursor'             , s:gray1     , s:green           , 'NONE' , 'NONE')
call <sid>hi('TermCursorNC'           , s:gray18    , s:red             , 'NONE' , 'NONE')

" Linked
" ============================================================================
" Editor elements
" ----------------------------------------------------------------------------
highlight! link MsgSeparator  StatusLineNC
highlight! link SignColumn    StatusLineNC
highlight! link TabLineFill   StatusLineNC

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

highlight! link EndOfBuffer   LineNr

" Syntax groups
" ----------------------------------------------------------------------------
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

" Terminal colors
" ============================================================================
let g:terminal_color_0  = s:gray4
let g:terminal_color_1  = s:red
let g:terminal_color_2  = s:green
let g:terminal_color_3  = s:yellowOrange
let g:terminal_color_4  = s:blue
let g:terminal_color_5  = s:violet
let g:terminal_color_6  = s:blueGreen
let g:terminal_color_7  = s:gray15
let g:terminal_color_8  = s:gray11
let g:terminal_color_9  = s:lightRed
let g:terminal_color_10 = s:lightGreen
let g:terminal_color_11 = s:yellow
let g:terminal_color_12 = s:lightBlue
let g:terminal_color_13 = s:pink
let g:terminal_color_14 = s:blueGreen
let g:terminal_color_15 = s:gray18

" Filetype-specific
" ============================================================================
" javascript:
highlight! link javaScriptNull       Type
highlight! link javaScriptIdentifier Statement
highlight! link javaScriptFunction   Statement

" vim:
highlight! link vimCommentTitle Comment
highlight! link vimUserFunc Special

" markdown:
highlight! link htmlLink Question
highlight! link htmlH1   Title
highlight! link htmlH2   Statement
highlight! link htmlH3   Identifier
