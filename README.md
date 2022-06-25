# halostatue/fish-utils-core

Core utility functions for [fish shell][]. Most have been ported from my zsh
dotfiles or from bash files.

This has been extracted from `halostatue/fish-utils` because there’s functions
that I consider core functions (which can be depended on existing for any
plug-in that I create) and functions that are useful utilities, but not core
functions.

Note that with Fisher v4, transitive `fishfile` dependencies are no longer
supported, so if the plugin requires `halostatue/fish-utils-core`, it will need
to be added explicitly as part of your dependencies.

[![Version][]](https://github.com/halostatue/fish-utils-core/releases)

## Installation

Install with [Fisher][] (recommended):

```fish
fisher install halostatue/fish-utils-core@v2.x
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

### is:os — is:freebsd, is:linux, is:mac, is:ubuntu

Tests that the current operating environment is the expected OS type. Most
are implemented in terms of is:os, which is mostly a comparison tool for
`uname -s`.

`is:mac` can also test for a specific version of macOS by name or version,
up to the newest beta version Ventura (macOS 13).

```fish
is:mac; and echo Yes; or echo No
is:mac ventura; and echo Developer; or echo Normal
```

### is:mac-terminal

Returns true if `fish` is running on macOS and in a recognized terminal based on
the terminal bundle ID as reported in `$__CFBundleId`. Not all terminals are
currently recognized.

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

### list:unique

Ensures that each of the values in the provided list is uniquely represented,
removing second or subsequent copies of the values and preserving order.

```fish
list:unique b a c a b # => b a c
set PATH (list:unique $PATH)
```

#### list:unique flags

- `-t TYPE`, `--type TYPE`: Checks each value of the list to see if the value
  represents one of the provided `TYPE`s. May be specified multiple times.
  Supported `TYPE` values are:

  - `d`: an existing directory
  - `f`: an existing file

- `-d`, `--directory`: Shorthand for `--type d`.

- `-f`, `--file`: Shorthand for `--type f`.

### list:clean

Removes the first list of values from the second list of values. This _requires_
that the `--` parameter be supplied to separate the lists. Roughly equivalent to
`set -e list[(contains -i value $list)]`, except that the first part can also be
a list.

```fish
list:clean a b c -- a b c d e f # => d e f
```

### Completion Helper Functions

### \_\_complete_no_subcommand

A completion function generator that creates a completion function that knows
about the subcommands of a command.

```fish
__complete_no_subcommand manage add remove
```

The above example will generate a function `__complete_no_subcommand__manage`
that returns true if the current command-line arguments do not include `add`
or `remove`.

This function is deprecated and will be removed in the next major version. (It
was added for a fish plug-in that I did not finish creating.)

### \_\_complete_pos_eq

A completion function that tests whether the current argument position is the
same as what is provided.

```fish
__complete_pos_eq 3
```

This will be true if the user is in the third argument position. Note that
this will only work if there are no flags provided.

This function is deprecated and will be removed in the next major version. (It
was added for a fish plug-in that I did not finish creating.)

### \_\_complete_subcommands

Returns true if the subcommand chain provided exists. Usable as a `complete`
condition function. An extension of `__fish_seen_subcommand_from`, this looks
for multi-part subcommands.

Assuming a command `manage` that has a subcommand `add` which has further
subcommands `group` and `user`, the following conditions would work:

Use `\*` to match any pattern.

```fish
__complete_no_subcommand manage add

complete -c manage -e
complete -c manage -n __complete_no_subcommand__manage -a add -d 'Add groups or users'
complete -c manage -n '__complete_subcommands add' -a group -d 'Add a group'
complete -c manage -n '__complete_subcommands add' -a user -d 'Add a user'
complete -c manage -n '__complete_subcommands add group' --no-files -a group1 group2 -d 'Supported groups'
complete -c manage -n '__complete_subcommands add users' --no-files -a user1 user2 -d 'Supported users'
```

In this case, `manage add group<Tab>` would show the completion options `group1` and `group2`

This function is deprecated and will be removed in the next major version. (It
was added for a fish plug-in that I did not finish creating.)

## License

[MIT](LICENCE.md)

[fish shell]: https://fishshell.com 'friendly interactive shell'
[version]: https://img.shields.io/github/tag/halostatue/fish-utils-core.svg?label=Version
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
