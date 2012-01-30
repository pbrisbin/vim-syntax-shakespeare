" Vim syntax file
" Language: haskell with embedded hamlet
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

" store and remove current syntax value
let old_syntax = b:current_syntax
unlet b:current_syntax

syn include @hamlet syntax/hamlet.vim
unlet b:current_syntax

syn include @cassius syntax/cassius.vim
unlet b:current_syntax

syn include @lucious syntax/lucius.vim
unlet b:current_syntax

syn include @julius syntax/julius.vim
unlet b:current_syntax

syn region hmBlock matchgroup=quasiQuote start=/\[\$\?[iw]\?hamlet|/   end=/|\]/ contains=@hamlet
syn region hmBlock matchgroup=quasiQuote start=/\[\$\?xs\?hamlet|/     end=/|\]/ contains=@hamlet
syn region hmBlock matchgroup=quasiQuote start=/\[\$\?x\?shamlet|/     end=/|\]/ contains=@hamlet
syn region csBlock matchgroup=quasiQuote start=/\[\$\?cassius|/        end=/|\]/ contains=@cassius
syn region lcBlock matchgroup=quasiQuote start=/\[\$\?lucius|/         end=/|\]/ contains=@lucius
syn region jsBlock matchgroup=quasiQuote start=/\[\$\?julius|/         end=/|\]/ contains=@julius

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

" note: csBlock/lcBlock purposely left out
HiLink quasiQuote Boolean
HiLink hmBlock    StorageClass
HiLink jsBlock    StorageClass

delcommand HiLink

" restore current syntax value
let b:current_syntax = old_syntax
