" vim: fdm=marker

" TODO: Check prefix on mappings (n, v, x, none, etc.). Refactor. Split into separate files.
" :colder, :cnewer, tab navigation, tag navigation

" General {{{

  " Yank to end of line (consistent with D and C) {{{
    nnoremap Y y$
  " }}}

  " Break undo, CTRL-U {{{
    inoremap <C-U> <C-G>u<C-U>
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

  " Insert date (from @tpope) {{{
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

  " Echo syntax info of character under cursor {{{
    noremap <F10> :echo ''
      \ . 'hi<'    . synIDattr(synID(line('.'),col('.'),1),'name')             . '> '
      \ . 'trans<' . synIDattr(synID(line('.'),col('.'),0),'name')             . '> '
      \ . 'lo<'    . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'<CR>
  " }}}

  " Move though displayed lines when lines wrap {{{
    noremap j  gj
    noremap k  gk
    noremap gj j
    noremap gk k
  " }}}

  " Auto-reselect after indent {{{
    vnoremap < <gv
    vnoremap > >gv
  " }}}

  " Substitute with previous flags {{{
    nnoremap & :&&<CR>
    xnoremap & :&&<CR>
  " }}}

  " Search for visual selection {{{
    vnoremap * :<C-u>call VSetSearch()<CR>/<CR>
    vnoremap # :<C-u>call VSetSearch()<CR>?<CR>
  " }}}

  " Repeat or execute macro over visual selection {{{
    xnoremap . :normal! .<CR>
    xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
  " }}}

  " Quickly access last command {{{
    nnoremap <Up> :<Up>
    vnoremap <Up> :<Up>
  " }}}

  " Escape insert mode {{{
    imap jk <Esc>
    imap kj <Esc>
  " }}}

  " Swap Apostrophe and Back-tick {{{
    noremap ' `
    noremap ` '
  " }}}

  " Buffer Deletion {{{
    nmap     Q  <Nop>
    nnoremap QQ :call DeleteOneBuffer()<CR>
    nnoremap QA :call DeleteAllBuffers()<CR>
  " }}}

  " Windows Movement {{{
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
  " }}}

  " Font Size Management {{{
    nnoremap <C-Left>  :call DecreaseFontSize(3)<CR>
    nnoremap <C-Right> :call IncreaseFontSize(3)<CR>
    nnoremap <Left>    :call DecreaseFontSize(1)<CR>
    nnoremap <Right>   :call IncreaseFontSize(1)<CR>
  " }}}

  " Swap Colon and Semi-colon {{{
    nnoremap ;  :
    nnoremap :  ;
    vnoremap ;  :
    vnoremap :  ;
    nnoremap @; @:
    map      :  <Plug>Sneak_;
  " }}}

  " Faster Horizontal Scrolling {{{
    nnoremap zh 15zh
    nnoremap zl 15zl
    vnoremap zh 15zh
    vnoremap zl 15zl
  " }}}

  " Auto-echo fold level {{{
    function! s:MapEchoFoldLevel(map)
      execute "nnoremap " . a:map . " " . a:map . ":echo 'foldlevel == '.&foldlevel<CR>"
    endfunction

    call s:MapEchoFoldLevel('zr')
    call s:MapEchoFoldLevel('zm')
    call s:MapEchoFoldLevel('zR')
    call s:MapEchoFoldLevel('zM')
  " }}}

  " Improve scroll {{{
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
    vnoremap / ms/\V
    nnoremap ? ms?\V
    vnoremap ? ms?\V
  " }}}

  " Profiling {{{
    " Reference: http://stackoverflow.com/questions/12213597/how-to-see-which-plugins-are-making-vim-slow
    nnoremap <silent> <F5> :execute ":profile start profile.log"<CR>:exe ":profile func *"<CR>:exe ":profile file *"<CR>:echo "profile started"<CR>
    nnoremap <silent> <F6> :execute ":profile pause"<CR>:echo "profile paused"<CR>
    nnoremap <silent> <F7> :execute ":profile continue"<CR>:echo "profile continued"<CR>
    nnoremap <silent> <F8> :execute ":profile pause"<CR>:noautocmd qall!<CR>
  " }}}

  " Auto center {{{
    if g:asheq#settings.auto_center
      nnoremap <silent> n     nzz
      nnoremap <silent> N     Nzz
      nnoremap <silent> *     *zz
      nnoremap <silent> #     #zz
      nnoremap <silent> g*    g*zz
      nnoremap <silent> g#    g#zz
      nnoremap <silent> <C-o> <C-o>zz
      nnoremap <silent> <C-i> <C-i>zz
    endif
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
    vnoremap g/ ms/\v
    nnoremap g? ms?\v
    vnoremap g? ms?\v
  " }}}

  " Select last yank or change {{{
    nnoremap <expr> gv '`[' . strpart(getregtype(), 0, 1) . '`]'
  " }}}

  " Open hyperlink or do Google search {{{
    nmap gx <Plug>(openbrowser-smart-search)
    vmap gx <Plug>(openbrowser-smart-search)
  " }}}

  " Open file in Chrome {{{
    nnoremap goc :call OpenFileInChrome()<CR>:echo 'Opened file in Chrome'<CR>
  " }}}

  " Strip trailing white space {{{
    " TODO: Turn this into a proper operator
    nnoremap gsie :call StripTrailingWhitespaceAll()<CR>
    nnoremap gsae :call StripTrailingWhitespaceAll()<CR>
    xnoremap gs   :<C-u>call StripTrailingWhitespaceVisual()<CR>
  " }}}

  " Grep {{{
    nnoremap <silent> gr :set operatorfunc=<SID>GrepOperator<CR>g@
    vnoremap <silent> gr :<c-u>call <SID>GrepOperator(visualmode())<CR>

    function! s:GrepOperator(type)
      let saved_unnamed_register = @@

      if a:type ==# 'v'
        normal! `<v`>y
      elseif a:type ==# 'char'
        normal! `[v`]y
      else
        return
      endif

      silent execute "grep! " . shellescape(@@, 1)

      let @@ = saved_unnamed_register
    endfunction
  " }}}

" }}}

" Leader Mappings {{{
  " TODO: No timeout on leader commands

  " Miscellaneous {{{
    nmap                     <leader>q <Plug>(qf_qf_toggle)
    nnoremap                 <leader>e :edit <C-z>
    nnoremap                 <leader>g :grep! 
    nnoremap                 <leader>h :cd %:p:h<CR>:echo 'CWD -> ' . getcwd()<CR>
    nnoremap                 <leader>p :echo 'CWD == ' . getcwd()<CR>
    nnoremap                 <leader>t :tab
    nnoremap <expr>          <leader>a ':source ' . GetCacheDir('sessions') . '\<C-z>'
    nnoremap <expr>          <leader>j ':edit ' . GetCacheDir('junkfiles') . '\<C-z>'
    nnoremap <expr>          <leader>m ':mksession! ' . GetCacheDir('sessions') . '\<C-z>'
    nnoremap <silent>        <leader>* :DeniteCursorWord line<CR>
    nnoremap <silent>        <leader>/ :Denite line<CR>
    nnoremap <silent>        <leader>? :Denite line<CR>
    nnoremap <silent>        <leader>w :update<CR>
  " }}}

  " Find File or Switch Buffers {{{
    nnoremap                 <leader>f :echo 'Reserved for fuzzy file search'<CR>
    nnoremap                 <leader>b :ls<CR>:echo '──────────────────────────────'<CR>:b *
    nnoremap                 <leader>r :browse oldfiles<CR>
  " }}}

  " Browse/Explore Filesystem {{{
    nnoremap <silent>        <leader>L :Dirvish<CR>
    nnoremap <silent>        <leader>l :Dirvish %<CR>
    " TODO: Any way to further customize browser that opens up?
    nnoremap <silent>        <leader>x :browse edit %:p:h<CR>
    nnoremap <silent> <expr> <leader>X ':browse edit ' . getcwd() . '<CR>'
  " }}}

  " Window Management {{{
    " nnoremap <leader>S        :split  <C-z>
    " nnoremap <leader>V        :vsplit <C-z>
    nnoremap <leader><leader> <C-w>p
    nnoremap <leader>=        <C-w>=
    nnoremap <leader>S        :split<Bar>Dirvish %<CR>
    nnoremap <leader>V        :vsplit<Bar>:Dirvish %<CR>
    nnoremap <leader>c        <C-w>c
    nnoremap <leader>o        <C-w>o
    nnoremap <leader>s        <C-w>s
    nnoremap <leader>v        <C-w>v
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
    nnoremap          \r gg"_dG"*p:echo 'Replaced buffer contents with system clipboard'<CR>
  " }}}

  " Source as Vimscript {{{
    nnoremap <silent> \s :call Source(line('.'), line('.'))<CR>
    vnoremap <silent> \s :call Source(line('v'), line('.'))<CR>
  " }}}

  " Denite {{{
    nnoremap <silent> \d :Denite -resume<CR>
    nnoremap <silent> \f :Denite filetype<CR>
    nnoremap <silent> \m :Denite menu<CR>
  " }}}

" }}}
