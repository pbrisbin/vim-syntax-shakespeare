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

syn include @julius syntax/julius.vim
unlet b:current_syntax

syn region hmBlock matchgroup=quasiQuote start=/\[\$\?[iwx]\?hamlet|/ end=/|\]/ contains=@hamlet
syn region csBlock matchgroup=quasiQuote start=/\[\$\?cassius|/       end=/|\]/ contains=@cassius
syn region jsBlock matchgroup=quasiQuote start=/\[\$\?julius|/        end=/|\]/ contains=@julius

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

" note: csBlock purposely left out
HiLink quasiQuote Boolean
HiLink hmBlock    StorageClass
HiLink jsBlock    StorageClass

delcommand HiLink

" restore current syntax value
let b:current_syntax = old_syntax
