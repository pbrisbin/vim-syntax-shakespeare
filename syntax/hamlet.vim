" Vim syntax file
" Language: Hamlet template syntax highlighting
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'hamlet'
endif

" normal double-quoted strings
syn match hmString contained /"[^"]*"/ contains=hmVar,hmExp
hi def link hmString String

" <something>
syn match hmKey /^\s*<[^>\n]*[>\n]/ contains=hmAttr,hmString
hi def link hmKey Identifier

" #something and .something
syn match hmAttr contained /\(\.\|#\)[^ >]*/ contains=hmString,hmVar,hmExp
hi def link hmAttr Operator

" ^{template}
syn match hmTmpl /\^{[^}]*}/ contains=hmString,hsVarSym,hsConSym " values from syntax/haskell.vim
hi def link hmTmpl Number

" #{variable}
syn match hmVar /\#{[^}]*}/ contains=hmString,hsVarSym,hsConSym
hi def link hmVar Structure

" @{RoutR}
syn match hmExp /@{[^}]*}/ contains=hmString,hsVarSym,hsConSym
hi def link hmExp Type

" $maybe, $forall, $if, $else
syn match hmFunc /\$\(maybe\|nothing\|forall\|if\|elseif\|else\)/
hi def link hmFunc Function

" i like to show trailing spaces for convenience
syn match hmTrail /  *$/
hi def link hmTrail Error

" embedded <script> tags
syn include @hmJavaScript syntax/javascript.vim
unlet b:current_syntax
syn region javaScript start=+<script[^>]*>+ keepend end=+</script>+ contains=@hmJavaScript,hmTmpl,hmVar,hmExp,hmFunc
