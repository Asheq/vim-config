" color
set background=dark
colorscheme tender
hi Normal guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#444444 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
highlight Search guifg=#282828 ctermfg=black guibg=#ffff00 ctermbg=yellow gui=NONE cterm=NONE

" anzu
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)

" auto-save
let g:auto_save = 1
let g:auto_save_silent = 1

" indent-guides
let g:indent_guides_default_mapping = 0

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" vim-dirvish
let g:dirvish_relative_paths = 1

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

" vim-textobj-line
" The 'il' and 'al' text objects are already taken by Targets plugin
let g:textobj_line_no_default_key_mappings = 1
vmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
vmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" vim-qf
let g:qf_auto_quit = 0
let g:qf_mapping_ack_style = 1
let g:qf_save_win_view = 0
let g:qf_statusline = {}
let g:qf_statusline.before = '%#IncSearch#\ '
let g:qf_statusline.after ='\ %0*\ %L\ QuickFix\ Items'

" " vim-highlightedyank
" let g:highlightedyank_highlight_duration = 200

" " vim-wordmotion
" let g:wordmotion_mappings = {
"     \ 'w'  : 'gw',
"     \ 'b'  : 'gb',
"     \ 'e'  : 'ge',
"     \ 'aw' : 'agw',
"     \ 'iw' : 'igw'
"     \ }

" vim: fdm=marker
