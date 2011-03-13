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

if version < 508
  command! -nargs=+ HamletHiLink hi link <args>
else
  command! -nargs=+ HamletHiLink hi def link <args>
endif

syntax spell toplevel

" normal double-quoted strings
syn match hmString contained /"[^"]*"/ contains=hmVar,hmExp

" <something>
syn match hmKey /^\s*<[^>\n]*[>\n]/ contains=hmAttr,hmString

" #something and .something
syn match hmAttr contained /\(\.\|#\)[^ >]*/ contains=hmString,hmVar,hmExp

" ^{template}
syn match hmTmpl /\^{[^}]*}/ contains=hmString,hsVarSym,hsConSym " values from syntax/haskell.vim

" #{variable}
syn match hmVar /\#{[^}]*}/ contains=hmString,hsVarSym,hsConSym

" @{RoutR}
syn match hmExp /@{[^}]*}/ contains=hmString,hsVarSym,hsConSym

" $maybe, $forall, $if, $else
syn match hmFunc /\$\(maybe\|nothing\|forall\|if\|elseif\|else\)/

" i like to show trailing spaces for convenience
syn match hmTrail /  *$/

" raw html is prefixed as \<
syn include @HTML syntax/html.vim
unlet b:current_syntax
syn match hmHTML /\\<[^>]\+>/ contains=@HTML

"
" embedded javascript might not work without a </script> to end the 
" region.
"
"syn include @JavaScript syntax/javascript.vim
"unlet b:current_syntax
"syn match hmJavaScript /???/ contains=@JavaScript,hmTmpl,hmVar,hmExp,hmFunc

HamletHiLink hmString String
HamletHiLink hmKey    Identifier
HamletHiLink hmAttr   Operator
HamletHiLink hmTmpl   Number
HamletHiLink hmVar    Structure
HamletHiLink hmExp    Type
HamletHiLink hmFunc   Function
HamletHiLink hmTrail  Error

delcommand HamletHiLink

let b:current_syntax='hamlet'

if main_syntax == 'hamlet'
  unlet main_syntax
endif
