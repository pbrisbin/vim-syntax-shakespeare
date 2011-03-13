# Html Template Syntax

A collection of vim syntax files for working in haskell's various html 
templating languages (hamlet, cassius, and julius).

The idea is to provide both a `syntax/$language.vim` file for external 
templates as well as include them in an `after/syntax/haskell.vim` to 
properly highlight quasi-quoted blocks inside a haskell source file.

To use, just copy the contents of `./syntax` and `./after/syntax` into 
your `~/.vim/syntax` and `~/.vim/after/syntax` directories.

### So far:

* hamlet.vim
* julius.vim
* embedded hamlet in haskell.vim
* embedded julius in haskell.vim

### Todo:

* cassius
* there are some quirks with embedded julius

### Screenshots

Embedded hamlet in a haskell source file:

![Screenshot](http://pbrisbin.com/static/fileshare/hamlet.png)
