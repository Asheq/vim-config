" Set <Space> as leader key
" ============================================================================
let mapleader = "\<Space>"
let maplocalleader = "\\"

nnoremap          <Space>          <Nop>

" Ex command typing helpers
" ============================================================================

" Partial
" ----------------------------------------------------------------------------
nnoremap          <leader>g       :sil gr!  <Bar> cw<S-Left><S-Left><Left>

nnoremap          <leader>r        :redi @r <Bar> sil  <Bar> redi END<S-Left><S-Left><S-Left><Left>

nnoremap          <leader>t        :tab<C-z><C-p>

nnoremap          <leader>y        :let @* = expand('%:')<Left><Left>

nnoremap          <leader>/        :mat Match //<Left>

" Complete
" ----------------------------------------------------------------------------
nnoremap          <leader>m        :cal vimrc#mru_dirvish()<CR>

nnoremap          <leader>w        :up<CR>

" TODO: Move to function
nnoremap          <leader>h        :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

call              vimrc#create_toggle_maps('a', '&formatoptions=~"a"'         , 'setl fo-=a'    , 'setl fo+=a')
call              vimrc#create_toggle_maps('b', '&scrollbind'                 , 'setl noscb'    , 'setl scb')
call              vimrc#create_toggle_maps('c', '&cursorcolumn'               , 'setl nocuc'    , 'setl cuc')
call              vimrc#create_toggle_maps('f', '&foldopen=="all"'            , 'setl fdo& fcl&', 'setl fdo=all fcl=all')
call              vimrc#create_toggle_maps('l', '&list'                       , 'setl nolist'   , 'setl list')
call              vimrc#create_toggle_maps('n', '&number'                     , 'setl nonu'     , 'setl nu')
call              vimrc#create_toggle_maps('p', 'g:show_position'             , 'let g:show_position = 0' , 'let g:show_position = 1')
call              vimrc#create_toggle_maps('r', '&relativenumber'             , 'setl nornu'    , 'setl rnu')
call              vimrc#create_toggle_maps('s', '&spell'                      , 'setl nospell'  , 'setl spell')
call              vimrc#create_toggle_maps('t', 'match(&colorcolumn, "+1")>=0', 'setl cc-=+1'   , 'setl cc+=+1')
call              vimrc#create_toggle_maps('w', '&wrap'                       , 'setl nowrap'   , 'setl wrap')

" Operations
" ============================================================================
nnoremap          <leader>d        :cal vimrc#define(expand('<cword>'))<CR>
xnoremap          <leader>d        :<C-u>cal vimrc#define(vimrc#get_selection_text())<CR>

nnoremap          <leader>s        :cal vimrc#search(expand('<cword>'))<CR>
xnoremap          <leader>s        :<C-u>cal vimrc#search(vimrc#get_selection_text())<CR>

nnoremap          <leader>e        :cal vimrc#echo(expand('<cword>'))<CR>
xnoremap          <leader>e        :<C-u>cal vimrc#echo(vimrc#get_selection_text())<CR>

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
