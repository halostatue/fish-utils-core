# @halostatue/fish-utils-core/functions/list_unique.fish:v3.2.0

function list_unique --description 'Ensures that the values in the list are unique, preserving order'
    argparse t/type=+ d/directory f/file -- $argv
    or return 1

    test (count $argv) -eq 0
    and return 0

    set --function type_test

    if set --query _flag_directory || contains d -- $_flag_type
        set type_test "$type_test"d
    end

    if set --query _flag_file || contains f -- $_flag_type
        set type_test "$type_test"f
    end

    set --function result

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
        or set --append result $item
    end

    echo $result
end
