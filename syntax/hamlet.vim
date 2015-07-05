" Vim syntax file
" Language: Hamlet template syntax highlighting
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  MIT

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'hamlet'
endif

if !exists("g:hamlet_prevent_invalid_nesting")
  let g:hamlet_prevent_invalid_nesting = 1
endif

if !exists("g:hamlet_highlight_trailing_space")
  let g:hamlet_highlight_trailing_space = 1
endif

syntax spell toplevel

syn match hmString  contained /"[^"]*"/ contains=hmVar,hmRoute,hmLang
syn match hmNum     contained /\<[0-9]\+\>/
syn match hmComment display /\(\$#.*$\|<!--\_.\{-}-->\)/

if g:hamlet_highlight_trailing_space == 1
  syn match hmTrail display excludenl /\s\+$/
endif

" We use the leading anchor (^) to prevent invalid nesting from
" highlighting; however, this prevents oneliner QQs from working.
if g:hamlet_prevent_invalid_nesting == 1
  syn match hmKey /^\s*\\\?\s*<[^!]\_.\{-}>/ contains=hmVar,hmRoute,hmAttr,hmAttrVal,hmString,hmCond,hmAttrs
else
  syn match hmKey /\s*\\\?\s*<[^!]\_.\{-}>/ contains=hmVar,hmRoute,hmAttr,hmAttrVal,hmString,hmCond,hmAttrs
endif
syn match hmAttr contained /\(\.\|#\)[^ >]*/ contains=hmString,hmVar,hmRoute,hmLang
syn match hmAttrVal contained /=\zs[^ >]*/ contains=hmString,hmVar,hmRoute,hmLang
syn match hmCond contained /:[^:]\+:\([^ ]*"[^"]*"\|[^ >]*\)/ contains=hmString,hmNumber,hmCondOp,hmHsOp

" various interpolations
syn region hmVar   matchgroup=hmVarDelim   start="#{"  end="}" contains=hmHsOp,hmString,hmNum
syn region hmAttrs matchgroup=hmAttrsDelim start="\*{" end="}" contains=hmHsOp,hmString,hmNum
syn region hmRoute matchgroup=hmRouteDelim start="@{"  end="}" contains=hmHsOp,hmString,hmNum
syn region hmRoute matchgroup=hmRouteDelim start="@?{" end="}" contains=hmHsOp,hmString,hmNum
syn region hmTmpl  matchgroup=hmTmplDelim  start="\^{" end="}" contains=hmHsOp,hmString,hmNum
syn region hmLang  matchgroup=hmLangDelim  start="_{"  end="}" contains=hmHsOp,hmString,hmNum

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
HiLink hmAttrVal String
HiLink hmCond    Function
HiLink hmCondOp  Number
HiLink hmRoute   Type
HiLink hmTmpl    Number
HiLink hmFunc    Function
HiLink hmFuncOp  Number
HiLink hmTrail   Error
HiLink hmComment Comment

HiLink hmVarDelim   Delimiter
HiLink hmRouteDelim Delimiter
HiLink hmLangDelim  Delimiter
HiLink hmTmplDelim  Delimiter

delcommand HiLink

let b:current_syntax='hamlet'

if main_syntax == 'hamlet'
  unlet main_syntax
endif
