# Shakespeare Syntax

A collection of vim syntax files for working in the [shakespeare][]
templating languages used by Yesod.

[shakespeare]: http://hackage.haskell.org/package/shakespeare

Provided is each `syntax/$language.vim` file for external templates as 
well as an `after/syntax/haskell.vim` which will properly highlight 
quasi-quoted blocks inside a haskell source file.

## Installation

- Use [Vundle][]
- Add `Plugin "pbrisbin/vim-syntax-shakespeare"`

[vundle]: https://github.com/gmarik/Vundle.vim

### Todo

* javascript inside a script tag is difficult due to the lack of a 
  \</script> region-end

* highlight in-line html tags added as raw

* nested blocks in lucius

* bug in lucius unquoted interpolations

### Screenshots

Embedded hamlet in a haskell source file:

![Screenshot](http://files.pbrisbin.com/screenshots/desktop_1202101148.png)
