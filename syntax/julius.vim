" Vim syntax file
" Language: Julius template syntax highlighting
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  MIT

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'julius'
endif

" julius is just javascript with variable interpolation
:runtime! syntax/javascript.vim
unlet b:current_syntax

syn region jsStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=jsVar,jsRoute,jsTmpl
syn region jsStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=jsVar,jsRoute,jsTmpl

syn match jsVar /\#{[^}]*}/ contains=jsStringQ,jsStringQQ,jsRoute,jsHsOp
syn match jsRoute /@{[^}]*}/ contains=jsStringQ,jsStringQQ,jsVar,jsHsOp
syn match jsRoute /@?{[^}]*}/ contains=jsStringQ,jsStringQQ,jsVar,jsHsOp
syn match jsTmpl /\^{[^}]*}/ contains=jsStringQ,jsStringQQ,hmHsOp

syn match jsHsOp contained /\(\$\|\.\)/

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

HiLink jsStringQQ String
HiLink jsStringQ  String
HiLink jsVar      Structure
HiLink jsRoute    Type
HiLink jsTmpl     Number
HiLink jsHsOp     Operator

delcommand HiLink

let b:current_syntax = 'julius'

if main_syntax == 'julius'
  unlet main_syntax
endif
