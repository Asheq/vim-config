" Leader Mappings {{{

" Set space key as leader
let mapleader = "\<Space>"
let maplocalleader = "\\"
nnoremap <Space> <Nop>

" Miscellaneous
nnoremap          <leader><Tab>   :tab
nnoremap <silent> <leader>e       :Files<CR>
nnoremap <silent> <leader>h       :Helptags<CR>
" TODO-WAIT: The following does not work as expected after yanking a custom text object
nnoremap <silent> <leader>m       :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <silent> <leader>r       :History<CR>
nnoremap <silent> <leader>s       :call RestoreLastSession()<CR>
nnoremap <silent> <leader>t       :Filetypes<CR>
nnoremap <silent> <leader>o       :Goyo<CR>

" Format Code
nnoremap <silent> <leader>f       :Format<CR>
xnoremap <silent> <leader>f       :Format<CR>

" Explore File System
nnoremap <silent> <leader>d       :Dirvish %:p:h<CR>
nnoremap <silent> <leader>D       :Dirvish<CR>

" Yank to System Clipboard
nnoremap <silent> <leader>y       "+y
xnoremap <silent> <leader>y       "+y
nmap     <silent> <leader>Y       "+Y
" TODO-WAIT: Find better mapping than <leader>a
nnoremap <silent> <leader>a       :let @+=@"<CR>

" Paste from System Clipboard
nnoremap <silent> <leader>p       "+p
xnoremap <silent> <leader>p       "+p
nnoremap <silent> <leader>P       "+P

" Vimgrep
nnoremap          <leader>ga      :Ag<CR>
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
" }}}

" Mappings that Start with 'g' {{{

nnoremap          gh              :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Search in Browser
nmap              gx              <Plug>(openbrowser-smart-search)
xmap              gx              <Plug>(openbrowser-smart-search)

" Improved Cursor Movement through Wrapped Text
for m in ['n', 'x', 'o']
  for d in ['j', 'k']
    exe m.'noremap'  d           'g'.d
    exe m.'noremap' 'g'.d         d
  endfor
endfor

" }}}

" Mappings that Start with '[' or ']' {{{
  map [a <Plug>(IndentWiseBlockScopeBoundaryBegin)
  map ]a <Plug>(IndentWiseBlockScopeBoundaryEnd)
" }}}

" Mappings that Start with an Operator {{{

" Yank Path of File
nnoremap          yp              :let @+=expand('%:p')<CR>

function! s:create_toggle_maps() abort
  call vimrc#remove_toggle_map('b') " Remove map created by unimpaired
  call vimrc#create_toggle_map('b', '&scrollbind', 'set noscrollbind', 'set scrollbind')
  call vimrc#create_toggle_map('z', '&foldopen=="all"', 'set foldopen& foldclose&', 'set foldopen=all foldclose=all')
  call vimrc#create_toggle_map('t', 'match(&colorcolumn, "+1")>=0', 'set colorcolumn-=+1', 'set colorcolumn+=+1')
  call vimrc#create_toggle_map('a', '&formatoptions=~"a"', 'set formatoptions-=a', 'set formatoptions+=a')
endfunction

" Toggling commands
augroup create_toggle_maps
  autocmd!
  autocmd VimEnter * call s:create_toggle_maps()
augroup end
" }}}

" Control Mappings {{{
" Miscellaneous
nnoremap <silent> <C-g>           :call vimrc#print_file_info()<CR>
nnoremap <silent> <C-n>           :call vimrc#open_scratch_buffer()<CR>

" Scrolling
noremap <expr>    <C-f>           line('w$') >= line('$') ? "L" : "z+"
noremap           <C-b>           z^
nmap              <PageDown>      <C-f>
nmap              <PageUp>        <C-b>
nnoremap <silent> <C-e>           :call smooth_scroll#up(&scroll * 2 / 3, 14, 1)<CR>
nnoremap <silent> <C-d>           :call smooth_scroll#down(&scroll * 2 / 3, 14, 1)<CR>
xnoremap <expr>   <C-e>           &scroll * 2 / 3 . "\<C-y>"
xnoremap <expr>   <C-d>           &scroll * 2 / 3 . "\<C-e>"

" Recall Command-line History
nnoremap          <C-p>           :<Up>
xnoremap          <C-p>           :<Up>

" Smart vertical and horizontal movement
nnoremap <silent> <C-h>           ^
xnoremap <silent> <C-h>           ^
onoremap <silent> <C-h>           ^
nnoremap <silent> <C-l>           $
xnoremap <silent> <C-l>           $
onoremap <silent> <C-l>           $
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
nnoremap <silent> <C-w>u          :UndotreeToggle<bar>UndotreeFocus<CR>
xnoremap <silent> <C-w>j          :VSSplitAbove<CR>
xnoremap <silent> <C-w>k          :VSSplitBelow<CR>
" }}}

" Alt/Meta Mappings {{{
" }}}

" Other Mappings {{{
" Miscellaneous
nnoremap          '0              '0zz
nnoremap          Y               y$
nnoremap          <BS>            <C-^>
xnoremap          <BS>            "_d
nnoremap <silent> <C-q>           :Bdelete menu<CR>
nnoremap <silent> K               :call vimrc#define_merriam_webster_web(expand('<cword>'))<CR>
xnoremap <silent> K               :<C-u>call vimrc#define_merriam_webster_web(vimrc#get_visual_selection_raw_text())<CR>
nnoremap <silent> \               :nohlsearch\|echo ''<CR>
nnoremap <silent> \|              :redraw!<CR>:diffupdate<CR>:syntax sync fromstart<CR>
nnoremap          U               <C-r>

" TODO: Review
nmap              #               yow
nmap              $               yos
" TODO: This is being overrided
" nmap              %               yol

" Saner behavior of n and N
nnoremap <expr>   n               'Nn'[v:searchforward]
xnoremap <expr>   n               'Nn'[v:searchforward]
onoremap <expr>   n               'Nn'[v:searchforward]
nnoremap <expr>   N               'nN'[v:searchforward]
xnoremap <expr>   N               'nN'[v:searchforward]
onoremap <expr>   N               'nN'[v:searchforward]

" Saner behavior of * and #
map               *               <Plug>(asterisk-z*)
map               g*              <Plug>(asterisk-gz*)

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
for p in ["", "g", "[", "]"]
  for m in ["n", "x", "o"]
    exe m."noremap"    p."'"      p."`"
    exe m."noremap"    p."`"      p."'"
  endfor
endfor

" Search in Current File
nnoremap          /               /\v
nnoremap          ?               ?\v
" TODO-WAIT: Needs testing
xnoremap          /               <Esc>`</\v%V
xnoremap          ?               <Esc>`>?\v%V
" }}}

" vim: fdm=marker:colorcolumn+=19,35
