# Html Template Syntax

A (so far very small) collection of vim syntax files for Html working in 
haskell's Html templating languages (hamlet, cassius, etc).

The idea is to provide both a $language.vim file to for external 
templates as well as one monolithic haskell.vim that can be placed in 
your after/syntax directory to properly highlight quasi-quoted blocks.

### So far

haskell.vim with support for quasi-quoted hamlet.

![Screenshot](http://pbrisbin.com/static/fileshare/hamlet.png)

# Todo:

* hamlet.vim
* cassius.vim
* julius.vim
* update haskell.vim with support for these
* update hamlet to highlight \<script> stuff as julius

### Call for contributors

My site doesn't use any external templates, so only the haskell.vim is 
really useful to me. If anyone would like to tackle the others (cassius 
and julius can really just be tweaked versions of the standard css and 
javascript syntax files), please do.

Anyone with greater vim knowledge, please share. Is there a way to 
create the $language.vim files then reference them in a regex-contained 
way in haskell.vim?
