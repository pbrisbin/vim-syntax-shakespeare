" Vim syntax file
" Language: haskell with embedded hamlet
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

" hamlet template
syn region hmBlock start='\[\$\?x\?hamlet|*' end='|\]' contains=hmString,hmKey,hmAttr,hmTmpl,hmVar,hmFunc,hmExp,hmTrail
hi def link hmBlock Boolean

" normal double-quoted strings
syn match hmString contained /"[^"]*"/ contains=hmVar,hmExp
hi def link hmString String

" <something>
syn match hmKey contained /^\s*<[^>\n]*[>\n]/ contains=hmAttr,hmString
hi def link hmKey Identifier

" !something, #something, .something
syn match hmAttr contained /\(\.\|#\)[^ >]*/ contains=hmString,hmVar,hmExp
syn match hmAttr contained /^\s*\(\.\|#\)[^ >]*/ contains=hmString,hmVar,hmExp
hi def link hmAttr Operator

" ^{template}
syn match hmTmpl contained /\^{[^}]*}/ contains=hmString,hsVarSym,hsConSym " values from syntax/haskell.vim
hi def link hmTmpl Number

" #{variable}
syn match hmVar contained /\#{[^}]*}/ contains=hmString,hsVarSym,hsConSym
hi def link hmVar Structure

" @{RoutR}
syn match hmExp contained /@{[^}]*}/ contains=hmString,hsVarSym,hsConSym
hi def link hmExp Type

" $maybe, $forall, $if, $else
syn match hmFunc contained /\$\(maybe\|nothing\|forall\|if\|elseif\|else\)/
hi def link hmFunc Function

" i like to show trailing spaces for convenience
syn match hmTrail contained /  *$/
hi def link hmTrail Error
