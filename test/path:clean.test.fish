source "$current_dirname/../functions/path:clean.fish"

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

@test 'path:clean /x removes all instances of /x from $PATH' -z (
    set PATH $___tempdir $PATH $___tempdir
    path:clean $___tempdir
    contains -i $___tempdir $PATH
)

@test 'path:clean /x --cdpath removes all instances of /x from $CDPATH' -z (
    set CDPATH $___tempdir $CDPATH $___tempdir
    path:clean $___tempdir --cdpath
    contains -i $___tempdir $CDPATH
)
