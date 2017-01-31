" vim: fdm=marker

" General {{{

  " Make Y consistent with C and D
  nnoremap Y y$

  " CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break.
  inoremap <C-U> <C-G>u<C-U>

  " Move though displayed lines when lines wrap
  nnoremap j gj
  nnoremap k gk

  " Faster horizontal scroll
  nnoremap zh 15zh
  nnoremap zl 15zl

  "  Auto-reselect after indent
  vnoremap < <gv
  vnoremap > >gv

  " Auto-echo fold level
  nnoremap zr zr:echo 'FL =='&foldlevel<CR>
  nnoremap zm zm:echo 'FL =='&foldlevel<CR>
  nnoremap zR zR:echo 'FL =='&foldlevel<CR>
  nnoremap zM zM:echo 'FL =='&foldlevel<CR>

  " Improve scroll
  " nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ? 'zt' : (winline() == &scrolloff + 1) ? 'zb' : 'zz'
  noremap <expr> <C-f> max([winheight(0) - 2, 1]) ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
  noremap <expr> <C-b> max([winheight(0) - 2, 1]) ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
  noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
  noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

  " Literal Search ("Very not magic")
  " Auto-set mark 's' so you can jump back easily
  nnoremap / ms/\V
  vnoremap / ms/\V
  nnoremap ? ms?\V
  vnoremap ? ms?\V

  " Format without moving cursor
  nnoremap =ae :call FormatEntireFile()<CR>
  nnoremap =ie :call FormatEntireFile()<CR>

  " Reuse substitution flags
  nnoremap & :&&<CR>
  xnoremap & :&&<CR>

  " Visual * and #
  " TODO: Use plugin
  vnoremap * :<C-u>call VSetSearch()<CR>/<CR>
  vnoremap # :<C-u>call VSetSearch()<CR>?<CR>

  " Visual line repeat
  xnoremap . :normal! .<CR>
  xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

  " Previous command line command
  noremap <Up> :<Up>

  " Smash escape
  imap jk <Esc>
  imap kj <Esc>

  " Swap apostrophe and back-tick
  nnoremap ' `
  nnoremap ` '

  " Swap colon and semi-colon
  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;
  nnoremap @; @:
  map : <Plug>Sneak_;
  " TODO: Remove the side-effect of increasing the amount of time it takes to stop recording a macro
  nnoremap q; q:
  vnoremap q; q:

  " Windows Movement
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Delete buffer
  nnoremap <silent> Q :Bdelete<CR>
  nnoremap <silent> !Q :Bdelete!<CR>

  " Jump to matching pair
  map R %

  " Alternate buffer
  nnoremap - <C-^>

  " Turn off search highlighting
  nnoremap <BS> :nohlsearch<cr>

  " Change Font Size
  nnoremap <C-Left> :call DecreaseFontSize(3)<CR>
  nnoremap <C-Right> :call IncreaseFontSize(3)<CR>
  nnoremap <Left> :call DecreaseFontSize(1)<CR>
  nnoremap <Right> :call IncreaseFontSize(1)<CR>

  " Profiling
  nnoremap <silent> <F5> :exe ":profile start profile.log"<CR>:exe ":profile func *"<CR>:exe ":profile file *"<CR>:echo "profile started"<CR>
  nnoremap <silent> <F6> :exe ":profile pause"<CR>:echo "profile paused"<CR>
  nnoremap <silent> <F7> :exe ":profile continue"<CR>:echo "profile continued"<CR>
  nnoremap <silent> <F8> :exe ":profile pause"<CR>:noautocmd qall!<CR>

  " NOTE: To view info about a function in the profile, use:
  " set more | verbose function {function_name}

  " NOTE: With plugins, a "general slowness" usually comes from autocommands; a :autocmd lists them
  " all. Investigate by killing some of them via :autocmd! [group] {event}. Proceed from more
  " frequent events (i.e. CursorMoved[I]) to less frequent ones (e.g. BufWinEnter)

  " EXPERIMENTAL " {{{
  " Yank selection without moving cursor
  " vmap y ygv<Esc>

  " Auto center
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

  " Insert mode ddate adds date stamp
  iab <expr> ddate strftime("%b %d - %a")
  " }}}

" }}}

" New mappings that start with an operator {{{
  " NOTE: Valid mappings here include
  " -> operator non-motion
  " -> operator-1 operator-2
  "  Reference: http://www.viemu.com/vi-vim-cheat-sheet.gif

  " Change working directory
  nnoremap cd :cd <C-d>

  " Yank file path
  nnoremap yp :let @*=expand('%:p')<CR>

  " Toggle indent guides
  nmap <silent> cog <Plug>IndentGuidesToggle

  " Toggle text width color column
  nnoremap <silent> cot :set colorcolumn<C-R>=match(&colorcolumn,'+1')>=0?'-=+1':'+=+1'<CR><CR>
" }}}

" New mappings that start with 'g' {{{
  " Regex Search ("very magic")
  nnoremap g/ ms/\v
  vnoremap g/ ms/\v
  nnoremap g? ms?\v
  vnoremap g? ms?\v

  " Select last yank or change, e.g., insertion (including pasted text) and deletion
  nnoremap <expr> gl '`[' . strpart(getregtype(), 0, 1) . '`]'

  " Open hyperlink or do Google search
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

  " Open file in Chrome - Mnemonic: 'Go to Chrome'
  nnoremap goc :call OpenFileInChrome()<CR>:echo 'Opened file in Chrome'<CR>

  " Strip trailing white space
  nnoremap gsie :call StripTrailingWhitespaceAll()<CR>
  nnoremap gsae :call StripTrailingWhitespaceAll()<CR>
  xnoremap gs   :<C-u>call StripTrailingWhitespaceVisual()<CR>
" }}}

" Leader Mappings {{{

  " Edit file
  nnoremap <leader>e :e <C-d>

  " Junk file
  nnoremap <expr> <leader>j ':e ' . GetCacheDir('junkfiles') . '\<C-d>'

  " View mappings
  nnoremap <leader>m :call CommandOutputInBuffer('map')<CR>

  " Poor man's tagbar using qlist plugin
  nnoremap <leader>t :Ilist func<CR>

  " Write buffer
  nnoremap <silent> <leader>w :update<CR>

  " Grep
  nnoremap <leader>gg :grep 
  " Grep for word under cursor
  nnoremap <silent> <leader>gw :grep <C-r><C-w><CR>
  " TODO: Grep for visual selection (requires converting search pattern to ag syntax?)
  " vnoremap <leader>g  :<C-u>call VGrep()<CR>

  " Print working directory
  nnoremap <leader>p :echo 'CWD == ' . getcwd()<CR>
  " Change working directory to 'here'
  nnoremap <leader>h :cd %:p:h<CR>:echo 'CWD -> ' . getcwd()<CR>

  " Window Management
  nnoremap <leader>s <C-w>s
  nnoremap <leader>v <C-w>v
  nnoremap <leader>c <C-w>c
  nnoremap <leader>o <C-w>o
  nnoremap <leader>= <C-w>=

  " Dirvish
  " Look at directory of current file
  nnoremap <leader>l :Dirvish %<CR>
  " eXplore current working directory
  nnoremap <leader>x :Dirvish<CR>

  " JsBeautify
  autocmd FileType css noremap <buffer> <leader><Space> :call CSSBeautify()<CR>
  autocmd FileType css vnoremap <buffer> <leader><Space> :call RangeCSSBeautify()<CR>
  autocmd FileType html noremap <buffer> <leader><Space> :call HtmlBeautify()<CR>
  autocmd FileType html vnoremap <buffer> <leader><Space> :call RangeHtmlBeautify()<CR>
  autocmd FileType javascript noremap <buffer> <leader><Space> :call JsBeautify()<CR>
  autocmd FileType javascript vnoremap <buffer> <leader><Space> :call RangeJsBeautify()<CR>
  autocmd FileType json noremap <buffer> <leader><Space> :call JsonBeautify()<CR>
  autocmd FileType json vnoremap <buffer> <leader><Space> :call RangeJsonBeautify()<CR>
  autocmd FileType jsx noremap <buffer> <leader><Space> :call JsxBeautify()<CR>
  autocmd FileType jsx vnoremap <buffer> <leader><Space> :call RangeJsxBeautify()<CR>
  autocmd FileType scss noremap <buffer> <leader><Space> :call CSSBeautify()<CR>
  autocmd FileType scss vnoremap <buffer> <leader><Space> :call RangeCSSBeautify()<CR>

  " Denite
  nnoremap <silent> <leader>r       :Denite file_mru<CR>
  nnoremap <silent> <leader>f       :Denite file_rec<CR>
  nnoremap <silent> <leader>b       :Denite buffer<CR>
  nnoremap <silent> <leader>/       :Denite line<CR>
  nnoremap <silent> <leader>*       :DeniteCursorWord line<CR>

  " TODO: Sessions
" }}}

" Backslash Mappings {{{
  " Replace all buffer contents with system clipboard
  nnoremap \r gg"_dG"*p:echo 'Replaced buffer contents with system clipboard'<CR>
  nnoremap \b :center 80<CR>hhv0r#A<SPACE><ESC>40A#<ESC>d80<BAR>YppVr#kk.

  " Source as Vimscript
  nnoremap <silent> \s :call Source(line('.'), line('.'))<CR>
  vnoremap <silent> \s :call Source(line('v'), line('.'))<CR>

  " Denite
  nnoremap <silent> \d       :Denite -resume<CR>
  nnoremap <silent> \f       :Denite filetype<CR>
  nnoremap <silent> \m       :Denite menu<CR>
" }}}
