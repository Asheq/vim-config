" vim: fdm=marker

" TODO
" - Add visual-mode equivalent of all normal-mode mappings, where applicable
" - Make operators, text objects, and motions
" - Mappings for:
"   > run ctags and tag navigation
"   > count occurrences of last search term --- :%s///gn
"   > toggle location list
"   > :colder, :cnewer, etc. --- in qf filetype?

" Leader Mappings {{{

  let g:mapleader = "\<Space>"

  " Miscellaneous
  nmap              <leader>q <Plug>(qf_qf_toggle)
  nnoremap          <leader>e :edit <C-z>
  nnoremap          <leader>g :grep! 
  nnoremap          <leader>n :split\|enew<CR>
  xnoremap          <leader>n :<C-u>call VisualSelectionToNewBuffer()<CR>
  nnoremap          <leader><Tab> :tab
  nnoremap <silent> <leader>u :UndotreeToggle<CR>
  nnoremap <silent> <leader>w :update<CR>

  " Search in File (with Denite)
  nnoremap <silent> <leader>* :DeniteCursorWord line<CR>
  nnoremap <silent> <leader>/ :Denite line<CR>
  nnoremap <silent> <leader>? :Denite line<CR>

  " Search for File or Buffer
  nnoremap          <leader>b :PrettyPrintBufferList<CR>:b *
  nnoremap          <leader>f :echo 'Reserved for fuzzy file search'<CR>
  nnoremap          <leader>r :echo 'Reserved for fuzzy recent file search'<CR>

  " Manually Browse File System
  nnoremap <silent> <leader>D :Dirvish<CR>
  nnoremap <silent> <leader>d :call DirvishUseCurrentFile()<CR>

  " Window Management
  nnoremap          <leader><leader> <C-w>p
  nnoremap          <leader>= <C-w>=
  nnoremap          <leader>c <C-w>c
  nnoremap          <leader>o <C-w>o
  nnoremap          <leader>x <C-w>x
  nnoremap          <leader>H <C-w>H
  nnoremap          <leader>J <C-w>J
  nnoremap          <leader>K <C-w>K
  nnoremap          <leader>L <C-w>L
  nnoremap <silent> <leader>h :set nosplitright\|vsplit<CR>
  nnoremap <silent> <leader>j :set splitbelow\|split<CR>
  nnoremap <silent> <leader>k :set nosplitbelow\|split<CR>
  nnoremap <silent> <leader>l :set splitright\|vsplit<CR>
  xnoremap <silent> <leader>h :<C-u>set nosplitright\|vsplit<CR>
  xnoremap <silent> <leader>k :VSSplitAbove<CR>
  xnoremap <silent> <leader>j :VSSplitBelow<CR>
  xnoremap <silent> <leader>l :<C-u>set splitright\|vsplit<CR>

  " Sessions
  nnoremap <expr>   <leader>m ':mksession! ' . GetCacheDir('sessions') . '/<C-z>'
  nnoremap <expr>   <leader>s ':source ' . GetCacheDir('sessions') . '/<C-z>'
  nnoremap <expr>   <leader>z ':edit ' . GetCacheDir('junkfiles') . '/<C-z>'

" }}}

" Backslash Mappings {{{

  " Source Vimscript
  nnoremap <silent> \ss :call SourceVimscript(0)<CR>
  xnoremap <silent> \s :<C-u>call SourceVimscript(1)<CR>

  " Denite
  nnoremap <silent> \d :Denite -resume<CR>
  nnoremap <silent> \f :Denite filetype<CR>
  nnoremap <silent> \m :Denite menu<CR>

  " Replace Buffer with System Clipboard
  nnoremap          \r gg"_dG"*p:call EchoWithColor('Replaced buffer contents with system clipboard', 'WarningMsg')<CR>

" }}}

" Mappings that Start with 'z' {{{

  " Credit: shougo
  nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ? 'zt' : 'zz'

  nnoremap        zh 10zh
  nnoremap        zl 10zl
  xnoremap        zh 10zh
  xnoremap        zl 10zl

  nnoremap        zr zr:echo 'foldlevel: ' . &foldlevel<CR>
  nnoremap        zm zm:echo 'foldlevel: ' . &foldlevel<CR>
  nnoremap        zR zR:echo 'foldlevel: ' . &foldlevel<CR>
  nnoremap        zM zM:echo 'foldlevel: ' . &foldlevel<CR>

  nnoremap        z/ :Ilist 
  nnoremap        z* :Ilist <C-r><C-w><CR>

" }}}

" Mappings that Start with 'g' {{{

  nmap     gx  <Plug>(openbrowser-smart-search)
  xmap     gx  <Plug>(openbrowser-smart-search)

  nnoremap gh  :ShowHighlightInfoUnderCursor<CR>

  nnoremap goc :OpenFileInChrome<CR>

  noremap  gj  j
  noremap  gk  k
  noremap  j   gj
  noremap  k   gk

  " Regex Search ("very magic")
  " Set mark s (for quickly jumping back), then search as regex
  nnoremap g/  ms/\v
  xnoremap g/  ms/\v
  nnoremap g?  ms?\v
  xnoremap g?  ms?\v

" }}}

" Mappings that Start with an Operator {{{

  " Yank Path of File
  nnoremap yp  :let @*=expand('%:p')<CR>

  " Current Directory (change Here and Print)
  nnoremap cdh :cd %:p:h<CR>:call EchoWithColor('CWD -> ' . getcwd(), 'WarningMsg')<CR>
  nnoremap cdp :echo 'CWD == ' . getcwd()<CR>

  " Toggling
  nmap     cog <Plug>IndentGuidesToggle
  nnoremap cot :set colorcolumn<C-R>=match(&colorcolumn,'+1')>=0?'-=+1':'+=+1'<CR><CR>
  nnoremap coz :call ToggleFoldOpenFoldCloseStrategy()<CR>
" }}}

" Function Key Mappings {{{

  " Diff with file saved on disk
  nnoremap <F5> :DiffOrig<CR>
  nnoremap <F6> :bdelete\|diffoff!<CR>
  nnoremap <F7> :write !diff % -<CR> 

" }}}

" Other Mappings {{{

  inoremap <C-u> <C-g>u<C-u>

  nnoremap Y     y$

  nnoremap &     :&&<CR>
  xnoremap &     :&&<CR>

  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  nnoremap <Up>  :<Up>
  xnoremap <Up>  :<Up>
  nnoremap <C-p> :<Up>
  xnoremap <C-p> :<Up>
  cnoremap <C-p> <Up>

  inoremap jk    <Esc>
  inoremap kj    <Esc>

  noremap  '     `
  noremap  `     '
  noremap  g'    g`
  noremap  g`    g'

  map      r     %
  noremap  R     r

  nnoremap -     <C-^>

  nnoremap <BS>  :nohlsearch<CR>

  nnoremap Q     :BufferCloseDialog<CR>

  " Literal Search ("Very not magic")
  " Set mark s (for quickly jumping back), then search literally
  nnoremap /     ms/\V
  xnoremap /     ms/\V
  nnoremap ?     ms?\V
  xnoremap ?     ms?\V

  " Substitute selected text with something else
  xnoremap x "hy:%s/<c-r>h//gc<left><left><left>

  " Do a substitution inside the selected text
  xnoremap X :s/\%V//gc<left><left><left><left>

  " Insert text copied from system clipboard as literal characters (instead of as if typed)
  " when using Ctrl-R in insert mode. This prevents 'clipboard hijacking' attacks.
  inoremap <C-R>+ <C-R><C-R>+
  inoremap <C-R>* <C-R><C-R>*

  " Insert date
  " Credit: tpope
  inoremap <silent> <C-g><C-t>
    \ <C-r>=repeat(complete(col('.'), map([
    \ "%Y-%m-%d %H:%M:%S",
    \ "%Y-%m-%d",
    \ "%Y %b %d",
    \ "%d-%b-%y",
    \ "%a, %d %b %Y %H:%M:%S %z",
    \ "%a %b %d %T %Z %Y"
    \ ], 'strftime(v:val)')), 0)<CR>

  " Improved scrolling
  " Credit: shougo
  noremap <expr> <C-f> max([winheight(0) - 2, 1]) ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
  noremap <expr> <C-b> max([winheight(0) - 2, 1]) ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
  noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
  noremap <expr> <C-y> (line("w0") <= 1 ? "k" : "3\<C-y>")

" }}}

" Free Mappings {{{

  " Free leader mappings (that do not involve Shift key) {{{
    " <leader>`
    " <leader>[0-9]
    " <leader>-
    " <leader><BS>
    " <leader>[
    " <leader>]
    " <leader>\
    " <leader>;
    " <leader>'
    " <leader>,
    " <leader>.
    " <leader>a
    " <leader>i
    " <leader>p
    " <leader>t
    " <leader>v
    " <leader>y
  " }}}

  " Free backslash mappings (that do not involve Shift key) {{{
    " <backslash>`
    " <backslash>-
    " <backslash>=
    " <backslash><Tab>
    " <backslash>[
    " <backslash>]
    " <backslash>\
    " <backslash>,
    " <backslash>.
    " <backslash>/
    " <backslash>a
    " <backslash>b
    " <backslash>c
    " <backslash>e
    " <backslash>g
    " <backslash>h
    " <backslash>i
    " <backslash>j
    " <backslash>k
    " <backslash>l
    " <backslash>n
    " <backslash>o
    " <backslash>p
    " <backslash>q
    " <backslash>t
    " <backslash>u
    " <backslash>v
    " <backslash>w
    " <backslash>x
    " <backslash>y
    " <backslash>z
  " " }}}

  " Free normal-mode mappings that start with 'z' (that do not involve Shift key) {{{
    " zp
    " zq
    " zy
    " z`
    " z<Tab>
    " z[
    " z]
    " z\
    " z,
    " More that are duplicates or not useful...
  " }}}

  " Free normal-mode mappings that start with 'g' (that do not involve Shift key) {{{
    " g=
    " g<Tab>
    " g]
    " g.
    " gp
    " gy
    " gz
    " More that are duplicates or not useful...
  " }}}

  " Free visual-mode mappings {{{
    " % (duplicate since r can be used now)
    " _
    " P (duplicate with p)
    " x (duplicate with d)
    " X (duplicate with D)
  " }}}

  " Free normal-mode mappings that start with an operator {{{
  " }}}

  " Keys auto-mapped by plugins {{{
    " gb
    " gc
    " ge
    " gl
    " gr
    " gs
    " gw
    " zu
    " co[some]
    " MORE ???
  " }}}

" }}}

" Notes {{{

  " Note: Vim by default uses 'z' as a name-space for:
  "   > Scrolling (both horizontal and vertical)
  "   > Folding
  "   > Spelling
  "   > Changing window height

  " Note: Vim by default uses 'g' as a name-space for:
  "   > Operators for changing case
  "   > Operators for formatting
  "   > Operators for encoding
  "   > Printing info about character under cursor
  "   > Modifiers that modify the default behaviour of regular normal-mode commands
  "   > 'Going' places (go to definition, go to file, etc.)
  "   > Various...

  " Note: Valid mappings that start with an operator:
  "   > operator non-motion
  "   > operator-1 operator-2

  " Note: Cheat Sheet
  "   > http://www.viemu.com/vi-vim-cheat-sheet.gif
" }}}

