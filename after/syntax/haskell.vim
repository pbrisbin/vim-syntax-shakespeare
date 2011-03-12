" Vim syntax file
" Language: haskell with embedded hamlet
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

if exists("b:current_syntax")
  unlet b:current_syntax
endif

syn include @hmQuasi syntax/hamlet.vim
syn include @csQuasi syntax/css.vim " not implemented yet
syn include @jsQuasi syntax/julius.vim

syn region hmBlock start='\[\$\?x\?hamlet|*' end='|\]' contains=@hmQuasi
syn region csBlock start='\[\$\?cassius|*' end='|\]'   contains=@csQuasi
syn region jsBlock start='\[\$\?julius|*'  end='|\]'   contains=@jsQuasi

"hi def link hmBlock Boolean
"hi def link csBlock Boolean
"hi def link jsBlock Boolean
