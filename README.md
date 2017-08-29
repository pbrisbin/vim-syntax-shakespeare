# Shakespeare Syntax

Vim syntax files for the [shakespeare][] templating languages used by Yesod.

[shakespeare]: http://hackage.haskell.org/package/shakespeare

![Screenshot](screenshot.png)

## Usage

Add `pbrisbin/vim-syntax-shakespeare` using your preferred plugin manager.

## Configuration

Allow one-liner QQs even if they have invalid nesting:

```vim
let g:hamlet_prevent_invalid_nesting = 0
```

Don't highlight empty space at the end of lines:

```vim
let g:hamlet_highlight_trailing_space = 0
```

---

[LICENSE](./LICENSE)
