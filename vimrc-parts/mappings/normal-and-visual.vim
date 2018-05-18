" Leader Mappings {{{
"
" TODO: Refactor and simplify mappings.

let mapleader = "\<Space>"
let maplocalleader = "\\"

" Windows
nnoremap          <leader>z       <C-w>\|<C-w>_
nnoremap          <leader>=       <C-w>=
nnoremap          <leader>H       <C-w>H
nnoremap          <leader>J       <C-w>J
nnoremap          <leader>K       <C-w>K
nnoremap          <leader>L       <C-w>L
nnoremap          <leader>c       <C-w>c
nnoremap          <leader>o       <C-w>o
nnoremap          <leader>x       <C-w>x

" Miscellaneous
nmap     <silent> <leader>q       <Plug>(qf_qf_toggle)
nnoremap          <leader><Tab>   :tab
nnoremap <silent> <leader>r       :History<CR>
nnoremap <silent> <leader>t       :Filetypes<CR>
nnoremap <silent> <leader>u       :UndotreeToggle<bar>UndotreeFocus<CR>
nnoremap <silent> <leader>s       :call vimrc#restore_last_session()<CR>
nnoremap <silent> <leader>m       :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <silent> <leader>h       :Helptags<CR>
nnoremap <silent> <leader>e       :Files<CR>
map      <silent> <leader>j       <Plug>(edgemotion-j)
map      <silent> <leader>k       <Plug>(edgemotion-k)
" nnoremap          <leader>d       :execute 'drop ' . fnameescape('')<left><left>

" Format Code
nnoremap <silent> <leader>f       :call vimrc#preserve('Format')<CR>
xnoremap <silent> <leader>f       :Format<CR>

" Explore File System using Dirvish
nnoremap <silent> <leader>d       :Dirvish %:p:h<CR>
nnoremap <silent> <leader>D       :Dirvish<CR>

" Yank to System Clipboard
nmap     <silent> <leader>Y       "*Y
nmap     <silent> <leader>y       "*y
xmap     <silent> <leader>y       "*y
" TODO: Find better mapping
nmap     <silent> <leader>a       :let @*=@0<CR>

" Paste from System Clipboard
nnoremap <silent> <leader>p       "*p
nnoremap <silent> <leader>P       "*P
xnoremap <silent> <leader>p       "*p

" Search in Current File using fzf
nnoremap <silent> <leader>/       :BLines<CR>
nnoremap <silent> <leader>?       :BLines<CR>
nnoremap <silent> <leader>8       :BLines <C-r><C-w> <CR>
nnoremap <silent> <leader>3       :BLines <C-r><C-w> <CR>
" nnoremap <silent> <leader>n
" nnoremap <silent> <leader>N
" xnoremap <silent> <leader>/
" xnoremap <silent> <leader>?
xnoremap <silent> <leader>8       "zy:BLines <C-r>z <CR>
xnoremap <silent> <leader>3       "zy:BLines <C-r>z <CR>
" xnoremap <silent> <leader>n
" xnoremap <silent> <leader>N

" Search in Multiple Files
nnoremap          <leader>gg       :vimgrep // `ag -g ""`<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap          <leader>gf       :vimgrep // %<Left><Left><Left>

" Write to File
nnoremap          <leader>w       :saveas 
xnoremap          <leader>w       :<C-u>silent '<,'>write <C-r>=expand('%:h')<CR>/
xnoremap          <leader>W       :<C-u>silent '<,'>write 

" }}}

" Mappings that Start with 'z' {{{

" Improved scrolling
nnoremap          zh              10zh
nnoremap          zl              10zl
xnoremap          zh              10zh
xnoremap          zl              10zl
" }}}

" Mappings that Start with 'g' {{{

" TODO: Grep Operator (gr)

" Search in Current File using Quickfix List.
" TODO: Have vimgrep set search register and highlight on for those that don't already do it.
nnoremap          g/              :vimgrep /\V/g %<left><left><left><left>
nnoremap          g?              :vimgrep /\V/g %<left><left><left><left>
nnoremap          g8              *:vimgrep //g %<CR>
nnoremap          g3              #:vimgrep //g %<CR>
" nnoremap          gn              :vimgrep //g %<CR>:set hlsearch<CR>
" nnoremap          gN              :vimgrep //g %<CR>:set hlsearch<CR>
" xnoremap          g/
" xnoremap          g?
xnoremap          g8              :<C-u>call VSetSearch()<CR>:vimgrep //g %<CR>:set hlsearch<CR>
xnoremap          g3              :<C-u>call VSetSearch()<CR>vimgrep //g %<CR>:set hlsearch<CR>
" xnoremap          gn
" xnoremap          gN

" Search in Browser
nmap              gx              <Plug>(openbrowser-smart-search)
xmap              gx              <Plug>(openbrowser-smart-search)

" Improved Cursor Movement through Wrapped Text
noremap           gj              j
noremap           gk              k
noremap           j               gj
noremap           k               gk

" }}}

" Mappings that Start with an Operator {{{

" Yank Path of File
nnoremap          yp              :let @*=expand('%:p')<CR>

" Change Current Directory to that of Current File
nnoremap <silent> cd              :call vimrc#change_directory()<CR>

" Toggling commands
call vimrc#create_toggle_map('o', '&scrollbind', 'set noscrollbind', 'set scrollbind')
call vimrc#create_toggle_map('z', '&foldopen=="all"', 'set foldopen& foldclose&', 'set foldopen=all foldclose=all')
call vimrc#create_toggle_map('t', 'match(&colorcolumn, "+1")>=0', 'set colorcolumn-=+1', 'set colorcolumn+=+1')
" }}}

" Control Mappings {{{
" Miscellaneous
nnoremap <silent> <C-g>           :call vimrc#file_info()<CR>

nnoremap <silent> <C-f>           :call smooth_scroll#down(&scroll*2, 5, 1)<CR>
nnoremap <silent> <C-b>           :call smooth_scroll#up(&scroll*2, 5, 1)<CR>
nnoremap <silent> <C-e>           :call smooth_scroll#up(&scroll/3, 20, 1)<CR>
nnoremap <silent> <C-d>           :call smooth_scroll#down(&scroll/3, 10, 1)<CR>
xnoremap <expr>   <C-e>           &scroll/3 . "\<C-y>"
xnoremap <expr>   <C-d>           &scroll/3 . "\<C-e>"

" Window Movement
nnoremap <silent> <C-h>           :call vimrc#win_move('h')<cr>
nnoremap <silent> <C-j>           :call vimrc#win_move('j')<cr>
nnoremap <silent> <C-k>           :call vimrc#win_move('k')<cr>
nnoremap <silent> <C-l>           :call vimrc#win_move('l')<cr>
xnoremap <silent> <C-j>           :VSSplitAbove<CR>
xnoremap <silent> <C-k>           :VSSplitBelow<CR>

" Recall Command-line History
nnoremap          <C-p>           :<Up>
xnoremap          <C-p>           :<Up>
" }}}

" Other Mappings {{{
" Miscellaneous
nnoremap          '0              '0zz
nmap              Y               y$
nmap              <BS>            <C-^>
nnoremap <silent> &               :&&<CR>
xnoremap <silent> &               :&&<CR>
nnoremap <silent> Q               :bd<CR>
nnoremap <silent> ZZ              :qa<CR>
nnoremap <silent> K               :call vimrc#define(0)<CR>
xnoremap <silent> K               :<C-u>call vimrc#define(1)<CR>
nnoremap <silent> \               :nohlsearch\|echo ''<CR>
nnoremap <silent> \|              :redraw!<CR>:diffupdate<CR>:syntax sync fromstart<CR>

nnoremap          <Tab>           %
xnoremap          <Tab>           %
onoremap          <Tab>           %
" <C-i> is mapped to F9 in Karabiner
nnoremap          <F9>            <C-i>

" Visual repeat
xnoremap . :normal! .<CR>
xnoremap @ :call vimrc#execute_macro_on_visual_range()<CR>

" Navigate Quickfix List
" TODO: Use 'kana/vim-submode'?
nnoremap <silent> <Left>          :cprev<CR>
nnoremap <silent> <Right>         :cnext<CR>
nnoremap <silent> <Up>            :cpfile<CR>
nnoremap <silent> <Down>          :cnfile<CR>
nnoremap <silent> <S-Left>        :cfirst<CR>
nnoremap <silent> <S-Right>       :clast<CR>
nnoremap <silent> <S-Up>          :colder<CR>
nnoremap <silent> <S-Down>        :cnewer<CR>

" Swap Back-tick and Apostrophe
noremap           '               `
noremap           `               '
noremap           g'              g`
noremap           g`              g'

" Search in Current File
nnoremap          /               /\V
nnoremap          ?               ?\V
nnoremap          *               *
nnoremap          #               #
" nnoremap          n
" nnoremap          N
xnoremap          /               /\V
xnoremap          ?               ?\V
xnoremap          *               :<C-u>call VSetSearch()<CR>/<CR>
xnoremap          #               :<C-u>call VSetSearch()<CR>?<CR>
" xnoremap          n
" xnoremap          N

" Replace selected text with something else in entire file.
xnoremap <silent> X               :<C-u>ReplaceSelection<CR>

" Replace inside the selected text.
" Note that in visual mode, x is made redundant by d.
" TODO: Turn into an operator?
xnoremap          x               :s/\%V\V/gc<left><left><left>
" }}}

" vim: fdm=marker:colorcolumn+=19,35
