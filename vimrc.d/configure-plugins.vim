" Internal {{{
  " plugin/format-code.vim
  let g:formatters = {
        \ 'javascript': 'js-beautify --editorconfig --type js',
        \ 'json'      : 'js-beautify --editorconfig --type js',
        \ 'scss'      : 'sass-convert -F scss -T scss',
        \ 'html'      : 'html-beautify --editorconfig',
        \ 'css'       : 'js-beautify --editorconfig --type css' }

  " plugin/window-maximizer.vim
  let g:maximizer_set_default_mapping = 1
  let g:maximizer_default_mapping_key = '<C-w>m'
" }}}

" External {{{
  " plugged/vim-caser
  let g:caser_prefix = '<leader>c'

  " plugged/fzf.vim
  let g:fzf_layout = { 'window': 'enew' }

  " plugged/vim-flagship
  let g:tabprefix = ""
  let g:tablabel = ""
        \ . "%{vimrc#get_tab_name(v:lnum)}"
        \ . "%{vimrc#get_tab_cwd(v:lnum) != '' ?'[' . g:glyphs.directory . ' ' : ''}"
        \ . "%{vimrc#get_tab_cwd_head(v:lnum)}"
        \ . "%{vimrc#get_tab_cwd_tail(v:lnum)}"
        \ . "%{vimrc#get_tab_cwd(v:lnum) != '' ? ']' : ''}"
        \ . "%{vimrc#get_maximized_flag(v:lnum)}"
  let g:flagship_skip = 'FugitiveStatusline'
  augroup global_flags
    autocmd!
    autocmd User Flags call Hoist("global", ""
          \ . " " . g:glyphs.directory . " "
          \ . "%2*%{vimrc#get_global_cwd_head()}%0*"
          \ . "%{vimrc#get_global_cwd_tail()}")
  augroup end

  " plugged/vim-dirvish
  let g:dirvish_mode = ':sort ,^.*[\/],'

  " plugged/vim-qf
  let g:qf_auto_quit = 0
  let g:qf_mapping_ack_style = 1
  let g:qf_save_win_view = 0
  let g:qf_statusline = {}
  let g:qf_statusline.before = "%{vimrc#get_statusline_padding_left()}%L\\ "
  let g:qf_statusline.after = ''

  " plugged/vim-qf
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
" }}}

" vim: fdm=marker
