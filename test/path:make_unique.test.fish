source "$current_dirname/../functions/path:make_unique.fish"

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

@test 'path:make_unique /x ensures that the first instance of /x is the correct one $PATH' (
    set PATH $PATH[1] $___tempdir $PATH[2..-1] $___tempdir
    path:make_unique
    contains -i $___tempdir $PATH
) = 2

@test 'path:make_unique /x ensures that the first instance of /x is the correct one $CDPATH' (
    set CDPATH $CDPATH[1] $___tempdir $CDPATH[2..-1] $___tempdir
    path:make_unique --cdpath
    contains -i $___tempdir $CDPATH
) = 2
