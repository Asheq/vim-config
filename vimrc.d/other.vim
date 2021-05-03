colorscheme asheq-codedark

lua require'colorizer'.setup()

if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif
