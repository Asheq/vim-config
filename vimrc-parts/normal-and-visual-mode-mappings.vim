" Leader Mappings {{{

let mapleader = "\<Space>"
let maplocalleader = "\\"

" Windows
nnoremap          <leader><Space> <C-w>p
nnoremap          <leader>=       <C-w>=
nnoremap          <leader>c       <C-w>c
nnoremap          <leader>o       <C-w>o
nnoremap          <leader>z       <C-w>z
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

" Miscellaneous
nmap     <silent> <leader>q       <Plug>qf_qf_toggle
nnoremap          <leader><Tab>   :tab
nnoremap <silent> <leader>r       :History<CR>
nnoremap <silent> <leader>t       :Filetypes<CR>
nnoremap <silent> <leader>u       :UndotreeToggle<CR>

" Format code
nnoremap <silent> <leader>f       :call vimrc#preserve('Format')<CR>
xnoremap <silent> <leader>f       :Format<CR>

" Explore file system
nnoremap <silent> <leader>d       :Dirvish %<CR>
nnoremap <silent> <leader>D       :Dirvish<CR>

" Create a new file
nnoremap          <leader>e       :edit <C-r>=(expand('%:h')==''?'.':expand('%:h'))<CR>/
nnoremap          <leader>E       :edit 

" Yank to system clipboard
nmap     <silent> <leader>Y       "*Y
nmap     <silent> <leader>y       "*y
xmap     <silent> <leader>y       "*y

" Paste from system clipboard
nnoremap <silent> <leader>p       "*p
nnoremap <silent> <leader>P       "*P
xnoremap <silent> <leader>p       "*p

" Sessions
nnoremap <expr>   <leader>m       ':silent mksession! ' . vimrc#get_cache_dir('sessions') . '/<C-z>'
nnoremap <expr>   <leader>s       ':silent source ' . vimrc#get_cache_dir('sessions') . '/<C-z>'

" Search in current buffer
nnoremap <silent> <leader>/       ms:BLines<CR>
nnoremap <silent> <leader>8       ms:BLines <C-r><C-w> <CR>
" TODO: Don't clobber register
xnoremap <silent> <leader>8       ms"zy:BLines <C-r>f <CR>

" Search in multiple files
nnoremap          <leader>g       msmS:Grepper -dir file<CR>
nnoremap          <leader>G       msmS:Grepper -dir cwd<CR>

" Write to file
nnoremap          <leader>w       :saveas 
xnoremap          <leader>w       :<C-u>silent '<,'>write <C-r>=expand('%:h')<CR>/
xnoremap          <leader>W       :<C-u>silent '<,'>write 

" }}}

" Mappings that Start with 'z' {{{

" Search in current buffer
nnoremap          z/              ms:Grepper -buffer<CR>
nnoremap <silent> z8              ms:Grepper -buffer -cword -noprompt<CR>
xnoremap          z8              :<C-u>echo 'TODO: Use Grepper to search in current buffer for visual selection'<CR>

" Improved scrolling
nnoremap          zh              10zh
nnoremap          zl              10zl
xnoremap          zh              10zh
xnoremap          zl              10zl
" }}}

" Mappings that Start with 'g' {{{

" TODO: Depending on filetype, set gD (and [I and [i?) to appropriate command (like TernDef commands for JS)

" Grep operator
" TODO: Set marks with ms and mS. Use different mappings to grep
"   > from current file
"   > from cwd
"   > in current file only
nmap              gr              <plug>(GrepperOperator)
xmap              gr              <plug>(GrepperOperator)

" Search in browser
nmap              gx              <Plug>(openbrowser-smart-search)
xmap              gx              <Plug>(openbrowser-smart-search)

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
nnoremap <silent> cot             :set colorcolumn<C-r>=match(&colorcolumn,'+1')>=0?'-=+1':'+=+1'<CR><CR>
nnoremap <silent> coz             :ToggleFoldOpenCloseStrategy<CR>
nnoremap <silent> cog             :IndentGuidesToggle<CR>
nnoremap <silent> coo             :set scrollbind!<CR>
" }}}

" Control Mappings {{{
" Miscellaneous
nnoremap <silent> <C-n>           :enew<CR>
nnoremap <silent> <C-g>           :BufferInfo<CR>

if asheq#settings.smooth_scroll
  nnoremap <silent> <C-f>          :call smooth_scroll#down(&scroll*2, 5, 1)<CR>
  nnoremap <silent> <C-b>          :call smooth_scroll#up(&scroll*2, 5, 1)<CR>
  " TODO: Keep cursor on same line for <C-e> and <C-d>
  nnoremap <silent> <C-e>          :call smooth_scroll#up(&scroll/2, 20, 1)<CR>
  nnoremap <silent> <C-d>          :call smooth_scroll#down(&scroll/2, 10, 1)<CR>
else
  " noremap <expr>  <C-f>           max([winheight(0) - 2, 1]) ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
  " noremap <expr>  <C-b>           max([winheight(0) - 2, 1]) ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
  " noremap <expr>  <C-e>           (line("w0") <= 1 ? "k" : "3\<C-y>")
  " noremap <expr>  <C-d>           (line("w$") >= line('$') ? "j" : "3\<C-e>")
  nnoremap <C-e>           <C-y>
  nnoremap <C-d>           <C-e>
endif

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
" }}}

" Other Mappings {{{
" Miscellaneous
nnoremap          '0              '0zz
nmap              Y               y$
map               r               %
noremap           R               r
nmap              <BS>            <C-^>
nnoremap <silent> &               :&&<CR>
xnoremap <silent> &               :&&<CR>
nnoremap <silent> Q               :BD<CR>
nnoremap <silent> ZZ              :confirm qa<CR>
nnoremap <silent> K               :call Define(0)<CR>
xnoremap <silent> K               :<C-u>call Define(1)<CR>

" Fuzzy find files
nnoremap <silent> -               :Files <C-r>=expand('%:h')<CR><CR>
nnoremap <silent> _               :Files<CR>

" Remove visual noise
nnoremap <silent> \               :nohlsearch\|AnzuClearSearchStatus\|echo ''<CR>
nnoremap <silent> \|              :echo 'TODO'<CR>

" Navigate quickfix list
nnoremap <silent> <Left>          :cprev<CR>
nnoremap <silent> <Right>         :cnext<CR>
nnoremap <silent> <S-Left>        :cpfile<CR>
nnoremap <silent> <S-Right>       :cnfile<CR>
nnoremap <silent> <Up>            :cfirst<CR>
nnoremap <silent> <Down>          :clast<CR>
nnoremap <silent> <S-Up>          :colder<CR>
nnoremap <silent> <S-Down>        :cnewer<CR>

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
" Note that in visual mode, x is made redundant by d
" TODO: Turn into an operator?
xnoremap          x               :s/\V/gc<left><left><left>
" }}}

" vim: fdm=marker:colorcolumn+=19,35
