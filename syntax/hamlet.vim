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

syntax spell toplevel

syn match hmString contained /"[^"]*"/ contains=hmVar,hmExp

" todo: we need the leading anchor (^) to prevent invalid nesting from 
" highligting; however, this prevents oneliners from working -- we need 
" some way to anchor to (start-of-line OR start-of-region).
syn match hmKey /^\s*<[^>$]*>\?/ contains=hmVar,hmExp,hmAttr,hmString

syn match hmAttr contained /\(\.\|#\)[^ >]*/ contains=hmString,hmVar,hmExp
syn match hmHsOp contained /\(\$\|\.\)/
syn match hmTmpl /\^{[^}]*}/ contains=hmString,hmHsOp
syn match hmVar /\#{[^}]*}/ contains=hmString,hsHsOp
syn match hmLang /_{[^}]*}/ contains=hmString,hsHsOp
syn match hmExp /@{[^}]*}/ contains=hmString,hmHsOp
syn match hmStmt /^\s*\$.\+$/ contains=hmFunc,hmStmtOps
syn match hmFunc contained /\$\(maybe\|nothing\|forall\|if\|elseif\|else\|with\)/
syn match hmStmtOps contained /\(<-\|,\)/
syn match hmTrail display excludenl /\s\+$/

syn include @HTML syntax/html.vim
unlet b:current_syntax
syn match hmHTML /\\<[^>]\+>/ contains=@HTML

"
" todo: embedded javascript is real hard without that </script> closure
"

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

HiLink hmString String
HiLink hmKey    Identifier
HiLink hmHsOp   Operator
HiLink hmAttr   Operator
HiLink hmBindOp Operator
HiLink hmTmpl   Number
HiLink hmVar    Structure
HiLink hmLang   Structure
HiLink hmExp    Type
HiLink hmFunc   Function
HiLink hmTrail  Error

delcommand HiLink

let b:current_syntax='hamlet'

if main_syntax == 'hamlet'
  unlet main_syntax
endif
