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

nnoremap          <leader>gg       :sil gr!  \| cw<S-Left><S-Left><Left>
nnoremap          <leader>gf       :sil gr!  % \| cw<S-Left><S-Left><S-Left><Left>

nnoremap          <leader>/        :mat Match //<Left>

nnoremap          <leader>y        :let @* = expand('%:')<Left><Left>

nnoremap          <leader>t        :tab<C-z><C-p>

" Complete
" ----------------------------------------------------------------------------
nnoremap          <leader>r        :cal vimrc#redirect()<CR>

nnoremap          <leader>m        :cal vimrc#mru_dirvish()<CR>

call              vimrc#create_toggle_maps('a', '&formatoptions=~"a"'         , 'setl fo-=a'    , 'setl fo+=a')
call              vimrc#create_toggle_maps('b', '&scrollbind'                 , 'setl noscb'    , 'setl scb')
call              vimrc#create_toggle_maps('f', '&foldopen=="all"'            , 'setl fdo& fcl&', 'setl fdo=all fcl=all')
call              vimrc#create_toggle_maps('n', '&number'                     , 'setl nonu'     , 'setl nu')
call              vimrc#create_toggle_maps('t', 'match(&colorcolumn, "+1")>=0', 'setl cc-=+1'   , 'setl cc+=+1')
call              vimrc#create_toggle_maps('w', '&wrap'                       , 'setl nowrap'   , 'setl wrap')

" Operations
" ============================================================================
nnoremap          <leader>d        :cal vimrc#define_word(expand('<cword>'))<CR>
xnoremap          <leader>d        :<C-u>cal vimrc#define_word(vimrc#get_text_from_selection())<CR>

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
