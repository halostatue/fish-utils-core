source "$current_dirname/../functions/path:unique.fish"
source "$current_dirname/../functions/path:before.fish"

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

@test 'path:before /x prepends /x to $PATH' (
    path:before $___tempdir
    contains -i $___tempdir $PATH
) = 1

@test 'path:before /x --append still prepends /x to $PATH' (
    path:before $___tempdir --append
    contains -i $___tempdir $PATH
) = 1

@test 'path:before /x moves /x to the head if it already exists' (
    set PATH $PATH $___tempdir
    path:before $___tempdir
    contains -i $___tempdir $PATH
) = 1

@test 'path:before /x --test does not add /x if it does not exist' -z (
    rmdir $___tempdir
    path:before $___tempdir --test
    contains -i $___tempdir $PATH
)

@test 'path:before /x --test adds /x if it exists' (
    path:before $___tempdir --test
    contains -i $___tempdir $PATH
) = 1

@test 'path:before /x --cdpath prepend /x to $CDPATH' (
    path:before $___tempdir --cdpath
    contains -i $___tempdir $CDPATH
) = 1
