# Html Template Syntax

A collection of vim syntax files for working in haskell's various html 
templating languages (hamlet, cassius, lucius, and julius).

Provided is each `syntax/$language.vim` file for external templates as 
well as an `after/syntax/haskell.vim` which will properly highlight 
quasi-quoted blocks inside a haskell source file.

To use, just copy (or link) the contents of this repo into the correct 
directories under `~/.vim`.

I would also recommend pathogen for automated plugin loading. See my 
[vim repo][repo] (or just google around) for an example of this usage.

[repo]: https://github.com/pbrisbin/vim-config

### Todo

* javascript inside a script tag is difficult due to the lack of a 
  \</script> region-end

* highlight in-line html tags added as raw

* nested blocks in lucius

* bug in lucius unquoted interpolations

### Screenshots

Embedded hamlet in a haskell source file:

![Screenshot](http://files.pbrisbin.com/screenshots/desktop_1202101148.png)
