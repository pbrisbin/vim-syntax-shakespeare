" Vim syntax file
" Language: Lucius template syntax highlighting
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  MIT

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'lucius'
endif

" lucius is just css with variable interpolation
:runtime! syntax/css.vim
unlet b:current_syntax

" redefine existing definitions so they can contain vars
syn region cssStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=lcVar,lcRoute
syn region cssStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=lcVar,lcRoute
syn region cssURL contained matchgroup=cssFunctionName start="\<url\s*(" end=")" contains=lcVar,lcRoute oneline keepend

syn match lcVar /\#{[^}]*}/ contains=cssStringQ,cssStringQQ,lcRoute,lcHsOp
syn match lcRoute /@{[^}]*}/ contains=cssStringQ,cssStringQQ,lcVar,lcHsOp
syn match lcRoute /@?{[^}]*}/ contains=cssStringQ,cssStringQQ,lcVar,lcHsOp
syn match lcAtVar /@[^{][^: ]*:/

syn match lcHsOp contained /\(\$\|\.\)/

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

HiLink lcVar      Structure
HiLink lcAtVar    Number
HiLink lcRoute    Type
HiLink lcHsOp     Operator

delcommand HiLink

let b:current_syntax = 'lucius'

if main_syntax == 'lucius'
  unlet main_syntax
endif
