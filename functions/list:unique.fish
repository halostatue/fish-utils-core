function list:unique -d 'Ensures that the values in the list are unique, preserving order'
    argparse t/type=+ d/directory f/file -- $argv
    or return 1

    test (count $argv) -eq 0
    and return 0

    set -l type_test

    if set -q _flag_directory || contains d -- $_flag_type
        set type_test "$type_test"d
    end

    if set -q _flag_file || contains f -- $_flag_type
        set type_test "$type_test"f
    end

    set -l result

    for item in $argv
        switch $type_test
            case df
                test -d $item
                or test -f $item
                or continue
            case d
                test -d $item
                or continue
            case f
                test -f $item
                or continue
        end

        contains $item -- $result
        or set -a result $item
    end

    echo $result
end
