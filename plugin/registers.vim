command! Registers call s:Registers()

function! s:Registers() abort
  " Basic
  registers " + 0

  " File name registers
  registers % #

  " Command-line registers
  registers / : .

  " Small delete registers and 9 numbered large delete registers 1 to 9
  execute 'registers - ' . join(range(1, 9))

  " 26 named registers a to z and A to Z
  execute 'registers ' . join(map(range(97, 97 + 25), 'nr2char(v:val)'))
endfunction
