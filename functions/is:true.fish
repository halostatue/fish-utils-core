# @halostatue/fish-utils-core:functions/is/true.fish
function is:true
    test -z $argv[1]
    and return 1

    switch (string lower $argv[1])
        case 1 y yes t true o on
            return 0
        case '*'
            return 1
    end
end
