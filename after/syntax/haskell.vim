" Vim syntax file
" Language: haskell with embedded hamlet
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

" store and remove current syntax value
let old_syntax = b:current_syntax
unlet b:current_syntax

syn include @hmQuasi syntax/hamlet.vim
unlet b:current_syntax

" note: not implemented yet
syn include @csQuasi syntax/css.vim 
unlet b:current_syntax

syn include @jsQuasi syntax/julius.vim
unlet b:current_syntax

syn region hmBlock start=/\[\$\?x\?hamlet|/ keepend end=/|\]/ contains=@hmQuasi
syn region csBlock start=/\[\$\?cassius|/   keepend end=/|\]/ contains=@csQuasi
syn region jsBlock start=/\[\$\?julius|/    keepend end=/|\]/ contains=@jsQuasi

hi def link hmBlock Boolean
hi def link csBlock Boolean
hi def link jsBlock Boolean

" restore current syntax value
let b:current_syntax = old_syntax
