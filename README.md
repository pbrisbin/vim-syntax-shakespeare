# Html Template Syntax

A (so far very small) collection of vim syntax files for working in 
haskell's various html templating languages (hamlet, cassius, etc).

The idea is to provide both a $language.vim file for external templates 
as well as one monolithic haskell.vim that can be placed in your 
after/syntax directory to properly highlight quasi-quoted blocks inside 
a haskell source file.

### So far:

* haskell.vim with hamlet support
* hamlet.vim

![Screenshot](http://pbrisbin.com/static/fileshare/hamlet.png)

### Todo:

* cassius.vim
* julius.vim
* update haskell.vim with support for these
* update hamlet to highlight \<script> stuff as javascript

### Call for contributors

My site doesn't use any external templates, so only the haskell.vim is 
really useful to me. If anyone would like to tackle the others (cassius 
and julius can really just be tweaked versions of the standard css and 
javascript syntax files), please do.
