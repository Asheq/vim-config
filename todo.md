TODO
================================================
- Learn how to create the following on your own without any helper plugins:
    - text objects
    - operators
    - motions

- Get ideas from other vimrcs

Begin utilizing these commands
================================================
dv{motion} cv{motion} yv{motion}
zL zH
!{text-object}{filter}

'^
'.
gi
g&
g;
g,

[* ]*

[m ]m [M ]M [[ ]] (for Java-structured languages)

[count]v

:earlier and :later

Performance audit on all options and plugins
================================================
    - open vim
    - i(a'word'a)424242<Esc>
    - Hold <C-a> <C-x>
    - yy33p
    - <Esc>
    - d<Esc>
    - v<Esc>
    - yiw yi' yib
    - viw<Esc> vi'<Esc> vib<Esc>
    - L zt zb zz
    - dd..gg
    - dap
    - uuu <C-r>
    - gg0<C-^>gg0<C-^><C-^>
    - G gg
    - iasdf<Esc>**
    - nnn
    - yy ppp nnn
    - /asdf
    - <CR>
    - Hold <C-f> <C-b>
