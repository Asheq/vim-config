" plugin/format-code.vim
let g:formatters = {
      \ 'javascript': 'prettier --parser babel --loglevel error',
      \ 'json'      : 'prettier --parser json --loglevel error',
      \ 'scss'      : 'prettier --parser scss --loglevel error',
      \ 'html'      : 'prettier --parser html --loglevel error',
      \ 'css'       : 'prettier --parser css --loglevel error' }

" plugin/window-maximizer.vim
let g:maximizer_set_default_mapping = 1
let g:maximizer_default_mapping_key = '<C-w>m'

" plugged/markdown-preview.nvim
let g:mkdp_auto_close = 0

" plugged/vim-caser
let g:caser_prefix = '<leader>c'

" plugged/fzf.vim
let g:fzf_layout = { 'window': 'enew' }

" plugged/vim-flagship
let g:tabprefix = ""
let g:tablabel = ""
      \ . "%{vimrc#get_tab_name(v:lnum)}"
      \ . "%{vimrc#get_tab_cwd(v:lnum) != '' ?'[' . vimrc#glyphs.directory . ' ' : ''}"
      \ . "%{vimrc#get_tab_cwd_head(v:lnum)}"
      \ . "%{vimrc#get_tab_cwd_tail(v:lnum)}"
      \ . "%{vimrc#get_tab_cwd(v:lnum) != '' ? ']' : ''}"
      \ . "%{vimrc#get_maximized_flag(v:lnum)}"
let g:flagship_skip = 'FugitiveStatusline'
augroup global_flags
  autocmd!
  autocmd User Flags call Hoist("global", "🐉 "
        \ . "%{vimrc#get_global_cwd_head()}"
        \ . "%2*%{vimrc#get_global_cwd_tail()}%0*"
        \ . " %{vimrc#get_git_branch_flag()}"
        \ . "%{vimrc#get_mucomplete_message_flag()}")
augroup end

" plugged/vim-dirvish
let g:dirvish_mode = ':sort ,^.*[\/], | :g/\.DS_Store/d'

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

"plugged/vim-surround
let g:submode_always_show_submode = 1

" plugged/vim-mucomplete
let g:mucomplete#enable_auto_at_startup = 1
function s:call_mucomplete_functions()
  if exists(':MUcompleteNotify')
    MUcompleteNotify 3
  endif
endfunction
augroup call_mucomplete_functions
  autocmd!
  autocmd VimEnter * call s:call_mucomplete_functions()
augroup end

" NOTE: Keep the chain short to avoid the flickering that occurs when auto switching between
" completion methods
let g:mucomplete#chains = {'vim': ['path', 'cmd', 'keyn'], 'default': ['path', 'c-n']}

" Values that can be added to the chain:
" ======================================================================
"c-n" : keywords in 'complete' (search forwards)       ; i_CTRL-N
"c-p" : keywords in 'complete' (search backwards)      ; i_CTRL-P
"cmd" : Vim command line                               ; i_CTRL-X_CTRL-V
"defs": definitions or macros                          ; i_CTRL-X_CTRL-D
"dict": keywords in 'dictionary'                       ; i_CTRL-X_CTRL-K
"file": file names                                     ; i_CTRL-X_CTRL-F
"incl": keywords in the current and included files     ; i_CTRL-X_CTRL-I
"keyn": keywords in the current file (search forwards) ; i_CTRL-X_CTRL-N
"keyp": keywords in the current file (search backwards); i_CTRL-X_CTRL-P
"line": whole lines                                    ; i_CTRL-X_CTRL-L
"omni": omni completion ('omnifunc')                   ; i_CTRL-X_CTRL-O
"spel": spelling suggestions                           ; i_CTRL-X_s
"tags": tags                                           ; i_CTRL-X_CTRL-]
"thes": keywords in 'thesaurus'                        ; i_CTRL-X_CTRL-T
"user": user defined completion ('completefunc')       ; i_CTRL-X_CTRL-U
"path": file names (MUcomplete's implementation)
"uspl": spelling suggestions (MUcomplete's implementation)
"list": complete words from b:mucomplete_wordlist or g:mucomplete#wordlist.
