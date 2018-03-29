- Search project for TODO
- Make <A-b>, <A-f>, <C-w>, <A-d> consistent between insert-mode and command-mode and bash? They are wildly inconsistent
- Learn how to create the following on your own without any helper plugins:
    - text objects
    - operators
    - motions

Add/groom mappings for all variations of file manipulation
================================================
    Create a new file (editing it immediately)
        From CWD
            ---> :edit 
        From current buffer's directory
            ---> :edit <C-r>=expand('%:h')<CR>/
    Copy a file (edit the copy immediately)
        To CWD
            ---> :saveas 
        To current buffer's directory
            ---> :saveas <C-r>=expand('%:h')<CR>/
    Move/Rename a file (continue editing it)
        To CWD
            ---> :Move 
        To current buffer's directory
            ---> :Rename 
    Delete a file
        --> :Delete

Mappings Checklist
================================================
    - Should there be an operator and/or text object?
    - Does it have a visual mode equivalent?
    - Does it have an insert mode equivalent?
    - Does it have a command-line mode equivalent?
    - Is it using a noremap? If not, is it justified?

Begin utilizing these commands
================================================
dv{motion}
cv
yv
zL             scroll screen half a screenwidth to left
zH             scroll screen half a screenwidth to right
!{text-object}{filter}      filter [count] lines through the external program {filter}
'^
gi
g&
g;
g,
'.
[* ]*
yo (from plugin)
[m ]m [M ]M [[ ]] (for Java-structured languages)
[count]v

Over-Arching Goals to Keep in Mind
================================================
- Use plugins sparingly, and only those that build upon existing vim philosophy.
- For manipulating text, create operators, text objects, and motions (instead of arbitrary leader mappings)
- Limit window chrome. Use commands that temporarily show the info only when you really want it.
- Autosave to file after any buffer modification. To the user, there should be no difference between a buffer and a file. They should be one-to-one. A buffer should always reflect the underlying file. Saving should not be necessary. Avoid the concept of buffers. Don't look at buffer lists or navigate between them the traditional way. DO NOT USE:
    :bn
    :bp
    :buffers
    :ls
    :Buffers
    :b *
  Use file system navigation and fuzzy file search.
- Automatically persist state between sessions(?)
- Help reduce congitive load

Performance audit on all options and plugins
================================================
    ? open vim
    - i(a'word'a)424242<Esc>
    - Hold <C-a> <C-x>
    - yy22p
    - <Esc> d<Esc>
    - v<Esc>
    - yiw yi' yib
    - viw vi' vib
    - zb zt zz
    - dd..gg
    - dap
    ? uuu <C-r>
    ? gg0<C-^>gg0<C-^><C-^>
    ? G gg
    ? iasdf<Esc>***
    - nnn
    - yy ppp nnn
    - /asdf
    - <CR>
    ? Hold <C-f> <C-b>

? = causes minor flickering even in raw vim with syntax on
