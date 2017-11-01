" mappings.vim

" Leader Mappings {{{

  let mapleader = "\<Space>"
  let maplocalleader = "\\"

  " Miscellaneous
  nnoremap          <leader><Tab>   :tab
  nnoremap          <leader>t       :setfiletype 
  nmap     <silent> <leader>q       <Plug>qf_qf_toggle
  nnoremap <silent> <leader>i       :Info<CR>
  nnoremap <silent> <leader>u       :UndotreeToggle<CR>
  nnoremap <silent> <leader><CR>    :syncbind<CR>

  " Yank to and paste from system clipboard
  nnoremap <silent> <leader>y       "*y
  xnoremap <silent> <leader>y       "*y
  nnoremap <silent> <leader>p       "*p
  nnoremap <silent> <leader>P       "*P
  xnoremap <silent> <leader>p       "*p

  " Write to file
  nnoremap <silent> <leader>w       :Update<CR>
  xnoremap          <leader>w       :<C-u>silent '<,'>write <C-z>

  " Search in files
  nnoremap          <leader>g       msmS:Grepper -query 

  " Search in current buffer
  nnoremap          <leader>/       ms:Grepper -buffer -query 
  " TODO: Ignore case like regular * and # commands do? Or should I switch the other behaviour?
  nnoremap <silent> <leader>8       ms:Grepper -buffer -cword -noprompt<CR>
  " TODO: Add ability to Grepper in current buffer with visual selection
  xnoremap <silent> <leader>8       ms:<C-u>echo "TODO: Grepper in current buffer with visual selection"<CR>

  " TODO: BOOKMARK for mappings-checklist.txt

  " Search for file or buffer
  nnoremap          <leader>b       :buffers<CR>:silent b *
  nnoremap          <leader>d       :Drop 
  nnoremap          <leader>e       :edit <C-z>
  nnoremap <silent> <leader>f       :echo 'TODO: Fuzzy file search'<CR>
  nnoremap <silent> <leader>r       :browse oldfiles<CR>

  " Windows
  nnoremap          <leader><Space> <C-w>p
  nnoremap          <leader>=       <C-w>=
  nnoremap          <leader>c       <C-w>c
  nnoremap          <leader>o       <C-w>o
  nnoremap          <leader>x       <C-w>x
  nnoremap          <leader>H       <C-w>H
  nnoremap          <leader>J       <C-w>J
  nnoremap          <leader>K       <C-w>K
  nnoremap          <leader>L       <C-w>L
  nnoremap <silent> <leader>h       :SplitLeft<CR>
  nnoremap <silent> <leader>j       :SplitBelow<CR>
  nnoremap <silent> <leader>k       :SplitAbove<CR>
  nnoremap <silent> <leader>l       :SplitRight<CR>
  xnoremap <silent> <leader>j       :VSSplitAbove<CR>
  xnoremap <silent> <leader>k       :VSSplitBelow<CR>

  " Sessions
  nnoremap <expr>   <leader>m       ':silent mksession! ' . vimrc#get_cache_dir('sessions') . '/<C-z>'
  nnoremap <expr>   <leader>s       ':silent source ' . vimrc#get_cache_dir('sessions') . '/<C-z>'

  " Denite
  nnoremap <silent> <leader>D       :Denite -resume<CR>
  nnoremap <silent> <leader>M       :Denite menu:all_menus<CR>
" }}}

" g-Leader Mappings {{{


" }}}

" Mappings that Start with 'z' {{{

  " Search in file with Denite
  nnoremap <silent> z8              ms:DeniteCursorWord line<CR>
  nnoremap <silent> z/              ms:Denite line<CR>
  nnoremap <silent> z?              ms:Denite line<CR>

  " Improved scrolling
  nnoremap          zh              10zh
  nnoremap          zl              10zl
  xnoremap          zh              10zh
  xnoremap          zl              10zl

  " Echo foldlevel
  nnoremap <silent> zr              zr:call vimrc#echo_with_color('foldlevel -> ' . &foldlevel, 'WarningMsg')<CR>
  nnoremap <silent> zm              zm:call vimrc#echo_with_color('foldlevel -> ' . &foldlevel, 'WarningMsg')<CR>
  nnoremap <silent> zR              zR:call vimrc#echo_with_color('foldlevel -> ' . &foldlevel, 'WarningMsg')<CR>
  nnoremap <silent> zM              zM:call vimrc#echo_with_color('foldlevel -> ' . &foldlevel, 'WarningMsg')<CR>

" }}}

" Mappings that Start with 'g' {{{

  " Yank to or paste from system clipboard
  nnoremap <silent> g<leader>y      gg"*yG``
  nnoremap <silent> g<leader>p      gg"_dG"*p

  " Grep operator
  nmap              gr              <plug>(GrepperOperator)
  xmap              gr              <plug>(GrepperOperator)

  " Search in browser
  nmap              gx              <Plug>(openbrowser-smart-search)
  xmap              gx              <Plug>(openbrowser-smart-search)

  " Show highlight info under cursor
  nnoremap <silent> gh              :ShowHighlightInfoUnderCursor<CR>

  " Improved cursor movement through wrapped text
  noremap           gj              j
  noremap           gk              k
  noremap           j               gj
  noremap           k               gk

  " Regex search ("very magic")
  " Set mark s, then search as regex
  nnoremap          g/              ms/\v
  xnoremap          g/              ms/\v
  nnoremap          g?              ms?\v
  xnoremap          g?              ms?\v

" }}}

" Mappings that Start with an Operator {{{

  " Yank path of file
  nnoremap          yp              :let @*=expand('%:p')<CR>

  " Change current directory to that of current file
  nnoremap <silent> cd              :ChangeDirectory<CR>

  " Toggling commands
  nmap              cog             <Plug>IndentGuidesToggle
  nnoremap          cot             :set colorcolumn<C-r>=match(&colorcolumn,'+1')>=0?'-=+1':'+=+1'<CR><CR>
  nnoremap          coz             :ToggleFoldOpenCloseStrategy<CR>
  nnoremap          coo             :set <C-r>=&scrollbind?'no':''<CR>scrollbind<CR>
" }}}

" Other Mappings {{{
  " Miscellaneous
  inoremap          <C-u>           <C-g>u<C-u>
  nnoremap          Y               y$
  inoremap          jk              <Esc>
  inoremap          kj              <Esc>
  map               r               %
  noremap           R               r
  nnoremap          <BS>            <C-^>
  nnoremap <silent> &               :&&<CR>
  xnoremap <silent> &               :&&<CR>
  nnoremap <silent> Q               :BD<CR>
  nnoremap <silent> <C-q>           :CloseBuffersMenu<CR>
  nnoremap <silent> ZZ              :confirm qa<CR>
  nnoremap <silent> _               :Dirvish<CR>
  nnoremap <silent> <C-n>           :enew<CR>
  nnoremap <silent> K               :call Define(0)<CR>
  xnoremap <silent> K               :<C-u>call Define(1)<CR>

  " Remove visual noise
  nnoremap <silent> \               :nohlsearch<CR>:echo ''<CR>
  nnoremap <silent> \|              :echo ''<CR>

  " Navigate quickfix list
  nnoremap <silent> <Left>          :cprev<CR>
  nnoremap <silent> <Right>         :cnext<CR>
  nnoremap <silent> <S-Left>        :cpfile<CR>
  nnoremap <silent> <S-Right>       :cnfile<CR>
  nnoremap <silent> <Up>            :cfirst<CR>
  nnoremap <silent> <Down>          :clast<CR>
  nnoremap <silent> <S-Up>          :colder<CR>
  nnoremap <silent> <S-Down>        :cnewer<CR>

  " Window movement
  nnoremap          <C-h>           <C-w>h
  nnoremap          <C-j>           <C-w>j
  nnoremap          <C-k>           <C-w>k
  nnoremap          <C-l>           <C-w>l
  xnoremap <silent> <C-j>           :VSSplitAbove<CR>
  xnoremap <silent> <C-k>           :VSSplitBelow<CR>

  " Recall command-line history
  nnoremap          <C-p>           :<Up>
  xnoremap          <C-p>           :<Up>
  cnoremap          <C-p>           <Up>

  " Swap back-tick and apostrophe
  noremap           '               `
  noremap           `               '
  noremap           g'              g`
  noremap           g`              g'

  " Literal Search ("Very not magic")
  " Set mark s, then search literally
  nnoremap          /               ms/\V
  xnoremap          /               ms/\V
  nnoremap          ?               ms?\V
  xnoremap          ?               ms?\V

  " Replace selected text with something else in entire buffer
  xnoremap <silent> X               :<C-u>ReplaceSelection<CR>

  " Replace inside the selected text
  xnoremap          x               :s/\V/gc<left><left><left>

  " Insert text copied from system clipboard as literal characters (instead of as if typed)
  " when using Ctrl-r in insert mode. This prevents 'clipboard hijacking' attacks.
  inoremap          <C-r>+          <C-r><C-r>+
  inoremap          <C-r>*          <C-r><C-r>*

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
  noremap <expr>    <C-f>           max([winheight(0) - 2, 1]) ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
  noremap <expr>    <C-b>           max([winheight(0) - 2, 1]) ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
  noremap <expr>    <C-e>           (line("w$") >= line('$') ? "j" : "3\<C-e>")
  noremap <expr>    <C-y>           (line("w0") <= 1 ? "k" : "3\<C-y>")

" }}}

" vim: fdm=marker:colorcolumn+=21,37
