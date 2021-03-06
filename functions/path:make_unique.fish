function path:make_unique -d 'Makes sure that each entry in $PATH or $CDPATH is uniquqe, with order preserved.'
    argparse -X0 'c/cdpath' -- $argv
    or return

    set -l var PATH

    test -z {$_flag_cdpath}
    or set var CDPATH

    set -l value

    for item in $$var
        string match -qr "^$item\$" $value
        and continue

        set value $value $item
    end

    if test -z {$_flag_n}
        set $var $value
    else
        echo "set $var $value"
    end
end
