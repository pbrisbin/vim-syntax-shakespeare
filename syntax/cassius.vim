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

" todo:

let b:current_syntax = 'cassius'
