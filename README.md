# Html Template Syntax

A collection of vim syntax files for working in haskell's various html 
templating languages (hamlet, cassius, and julius).

The idea is to provide both a syntax/$language.vim file for external 
templates as well as include them in an after/syntax/haskell.vim to 
properly highlight quasi-quoted blocks inside a haskell source file.

### So far:

* hamlet.vim
* julius.vim
* embedded hamlet in haskell.vim

### Todo:

* cassius.vim
* embedded cassius in haskell.vim
* fix embedded julius in haskell.vim
* fix embedded javascript in hamlet.vim

### Screenshots

Embedded hamlet in a haskell source file:

![Screenshot](http://pbrisbin.com/static/fileshare/hamlet.png)
