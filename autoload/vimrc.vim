" Define glyphs {{{
let s:glyphs = {}
let s:glyphs.scrollbind = 'V'
let s:glyphs.diff = 'D'
let s:glyphs.wrap = 'W'
let s:glyphs.spell = 'S'
let s:glyphs.list = 'L'
let s:glyphs.showbreak = '↪  '
let s:glyphs.listchars = 'tab:▷ ,trail:·,extends:▶,precedes:◀,nbsp:○'
if $USE_FANCY_GLYPHS == 'yes'
  let s:glyphs.branch = ' '
  let s:glyphs.directory = ' '
  let s:glyphs.file = ' '
  let s:glyphs.fold = ' '
  let s:glyphs.info = ' '
else
  let s:glyphs.branch = 'β'
  let s:glyphs.directory = 'Δ'
  let s:glyphs.file = 'Φ'
  let s:glyphs.fold = '==='
  let s:glyphs.info = 'ⓘ'
endif

function! vimrc#get_glyph(glyph) abort
  return s:glyphs[a:glyph]
endfunction
" }}}

" Go to last nonempty line {{{
function! vimrc#go_to_last_nonempty_line() abort
  normal G$
  if nvim_get_current_line() == ''
    call search('\v[^\n]', 'b')
  endif
endfunction
" }}}

" Get total number of lines in buffer {{{
function! vimrc#get_total_lines_in_buffer()
  let total_lines_in_buffer = line('$')
  if line('w$') != total_lines_in_buffer
    return vimrc#get_statusline_padding_left() . total_lines_in_buffer . ' '
  else
    return vimrc#get_statusline_padding_left() . repeat(' ', len(total_lines_in_buffer)) . ' '
  endif
endfunction
" }}}

" Choose case for plugged/vim-caser {{{
function! vimrc#choose_case(visual)
  let l:options = ["&MixedCase", "&camelCase", "snake&_case", "&UPPER_CASE", "&Title Case", "&Sentence case", "space& case", "&kebab-case", "&dot.case"]
  let l:choice = confirm("Change case?", join(l:options, "\n"))
  let l:operation = ["MixedCase", "CamelCase", "SnakeCase", "UpperCase", "TitleCase", "SentenceCase", "SpaceCase", "KebabCase", "DotCase"][l:choice - 1]
  if a:visual
    return "\<Plug>CaserV".l:operation
  else
    return "\<Plug>Caser".l:operation
  end
endfunction
" }}}

" Open scratch buffer {{{
function! vimrc#open_scratch_buffer() abort
  " TODO-WAIT: Otherise, if the scratch buffer is already visible in a window in the current tab,
  " move to it. Otherwise, open it in a new window at the top
  if (bufname('%') == '[Scratch]')
    bd
    return
  endif

  topleft split [Scratch]
  setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted
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
function! vimrc#echo_with_color(message, highlight_group, ...) abort
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlight_group
  execute echo_command . " '" . a:message . "'"
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
function! vimrc#wrap_if_nonempty(prefix, item, suffix)
  if !empty(a:item)
    return a:prefix . a:item . a:suffix
  endif
  return a:item
endfunction
" }}}

" Get git branch flag {{{
function! vimrc#get_git_branch_flag()
  return vimrc#wrap_if_nonempty('  ' . s:glyphs.branch . ' ', FugitiveHead(), ' ')
endfunction
" }}}

function! vimrc#get_window_flags()
  let flags = (&scrollbind?vimrc#get_glyph('scrollbind'):'') . (&wrap?vimrc#get_glyph('wrap'):'') . (&spell?vimrc#get_glyph('spell'):'') . (&list?vimrc#get_glyph('list'):'') . (&diff?vimrc#get_glyph('diff'):'')
  return vimrc#wrap_if_nonempty('  ' . vimrc#get_glyph('info') . ' ', flags , ' ')
endfunction

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

" Print values {{{
function! vimrc#print_values(categories) abort
  let all_items = []
  for category in a:categories
    let all_items = all_items + category.items
  endfor
  let max_item_label_length = max(map(all_items, 'len(v:val.label)'))

  for category in a:categories
    call vimrc#echo_with_color(category.title, 'Directory')
    for item in category.items
      let label_padding_left = max_item_label_length - len(item.label)
      call vimrc#echo_with_color(repeat(' ', label_padding_left) . item.label . ': ', 'Title')
      if exists('item.value')
        call vimrc#echo_with_color(item.value, 'Normal', 1)
      endif
      if exists('item.secondary')
        call vimrc#echo_with_color(item.secondary, 'NonText', 1)
      endif
    endfor
  endfor
endfunction
" }}}

" Print other options {{{
function! vimrc#get_option_last_set_by(option)
  let temp = @v
  redir @v
  execute 'silent verbose set ' . a:option
  redir END
  let full_value = @v
  let @v = temp
  let idx = match(full_value, 'Last set from .*')
  if (idx != -1)
    let file = substitute(full_value[idx:], 'Last set from ', '', '')
    return ' => ' . substitute(file, $VIMRUNTIME, '$VIMRUNTIME', 'g')
  else
    return ''
  endif
endfunction

" Print buffer info {{{
function! vimrc#print_buffer_info() abort
  call vimrc#print_values([
        \ {
        \   'title': 'Basic',
        \   'items': [
        \     {'label': 'Working directory', 'value': vimrc#get_effective_cwd_head() . vimrc#get_effective_cwd_tail()},
        \     {'label': 'File name', 'value': vimrc#get_buffer_head() . vimrc#get_buffer_tail()},
        \     {'label': 'Git branch', 'value': FugitiveHead()},
        \     {'label': 'filetype', 'value': &filetype, 'secondary': vimrc#get_option_last_set_by('filetype')},
        \   ]
        \ },
        \ {
        \   'title': 'Spacing',
        \   'items': [
        \     {'label': 'expandtab', 'value': &expandtab, 'secondary': vimrc#get_option_last_set_by('expandtab')},
        \     {'label': 'tabstop', 'value': &tabstop, 'secondary': vimrc#get_option_last_set_by('tabstop')},
        \     {'label': 'shiftwidth', 'value': &shiftwidth, 'secondary': vimrc#get_option_last_set_by('shiftwidth')},
        \     {'label': 'textwidth', 'value': &textwidth, 'secondary': vimrc#get_option_last_set_by('textwidth')},
        \   ]
        \ },
        \ {
        \   'title': 'Encoding and format',
        \   'items': [
        \     {'label': 'fileencoding (character)', 'value': &fileencoding, 'secondary': vimrc#get_option_last_set_by('fileencoding')},
        \     {'label': 'fileformat (end of line)', 'value': &fileformat, 'secondary': vimrc#get_option_last_set_by('fileformat')},
        \   ]
        \ }
        \ ])
endfunction
" }}}

" Print other options {{{
function! vimrc#print_other_options() abort
  call vimrc#print_values([
        \ {
        \   'title': 'Indenting methods used for = operator',
        \   'items': [
        \     {'label': 'equalprg', 'value': &equalprg, 'secondary': vimrc#get_option_last_set_by('equalprg')},
        \     {'label': 'indentexpr', 'value': &indentexpr, 'secondary': vimrc#get_option_last_set_by('indentexpr')},
        \     {'label': 'cindent', 'value': &cindent, 'secondary': vimrc#get_option_last_set_by('cindent')},
        \   ]
        \ },
        \ {
        \   'title': 'Extra options for indentexpr',
        \   'items': [
        \     {'label': 'indentkeys', 'value': &indentkeys, 'secondary': vimrc#get_option_last_set_by('indentkeys')},
        \   ]
        \ },
        \ {
        \   'title': 'Extra options for cindent',
        \   'items': [
        \     {'label': 'cinkeys', 'value': &cinkeys, 'secondary': vimrc#get_option_last_set_by('cinkeys')},
        \     {'label': 'cinoptions', 'value': &cinoptions, 'secondary': vimrc#get_option_last_set_by('cinoptions')},
        \     {'label': 'cinwords', 'value': &cinwords, 'secondary': vimrc#get_option_last_set_by('cinwords')},
        \   ]
        \ },
        \ {
        \   'title': 'Indenting methods not used for = operator',
        \   'items': [
        \     {'label': 'smartindent', 'value': &smartindent, 'secondary': vimrc#get_option_last_set_by('smartindent')},
        \     {'label': 'autoindent', 'value': &autoindent, 'secondary': vimrc#get_option_last_set_by('autoindent')},
        \   ]
        \ },
        \ {
        \   'title': 'Formatting methods used for gq/gw operator',
        \   'items': [
        \     {'label': 'formatexpr', 'value': &formatexpr, 'secondary': vimrc#get_option_last_set_by('formatexpr')},
        \     {'label': 'formatprg', 'value': &formatprg, 'secondary': vimrc#get_option_last_set_by('formatprg')},
        \     {'label': 'internal formatting', 'value': '[N/A]'},
        \   ]
        \ },
        \ {
        \   'title': 'Extra options for internal formatting',
        \   'items': [
        \     {'label': 'formatoptions', 'value': &formatoptions, 'secondary': vimrc#get_option_last_set_by('formatoptions')},
        \     {'label': 'formatlistpat', 'value': &formatlistpat, 'secondary': vimrc#get_option_last_set_by('formatlistpat')},
        \     {'label': 'comments', 'value': &comments, 'secondary': vimrc#get_option_last_set_by('comments')},
        \     {'label': 'commentstring', 'value': &commentstring, 'secondary': vimrc#get_option_last_set_by('commentstring')},
        \   ]
        \ }
        \ ])
endfunction
" }}}

" vim: fdm=marker
