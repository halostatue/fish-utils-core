function dict:::key -a name key
    test -z $name -o -z $key; and return 1
    string escape --style=var "__dict{$name}{$key}"
end
