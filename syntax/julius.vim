" Vim syntax file
" Language: Julius template syntax highlighting
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

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

syn match jsString contained /"[^"]*"/ contains=jsVar
hi def link jsString String

syn match jsVar /\#{[^}]*}/ contains=jsString,hsVarSym,hsConSym
hi def link jsVar Structure
