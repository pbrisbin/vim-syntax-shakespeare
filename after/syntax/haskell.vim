" Vim syntax file
" Language: haskell with embedded hamlet
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

syn include @hmQuasi syntax/hamlet.vim
unlet b:current_syntax

syn region hmBlock start='\[\$\?x\?hamlet|*' end='|\]' contains=@hmQuasi
hi def link hmBlock Boolean
