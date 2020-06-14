function dict:keys -a name -d 'Shows all keys for dictionary $name'
    test -z $name; and begin
        echo >&2 'dict:keys: requires a name.'
        return 1
    end

    set -l braces (string join '|' (string escape --style=var '{') (string escape --style=var '}'))
    set -l result

    for key in (dict:::keys $name)
        set -a result (
          string unescape --style=var $key |
          string replace "__dict{$name}" '' |
          string replace -r -a '[{}$]' ''
        )
    end

    echo $result
end
