" Vim ftdetect file
" Author:  Patrick Brisbin <me@pbrisbin.com>
" License: MIT

if has("autocmd")
  au BufRead,BufNewFile *.hamlet  setf hamlet
  au BufRead,BufNewFile *.julius  setf julius
  au BufRead,BufNewFile *.lucius set filetype=css syntax=lucius | runtime! ftplugin/lucius.vim ftplugin/lucius*.vim ftplugin/lucius/*.vim
  au BufRead,BufNewFile *.cassius set filetype=css syntax=cassius | runtime! ftplugin/cassius.vim ftplugin/cassius*.vim ftplugin/cassius/*.vim
endif
