# @halostatue/fish-utils-core/tests/list_clean.test.fish:v3.1.2

@echo (status basename)

source (status dirname)"/../functions/list_clean.fish"

@test 'list_clean with no parameters outputs nothing' -z (
    list_clean
)

@test 'list_clean without a pivot returns the original list' (
    list_clean a b c
) = 'a b c'

@test 'list_clean with an empty list before the pivot returns the second list' (
    list_clean -- a b c
) = 'a b c'

@test 'list_clean with an empty list after the pivot returns an empty list' -z (
    list_clean a b c --
)

@test 'list_clean with no values from the first list in the second list returns the second list' (
    list_clean a b c -- d e f
) = 'd e f'

@test 'list_clean removes values in the first list from the second list' (
    list_clean a b c -- a b c d e f a b c
) = 'd e f'
