" Leader Mappings {{{
" TODO: Refactor mappings

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

" Miscellaneous
nmap     <silent> <leader>q       <Plug>(qf_qf_toggle)
nnoremap          <leader><Tab>   :tab
nnoremap <silent> <leader>r       :History<CR>
nnoremap <silent> <leader>t       :Filetypes<CR>
nnoremap <silent> <leader>u       :UndotreeToggle<bar>UndotreeFocus<CR>
nnoremap <silent> <leader>s       :call vimrc#restore_last_session()<CR>

" Format code
nnoremap <silent> <leader>f       :call vimrc#preserve('Format')<CR>
xnoremap <silent> <leader>f       :Format<CR>

" Explore file system using Dirvish
nnoremap <silent> <leader>d       :Dirvish %:p:h<CR>
nnoremap <silent> <leader>D       :Dirvish<CR>

" Create a new file
nnoremap          <leader>e       :edit <C-r>=(expand('%:h')==''?'.':expand('%:h'))<CR>/
nnoremap          <leader>E       :edit 

" Yank to system clipboard
nmap     <silent> <leader>Y       "*Y
nmap     <silent> <leader>y       "*y
xmap     <silent> <leader>y       "*y
" TODO: Find better mapping
nmap     <silent> <leader>a       :let @*=@0<CR>

" Paste from system clipboard
nnoremap <silent> <leader>p       "*p
nnoremap <silent> <leader>P       "*P
xnoremap <silent> <leader>p       "*p

" Search in current file using fzf
nnoremap <silent> <leader>/       ms:BLines<CR>
nnoremap <silent> <leader>?       ms:BLines<CR>
nnoremap <silent> <leader>8       ms:BLines <C-r><C-w> <CR>
nnoremap <silent> <leader>3       ms:BLines <C-r><C-w> <CR>
" nnoremap <silent> <leader>n
" nnoremap <silent> <leader>N
" xnoremap <silent> <leader>/
" xnoremap <silent> <leader>?
xnoremap <silent> <leader>8       ms"zy:BLines <C-r>z <CR>
xnoremap <silent> <leader>3       ms"zy:BLines <C-r>z <CR>
" xnoremap <silent> <leader>n
" xnoremap <silent> <leader>N

" Search in multiple files
nnoremap          <leader>G       msmS:grep 

" Write to file
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

" TODO: Grep operator (gr)

" Search in current file using quickfix list
" TODO: Have vimgrep set search register and highlight on for those that don't already do it
nnoremap          g/              ms:vimgrep /\V/g %<left><left><left><left>
nnoremap          g?              ms:vimgrep /\V/g %<left><left><left><left>
nnoremap          g8              ms*:vimgrep //g %<CR>
nnoremap          g3              ms#:vimgrep //g %<CR>
" nnoremap          gn              ms:vimgrep //g %<CR>:set hlsearch<CR>
" nnoremap          gN              ms:vimgrep //g %<CR>:set hlsearch<CR>
" xnoremap          g/
" xnoremap          g?
xnoremap          g8              ms:<C-u>call VSetSearch()<CR>:vimgrep //g %<CR>:set hlsearch<CR>
xnoremap          g3              ms:<C-u>call VSetSearch()<CR>vimgrep //g %<CR>:set hlsearch<CR>
" xnoremap          gn
" xnoremap          gN

" Search in browser
nmap              gx              <Plug>(openbrowser-smart-search)
xmap              gx              <Plug>(openbrowser-smart-search)

" Improved cursor movement through wrapped text
noremap           gj              j
noremap           gk              k
noremap           j               gj
noremap           k               gk

" }}}

" Mappings that Start with an Operator {{{

" Yank path of file
nnoremap          yp              :let @*=expand('%:p')<CR>

" Change current directory to that of current file
nnoremap <silent> cd              :ChangeDirectory<CR>

" Toggling commands
nnoremap <silent> =ot             :set colorcolumn<C-r>=match(&colorcolumn,'+1')>=0?'-=+1':'+=+1'<CR><CR>
nnoremap <silent> =oz             :ToggleFoldOpenCloseStrategy<CR>
nnoremap          =oo             :set scrollbind!<CR>
" }}}

" Control Mappings {{{
" Miscellaneous
nnoremap <silent> <C-g>           :FileInfo<CR>

nnoremap <silent> <C-f>           :call smooth_scroll#down(&scroll*2, 5, 1)<CR>
nnoremap <silent> <C-b>           :call smooth_scroll#up(&scroll*2, 5, 1)<CR>
nnoremap <silent> <C-e>           :call smooth_scroll#up(&scroll/3, 20, 1)<CR>
nnoremap <silent> <C-d>           :call smooth_scroll#down(&scroll/3, 10, 1)<CR>
xnoremap <expr>   <C-e>           &scroll/3 . "\<C-y>"
xnoremap <expr>   <C-d>           &scroll/3 . "\<C-e>"

" Window movement
nnoremap <silent> <C-h>           :call vimrc#WinMove('h')<cr>
nnoremap <silent> <C-j>           :call vimrc#WinMove('j')<cr>
nnoremap <silent> <C-k>           :call vimrc#WinMove('k')<cr>
nnoremap <silent> <C-l>           :call vimrc#WinMove('l')<cr>
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
nnoremap <silent> \               :nohlsearch\|echo ''<CR>

" Fuzzy find files
nnoremap <silent> -               :Files <C-r>=expand('%:h')<CR><CR>
nnoremap <silent> _               :Files<CR>

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

" Search in current file
nnoremap          /               ms/\V
nnoremap          ?               ms?\V
nnoremap          *               ms*
nnoremap          #               ms#
" nnoremap          n
" nnoremap          N
xnoremap          /               ms/\V
xnoremap          ?               ms?\V
xnoremap          *               ms:<C-u>call VSetSearch()<CR>/<CR>
xnoremap          #               ms:<C-u>call VSetSearch()<CR>?<CR>
" xnoremap          n
" xnoremap          N

" Replace selected text with something else in entire file
xnoremap <silent> X               :<C-u>ReplaceSelection<CR>

" Replace inside the selected text
" Note that in visual mode, x is made redundant by d
" TODO: Turn into an operator?
xnoremap          x               :s/\%V\V/gc<left><left><left>
" }}}

" vim: fdm=marker:colorcolumn+=19,35
