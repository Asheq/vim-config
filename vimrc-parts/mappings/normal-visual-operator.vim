" Leader Mappings {{{

let mapleader = "\<Space>"
let maplocalleader = "\\"

" Miscellaneous
nnoremap          <leader><Tab>   :tab
nnoremap <silent> <leader>e       :Files<CR>
nnoremap <silent> <leader>h       :Helptags<CR>
nnoremap <silent> <leader>m       :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <silent> <leader>r       :History<CR>
nnoremap <silent> <leader>s       :call vimrc#restore_last_session()<CR>
nnoremap <silent> <leader>t       :Filetypes<CR>
nnoremap <silent> <leader>u       :UndotreeToggle<bar>UndotreeFocus<CR>

" Format Code
nnoremap <silent> <leader>f       :Format<CR>
xnoremap <silent> <leader>f       :Format<CR>

" Explore File System
nnoremap <silent> <leader>d       :Dirvish %:p:h<CR>
nnoremap <silent> <leader>D       :Dirvish<CR>

" Yank to System Clipboard
nmap     <silent> <leader>Y       "*Y
nnoremap <silent> <leader>y       "*y
xnoremap <silent> <leader>y       "*y
" TODO-WAIT: Find better mapping than <leader>a
nnoremap <silent> <leader>a       :let @*=@"<CR>

" Paste from System Clipboard
nnoremap <silent> <leader>p       "*p
nnoremap <silent> <leader>P       "*P
xnoremap <silent> <leader>p       "*p

" Vimgrep
" nnoremap          <leader>gg      :vimgrep //j `ag -g ""`<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap          <leader>gg      :vimgrep //j `git ls-files`<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap          <leader>gf      :vimgrep //j %<Left><Left><Left><Left>

" Replace
nnoremap          <leader>gr      :cfdo %s///gc<Left><Left><Left>

" Write to File
nnoremap          <leader>w       :saveas <C-r>=fnameescape(expand('%:h'))<CR>
nnoremap          <leader>W       :saveas 
xnoremap          <leader>w       :<C-u>silent '<,'>write <C-r>=fnameescape(expand('%:h'))<CR>/
xnoremap          <leader>W       :<C-u>silent '<,'>write 

" }}}

" Mappings that Start with 'z' {{{

" Faster horizontal scrolling
nnoremap          zh              10zh
xnoremap          zh              10zh
nnoremap          zl              10zl
xnoremap          zl              10zl

" Easier vertical scrolling
nnoremap          z<CR>           zt
xnoremap          z<CR>           zt
nnoremap          z.              zb
xnoremap          z.              zb
" }}}

" Mappings that Start with 'g' {{{

nnoremap          gh              :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Search in Browser
nmap              gx              <Plug>(openbrowser-smart-search)
xmap              gx              <Plug>(openbrowser-smart-search)

" Improved Cursor Movement through Wrapped Text
nnoremap          gj              j
xnoremap          gj              j
onoremap          gj              j
nnoremap          gk              k
xnoremap          gk              k
onoremap          gk              k
nnoremap          j               gj
xnoremap          j               gj
onoremap          j               gj
nnoremap          k               gk
xnoremap          k               gk
onoremap          k               gk

" }}}

" Mappings that Start with '[' or ']' {{{
" }}}

" Mappings that Start with an Operator {{{

" Yank Path of File
nnoremap          yp              :let @*=expand('%:p')<CR>

" Toggling commands
" TODO-WAIT: Use 'b' for scrollbind
call vimrc#create_toggle_map('o', '&scrollbind', 'set noscrollbind', 'set scrollbind')
call vimrc#create_toggle_map('z', '&foldopen=="all"', 'set foldopen& foldclose&', 'set foldopen=all foldclose=all')
call vimrc#create_toggle_map('t', 'match(&colorcolumn, "+1")>=0', 'set colorcolumn-=+1', 'set colorcolumn+=+1')
" }}}

" Control Mappings {{{
" Miscellaneous
nnoremap <silent> <C-g>           :call vimrc#print_file_info()<CR>
nnoremap <silent> <C-n>           :NERDTreeToggle<CR>

" Scrolling
noremap <expr> <C-f> line('w$') >= line('$') ? "L" : "z+"
noremap <expr> <C-b> line('w0') <= 1 ? "H" : "z^"
nnoremap <silent> <C-e>           :call smooth_scroll#up(&scroll/2, 7, 1)<CR>
nnoremap <silent> <C-d>           :call smooth_scroll#down(&scroll/2, 7, 1)<CR>
xnoremap <expr>   <C-e>           &scroll/2 . "\<C-y>"
xnoremap <expr>   <C-d>           &scroll/2 . "\<C-e>"

" Recall Command-line History
nnoremap          <C-p>           :<Up>
xnoremap          <C-p>           :<Up>

" Smart vertical and horizontal movement
nmap     <silent> <C-h>           ^
xmap     <silent> <C-h>           ^
omap     <silent> <C-h>           ^
nmap     <silent> <C-l>           $
xmap     <silent> <C-l>           $
omap     <silent> <C-l>           $
nmap     <silent> <C-j>           <Plug>(edgemotion-j)
xmap     <silent> <C-j>           <Plug>(edgemotion-j)
omap     <silent> <C-j>           <Plug>(edgemotion-j)
nmap     <silent> <C-k>           <Plug>(edgemotion-k)
xmap     <silent> <C-k>           <Plug>(edgemotion-k)
omap     <silent> <C-k>           <Plug>(edgemotion-k)

" Windows
nnoremap <silent> <C-w>h          :call vimrc#smart_window_move("h")<CR>
nnoremap <silent> <C-w>j          :call vimrc#smart_window_move("j")<CR>
nnoremap <silent> <C-w>k          :call vimrc#smart_window_move("k")<CR>
nnoremap <silent> <C-w>l          :call vimrc#smart_window_move("l")<CR>
nmap     <silent> <C-w>q          <Plug>(qf_qf_toggle)
xnoremap <silent> <C-w>j          :VSSplitAbove<CR>
xnoremap <silent> <C-w>k          :VSSplitBelow<CR>
" }}}

" Meta Mappings {{{
" call vimrc#create_alt_maps_for_terminal_and_normal_mode()
" xnoremap <silent> <A-j>           :VSSplitAbove<CR>
" xnoremap <silent> <A-k>           :VSSplitBelow<CR>
" }}}

" Other Mappings {{{
" Miscellaneous
nnoremap          '0              '0zz
nnoremap          Y               y$
nnoremap          <BS>            <C-^>
xnoremap          <BS>            "_d
nnoremap <silent> &               :&&<CR>
nnoremap <silent> <C-q>           :echo 'Number of Buffers: ' . len(vimrc#get_listed_or_loaded_buffers()) <Bar> CloseBuffersMenu<CR>
nnoremap <silent> K               :call vimrc#define_mac_dict(expand('<cword>'))<CR>
xnoremap <silent> K               :<C-u>call vimrc#define_mac_dict(vimrc#get_visual_selection_raw_text())<CR>
nnoremap <silent> \               :nohlsearch\|echo ''<CR>
nnoremap <silent> \|              :redraw!<CR>:diffupdate<CR>:syntax sync fromstart<CR>

" Saner behavior of n and N
nnoremap <expr>   n               'Nn'[v:searchforward]
xnoremap <expr>   n               'Nn'[v:searchforward]
onoremap <expr>   n               'Nn'[v:searchforward]
nnoremap <expr>   N               'nN'[v:searchforward]
xnoremap <expr>   N               'nN'[v:searchforward]
onoremap <expr>   N               'nN'[v:searchforward]

" Saner behavior of * and #
map               *               <Plug>(asterisk-z*)
map               #               <Plug>(asterisk-z#)
map               g*              <Plug>(asterisk-gz*)
map               g#              <Plug>(asterisk-gz#)

" Use <Tab> to jump to matching pair.
" Use <C-i> to jump forwards through jumplist.
" Note that <C-i> is mapped to <F9> in Karabiner.
nmap              <C-i>           %
xmap              <C-i>           %
omap              <C-i>           %
nnoremap          <F9>            <C-i>

" Visual repeat
xnoremap          .               :normal! .<CR>
xnoremap          @               :call vimrc#execute_macro_on_visual_range()<CR>

" Navigate Quickfix List
" TODO-WAIT: Use 'kana/vim-submode'?
nnoremap <silent> <Left>          :cprev<CR>
nnoremap <silent> <Right>         :cnext<CR>
nnoremap <silent> <Up>            :cpfile<CR>
nnoremap <silent> <Down>          :cnfile<CR>
nnoremap <silent> <S-Left>        :cfirst<CR>
nnoremap <silent> <S-Right>       :clast<CR>
nnoremap <silent> <S-Up>          :colder<CR>
nnoremap <silent> <S-Down>        :cnewer<CR>

" Swap Back-tick and Apostrophe
" TODO: Use a function to reduce duplication
nnoremap          '               `
xnoremap          '               `
onoremap          '               `
nnoremap          `               '
xnoremap          `               '
onoremap          `               '
nnoremap          g'              g`
xnoremap          g'              g`
onoremap          g'              g`
nnoremap          g`              g'
xnoremap          g`              g'
onoremap          g`              g'
nnoremap          ]'              ]`
xnoremap          ]'              ]`
onoremap          ]'              ]`
nnoremap          ]`              ]'
xnoremap          ]`              ]'
onoremap          ]`              ]'
nnoremap          ['              [`
xnoremap          ['              [`
onoremap          ['              [`
nnoremap          [`              ['
xnoremap          [`              ['
onoremap          [`              ['

" Search in Current File
nnoremap          /               /\v
nnoremap          ?               ?\v
xnoremap          /               /\v
xnoremap          ?               ?\v
" xnoremap          *               :<C-u>call VSetSearch()<CR>/<CR>
" xnoremap          #               :<C-u>call VSetSearch()<CR>?<CR>

" Replace selected text with something else in entire file.
xnoremap <silent> X               :<C-u>ReplaceSelection<CR>

" Replace inside the selected text. Note that in visual mode, x is made redundant by d.
" TODO-WAIT: Turn into an operator?
xnoremap          x               :s/\%V\V/gc<left><left><left>
" }}}

" vim: fdm=marker:colorcolumn+=19,35
