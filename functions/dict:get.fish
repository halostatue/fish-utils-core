function dict:get -a name key -d 'Gets $name{$key}'
    test -z $name; and begin
        echo >&2 'dict:get: requires a name.'
        return 1
    end

    test -z $key; and begin
        echo >&2 'dict:get: requires a key.'
        return 1
    end

    set -l _var (dict:::key $name $key)
    echo $$_var
end
