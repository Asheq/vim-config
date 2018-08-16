" flgaship
let g:tabprefix = ""
let g:tablabel = "Tab%N %{vimrc#get_tab_cwd_flag(v:lnum)}%{vimrc#get_maximized_flag(v:lnum)}"
let g:flagship_skip = 'FugitiveStatusline'

" maximizer
let g:maximizer_set_default_mapping = 1
let g:maximizer_default_mapping_key = '<C-w>m'

" dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'
" TODO:
"   - Renamed. Doesn't work?
"   - Unmerged. What is it?
"   - Deleted. How is it even supposed to show up?
"   - Ignored. Doesn't work?
let g:dirvish_git_indicators = {
      \ 'Modified'  : 'm',
      \ 'Untracked' : 'u',
      \ 'Ignored'   : 'i',
      \ 'Staged'    : 's',
      \ 'Renamed'   : 'r',
      \ 'Unmerged'  : '=',
      \ 'Unknown'   : '?'
      \ }
let g:dirvish_git_show_ignored = 1

" fieldtrip
let g:fieldtrip_start_map = '<C-s>'

" lion
let g:lion_squeeze_spaces = 1

" qf
let g:qf_auto_quit = 0
let g:qf_mapping_ack_style = 1
let g:qf_save_win_view = 0
let g:qf_statusline = {}
let g:qf_statusline.before = "%{vimrc#get_statusline_padding_left()}%L\\ "
let g:qf_statusline.after = ''

" rainbow
let g:rainbow_active = 1

" sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" textobj-line
" NOTE: 'il' and 'al' mappings are taken by Targets plugin.
let g:textobj_line_no_default_key_mappings = 1
xmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
xmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" undotree
let g:undotree_DiffAutoOpen = 0

" vim: fdm=marker
