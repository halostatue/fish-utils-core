# fish-utils-core Changelog

## NEXT

- Deprecated `__complete_no_subcommand`, `__complete_pos_eq`, and
  `__complete_subcommands`. They were all created for a plug-in that I am no
  longer working on and will never release. They’re all fairly complex and of
  questionable overall value.

- Added comments to help identify the source of plugins when installed with
  Fisher.

## 2.1.1

- Fixed a bug in `__macos_version_to_comparable` and `is:mac` where comparisons
  could not be performed correctly.

- Switched from using `matchai/fish-mock` to `IlanCosman/clownfish` for mocking.

- Added additional documentation files.

- Added a makefile for ease of testing.

## 2.1.0

- Fixed a bug in `is:mac` where modern versions of macOS were not properly
  detected, and improved the comparison mechanism. Added support for versions up
  to Ventura (macOS 13).

## 2.0.0

- Removed the `dict:*` functions from this library and moved it to
  `halostatue/fish-dict@v1.x`.

- Removed `is:mac-at-least`. There is no replacement.

- Removed `path:after`, `path:before` as unnecessary ports of functionality
  missing from zsh. Fish supports this natively: `set -a VAR value` (append) and
  `set -p VAR value` (prepend). Newer versions of Fish also include
  `fish_add_path`, which handles this more elegantly and can modify either
  `$PATH` or `$fish_user_paths` directly in a stable manner.

- Reworked `path:clean` and `path:unique` as `list:clean` and `list:uniq`. These
  do not work on variables directly, but are instead intended to be used as
  values to `set`.

- Removed `path:make_unique`. There is no replacement.

- Significant update to the tests, plus fixed an issue where the functions being
  tested are not the functions in the repo.

## 1.2.1

- Improve the `__complete_subcommands` helper function so that it is easier
  to use.

## 1.2

- Adding helper functions for use in completions.

## 1.1.1

- Removed unnecessary `-n(status function)` parameters to `argparse`.

## 1.1

- Add `fishtape` tests for all functions. This required rewriting some
  functions to be more testable (specifically `is:ubuntu`).

- Add various `dict:*` functions for dictionary-like operations.

- Modified `is:mac` to contain the full functionality of `is:mac-at-least` and
  `is:mac-at-least` is a wrapper around this functionality. `is:mac-at-least`
  will be removed in the future.

## 1.0

- Create halostatue/fish-utils-core as a trimmed-down version of
  halostatue/fish-utils. This implements the _minimum_ functionality required
  to support other fish plug-ins I have created. halostatue/fish-utils now
  depends on halostatue/fish-utils-core.
