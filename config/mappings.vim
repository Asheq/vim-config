" vim: fdm=marker

" TODO:
" Check prefixes on mappings (n, v, x, none, etc.).
" :colder, :cnewer, tag navigation

" Leader Mappings {{{

    let g:mapleader = "\<Space>"

  " Miscellaneous {{{
    nmap                     <leader>q <Plug>(qf_qf_toggle)
    nnoremap                 <leader>e :edit <C-z>
    nnoremap                 <leader>g :grep! 
    nnoremap                 <leader>h :cd %:p:h<CR>:call EchoWithHighlightColor('CWD -> ' . getcwd(), 'WarningMsg')<CR>
    nnoremap                 <leader>n :enew<CR>
    nnoremap                 <leader>p :echo 'CWD == ' . getcwd()<CR>
    nnoremap                 <leader>t :tab
    nnoremap <expr>          <leader>a ':source ' . GetCacheDir('sessions') . '/<C-z>'
    nnoremap <expr>          <leader>j ':edit ' . GetCacheDir('junkfiles') . '/<C-z>'
    nnoremap <expr>          <leader>m ':mksession! ' . GetCacheDir('sessions') . '/<C-z>'
    nnoremap <silent>        <leader>* :DeniteCursorWord line<CR>
    nnoremap <silent>        <leader>/ :Denite line<CR>
    nnoremap <silent>        <leader>? :Denite line<CR>
    nnoremap <silent>        <leader>w :update<CR>
  " }}}

  " Fast Find File or Switch Buffers {{{
    nnoremap                 <leader>b :PrettyPrintBufferList<CR>:b *
    nnoremap                 <leader>f :echo 'Reserved for fuzzy file search'<CR>
    nnoremap                 <leader>r :browse oldfiles<CR>
  " }}}

  " Browse/Explore Filesystem {{{
    nnoremap <silent>        <leader>L :Dirvish<CR>
    nnoremap <silent>        <leader>l :Dirvish %<CR>
    nnoremap <silent>        <leader>x :browse edit %:p:h<CR>
    nnoremap <silent> <expr> <leader>X ':browse edit ' . getcwd() . '<CR>'
  " }}}

  " Window Management {{{
    nnoremap                 <leader><leader> <C-w>p
    nnoremap                 <leader>= <C-w>=
    nnoremap                 <leader>S :split<Bar>Dirvish %<CR>
    nnoremap                 <leader>V :vsplit<Bar>:Dirvish %<CR>
    nnoremap                 <leader>c <C-w>c
    nnoremap                 <leader>o <C-w>o
    nnoremap                 <leader>s <C-w>s
    nnoremap                 <leader>v <C-w>v
  " }}}

  " DiffOrig {{{
    " Diff with file saved on disk
    nnoremap                 <leader>do :DiffOrig<CR>
    " Diff end
    nnoremap                 <leader>de :bdelete<CR>:diffoff!<CR>
    " Alternatively, view diff in terminal
    nnoremap                 <leader>dt :write !diff % -<CR>
  " }}}

" }}}

" Backslash Mappings {{{

  " Miscellaneous {{{
    " Replace entire buffer with system clipboard
    nnoremap          \r gg"_dG"*p:call EchoWithHighlightColor('Replaced buffer contents with system clipboard', 'WarningMsg')<CR>
  " }}}

  " Source as Vimscript {{{
    nnoremap <silent> \s :call Source(0)<CR>
    xnoremap <silent> \s :<C-u>call Source(1)<CR>
  " }}}

  " Denite {{{
    nnoremap <silent> \d :Denite -resume<CR>
    nnoremap <silent> \f :Denite filetype<CR>
    nnoremap <silent> \m :Denite menu<CR>
  " }}}

" }}}

" Function Key Mappings {{{

  " Undotree
  nnoremap            <F5> :UndotreeToggle<CR>

  " Echo syntax info of character under cursor
  nnoremap            <F8> :call EchoSyntaxInfo()<CR>

  " Profiling {{{
    " Reference: http://stackoverflow.com/questions/12213597/how-to-see-which-plugins-are-making-vim-slow
    nnoremap <silent> <F9>  :execute ":profile start profile.log"<CR>:exe ":profile func *"<CR>:exe ":profile file *"<CR>:echo "profile started"<CR>
    nnoremap <silent> <F10> :execute ":profile pause"<CR>:echo "profile paused"<CR>
    nnoremap <silent> <F11> :execute ":profile continue"<CR>:echo "profile continued"<CR>
    nnoremap <silent> <F12> :execute ":profile pause"<CR>:noautocmd qall!<CR>
  " }}}

" }}}

" General {{{

  " Yank to end of line (consistent with D and C) {{{
    nnoremap Y y$
  " }}}

  " Break undo, CTRL-u {{{
    inoremap <C-u> <C-g>u<C-u>
  " }}}

  " Jump to matching pair {{{
    map R %
  " }}}

  " Jump to alternate buffer {{{
    nnoremap - <C-^>
  " }}}

  " Turn off search highlighting {{{
    nnoremap <BS> :nohlsearch<CR>
  " }}}

  " Buffer Close Dialog {{{
    nnoremap Q :BufferCloseDialog<CR>
  " }}}

  " Insert date {{{
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
  " }}}

  " Move though displayed lines when lines wrap {{{
    noremap j  gj
    noremap k  gk
    noremap gj j
    noremap gk k
  " }}}

  " Auto-reselect after indent {{{
    xnoremap < <gv
    xnoremap > >gv
  " }}}

  " Substitute with previous flags {{{
    nnoremap & :&&<CR>
    xnoremap & :&&<CR>
  " }}}

  " Quickly access last command {{{
    nnoremap <Up> :<Up>
    xnoremap <Up> :<Up>
    nnoremap <C-p> :<Up>
    xnoremap <C-p> :<Up>
    cnoremap <C-p> <Up>
  " }}}

  " Escape insert mode {{{
    inoremap jk <Esc>
    inoremap kj <Esc>
  " }}}

  " Swap Apostrophe and Back-tick {{{
    noremap ' `
    noremap ` '
  " }}}

  " Windows Movement {{{
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
  " }}}

  " Font Size Management {{{
    nnoremap <C-Left>  :DecreaseFontSize 3<CR>
    nnoremap <C-Right> :IncreaseFontSize 3<CR>
    nnoremap <Left>    :DecreaseFontSize 1<CR>
    nnoremap <Right>   :IncreaseFontSize 1<CR>
  " }}}

  " Faster Horizontal Scrolling {{{
    nnoremap zh 15zh
    nnoremap zl 15zl
    xnoremap zh 15zh
    xnoremap zl 15zl
  " }}}

  " Auto-echo fold level {{{
    nnoremap  zr zr:echo 'foldlevel: ' . &foldlevel<CR>
    nnoremap  zm zm:echo 'foldlevel: ' . &foldlevel<CR>
    nnoremap  zR zR:echo 'foldlevel: ' . &foldlevel<CR>
    nnoremap  zM zM:echo 'foldlevel: ' . &foldlevel<CR>
  " }}}

  " Improve scroll {{{
  " Credit:
    if g:asheq#settings.scroll_skip_zb
      nnoremap <expr> zz    (winline() == (winheight(0)+1) / 2) ? 'zt' : 'zz'
    else
      nnoremap <expr> zz    (winline() == (winheight(0)+1) / 2) ? 'zt' : (winline() == &scrolloff + 1) ? 'zb' : 'zz'
    endif
    noremap  <expr> <C-f> max([winheight(0) - 2, 1]) ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
    noremap  <expr> <C-b> max([winheight(0) - 2, 1]) ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
    noremap  <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
    noremap  <expr> <C-y> (line("w0") <= 1 ? "k" : "3\<C-y>")
  " }}}

  " Literal Search ("Very not magic") {{{
    " Set mark s (for quickly jumping back), then search literally
    nnoremap / ms/\V
    xnoremap / ms/\V
    nnoremap ? ms?\V
    xnoremap ? ms?\V
  " }}}

" }}}

" New Mappings that start with 'z' {{{
  " Free normal-mode keys taken by plugins: zu
  " Free normal-mode keys: zp  zq  zy

  " Skips comments!
  nnoremap z/ :Ilist 
  nnoremap z* :Ilist <C-r><C-w><CR>
" }}}

" New mappings that start with 'g' {{{
  " Free normal-mode keys taken by plugins: gb  gc  gl
  " Free normal-mode keys: gy gz

  " Regex Search ("very magic") {{{
  " Set mark s (for quickly jumping back), then search as regex
    nnoremap g/ ms/\v
    xnoremap g/ ms/\v
    nnoremap g? ms?\v
    xnoremap g? ms?\v
  " }}}

  " Select last yank or change {{{
    nnoremap <expr> gv '`[' . strpart(getregtype(), 0, 1) . '`]'
  " }}}

  " Open hyperlink or do Google search {{{
    nmap gx <Plug>(openbrowser-smart-search)
    xmap gx <Plug>(openbrowser-smart-search)
  " }}}

  " Open file in Chrome {{{
    nnoremap goc :OpenFileInChrome<CR>
  " }}}
" }}}

" New mappings that start with an operator {{{
  " Reference: http://www.viemu.com/vi-vim-cheat-sheet.gif
  " Valid Mappings:
  " -> operator non-motion
  " -> operator-1 operator-2

  " Yank file path
  nnoremap yp :let @*=expand('%:p')<CR>

  " Change working directory
  nnoremap cd :cd <C-z>

  " Toggle indent guides
  nmap <silent> cog <Plug>IndentGuidesToggle

  " Toggle textwidth colorcolumn
  nnoremap <silent> cot :set colorcolumn<C-R>=match(&colorcolumn,'+1')>=0?'-=+1':'+=+1'<CR><CR>

  " Toggle foldopen and foldclose strategy
  nnoremap coz :call ToggleFoldOpenFoldCloseStrategy()<CR>
" }}}
