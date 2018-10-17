augroup set_stdin_buftype
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end

augroup make_session
  autocmd!
  autocmd VimLeave * call vimrc#make_last_session()
augroup end

augroup save_buffer
  " TODO-WAIT: Add a way to disable so macros do not create so many entries in undo list
  autocmd!
  autocmd InsertLeave,TextChanged * nested call vimrc#save_buffer()
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end

if has('nvim')
  augroup terminal_mods
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup end
endif


augroup myflags
    autocmd!
    autocmd User Flags call Hoist("buffer", "%h")
    autocmd User Flags call Hoist("buffer", "%w")
    autocmd User Flags call Hoist("buffer", "%m")
    autocmd User Flags call Hoist("buffer", "%r")
    autocmd User Flags call Hoist("buffer", "%y")
    autocmd User Flags call Hoist("buffer", "vimrc#get_git_branch_flag")

    autocmd User Flags call Hoist("window", "%{&scrollbind?'[' . g:symbols_scrollbind . ']':''}")
    autocmd User Flags call Hoist("window", "%{&wrap?'[' . g:symbols_wrap . ']':''}")
    autocmd User Flags call Hoist("window", "%{&spell?'[' . g:symbols_spell . ']':''}")
    autocmd User Flags call Hoist("window", "%{&list?'[' . g:symbols_list . ']':''}")
    autocmd User Flags call Hoist("window", "[" . g:symbols_window_percentage . "%P]")
    autocmd User Flags call Hoist("window", "vimrc#get_window_cwd_flag")

    autocmd User Flags call Hoist("global", "vimrc#get_global_cwd_flag")
augroup END
