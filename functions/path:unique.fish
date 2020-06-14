function path:unique -d 'Ensures that the provided value is unique in $PATH or $CDPATH'
    argparse -N1 'c/cdpath' 'a/append' 't/test' -- $argv
    or return

    set -l var PATH

    test -z {$_flag_cdpath}
    or set var CDPATH

    set -l prepend true
    test -z {$_flag_append}
    or set prepend false

    set -l test false
    test -z {$_flag_test}
    or set test true

    set -l args $argv
    $prepend
    and set args $args[-1..1]

    for item in $args
        if $test
            test -d $item
            or continue
        end

        $prepend
        and set $var $item (string match -vr "^$item\$" $$var)
        or set $var (string match -vr "^$item\$" $$var) $item
    end
end
