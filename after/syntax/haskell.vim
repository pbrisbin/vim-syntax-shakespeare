" Vim syntax file
" Language: haskell with embedded hamlet
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  MIT

" store and remove current syntax value
if exists('b:current_syntax')
  let old_syntax = b:current_syntax
  unlet b:current_syntax
endif

syn include @hamlet syntax/hamlet.vim
unlet b:current_syntax

syn include @cassius syntax/cassius.vim
unlet b:current_syntax

syn include @lucius syntax/lucius.vim
unlet b:current_syntax

syn include @julius syntax/julius.vim
unlet b:current_syntax


syn region hmBlock   matchgroup=quasiQuote start=/\[\$\?[iws]\?hamlet|/ end=/|\]/ contains=@hamlet
syn region hmBlock   matchgroup=quasiQuote start=/\[\$\?xs\?hamlet|/    end=/|\]/ contains=@hamlet
syn region csBlock   matchgroup=quasiQuote start=/\[\$\?cassius|/       end=/|\]/ contains=@cassius
syn region lcBlock   matchgroup=quasiQuote start=/\[\$\?lucius|/        end=/|\]/ contains=@lucius
syn region jsBlock   matchgroup=quasiQuote start=/\[\$\?julius|/        end=/|\]/ contains=@julius

" simple text
syn region txtBlock  matchgroup=quasiQuote start=/\[\$\?[sl]t|/ end=/|\]/ contains=txtInterp
syn region txtInterp matchgroup=txtInterpDelim start="#{"  end="}" contains=txtOp,txtString,txtNum

syn match txtOp      contained /\(\$\|\.\)/
syn match txtString  contained /"[^"]*"/
syn match txtNum     contained /\<[0-9]*\>/

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

HiLink quasiQuote     Boolean
HiLink txtBlock       String
HiLink txtInterp      Normal
HiLink txtInterpDelim Delimiter
HiLink txtOp          Operator
HiLink txtString      String
HiLink txtNum         Number

delcommand HiLink

" restore current syntax value
if exists('old_syntax')
  let b:current_syntax = old_syntax
endif
