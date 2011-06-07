# Html Template Syntax

A collection of vim syntax files for working in haskell's various html 
templating languages (hamlet, cassius, and julius).

Provided is each `syntax/$language.vim` file for external templates as 
well as an `after/syntax/haskell.vim` which will properly highlight 
quasi-quoted blocks inside a haskell source file.

To use, just copy (or link) the contents of `./syntax` and 
`./after/syntax` into your `~/.vim/syntax` and `~/.vim/after/syntax` 
directories.

Be sure to set the filetypes by extension in your `~/.vimrc`:

    au BufEnter *.hamlet  setlocal filetype=hamlet
    au BufEnter *.cassius setlocal filetype=cassius
    au BufEnter *.julius  setlocal filetype=julius

### Todo

* javascript inside a script tag is difficult due to the lack of a 
  \</script> region-end

### Screenshots

Embedded hamlet in a haskell source file:

![Screenshot](http://pbrisbin.com/static/fileshare/hamlet.png)
