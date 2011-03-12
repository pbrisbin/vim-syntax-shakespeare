" Vim syntax file
" Language: haskell with embedded hamlet
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

syn include @hmQuasi syntax/hamlet.vim
unlet b:current_syntax

syn include @csQuasi syntax/css.vim " not implemented yet
unlet b:current_syntax

syn include @jsQuasi syntax/julius.vim
unlet b:current_syntax

syn region hmBlock start='\[\$\?x\?hamlet|*' end='|\]' contains=@hmQuasi
syn region csBlock start='\[\$\?cassius|*' end='|\]'   contains=@csQuasi
syn region jsBlock start='\[\$\?julius|*'  end='|\]'   contains=@jsQuasi

"hi def link hmBlock Boolean
"hi def link csBlock Boolean
"hi def link jsBlock Boolean
