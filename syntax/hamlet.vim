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

syn match hmString  contained /"[^"]*"/ contains=hmVar,hmRoute,hmLang
syn match hmNum     contained /\<[0-9]*\>/
syn match hmTrail   display excludenl /\s\+$/
syn match hmComment display /\(\$#.*$\|<!--.*-->\)/

" We use the leading anchor (^) to prevent invalid nesting from
" highlighting; however, this prevents oneliner QQs from working.
syn match hmKey /^\s*\\\?\s*<[^!][^>$]*>\?/ contains=hmVar,hmRoute,hmAttr,hmString,hmCond
syn match hmAttr contained /\(\.\|#\)[^ >]*/ contains=hmString,hmVar,hmRoute,hmLang
syn match hmCond contained /:[^:]\+:\([^ ]*"[^"]*"\|[^ >]*\)/ contains=hmString,hmNumber,hmCondOp,hmHsOp

syn match hmVar   /\#{[^}]*}/  contains=hmHsOp,hmString,hmNum
syn match hmRoute /@{[^}]*}/   contains=hmHsOp,hmString,hmNum
syn match hmLang  /_{[^}]*}/   contains=hmHsOp,hmString,hmNum
syn match hmTmpl  /\^{[^}]*}/  contains=hmHsOp,hmString,hmNum

" can't use keyword due to special chars
syn match hmHsOp   contained /\(\$\|\.\)/
syn match hmCondOp contained /:/
syn match hmFuncOp contained /<-/

syn match hmStmt /^\s*\$.\+$/ contains=hmFunc,hmFuncOp,hmComment transparent
syn match hmFunc contained /\$\(doctype\|maybe\|nothing\|forall\|if\|elseif\|else\|with\|case\|of\)/

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

HiLink hmString  String
HiLink hmNum     Number
HiLink hmKey     Identifier
HiLink hmHsOp    Operator
HiLink hmAttr    Operator
HiLink hmCond    Function
HiLink hmCondOp  Number
HiLink hmTmpl    Number
HiLink hmVar     Structure
HiLink hmLang    Structure
HiLink hmRoute   Type
HiLink hmFunc    Function
HiLink hmFuncOp  Number
HiLink hmTrail   Error
HiLink hmComment Comment

delcommand HiLink

let b:current_syntax='hamlet'

if main_syntax == 'hamlet'
  unlet main_syntax
endif
