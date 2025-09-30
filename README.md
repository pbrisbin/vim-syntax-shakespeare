> [!NOTE]
> All of my GitHub repositories have been **archived** and will be migrated to
> Codeberg as I next work on them. This repository either now lives, or will
> live, at:
>
> https://codeberg.org/pbrisbin/vim-syntax-shakespeare
>
> If you need to report an Issue or raise a PR, and this migration hasn't
> happened yet, send an email to me@pbrisbin.com.

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
