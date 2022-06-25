# @halostatue/fish-utils-core:functions/is/os.fish
function is:os -a type -d 'Returns true if the current OS is the specified type'
    test -z $type
    and return 1

    string match -qe $type (string lower (uname -s))
end
