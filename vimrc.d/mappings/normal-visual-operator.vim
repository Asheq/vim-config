" Set <Space> as leader key
" ============================================================================
let mapleader = "\<Space>"
let maplocalleader = "\\"
nnoremap <Space> <Nop>

" Ex command typing helpers
" ============================================================================

" Partial
" ----------------------------------------------------------------------------
nnoremap          <leader><leader> :
xnoremap          <leader><leader> :

nnoremap          <leader>vv       :sil gr!  \| cw<Left><Left><Left><Left><Left>
nnoremap          <leader>vf       :sil gr!  % \| cw<Left><Left><Left><Left><Left><Left><Left>

nnoremap          <leader>/        :mat Match //<left>

nnoremap          <leader>g        :G<C-z><C-p>

nnoremap          <leader>t       :tab<C-z><C-p>

nnoremap          <leader>y       :let @*=expand('%:')<Left><Left>

" Complete
" ----------------------------------------------------------------------------
nnoremap          <leader><CR>     :sp\|te<CR>i

nnoremap          <leader>x        :HexokinaseToggle<CR>

nnoremap          <leader>h        :Helptags<CR>

nnoremap          <leader>f        :Filetypes<CR>

nnoremap          <leader>e        :GFiles<CR>

nnoremap          <leader>m        :History<CR>

call              vimrc#create_toggle_maps('a', '&formatoptions=~"a"', 'set formatoptions-=a', 'set formatoptions+=a')
call              vimrc#create_toggle_maps('t', 'match(&colorcolumn, "+1")>=0', 'set colorcolumn-=+1', 'set colorcolumn+=+1')
call              vimrc#create_toggle_maps('v', '&scrollbind', 'set noscrollbind', 'set scrollbind')
call              vimrc#create_toggle_maps('z', '&foldopen=="all"', 'set foldopen& foldclose&', 'set foldopen=all foldclose=all')

" Operators
" ============================================================================
nmap <expr>       <leader>c        vimrc#change_case(0)
xmap <expr>       <leader>c        vimrc#change_case(1)

" Key commands
" ============================================================================
nnoremap <silent> <leader>d        :call vimrc#define_word(expand('<cword>'))<CR>
xnoremap <silent> <leader>d        :<C-u>call vimrc#define_word(vimrc#get_text_from_selection())<CR>

nmap              gx               <Plug>(openbrowser-smart-search)
xmap              gx               <Plug>(openbrowser-smart-search)

map               *                <Plug>(asterisk-*)
map               #                <Plug>(asterisk-#)
map               g*               <Plug>(asterisk-g*)
map               g#               <Plug>(asterisk-g#)

" Motions
" ============================================================================
map               [b               <Plug>(IndentWisePreviousLesserIndent)
map               ]b               <Plug>(IndentWiseNextLesserIndent)

map               [w               <Plug>(IndentWisePreviousGreaterIndent)
map               ]w               <Plug>(IndentWiseNextGreaterIndent)

map               [v               <Plug>(IndentWisePreviousEqualIndent)
map               ]v               <Plug>(IndentWiseNextEqualIndent)

map               [a               <Plug>(IndentWiseBlockScopeBoundaryBegin)
map               ]a               <Plug>(IndentWiseBlockScopeBoundaryEnd)
