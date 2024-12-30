# @halostatue/fish-utils-core:functions/is_os.fish

function is_os -a type -d 'Checks that current OS matches specified type by uname -s'
    test -z $type
    and return 1

    string match -qe $type (string lower (uname -s))
end
