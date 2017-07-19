" mappings.vim

" Leader Mappings {{{

  let mapleader = "\<Space>"

  " Miscellaneous
  nmap              <leader>q     <Plug>(qf_qf_toggle)
  nnoremap          <leader>e     :edit <C-z>
  nnoremap          <leader>g     :grep! 
  nnoremap          <leader>n     :set splitbelow\|split\|enew<CR>
  xnoremap          <leader>n     :<C-u>VisualSelectionToNewBuffer<CR>
  nnoremap <silent> <leader>u     :UndotreeToggle<CR>
  nnoremap <silent> <leader>w     :update<CR>
  nnoremap          <leader><Tab> :tab

  " Search in file (with Denite)
  nnoremap <silent> <leader>* :DeniteCursorWord line<CR>
  nnoremap <silent> <leader>/ :Denite line<CR>
  nnoremap <silent> <leader>? :Denite line<CR>

  " Search for file or buffer
  nnoremap          <leader>b :PrettyPrintBufferList<CR>:b *
  nnoremap          <leader>f :echo 'Reserved for fuzzy file search'<CR>
  nnoremap          <leader>r :echo 'Reserved for fuzzy recent file search'<CR>

  " Manually browse file system
  nnoremap <silent> <leader>D :Dirvish<CR>
  nnoremap <silent> <leader>d :DirvishInCurrentFileDirectory<CR>

  " Windows
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

" }}}

" Backslash Mappings {{{

  " Denite
  nnoremap <silent> \d :Denite -resume<CR>
  nnoremap <silent> \f :Denite filetype<CR>
  nnoremap <silent> \m :Denite menu<CR>

  " Replace buffer with system clipboard
  nnoremap          \r :ReplaceBufferWithSystemClipboard<CR>

" }}}

" Mappings that Start with 'z' {{{

  " Improved scrolling
  " Credit: shougo
  nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ? 'zt' : 'zz'
  nnoremap        zh 10zh
  nnoremap        zl 10zl
  xnoremap        zh 10zh
  xnoremap        zl 10zl

  " Echo foldlevel
  nnoremap        zr zr:echo 'foldlevel: ' . &foldlevel<CR>
  nnoremap        zm zm:echo 'foldlevel: ' . &foldlevel<CR>
  nnoremap        zR zR:echo 'foldlevel: ' . &foldlevel<CR>
  nnoremap        zM zM:echo 'foldlevel: ' . &foldlevel<CR>

  " Search in file (show results in quickfix)
  nnoremap        z/ :Ilist 
  nnoremap        z* :Ilist <C-r><C-w><CR>

" }}}

" Mappings that Start with 'g' {{{

  " Search in browser
  nmap     gx  <Plug>(openbrowser-smart-search)
  xmap     gx  <Plug>(openbrowser-smart-search)

  " Show highlight info under cursor
  nnoremap gh  :ShowHighlightInfoUnderCursor<CR>

  " Open file in Chrome
  nnoremap goc :OpenBrowserCurrent<CR>

  " Improved cursor movement through wrapped text
  noremap  gj  j
  noremap  gk  k
  noremap  j   gj
  noremap  k   gk

  " Regex search ("very magic")
  " Set mark s, then search as regex
  nnoremap g/  ms/\v
  xnoremap g/  ms/\v
  nnoremap g?  ms?\v
  xnoremap g?  ms?\v

" }}}

" Mappings that Start with an Operator {{{

  " Yank path of file
  nnoremap ypf  :let @*=expand('%:p')<CR>
  nnoremap ypp  :let @*=expand('%:p:h')<CR>

  " Change current directory to that of current file
  nnoremap cd  :cd %:h<CR>:call EchoWithColor('CWD -> ' . getcwd(), 'WarningMsg')<CR>

  " Toggling commands
  nmap     cog <Plug>IndentGuidesToggle
  nnoremap cot :set colorcolumn<C-R>=match(&colorcolumn,'+1')>=0?'-=+1':'+=+1'<CR><CR>
  nnoremap coz :ToggleFoldOpenCloseStrategy<CR>
" }}}

" Function Key Mappings {{{

" }}}

" Other Mappings {{{

  " Miscellaneous
  inoremap         <C-u> <C-g>u<C-u>
  nnoremap         Y     y$
  nnoremap         &     :&&<CR>
  xnoremap         &     :&&<CR>
  inoremap         jk    <Esc>
  inoremap         kj    <Esc>
  map              r     %
  noremap          R     r
  nnoremap         -     <C-^>
  nnoremap         <BS>  :nohlsearch<CR>
  nnoremap<silent> Q     :BufferCloseDialog<CR>
  nnoremap<silent> ZZ    :confirm qa<CR>
  nnoremap<silent> K     :call Define(0)<CR>
  xnoremap<silent> K     :<C-u>call Define(1)<CR>

  " Window movement
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Recall command-line history
  nnoremap <Up>  :<Up>
  xnoremap <Up>  :<Up>
  nnoremap <C-p> :<Up>
  xnoremap <C-p> :<Up>
  cnoremap <C-p> <Up>

  " Open project drawer
  map <C-n> :NERDTreeToggle<CR>

  " Swap back-tick and apostrophe
  noremap  '     `
  noremap  `     '
  noremap  g'    g`
  noremap  g`    g'

  " Literal Search ("Very not magic")
  " Set mark s, then search literally
  nnoremap /     ms/\V
  xnoremap /     ms/\V
  nnoremap ?     ms?\V
  xnoremap ?     ms?\V

  " Substitute selected text with something else
  xnoremap x     "hy:%s/<c-r>h//gc<left><left><left>

  " Do a substitution inside the selected text
  xnoremap X     :s/\%V//gc<left><left><left><left>

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
    " <leader>z
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
  " }}}

  " Free normal-mode mappings that start with an operator {{{
    " TODO-HIGH:
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
    " co[?]
    " TODO-HIGH: More?
  " }}}

" }}}

" Notes {{{

  " Note: Vim by default uses 'z' as a name-space for:
  "   > Scrolling (both horizontal and vertical)
  "   > Folding
  "   > Spelling
  "   > Changing window height

  " Note: Vim by default uses 'g' as a name-space for:
  "   > Operator for changing case
  "   > Operator for formatting
  "   > Operator for encoding
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

" vim: fdm=marker
