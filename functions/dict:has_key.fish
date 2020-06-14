function dict:has_key -a name key -d 'Returns true if $name{$key} exists'
    test -z $name; and begin
        echo >&2 'dict:has_key: requires a name.'
        return 1
    end

    test -z $key; and begin
        echo >&2 'dict:has_key: requires a key.'
        return 1
    end

    set -l _var (dict:::key $name $key)
    set -gq $_var
end
