" Set <Space> as leader key
" ============================================================================
let mapleader = "\<Space>"
let maplocalleader = "\\"

nnoremap          <Space>          <Nop>

" Ex command typing helpers
" ============================================================================

" Partial
" ----------------------------------------------------------------------------
nnoremap          <leader><leader> :
xnoremap          <leader><leader> :

nnoremap          <leader>vv       :sil gr!  \| cw<S-Left><S-Left><Left>
nnoremap          <leader>vf       :sil gr!  % \| cw<S-Left><S-Left><S-Left><Left>

nnoremap          <leader>r        :let @r = execute(input('Capture into @r: ', '', 'command'))<CR>

nnoremap          <leader>/        :mat Match //<Left>

nnoremap          <leader>y        :let @* = expand('%:')<Left><Left>

nnoremap          <leader>s        :set

nnoremap          <leader>g        :G<C-z><C-p>

nnoremap          <leader>t        :tab<C-z><C-p>

nnoremap          <leader>h        :h <C-z><C-p>

nnoremap          <leader>f        :fin 

nnoremap          <leader>b        :ls<CR>:b 

" Complete
" ----------------------------------------------------------------------------
nnoremap          <leader><CR>     :sp\|te<CR>i

nnoremap          <leader>m        :cal vimrc#mru_dirvish()<CR>

nnoremap          <leader>u        :up<CR>

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
nnoremap          <leader>d        :cal vimrc#define_word(expand('<cword>'))<CR>
xnoremap          <leader>d        :<C-u>cal vimrc#define_word(vimrc#get_text_from_selection())<CR>

nmap              gx               <Plug>(openbrowser-smart-search)
xmap              gx               <Plug>(openbrowser-smart-search)

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
