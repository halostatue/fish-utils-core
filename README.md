# halostatue/fish-utils-core

Core utility functions for [fish shell][shell].

[![Version][version]](https://github.com/halostatue/fish-utils-core/releases)

## Installation

Install with [Fisher][Fisher]:

```fish
fisher install halostatue/fish-utils-core@v3
```

### System Requirements

- [fish][fish] 3.0+

## Functions

### `is_os` -- `is_freebsd`, `is_linux`, `is_mac`, `is_ubuntu`

Tests that the current operating environment is the expected OS type. Most are
implemented in terms of `is_os`, which is mostly a comparison tool for
`uname -s`.

- `is_mac` can also test for a specific version of macOS by name or version.

- `is_linux` can also test for a specific distribution based on the `ID` or
  `ID_LIKE` values from `/etc/os-release`. Values tested include `rhel`,
  `fedora`, `debian`, `ubuntu`, and `alpine`.

```fish
is_mac; and echo Yes; or echo No
is_mac sequoia; and echo Sequoia; or echo Not macOS or Sequoia
```

### `is_mac_terminal`

Returns true if `fish` is running on macOS and in a recognized terminal based on
the terminal bundle ID as reported in `$__CFBundleId`.

Currently, Alacritty, iTerm2, Apple Terminal, kitty, Wezterm, and GhosTTY are
recognized. Contributions are welcome to expand this.

### `list_unique`

Ensures that each of the values in the provided list is uniquely represented,
removing second or subsequent copies of the values and preserving order.

```fish
list_unique b a c a b # => b a c
set PATH (list_unique $PATH)
```

#### `list_unique` flags

- `-t TYPE`, `--type TYPE`: Checks each value of the list to see if the value
  represents one of the provided `TYPE`s. May be specified multiple times.
  Supported `TYPE` values are:

  - `d`: an existing directory
  - `f`: an existing file

- `-d`, `--directory`: Shorthand for `--type d`.

- `-f`, `--file`: Shorthand for `--type f`.

### `list_clean`

Removes the first list of values from the second list of values. This _requires_
that the `--` parameter be supplied to separate the lists. Roughly equivalent to
`set -e list[(contains -i value $list)]`, except that the first part can also be
a list.

```fish
list_clean a b c -- a b c d e f # => d e f
```

### `__macos_version_to_comparable`

Convert the provided macOS version to a comparable number. The special version
'current' or '--current' will use `/usr/bin/sw_vers` to produce a value. Special
names are recognized from Leopard to Sequoia.

## Licence

[MIT](LICENCE.md)

[shell]: https://fishshell.com 'friendly interactive shell'
[version]: https://img.shields.io/github/tag/halostatue/fish-utils-core.svg?label=Version
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
