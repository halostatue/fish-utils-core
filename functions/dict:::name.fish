function dict:::name -a name
    test -z $name; and return 1
    string escape --style=var "__dict{$name}"
end
