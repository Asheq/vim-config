function! vimrc#get_statusline()
    return ""
                \ . "%<%{vimrc#get_buffer_head()}"
                \ . "%1*%t%* "
                \ . "%h%w%m%r%y"
                \ . "%{FugitiveStatusline()}"
                \ . "%="
                \ . "%([%{vimrc#get_window_cwd()}]%)"
                \ . "[%P]"
endfunction

function! vimrc#get_fold_text()
    return repeat(' ', indent(v:foldstart)) . foldtext()
endfunction

function! vimrc#get_buffer_head()
    let head = expand('%:p:~:.:h') " :help filename-modifiers
    if head == '.' || head == ''
        let head = ''
    elseif head == '/'
        let head = '/'
    else
        let head = head . '/'
    endif
    return head
endfunction

function! vimrc#define_word(search_term)
    execute 'silent !open ' . shellescape('dict://' . a:search_term)
endfunction

command! -nargs=1 Define call vimrc#define_word(<f-args>)

function! vimrc#get_text_from_selection()
    let temp = getreg("v")
    normal! gv"vy
    let raw_text = getreg("v")
    call setreg("v", temp)
    return raw_text
endfunction

function! vimrc#create_toggle_maps(letter, test, off, on)
    execute 'nnoremap [r' . a:letter . ' :' . a:on . '<CR>'
    execute 'nnoremap ]r' . a:letter . ' :' . a:off . '<CR>'
    execute 'nnoremap yr' . a:letter . ' :' . '<C-r>=' . a:test . '?"' . a:off . '":"' . a:on . '"<CR><CR>'
endfunction

function! vimrc#get_global_cwd()
    return getcwd(-1, -1)
endfunction

function! vimrc#get_tab_cwd(tabnr)
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

function! vimrc#mru_dirvish()
    enew
    0put=execute('oldfiles')
    keeppatterns %s/\v.{-} (.*)/\=fnamemodify(submatch(1),':p')/
    set ft=dirvish
    keepjumps 0

    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
endfunction
