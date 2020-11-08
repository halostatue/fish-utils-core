# fish-utils-core Changelog

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
