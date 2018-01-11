" auto-save
let g:auto_save = 1
let g:auto_save_silent = 1

" color
set background=dark
colorscheme tender
highlight Search cterm=NONE ctermbg=yellow ctermfg=black
highlight EndOfBuffer ctermfg=235 ctermbg=235 guifg=#eeeeee guibg=#282828

" indent-guides
let g:indent_guides_default_mapping = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" vim-dirvish
let g:dirvish_relative_paths = 1

" vim-operator-flashy
let g:operator#flashy#flash_time = 100
map y <Plug>(operator-flashy)

" undotree
let g:undotree_DiffAutoOpen = 0

" vim-lion
let g:lion_squeeze_spaces = 1

" vim-grepper
let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.operator = {}
let g:grepper.operator.highlight = 1
command! Todo Grepper -query '(TODO|FIXME|XXX):'

" vim-sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" targets.vim
" The default value of g:targets_pairs is '()b {}B [] <>'
let g:targets_pairs = '()b {}B []r <>a'
" The default value of g:targets_argTrigger is 'a'
let g:targets_argTrigger = ','

" vim-textobj-line
" The 'il' and 'al' text objects are already taken by Targets plugin
let g:textobj_line_no_default_key_mappings = 1
vmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
vmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" vim-wordmotion
let g:wordmotion_mappings = {
    \ 'w'  : 'gw',
    \ 'b'  : 'gb',
    \ 'e'  : 'ge',
    \ 'aw' : 'agw',
    \ 'iw' : 'igw'
    \ }

" vim-qf
let g:qf_auto_quit = 0
let g:qf_mapping_ack_style = 1
let g:qf_save_win_view = 0
let g:qf_statusline = {}
let g:qf_statusline.before = '%#IncSearch#\ '
let g:qf_statusline.after ='\ %0*\ %L\ QuickFix\ Items'

" vim: fdm=marker
