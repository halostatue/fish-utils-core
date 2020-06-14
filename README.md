# halostatue/fish-utils-core

Core utility functions for [fish shell][]. Most have been ported from my zsh
dotfiles.

This has been extracted from `halostatue/fish-utils` because there’s
functions that I consider core fucntions (which can be depended on existing
for any plug-in that I create) and functions that are useful utilities,
but not core functions.

[![Version][]][]

## Installation

Install with [Fisher][] (recommended):

```fish
fisher add halostatue/fish-utils-core
```

<details>
<summary>Not using a package manager?</summary>

---

Copy `functions/*.fish` to your fish configuration directory preserving the
directory structure.
</details>

### System Requirements

- [fish][] 3.0+

## Functions

### dict:\* - dict:empty, dict:get, dict:has_key, dict:keys, dict:set

Functions to give fish behaviour similar to associative arrays found in `zsh`
or bash 4. This is based on functions that I wrote for bash 3 and uses the
same technique.

```fish
dict:set x y          # sets x{y} to an empty value
dict:set x y 1        # sets x{y} to the value 1
dict:set x y 1 2 3    # sets x{y} to the list value 1 2 3
dict:get x y          # gets the value of x{y}
dict:has_key x y      # true if key y exists in dictionary x
dict:empty x          # true if there is no dictionary x
dict:keys x           # the list of all keys in dictionary x
```

### is:os — is:freebsd, is:linux, is:mac, is:ubuntu

Tests that the current operating environment is the expected OS type. Most
are implemented in terms of is:os, which is mostly a comparison tool for
`uname -s`.

`is:mac` can also test for a specific version of Mac OS.

```fish
is:mac; and echo Yes; or echo No
is:mac catalina; and echo Developer; or echo Normal
```

### is:mac-at-least

Determines whether the MacOS version is at least the version specified. This
is deprecated and will be removed in the future.

```fish
is:mac-at-least catalina; and echo Developer; or echo Normal
```

### is:mac-terminal

Determines whether running on in MacOS and whether iTerm or Apple Terminal is
running.

### is:true

Determines whether the value provided is a true value

```fish
is:true 1; and echo yes
is:true yes; and echo yes
is:true true; and echo yes
is:true on; and echo yes
is:true no; or echo no
is:true foo; or echo no
```

### path:after, path:before, path:unique

Manages $PATH and $CDPATH in a consistent way. `path:after` and `path:before`
are simple wrappers around `path:unique`. `path:unique` adds the list of
paths provided to the global path variable.

#### path:unique Flags

Without flags, `path:unique` and its wrappers will add the provided paths, in
the provided order, to the beginning of the $PATH, even if the value was
already present. This means that:

```fish
echo $PATH # b /usr/local/bin
path:unique a b c
echo $PATH # a b c /usr/local/bin
```

- `-c`, `--cdpath`: Manages $CDPATH instead of $PATH.
- `-a`, `--append`: Appends the path list to the managed path. Not available
  on `path:before` and `path:after`.

    ```fish
    echo $PATH # b /usr/local/bin
    path:unique --append a b c
    echo $PATH # /usr/local/bin a b c
    ```

- `-t`, `--test`: Only appends the provided path if it exists. Off by default.

### path:clean

Removes the provided path(s) from $PATH or $CDPATH.

#### path:clean Flags

Without flags, `path:clean` will remove the provided paths from $PATH. This
means that:

```fish
echo $PATH # b /usr/local/bin
path:clean b
echo $PATH # /usr/local/bin
```

- `-c`, `--cdpath`: Manages $CDPATH instead of $PATH.

### path:make_unique

Run this once per type during initialization to ensure that your $PATH or
$CDPATH do not contain duplicate entries. The order of the entries in the
managed path variable will be preserved.

#### path:make_unique Flags

Without flags, `path:make_unique` will manage $PATH. This means that:

```fish
echo $PATH # /usr/local/bin /usr/local/bin
path:make_unique
echo $PATH # /usr/local/bin
```

- `-c`, `--cdpath`: Manages $CDPATH instead of $PATH.

## License

[MIT](LICENCE.md)

[fish shell]: https://fishshell.com "friendly interactive shell"
[Version]: https://img.shields.io/github/tag/halostatue/fish-utils-core.svg?label=Version
[![Version][]]: https://github.com/halostatue/fish-utils-core/releases
[Fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
