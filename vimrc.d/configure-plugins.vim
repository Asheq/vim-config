" plugged/vim-auto-save
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["CursorHold"]

" plugged/vim-hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_virtualText = '██'
let g:Hexokinase_ftEnabled = ['css', 'html', 'scss']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

" plugged/vCoolor.vim
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<A-c>'
let g:vcoolor_lowercase = 1

" plugged/vim-caser
let g:caser_no_mappings = 1

" plugged/markdown-preview.nvim
let g:mkdp_auto_close = 0

" plugged/vim-markdown
let g:vim_markdown_no_default_key_mappings = 1

" plugged/vim-flagship
let g:flagship_skip = 'FugitiveStatusline'
let g:tabprefix = ""
let g:tabinfix = " "
let g:tablabel = ""
      \ . "%{vimrc#get_tab_name(v:lnum)}"
      \ . "%{vimrc#wrap_if_nonempty('  ' . vimrc#get_glyph('directory') . ' ', vimrc#get_tab_cwd_head(v:lnum) . vimrc#get_tab_cwd_tail(v:lnum), '')}"
let g:tabsuffix = "%{vimrc#get_git_branch_flag()}%{vimrc#get_window_flags()}"
augroup global_flags
  autocmd!
  autocmd User Flags call Hoist("global", ""
        \ . " %{vimrc#get_global_cwd_head()}"
        \ . "%{vimrc#get_global_cwd_tail()}")
augroup end

" plugged/vim-dirvish
let g:dirvish_mode = ':sort ,^.*[\/], | :silent g/\.DS_Store/d'

" plugged/vim-qf
let g:qf_auto_quit = 0
let g:qf_save_win_view = 0
let g:qf_statusline = {}
let g:qf_statusline.before = "%{vimrc#get_statusline_padding_left()}%L\\ "
let g:qf_statusline.after = ''
let g:qf_shorten_path = 0

" plugged/vim-fieldtrip
let g:fieldtrip_start_map = '<C-s>'

" plugged/vim-lion
let g:lion_squeeze_spaces = 1

" plugged/rainbow
let g:rainbow_active = 1

" plugged/vim-sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" plugged/vim-textobj-line
" NOTE: 'il' and 'al' mappings are taken by Targets plugin.
let g:textobj_line_no_default_key_mappings = 1
xmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
xmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" plugged/undotree
let g:undotree_DiffAutoOpen = 0
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_HelpLine = 0

" plugged/vim-submode
let g:submode_always_show_submode = 1

" plugged/vim-mucomplete
let g:mucomplete#enable_auto_at_startup = 1
" NOTE: Keep the chain short to avoid the flickering that occurs when auto
" switching between completion methods
let g:mucomplete#chains = {'vim': ['path', 'cmd', 'keyn'], 'default': ['path', 'c-n']}

" plugged/vim-asterisk
let g:asterisk#keeppos = 1

" plugged/defx.nvim
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

" plugin/format-code.vim
let g:formatters_set = 0
call vimrc#swap_formatters()
