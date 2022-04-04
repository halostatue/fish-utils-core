function list:clean -d 'Remove first list values from second list values'
    set -q argv[1]
    or return 0

    set -l pivot (contains -i '--' -- $argv)

    if test -z $pivot || test $pivot -eq 1
        echo $argv
        return 0
    end

    set -l needles $argv[1..(math $pivot - 1)]
    set -l haystack $argv[(math $pivot + 1)..-1]
    set -l result

    for candidate in $haystack
        contains $candidate -- $needles
        and continue

        set -a result $candidate
    end

    echo $result
    return 0
end
