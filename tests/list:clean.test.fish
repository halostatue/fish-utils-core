@echo (status basename)

source (status dirname)"/../functions/list:clean.fish"

@test 'list:clean with no parameters outputs nothing' -z (
    list:clean
)

@test 'list:clean without a pivot returns the original list' (
    list:clean a b c
) = 'a b c'

@test 'list:clean with an empty list before the pivot returns the second list' (
    list:clean -- a b c
) = 'a b c'

@test 'list:clean with an empty list after the pivot returns an empty list' -z (
    list:clean a b c --
)

@test 'list:clean with no values from the first list in the second list returns the second list' (
    list:clean a b c -- d e f
) = 'd e f'

@test 'list:clean removes values in the first list from the second list' (
    list:clean a b c -- a b c d e f a b c
) = 'd e f'
