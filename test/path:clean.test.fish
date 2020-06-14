function path:clean -d 'Clean the specified paths from $PATH or $CDPATH'
    argparse -n(status function) -N1 'c/cdpath' -- $argv
    or return

    set -l var PATH

    test -z {$_flag_cdpath}
    or set var CDPATH

    for item in $argv
        set $var (string match -vr "^$item\$" $$var)
    end
end
