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

" TODO: Used by coc
" nnoremap          <leader>r        :redi @r <Bar> sil  <Bar> redi END<S-Left><S-Left><S-Left><Left>

nnoremap          <leader>t        :tab<C-z><C-p>

nnoremap          <leader>y        :let @* = expand('%:')<Left><Left>

nnoremap          <leader>/        :mat Match //<Left>

" Complete
" ----------------------------------------------------------------------------
nnoremap          <leader>m        :cal vimrc#mru_dirvish()<CR>

nnoremap <silent> <leader>w        :new<CR>iStop it!!!<Esc>

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

" CoC
" ----------------------------------------------------------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" TODO Overwrites built-in gi
nmap <silent> gi <Plug>(coc-implementation)
" TODO Overwrites built-in gr
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
"
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList
" TODO
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Operations
" ============================================================================
nnoremap          <leader>d        :cal vimrc#define(expand('<cword>'))<CR>
xnoremap          <leader>d        :<C-u>cal vimrc#define(vimrc#get_selection_text())<CR>

nnoremap <silent> <leader>b        :cal vimrc#browse(expand('<cword>'))<CR>
xnoremap <silent> <leader>b        :<C-u>cal vimrc#browse(vimrc#get_selection_text())<CR>

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
