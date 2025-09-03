# @halostatue/fish-utils-core/tests/list_unique.test.fish:v3.2.0

@echo (status basename)

source (status dirname)"/../functions/list_unique.fish"

function teardown
    test -d $___tempdir; and rm -rf $___tempdir
    set --global --erase ___tempdir
end

@test 'list_unique with no parameters outputs nothing' -z (
    list_unique
)

@test 'list_unique makes no changes if there are no duplicates' (
    list_unique a b c
) = 'a b c'

@test 'list_unique removes duplicates from the list, preserving order' (
    list_unique b a c c a b
) = 'b a c'

@test 'list_unique --directory removes items that are not directories' (
    set --global ___tempdir (mktemp -d)
    list_unique --directory a $___tempdir | string replace --all $___tempdir /x
) = /x

@test 'list_unique --type d removes items that are not directories' (
    set --global ___tempdir (mktemp -d)
    list_unique --type d a $___tempdir | string replace --all $___tempdir /x
) = /x

@test 'list_unique --file removes items that are not files' (
    set --global ___tempdir (mktemp -d)
    touch $___tempdir/y
    list_unique --file a $___tempdir/y | string replace --all $___tempdir /x
) = /x/y

@test 'list_unique --type f removes items that are not files' (
    set --global ___tempdir (mktemp -d)
    touch $___tempdir/y
    list_unique --type f a $___tempdir/y | string replace --all $___tempdir /x
) = /x/y

@test 'list_unique --directory --file removes items that are neither files nor directories' (
    set --global ___tempdir (mktemp -d)
    touch $___tempdir/y
    list_unique --type d --type f a $___tempdir $___tempdir/y | string replace --all $___tempdir /x
) = '/x /x/y'

@test 'list_unique --type d --type f removes items that are neither files nor directories' (
    set --global ___tempdir (mktemp -d)
    touch $___tempdir/y
    list_unique --type d --type f a $___tempdir $___tempdir/y | string replace --all $___tempdir /x
) = '/x /x/y'
