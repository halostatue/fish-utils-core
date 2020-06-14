source "$current_dirname/../functions/path:unique.fish"
source "$current_dirname/../functions/path:after.fish"

set size (math (count $PATH) + 1)
set cdpath_size (math (count $CDPATH) + 1)

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

@test 'path:after /x appends /x to $PATH' (
    path:after $___tempdir
    contains -i $___tempdir $PATH
) = $size

@test 'path:after /x moves /x to the tail if it already exists' (
    set PATH $___tempdir $PATH
    path:after $___tempdir
    contains -i $___tempdir $PATH
) = $size

@test 'path:after /x --test does not add /x if it does not exist' -z (
    rmdir $___tempdir
    path:after $___tempdir --test
    contains -i $___tempdir $PATH
)

@test 'path:after /x --test adds /x if it exists' (
    path:after $___tempdir --test
    contains -i $___tempdir $PATH
) = $size

@test 'path:after /x --cdpath appends /x to $CDPATH' (
    path:after $___tempdir --cdpath
    contains -i $___tempdir $CDPATH
) = $cdpath_size
