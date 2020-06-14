source "$current_dirname/../functions/path:unique.fish"

set size (math (count $PATH) + 1)

function setup
    set -g ___tempdir (mktemp -d)
    set -g ___path $PATH
    set -g ___cdpath $CDPATH
end

function teardown
    set -g PATH $___path
    set -g CDPATH $___cdpath
    set -ge ___path
    set -ge ___cdpath

    test -d $___tempdir; and rmdir $___tempdir
    set -ge ___tempdir
end

@test 'path:unique /x prepends /x to $PATH' (
    path:unique $___tempdir
    contains -i $___tempdir $PATH
) = 1

@test 'path:unique /x --append appends /x to $PATH' (
    path:unique $___tempdir --append
    contains -i $___tempdir $PATH
) = $size

@test 'path:unique /x moves /x to the front if it already exists' (
    set PATH $PATH $___tempdir
    path:unique $___tempdir
    contains -i $___tempdir $PATH
) = 1

@test 'path:unique /x --append moves /x to the tail if it already exists' (
    set PATH $___tempdir $PATH
    path:unique $___tempdir --append
    contains -i $___tempdir $PATH
) = $size

@test 'path:unique /x --test does not add /x if it does not exist' -z (
    rmdir $___tempdir
    path:unique $___tempdir --test
    contains -i $___tempdir $PATH
)

@test 'path:unique /x --test adds /x if it exists' (
    path:unique $___tempdir --test
    contains -i $___tempdir $PATH
) = 1

@test 'path:unique /x --cdpath prepends /x to $CDPATH' (
    path:unique $___tempdir --cdpath
    contains -i $___tempdir $CDPATH
) = 1
