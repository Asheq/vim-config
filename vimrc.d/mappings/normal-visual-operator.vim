" Set <Space> as leader key
" ----------------------------------------------------------------------------
let mapleader = "\<Space>"
let maplocalleader = "\\"
nnoremap <Space> <Nop>

" Ex command typing helpers
" ----------------------------------------------------------------------------
nnoremap          <leader>vv       :sil gr!  \| cw<Left><Left><Left><Left><Left>
nnoremap          <leader>vf       :sil gr!  % \| cw<Left><Left><Left><Left><Left><Left><Left>

nnoremap          <leader>va       :Rg<CR>

nnoremap          <leader>rr       :cfdo %s///gc<Left><Left><Left><Left>
nnoremap          <leader>rf       :%s///gc<Left><Left><Left><Left>
nnoremap          <leader>n        :norm! 
xnoremap          <leader>n        :norm! 

nnoremap          <leader><leader> :
xnoremap          <leader><leader> :

nnoremap          <leader><CR>     :sp\|te<CR>i

nnoremap          <leader>/        :mat Match //<left>

nnoremap          <leader>g        :G<C-z>

nnoremap          <leader><Tab>    :tab<C-z>

nnoremap          <leader>x        :HexokinaseToggle<CR>

nnoremap          <leader>h        :Helptags<CR>

nnoremap          <leader>t        :Filetypes<CR>

nnoremap          <leader>e        :GFiles<CR>

nnoremap          <leader>m        :History<CR>

nnoremap          <Left>          :cprev<CR>
nnoremap          <Right>         :cnext<CR>
nnoremap          <Up>            :cpfile<CR>
nnoremap          <Down>          :cnfile<CR>
nnoremap          <S-Left>        :cfirst<CR>
nnoremap          <S-Right>       :clast<CR>
nnoremap          <S-Up>          :colder<CR>
nnoremap          <S-Down>        :cnewer<CR>

nnoremap          yp               :let @*=expand('%:')<Left><Left>

call        vimrc#yo('a',          '&formatoptions=~"a"', 'set formatoptions-=a', 'set formatoptions+=a')
call        vimrc#yo('t',          'match(&colorcolumn, "+1")>=0', 'set colorcolumn-=+1', 'set colorcolumn+=+1')
call        vimrc#yo('v',          '&scrollbind', 'set noscrollbind', 'set scrollbind')
call        vimrc#yo('z',          '&foldopen=="all"', 'set foldopen& foldclose&', 'set foldopen=all foldclose=all')

" Operators
" ----------------------------------------------------------------------------
" TODO Add <leader>cc for whole line operation?
nmap <expr>       <leader>c        vimrc#choose_case(0)
xmap <expr>       <leader>c        vimrc#choose_case(1)

" Key commands
" ----------------------------------------------------------------------------
nnoremap          <leader>k        :call vimrc#define_word(expand('<cword>'))<CR>
xnoremap          <leader>k        :<C-u>call vimrc#define_word(vimrc#raw_text_from_selection())<CR>

nmap              gx               <Plug>(openbrowser-smart-search)
xmap              gx               <Plug>(openbrowser-smart-search)

map               *                <Plug>(asterisk-*)
map               #                <Plug>(asterisk-#)
map               g*               <Plug>(asterisk-g*)
map               g#               <Plug>(asterisk-g#)

" Motions
" ----------------------------------------------------------------------------
map               [b               <Plug>(IndentWisePreviousLesserIndent)
map               ]b               <Plug>(IndentWiseNextLesserIndent)

map               [w               <Plug>(IndentWisePreviousGreaterIndent)
map               ]w               <Plug>(IndentWiseNextGreaterIndent)

map               [v               <Plug>(IndentWisePreviousEqualIndent)
map               ]v               <Plug>(IndentWiseNextEqualIndent)

map               [a               <Plug>(IndentWiseBlockScopeBoundaryBegin)
map               ]a               <Plug>(IndentWiseBlockScopeBoundaryEnd)

" Types of mappings
" ----------------------------------------------------------------------------
" - Leader
" - Starts with z
" - Starts with g
" - Starts with ] or [
" - Starts with an operator (c,d,y,=)
" - Control
" - Alt/Meta
" - Other
