" vim: fdm=marker

" TODO: Check prefix on mappings (n, v, x, none, etc.)
" TODO: Refactor

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

  " Shortcut for inserting date and time in various formats
  " from @tpope. The repeat(..., 0) makes it such that there's
  " no output from <C-r>=
  inoremap <silent> <C-g><C-t> <C-r>=repeat(complete(col('.'), map([
        \ "%Y-%m-%d %H:%M:%S",
        \ "%Y-%m-%d",
        \ "%Y %b %d",
        \ "%d-%b-%y",
        \ "%a, %d %b %Y %H:%M:%S %z",
        \ "%a %b %d %T %Z %Y"
        \ ], 'strftime(v:val)')), 0)<CR>

  " Paste over a visual selection while preserving the unnamed register
  xnoremap P "_dP

  " Jump back to previous window
  nnoremap <leader><leader> <C-w>p

  " Echo syntax information of character under cursor
  noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

  " Move though displayed lines when lines wrap
  noremap j gj
  noremap k gk
  noremap gj j
  noremap gk k

  " Auto-reselect after indent
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

  " Delete buffers {{{
    nmap Q <Nop>
    nnoremap QQ :call DeleteOneBuffer()<CR>
    nnoremap QA :call DeleteAllBuffers()<CR>
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
    nnoremap ; :
    nnoremap : ;
    vnoremap ; :
    vnoremap : ;
    nnoremap @; @:
    map : <Plug>Sneak_;
  " }}}

  " Faster Horizontal Scroll {{{
    nnoremap zh 15zh
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
  nnoremap <expr> gv '`[' . strpart(getregtype(), 0, 1) . '`]'

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
    nnoremap <silent> gr :set operatorfunc=<SID>GrepOperator<cr>g@
    vnoremap <silent> gr :<c-u>call <SID>GrepOperator(visualmode())<cr>

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
    nnoremap <leader>z <C-w>z
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
