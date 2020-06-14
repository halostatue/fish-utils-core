function dict:_name -a name -d 'Create a dictionary name from the argument'
    test -z $name; and return 1
    string escape --style=var "__dict{$name}"
end

function dict:_key -a name key -d 'Create a dictionary key name'
    test -z $name -o -z $key; and return 1

    string escape --style=var "__dict{$name}{$key}"
end

function dict:set -d 'Sets $name{$key}=$argv'
    argparse -n(status function) -xq,e 'q/query' 'e/erase' -- $argv
    or return

    set -l mode assign
    test -z {$_flag_query}; or set mode query
    test -z {$_flag_erase}; or set mode erase

    switch $mode
        case assign
            if test (count $argv) -lt 2
                echo >&2 'dict:set requires a dictionary name and key for assignment.'
                return 1
            end

    end

    dict:set:_{$mode} $argv
end

function dict:get -a name key -d 'Gets $name{$key}'
    set -l _var (dict:_key $name $key)
    echo $$_var
end

function dict:set:_assign -a name key
    set -l _var (dict:_key $name $key)
    set -g $_var $argv[3..-1]
end

function dict:set:_erase -a name key
    if test -z $key
        set -l _dict (dict:_name $name)
        for key in (complete -C\$$_dict)
            set -ge (string replace '$' '' $key)
        end
    else
        set -l _key (dict:_key $name $key)
        set -ge $_key
    end
end

function dict:set:_query -a name key
    if test -z $key
        not dict:empty $name
    else
        dict:has_key $name $key
    end
end

function dict:empty -a name -d 'Returns true if $name has no keys'
    set -l _dict (dict:_name $name)
    set -l keys (complete -C\$$_dict)
    test (count $keys) -eq 0
end

function dict:has_key -a name key -d 'Returns true if $name{$key} exists'
    set -l _var (dict:_key $name $key)
    set -gq $_var
end

function dict:keys -a name -d 'Shows all keys for dictionary $name'
    set -l _dict (dict:_name $name)
    or return 1

    set -l keys (complete -C\$$_dict)
    set -l braces (string join '|' (string escape --style=var '{') (string escape --style=var '}'))
    set -l result

    for key in $keys
        set -a result (
          string replace $_dict '_' $key |
          string replace -r -a $braces '' |
          string replace '$' '' |
          string unescape $v
        )
    end

    echo $result
end
