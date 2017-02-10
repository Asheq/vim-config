" vim: fdm=marker

" TODO: Check prefix on mappings (n, v, x, none, etc.)

" General {{{

  " Make Y consistent with C and D
  nnoremap Y y$

  " CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break.
  inoremap <C-U> <C-G>u<C-U>

  " Jump to matching pair
  map R %

  " Jump to alternate buffer
  nnoremap - <C-^>

  " Turn off search highlighting
  nnoremap <BS> :nohlsearch<cr>

  " Type 'ddate' in insert mode to insert date
  iab <expr> ddate strftime("%b %d - %a")

  " Move though displayed lines when lines wrap
  noremap j gj
  noremap k gk

  "  Auto-reselect after indent
  vnoremap < <gv
  vnoremap > >gv

  " Format without moving cursor
  nnoremap =ae :call FormatEntireFile()<CR>
  nnoremap =ie :call FormatEntireFile()<CR>

  " Reuse substitution flags
  nnoremap & :&&<CR>
  xnoremap & :&&<CR>

  " Visual * and #
  vnoremap * :<C-u>call VSetSearch()<CR>/<CR>
  vnoremap # :<C-u>call VSetSearch()<CR>?<CR>

  " Visual line repeat
  xnoremap . :normal! .<CR>
  xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

  " Previous command line command
  nnoremap <Up> :<Up>
  vnoremap <Up> :<Up>

  " Smash escape
  imap jk <Esc>
  imap kj <Esc>

  " Swap apostrophe and back-tick
  noremap ' `
  noremap ` '

  " Delete buffer {{{
    nnoremap <silent> QQ :Bdelete<CR>
    nnoremap <silent> Q! :Bdelete!<CR>
    nnoremap <silent> QA :bufdo bd<CR>
  " }}}

  " Windows Movement {{{
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
  " }}}

  " Change Font Size {{{
    nnoremap <C-Left> :call DecreaseFontSize(3)<CR>
    nnoremap <C-Right> :call IncreaseFontSize(3)<CR>
    nnoremap <Left> :call DecreaseFontSize(1)<CR>
    nnoremap <Right> :call IncreaseFontSize(1)<CR>
  " }}}

  " Swap colon and semi-colon {{{
    " TODO: Remove the side-effect of increasing the amount of time it takes to stop recording a macro
    nnoremap ; :
    nnoremap : ;
    vnoremap ; :
    vnoremap : ;
    nnoremap @; @:
    nnoremap q; q:
    vnoremap q; q:
    map : <Plug>Sneak_;
  " }}}

  " Faster Horizontal Scroll {{{
    function! s:MapFasterHorizontalScroll(map)
      execute "nnoremap " . a:map . " 15" . a:map
      execute "vnoremap " . a:map . " 15" . a:map
    endfunction

    call s:MapFasterHorizontalScroll('zh')
    call s:MapFasterHorizontalScroll('zl')
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
    " nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ? 'zt' : (winline() == &scrolloff + 1) ? 'zb' : 'zz'
    nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ? 'zt' : 'zz'
    noremap <expr> <C-f> max([winheight(0) - 2, 1]) ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
    noremap <expr> <C-b> max([winheight(0) - 2, 1]) ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
    noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
    noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")
  " }}}

  " Literal Search ("Very not magic") {{{
    " Auto-set mark 's' to make it easy to jump back to where you were before searching
    nnoremap / ms/\V
    vnoremap / ms/\V
    nnoremap ? ms?\V
    vnoremap ? ms?\V
  " }}}

  " Profiling {{{
    nnoremap <silent> <F5> :exe ":profile start profile.log"<CR>:exe ":profile func *"<CR>:exe ":profile file *"<CR>:echo "profile started"<CR>
    nnoremap <silent> <F6> :exe ":profile pause"<CR>:echo "profile paused"<CR>
    nnoremap <silent> <F7> :exe ":profile continue"<CR>:echo "profile continued"<CR>
    nnoremap <silent> <F8> :exe ":profile pause"<CR>:noautocmd qall!<CR>
    " NOTE: To view info about a function in the profile, use :verbose function {function_name}
    " NOTE: With plugins, a 'general slowness' usually comes from autocommands; :autocmd lists them all.
    " Investigate by killing some of them via :autocmd! [group] {event}. Proceed from more
    " frequent events (i.e. CursorMoved[I]) to less frequent ones (e.g. BufWinEnter)
  " }}}

  " Auto center {{{
    if g:asheq#settings.auto_center
      nnoremap <silent> n nzz
      nnoremap <silent> N Nzz
      nnoremap <silent> * *zz
      nnoremap <silent> # #zz
      nnoremap <silent> g* g*zz
      nnoremap <silent> g# g#zz
      nnoremap <silent> <C-o> <C-o>zz
      nnoremap <silent> <C-i> <C-i>zz
    endif
  " }}}

" }}}

" New mappings that start with an operator {{{
  " Valid Mappings:
  " -> operator non-motion
  " -> operator-1 operator-2
  " Reference: http://www.viemu.com/vi-vim-cheat-sheet.gif

  " Yank file path
  nnoremap yp :let @*=expand('%:p')<CR>

  " Change working directory
  nnoremap cd :cd <C-d>

  " Toggle indent guides
  nmap <silent> cog <Plug>IndentGuidesToggle

  " Toggle textwidth colorcolumn
  nnoremap <silent> cot :set colorcolumn<C-R>=match(&colorcolumn,'+1')>=0?'-=+1':'+=+1'<CR><CR>

  " Toggle foldopen and foldclose strategy
  nnoremap coz :call ToggleFoldOpenFoldCloseStrategy()<CR>
" }}}

" New mappings that start with 'g' {{{
  " Regex Search ("very magic")
  nnoremap g/ ms/\v
  vnoremap g/ ms/\v
  nnoremap g? ms?\v
  vnoremap g? ms?\v

  " Select last yank or change
  nnoremap <expr> gl '`[' . strpart(getregtype(), 0, 1) . '`]'

  " Open hyperlink or do Google search
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

  " Open file in Chrome
  nnoremap goc :call OpenFileInChrome()<CR>:echo 'Opened file in Chrome'<CR>

  " Strip trailing white space
  nnoremap gsie :call StripTrailingWhitespaceAll()<CR>
  nnoremap gsae :call StripTrailingWhitespaceAll()<CR>
  xnoremap gs   :<C-u>call StripTrailingWhitespaceVisual()<CR>

  " Grep {{{
    " NOTE: For populating quickfix list with occurences in current file only, use qlist plugin commands:
    "    :Ilist to enter an arbitrary search pattern (skips comments)
    "    [I in normal mode to search for whole word under cursor (does not skip comments)
    "    [I in visual mode to search for selection (skips comments, not whole word only)

    " TODO: http://learnvimscriptthehardway.stevelosh.com/chapters/32.html
    " Grep for word under cursor
    " nnoremap gr :grep <cword><CR>
    " Grep for whole word under cursor
    " nnoremap gR :grep -w <cword> <CR>
  " }}}

  " JsBeautify {{{
    autocmd FileType css        vnoremap <buffer> gq :call RangeCSSBeautify()<CR>
    autocmd FileType html       vnoremap <buffer> gq :call RangeHtmlBeautify()<CR>
    autocmd FileType javascript vnoremap <buffer> gq :call RangeJsBeautify()<CR>
    autocmd FileType json       vnoremap <buffer> gq :call RangeJsonBeautify()<CR>
    autocmd FileType jsx        vnoremap <buffer> gq :call RangeJsxBeautify()<CR>
    autocmd FileType scss       vnoremap <buffer> gq :call RangeCSSBeautify()<CR>
  " }}}

" }}}

" Leader Mappings {{{

  " Miscellaneous {{{
    " Edit file
    nnoremap <leader>e :e <C-d>
    " Change working directory to 'here'
    nnoremap <leader>h :cd %:p:h<CR>:echo 'CWD -> ' . getcwd()<CR>
    " Junk file
    nnoremap <expr> <leader>j ':e ' . GetCacheDir('junkfiles') . '\<C-d>'
    " View mappings
    nnoremap <leader>m :call CommandOutputInBuffer('map')<CR>
    " Print working directory
    nnoremap <leader>p :echo 'CWD == ' . getcwd()<CR>
    " Toggle Quickfix Window
    nmap <leader>q <Plug>QfCtoggle
    " Poor man's tagbar using qlist plugin
    nnoremap <leader>t :Ilist func<CR>
    " Write buffer
    nnoremap <silent> <leader>w :update<CR>
  " }}}

  " Dirvish {{{
    " Look at directory of current file
    nnoremap <leader>l :Dirvish %<CR>
    " eXplore current working directory
    nnoremap <leader>x :Dirvish<CR>
  " }}}

  " Denite {{{
    " Search recent files
    nnoremap <silent> <leader>r       :Denite file_mru<CR>
    " Search files recursively in CWD
    nnoremap <silent> <leader>f       :Denite file_rec<CR>
    " Search buffers
    nnoremap <silent> <leader>b       :Denite buffer<CR>
    " Search lines in buffer
    nnoremap <silent> <leader>/       :Denite line<CR>
    " Search lines in buffer using current word
    nnoremap <silent> <leader>*       :DeniteCursorWord line<CR>
  " }}}

  " Window Management {{{
    nnoremap <leader>s <C-w>s
    nnoremap <leader>v <C-w>v
    nnoremap <leader>c <C-w>c
    nnoremap <leader>o <C-w>o
    nnoremap <leader>= <C-w>=
  " }}}

  " JsBeautify {{{
    autocmd FileType css          noremap <buffer> <leader>gq :call CSSBeautify()<CR>
    autocmd FileType html         noremap <buffer> <leader>gq :call HtmlBeautify()<CR>
    autocmd FileType javascript   noremap <buffer> <leader>gq :call JsBeautify()<CR>
    autocmd FileType json         noremap <buffer> <leader>gq :call JsonBeautify()<CR>
    autocmd FileType jsx          noremap <buffer> <leader>gq :call JsxBeautify()<CR>
    autocmd FileType scss         noremap <buffer> <leader>gq :call CSSBeautify()<CR>
  " }}}

  " DiffOrig {{{
    " Diff with original file on disk
    nnoremap <leader>do :DiffOrig<CR>
    " Cancel diff from <leader>do
    nnoremap <leader>dc :bd<CR>:diffoff!<CR>
    " Alternatively, view diff in terminal
    nnoremap <leader>dt :w !diff % -<CR>
  " }}}

" }}}

" Backslash Mappings {{{
  " Replace all buffer contents with system clipboard
  nnoremap \r gg"_dG"*p:echo 'Replaced buffer contents with system clipboard'<CR>

  " Block comment
  nnoremap \b :center 80<CR>hhv0r#A<SPACE><ESC>40A#<ESC>d80<BAR>YppVr#kk.

  " Source as Vimscript
  nnoremap <silent> \s :call Source(line('.'), line('.'))<CR>
  vnoremap <silent> \s :call Source(line('v'), line('.'))<CR>

  " Denite {{{
    " Resume Denite
    nnoremap <silent> \d       :Denite -resume<CR>
    " Change filetype
    nnoremap <silent> \f       :Denite filetype<CR>
    " Open menus
    nnoremap <silent> \m       :Denite menu<CR>
  " }}}

" }}}
