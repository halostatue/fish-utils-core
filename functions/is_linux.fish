# @halostatue/fish-utils-core/functions/is_linux.fish:v3.2.0

function is_linux --description 'Check if the current OS is Linux with optional flavour checking'
    is_os linux
    or return 1

    set --query argv[1]
    or return 0

    set --function id (cat /etc/os-release | string replace --filter --regex '^ID="?([^"]+)"?' '$1')
    set --function id_like (cat /etc/os-release | string replace --filter --regex '^ID_LIKE="?([^"]+)"?' '$1')
    set --function match (string lower $argv[1])

    test $id = $match
    and return 0

    test -z "$id_like"
    and return 1

    test $id_like = $match
end
