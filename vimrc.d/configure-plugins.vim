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

" plugged/vim-flagship
let g:tabinfix = " "
let g:tablabel = "%{vimrc#wrap_if_nonempty(vimrc#get_glyph('directory') . ' ', vimrc#get_tab_cwd_head(v:lnum) . vimrc#get_tab_cwd_tail(v:lnum), '')}"
augroup global_flags
  autocmd!
  autocmd User Flags call Hoist("global", ""
        \ . " %{vimrc#get_global_cwd_head()}"
        \ . "%{vimrc#get_global_cwd_tail()}")
augroup end

" plugged/rainbow
let g:rainbow_active = 1

" plugged/vim-textobj-line
" NOTE: 'il' and 'al' mappings are taken by Targets plugin.
let g:textobj_line_no_default_key_mappings = 1
xmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
xmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" plugged/undotree
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_HelpLine = 0

" plugged/vim-mucomplete
let g:mucomplete#enable_auto_at_startup = 1
" NOTE Keep the chain short to avoid the flickering that occurs when auto
" switching between completion methods
" TODO Clean this up
let g:mucomplete#chains = {'vim': ['path', 'cmd', 'keyn'], 'default': ['path', 'c-n']}

" plugged/vim-asterisk
let g:asterisk#keeppos = 1

" plugin/format-code.vim
let g:formatters = {
      \ 'javascript': 'npx prettier --parser babel --loglevel error',
      \ 'json'      : 'npx prettier --parser json --loglevel error',
      \ 'scss'      : 'npx prettier --parser scss --loglevel error',
      \ 'html'      : 'npx prettier --parser html --loglevel error',
      \ 'css'       : 'npx prettier --parser css --loglevel error',
      \ 'sh'        : 'format-shell-cmd.py' }
