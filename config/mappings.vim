" vim: fdm=marker

" Windows {{{
  " Management
  nnoremap <leader>s <C-w>s
  nnoremap <leader>v <C-w>v
  nnoremap <leader>c <C-w>c
  nnoremap <leader>o <C-w>o
  nnoremap <leader>= <C-w>=

  " Movement
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
" }}}

" Working Directory {{{
  " Change working directory
  nnoremap cd :cd <C-d>

  " Print working directory
  nnoremap <leader>p :echo 'CWD == ' . getcwd()<CR>

  " Change working directory to 'here' (current buffer)
  nnoremap <leader>h :cd %:p:h<CR>:echo 'CWD -> ' . getcwd()<CR>
" }}}

" Buffers + Files {{{
  " TODO: Replace <C-d> with <Tab> so I don't have to press <Tab> twice to continue completion

  " Find file
  nnoremap <leader>f :find *<C-d>

  " Edit file
  nnoremap <leader>e :e <C-d>

  " Switch buffer
  nnoremap <leader>b :b <C-d>

  " New junkfile
  nnoremap <expr> <leader>j ':e ' . GetCacheDir('junkfiles') . '\<C-d>'

  " Write buffer
  nnoremap <silent> <leader>w :update<CR>

  " Alternate buffer
  nnoremap - <C-^>

" }}}

" Search (& Replace) {{{

  " Literal Search ("Very not magic")
  nnoremap / /\V
  vnoremap / /\V
  nnoremap ? ?\V
  vnoremap ? ?\V

  " Regex Search ("very magic")
  nnoremap g/ /\v
  vnoremap g/ /\v
  nnoremap g? ?\v
  vnoremap g? ?\v

  " Visual * and #
  vnoremap * :<C-u>call VSetSearch()<CR>/<CR>
  vnoremap # :<C-u>call VSetSearch()<CR>?<CR>

  " Turn off search highlighting
  nnoremap <BS> :nohlsearch<cr>

  " & should reuse flags from previous substitution
  nnoremap & :&&<CR>
  xnoremap & :&&<CR>
" }}}

" Grep {{{
  nnoremap <leader>gg :grep 

  " Grep for word under cursor
  nnoremap <leader>gw :grep <C-r><C-w><CR>

  " TODO: Grep for visual selection
  " vnoremap <leader>g  :<C-u>call VGrep()<CR>
" }}}

" Evaluate vimscript {{{
  nnoremap <silent> <leader>z :call Source(line('.'), line('.'))<CR>
  vnoremap <silent> <leader>z :call Source(line('v'), line('.'))<CR>
" }}}

" Visual line repeat {{{
  xnoremap . :normal .<CR>
  xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
" }}}

" Smash escape {{{
  imap jk <Esc>
  imap kj <Esc>
" }}}

" Screen line movement {{{
  nnoremap j gj
  nnoremap k gk
" }}}

" Horizontal scroll {{{
  nnoremap zh 22zh
  nnoremap zl 22zl
" }}}

"  Auto-reselect after indent {{{
  vnoremap < <gv
  vnoremap > >gv
" }}}

" Swap apostraphe and back-tick {{{
  nnoremap ' `
  nnoremap ` '
" }}}

" Swap colon and semi-colon {{{
  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;

  " TODO: Allow exiting from macro quickly
  nnoremap q; q:
  vnoremap q; q:

  noremap @; @:
" }}}

" Change Font Size {{{
  nnoremap <C-Left> :call DecreaseFontSize(3)<CR>
  nnoremap <C-Right> :call IncreaseFontSize(3)<CR>
  nnoremap <Left> :call DecreaseFontSize(1)<CR>
  nnoremap <Right> :call IncreaseFontSize(1)<CR>
" }}}

" Profiling Helpers {{{
  nnoremap <silent> <Home> :exe ":profile start profile.log"<CR>:exe ":profile func *"<CR>:exe ":profile file *"<CR>:echo "profile started"<CR>
  nnoremap <silent> <PageDown> :exe ":profile pause"<CR>:echo "profile paused"<CR>
  nnoremap <silent> <PageUp> :exe ":profile continue"<CR>:echo "profile continued"<CR>
  nnoremap <silent> <End> :exe ":profile pause"<CR>:noautocmd qall!<CR>
" }}}

" Folding {{{
  " Auto-echo fold level
  nnoremap zr zr:echo &foldlevel<CR>
  nnoremap zm zm:echo &foldlevel<CR>
  nnoremap zR zR:echo &foldlevel<CR>
  nnoremap zM zM:echo &foldlevel<CR>
" }}}

" Format entire file {{{
  nnoremap =ae :call FormatEntireFile()<CR>
  nnoremap =ie :call FormatEntireFile()<CR>
" }}}

" Strip Trailing Whitespace {{{
  " NOTE: gs is my made-up operator for 'stripping' white-space
  " TODO: Support various motions and text objects, not just ie and ae
  nnoremap gsie :call StripTrailingWhitespace()<CR>
  nnoremap gsae :call StripTrailingWhitespace()<CR>
" }}}

" Improve scroll {{{
  nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ? 'zt' : (winline() == &scrolloff + 1) ? 'zb' : 'zz'
  noremap <expr> <C-f> max([winheight(0) - 2, 1]) ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
  noremap <expr> <C-b> max([winheight(0) - 2, 1]) ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
  noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
  noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")
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

" Toggle coloring of text width " {{{
  nnoremap [ot :set colorcolumn+=+1<CR>
  nnoremap ]ot :set colorcolumn-=+1<CR>
  nnoremap cot :set colorcolumn<C-R>=match(&colorcolumn,'+1')>=0?'-=+1':'+=+1'<CR><CR>
" }}}

" Miscellaneous {{{

  " Make Y consistent with C and D
  nnoremap Y y$

  " CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break.
  inoremap <C-U> <C-G>u<C-U>

  " Reselect last paste
  nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

  " Show highlight names under cursor
  nnoremap gh :call PrintHighlightInfo()<CR>

  " Previous command line command
  noremap <Up> :<Up>

  " Yank file path
  nnoremap yp :call YankFilePath()<CR>

  " Open file in Chrome
  nnoremap goc :call OpenFileInChrome()<CR>

  " Jump to matching pair
  map R %

  " Print mappings in a new buffer
  nnoremap <leader>m :call PrintMappings()<CR>

" }}}

" Poor man's Tagbar {{{
  " TODO
  " :g/func/#<CR>
" }}}

" Auto completion {{{
  " TODO
  " inoremap ^] ^X^]
  " inoremap ^F ^X^F
  " inoremap ^D ^X^D
  " inoremap ^L ^X^L

  " function! CleverTab()
  "    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
  "       return "\<Tab>"
  "    else
  "       return "\<C-N>"
  "    endif
  " endfunction
  " inoremap <Tab> <C-R>=CleverTab()<CR>
" }}}
