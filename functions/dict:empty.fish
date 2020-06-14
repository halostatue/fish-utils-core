function dict:empty -a name -d 'Returns true if $name has no keys'
    test -z $name; and begin
        echo >&2 'dict:empty: requires a name.'
    end
    test (count (dict:::keys $name)) -eq 0
end
