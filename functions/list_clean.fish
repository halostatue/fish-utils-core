# @halostatue/fish-utils-core/functions/list_clean.fish:v3.1.1
# @halostatue/fish-utils-core:functions/list_clean.fish:v3.1.1

function list_clean --description 'Remove first list values from second list values'
    set --query argv[1]
    or return 0

    set --query pivot (contains -i '--' -- $argv)

    if test -z $pivot || test $pivot -eq 1
        echo $argv
        return 0
    end

    set --function needles $argv[1..(math $pivot - 1)]
    set --function haystack $argv[(math $pivot + 1)..-1]
    set --function result

    for candidate in $haystack
        contains $candidate -- $needles
        and continue

        set --append result $candidate
    end

    echo $result
    return 0
end
