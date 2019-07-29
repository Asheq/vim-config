" TODO-WAIT: Create gists.
" TODO-WAIT: Move some things to plugin dir
" TODO-WAIT: aborts?

" Define glyphs {{{
let s:glyphs = {}
let s:glyphs.max = 'M'
let s:glyphs.scrollbind = 'B'
let s:glyphs.wrap = 'W'
let s:glyphs.spell = 'S'
let s:glyphs.list = 'L'
let s:glyphs.showbreak = '  '
let s:glyphs.listchars = 'tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○'
let s:glyphs.completion = 'μ'
if $USE_FANCY_GLYPHS == 'yes'
  let s:glyphs.branch = ' '
  let s:glyphs.directory = ' '
  let s:glyphs.fold = ' '
else
  let s:glyphs.branch = 'β'
  let s:glyphs.directory = 'Δ'
  let s:glyphs.fold = '==='
endif
let vimrc#glyphs = s:glyphs
" }}}

" Get session directory {{{
function! vimrc#get_session_dir() abort
  let dir = s:expand_and_resolve_path('~/.vim/cache/session')
  call s:create_dir(dir)
  return dir
endfunction

function! s:expand_and_resolve_path(path) abort
  return resolve(expand(a:path))
endfunction

function! s:create_dir(path) abort
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction
" }}}

" Restore and make last session {{{
function! vimrc#restore_last_session() abort
  execute 'silent source ' . vimrc#get_session_dir() . '/last'
  echo 'Last session restored'
endfunction

function! vimrc#make_last_session() abort
  execute ':silent mksession! ' . vimrc#get_session_dir() . '/last'
endfunction
" }}}

" Smart window move {{{
function! vimrc#smart_window_move(key) abort
  let curwin = winnr()
  execute 'wincmd ' . a:key
  if (curwin == winnr())
    if (a:key == 'j' || a:key == 'k')
      wincmd s
    else
      wincmd v
    endif
    exec 'wincmd ' . a:key
  endif
endfunction
" }}}

" Save buffer {{{
function! vimrc#save_buffer() abort
  if empty(&buftype) && !empty(bufname(''))
    let l:savemarks = {
          \ "'[": getpos("'["),
          \ "']": getpos("']")
          \ }

    silent! update

    for [l:key, l:value] in items(l:savemarks)
      call setpos(l:key, l:value)
    endfor
  endif
endfunction
" }}}

" Get visual selection raw text {{{
function! vimrc#get_visual_selection_raw_text()
  let temp = @@
  silent normal! gvy
  let raw_text = @@
  let @@ = temp
  return raw_text
endfunction
" }}}

" Define {{{
function! vimrc#define_mac_dict(search_term) abort
  execute 'silent !open dict://' . a:search_term
endfunction

function! vimrc#define_merriam_webster_web(search_term) abort
  if !exists(':OpenBrowser')
    throw 'Need open-browser plugin to be installed'
  endif
  execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . a:search_term
  execute 'OpenBrowser https://www.websters1913.com/words/' . a:search_term
endfunction
" }}}

" Echo with color {{{
function! vimrc#echo_with_color(msg, highlightGroup, ...) abort
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlightGroup
  execute echo_command . " '" . a:msg . "'"
  echohl Normal
endfunction
" }}}

" Create toggle map {{{
function! vimrc#create_toggle_map(letter, test, off, on)
  execute 'nnoremap [o' . a:letter . ' :' . a:on . '<CR>'
  execute 'nnoremap ]o' . a:letter . ' :' . a:off . '<CR>'
  execute 'nnoremap yo' . a:letter . ' :' . '<C-r>=' . a:test . '?"' . a:off . '":"' . a:on . '"<CR><CR>'
endfunction

function! vimrc#remove_toggle_map(letter)
  if mapcheck('[o' . a:letter, 'n')
    execute 'nunmap [o' . a:letter
  endif
  if mapcheck(']o' . a:letter, 'n')
    execute 'nunmap ]o' . a:letter
  endif
  if mapcheck('yo' . a:letter, 'n')
    execute 'nunmap yo' . a:letter
  endif
endfunction
" }}}

" Execute macro on visual range {{{
function! vimrc#execute_macro_on_visual_range() range abort
  echo '@'.getcmdline()
  execute ":" . a:firstline . "," . a:lastline . "normal! @" . nr2char(getchar())
endfunction
" }}}

" Get listed or loaded buffers {{{
function! vimrc#get_listed_or_loaded_buffers()
  return filter(getbufinfo(), 'v:val.listed || v:val.loaded')
endfunction
" }}}

" Get fold text {{{
function! vimrc#get_fold_text()
  let num_lines = v:foldend - v:foldstart + 1
  let first_line = getline(v:foldstart)
  let indent_level = indent(v:foldstart)
  let first_line_without_indent = substitute(first_line, '^[ \t]*', '', 'g')
  let indent_in_spaces = repeat(' ',indent_level)
  return indent_in_spaces . first_line_without_indent . ' ' . s:glyphs.fold . ' ' . num_lines . ' Lines'
endfunction
" }}}

" Get tab name {{{
function! vimrc#get_tab_name(tabnr)
  let tab_name = gettabvar(a:tabnr, 'name')
  if tab_name != ''
    return tab_name
  else
    return a:tabnr
  endif
endfunction
" }}}

" Get statusline padding left {{{
function! vimrc#get_statusline_padding_left() abort
  if &foldcolumn == 0 || &foldcolumn == 1
    return repeat(' ', &foldcolumn)
  else
    return repeat(' ', &foldcolumn + 1)
  endif
endfunction
" }}}

" Get git branch flag {{{
function! vimrc#get_git_branch_flag()
  let head = FugitiveHead()
  if head != ''
      return '[' . s:glyphs.branch . ' ' . head . ']'
  endif
  return ''
endfunction
" }}}

" Get mucomplete message flag {{{
function! vimrc#get_mucomplete_message_flag()
  let msg = get(g:mucomplete#msg#short_methods, get(g:, 'mucomplete_current_method', ''), '')
  if msg != ''
      return '[' . s:glyphs.completion . ' ' . msg . ']'
  endif
  return ''
endfunction
" }}}

" Get maximixed flag {{{
function! vimrc#get_maximized_flag(tabnr) abort
  if !empty(gettabvar(a:tabnr, 'maximizer_sizes'))
    return '[' . s:glyphs.max . ']'
  endif
  return ''
endfunction
" }}}

" Get buffer tail and head {{{
function! vimrc#buffer_name_shown()
  return (vimrc#get_buffer_head() . vimrc#get_buffer_tail()) != ''
endfunction

function! vimrc#get_buffer_tail()
  return expand('%:t')
endfunction

function! vimrc#get_buffer_head()
  " % = Current file name, as opened
  " ~ = If file is below $HOME, display file name relative to ~ (otherwise leave unmodified)
  " . = If file is below cwd, display file name relative to cwd (otherwise leave unmodified)
  " h = Display file name with last component and separators removed
  let head = expand('%:~:.:h')
  if head == '.' || head == ''
    let head = ''
  elseif head == '/'
    let head = '/'
  else
    let head = head . '/'
  endif
  return head
endfunction
" }}}

" Relative to home {{{
function! vimrc#get_dir_relative_to_home(dirname)
  let dirname = fnamemodify(a:dirname, ':~')
  if dirname == '~/'
    let dirname = '~'
  endif
  return dirname
endfunction
" }}}

" Get cwd {{{
function! vimrc#get_effective_cwd()
  return getcwd()
endfunction

function! vimrc#get_global_cwd()
  return getcwd(-1, -1)
endfunction

function! vimrc#get_tab_cwd(tabnr) abort
  if haslocaldir(-1, a:tabnr)
    return getcwd(-1, a:tabnr)
  endif
  return ''
endfunction

function! vimrc#get_window_cwd()
  if haslocaldir(0)
    return getcwd()
  endif
  return ''
endfunction

function! vimrc#get_directory_tail(dir)
  if (a:dir == '')
    return ''
  elseif (a:dir == '/')
    return '/'
  elseif (a:dir == $HOME)
    return '~'
  else
    return fnamemodify(a:dir, ':t')
  endif
endfunction

function! vimrc#get_directory_head(dir)
  if (a:dir == '' || a:dir == $HOME)
    return ''
  endif

  let head = ''
  if a:dir == '/'
    let head = ''
  else
    let head = fnamemodify(a:dir, ':h')
    let head = vimrc#get_dir_relative_to_home(head)
    if head == '/'
      let head = '/'
    else
      let head = head . '/'
    endif
  endif
  return head
endfunction

" TODO: Consolidate into one parametrized function, e.g. get_cwd('tail', 'global')
function! vimrc#get_global_cwd_tail()
  return vimrc#get_directory_tail(vimrc#get_global_cwd())
endfunction

function! vimrc#get_global_cwd_head()
  return vimrc#get_directory_head(vimrc#get_global_cwd())
endfunction

function! vimrc#get_window_cwd_tail()
  return vimrc#get_directory_tail(vimrc#get_window_cwd())
endfunction

function! vimrc#get_window_cwd_head()
  return vimrc#get_directory_head(vimrc#get_window_cwd())
endfunction

function! vimrc#get_tab_cwd_tail(tabnr)
  return vimrc#get_directory_tail(vimrc#get_tab_cwd(a:tabnr))
endfunction

function! vimrc#get_tab_cwd_head(tabnr)
  return vimrc#get_directory_head(vimrc#get_tab_cwd(a:tabnr))
endfunction

function! vimrc#get_effective_cwd_tail()
  return vimrc#get_directory_tail(vimrc#get_effective_cwd())
endfunction

function! vimrc#get_effective_cwd_head()
  return vimrc#get_directory_head(vimrc#get_effective_cwd())
endfunction
" }}}

" File info {{{
function! vimrc#print_file_info() abort
  call vimrc#echo_with_color('              File: ', 'Title')
  call vimrc#echo_with_color(vimrc#get_buffer_head() . vimrc#get_buffer_tail(), 'Normal', 1)
  call vimrc#echo_with_color("\n", 'Title')
  call vimrc#echo_with_color('          Filetype: ', 'Title')
  call vimrc#echo_with_color(&filetype, 'Normal', 1)
  call vimrc#echo_with_color('        Git Branch: ', 'Title')
  call vimrc#echo_with_color(FugitiveHead(), 'Normal', 1)
  call vimrc#echo_with_color("\n", 'Title')
  call vimrc#echo_with_color(' Working Directory: ', 'Title')
  call vimrc#echo_with_color(vimrc#get_effective_cwd_head(), 'Normal', 1)
  call vimrc#echo_with_color(vimrc#get_effective_cwd_tail(), 'Directory', 0)
  call vimrc#echo_with_color("\n", 'Title')
  call vimrc#echo_with_color('    Tabs or Spaces: ', 'Title')
  call vimrc#echo_with_color(&expandtab ? 'Spaces' : 'Tabs', 'Normal', 1)
  call vimrc#echo_with_color('          Tab Size: ', 'Title')
  call vimrc#echo_with_color(&tabstop . ' Characters', 'Normal', 1)
  call vimrc#echo_with_color("\n", 'Title')
  call vimrc#echo_with_color('Character Encoding: ', 'Title')
  call vimrc#echo_with_color(&fileencoding, 'Normal', 1)
  call vimrc#echo_with_color('       End of Line: ', 'Title')
  call vimrc#echo_with_color(&fileformat, 'Normal', 1)
endfunction
" }}}
" vim: fdm=marker
