@echo (status basename)

source (status dirname)"/../functions/list:unique.fish"

function teardown
    test -d $___tempdir; and rm -rf $___tempdir
    set -ge ___tempdir
end

@test 'list:unique with no parameters outputs nothing' -z (
    list:unique
)

@test 'list:unique makes no changes if there are no duplicates' (
    list:unique a b c
) = 'a b c'

@test 'list:unique removes duplicates from the list, preserving order' (
    list:unique b a c c a b
) = 'b a c'

@test 'list:unique --directory removes items that are not directories' (
    set -g ___tempdir (mktemp -d)
    list:unique --directory a $___tempdir | string replace --all $___tempdir /x
) = /x

@test 'list:unique --type d removes items that are not directories' (
    set -g ___tempdir (mktemp -d)
    list:unique --type d a $___tempdir | string replace --all $___tempdir /x
) = /x

@test 'list:unique --file removes items that are not files' (
    set -g ___tempdir (mktemp -d)
    touch $___tempdir/y
    list:unique --file a $___tempdir/y | string replace --all $___tempdir /x
) = /x/y

@test 'list:unique --type f removes items that are not files' (
    set -g ___tempdir (mktemp -d)
    touch $___tempdir/y
    list:unique --type f a $___tempdir/y | string replace --all $___tempdir /x
) = /x/y

@test 'list:unique --directory --file removes items that are neither files nor directories' (
    set -g ___tempdir (mktemp -d)
    touch $___tempdir/y
    list:unique --type d --type f a $___tempdir $___tempdir/y | string replace --all $___tempdir /x
) = '/x /x/y'

@test 'list:unique --type d --type f removes items that are neither files nor directories' (
    set -g ___tempdir (mktemp -d)
    touch $___tempdir/y
    list:unique --type d --type f a $___tempdir $___tempdir/y | string replace --all $___tempdir /x
) = '/x /x/y'
