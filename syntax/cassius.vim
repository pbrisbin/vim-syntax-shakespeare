" Vim syntax file
" Language: Cassius template syntax highlighting
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'cassius'
endif

if version < 508
  command! -nargs=+ CassiusHiLink hi link <args>
else
  command! -nargs=+ CassiusHiLink hi def link <args>
endif

" todo:

delcommand CassiusHiLink

let b:current_syntax = 'cassius'

if main_syntax == 'cassius'
  unlet main_syntax
endif
