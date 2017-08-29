# Shakespeare Syntax

A collection of vim syntax files for working in the [shakespeare][]
templating languages used by Yesod.

[shakespeare]: http://hackage.haskell.org/package/shakespeare

## Installation

Add `pbrisbin/vim-syntax-shakespeare` using your preferred plugin manager.

## Options

Allow one-liner QQs even if they have invalid nesting:

```vim
let g:hamlet_prevent_invalid_nesting = 0
```

Don't highlight empty space at the end of lines:

```vim
let g:hamlet_highlight_trailing_space = 0
```

### Screenshots

Embedded hamlet in a haskell source file:

![Screenshot](screenshot.png)
