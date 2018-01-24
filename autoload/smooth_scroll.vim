" ==============================================================================
" File: smooth_scroll.vim
" Original Author: Terry Ma
" Description: Scroll the screen smoothly to retain better context. Useful for
" replacing Vim's default scrolling behavior with CTRL-D, CTRL-U, CTRL-B, and
" CTRL-F
" ==============================================================================

let s:save_cpo = &cpo
set cpo&vim

" ==============================================================================
" Global Functions
" ==============================================================================

" Scroll the screen up
function! smooth_scroll#up(dist, duration, speed)
    call s:smooth_scroll('u', a:dist, a:duration, a:speed)
endfunction

" Scroll the screen down
function! smooth_scroll#down(dist, duration, speed)
    call s:smooth_scroll('d', a:dist, a:duration, a:speed)
endfunction

" ==============================================================================
" Functions
" ==============================================================================

" Scroll the scroll smoothly
" dir: Direction of the scroll. 'd' is downwards, 'u' is upwards
" dist: Distance, or the total number of lines to scroll
" duration: How long should each scrolling animation last. Each scrolling
" animation will take at least this long. It could take longer if the scrolling
" itself by Vim takes longer
" speed: Scrolling speed, or the number of lines to scroll during each scrolling
" animation
function! s:smooth_scroll(dir, dist, duration, speed)
    " Turn off cursorline and cursor
    set nocursorline
    let t_ve_bk=&t_ve
    set t_ve=

    let last_line_in_buffer = line('$')
    for i in range(a:dist/a:speed)
        let start = reltime()
        if a:dir ==# 'd'
            if line('w$') >= last_line_in_buffer
                break
            endif
            exec "normal! ".a:speed."\<C-e>"
        else
            if line('w0') == 1
                break
            endif
            exec "normal! ".a:speed."\<C-y>"
        endif
        redraw
        let elapsed = s:get_ms_since(start)
        let snooze = float2nr(a:duration-elapsed)
        if snooze > 0
            exec "sleep ".snooze."m"
        endif
    endfor

    " Turn on cursorline and cursor
    set cursorline
    execute 'set t_ve=' . t_ve_bk
endfunction

function! s:get_ms_since(time)
    let cost = split(reltimestr(reltime(a:time)), '\.')
    return str2nr(cost[0])*1000 + str2nr(cost[1])/1000.0
endfunction
