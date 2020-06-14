source "$current_dirname/../functions/is:os.fish"
source "$current_dirname/../functions/is:linux.fish"
source "$current_dirname/../functions/is:ubuntu.fish"

function teardown
    unmock uname
    unmock lsb_release
end

@test "is:ubuntu is false when the current OS is not a Linux" (
    mock uname -s 0 "echo Nope"
    is:ubuntu
) $status = 1

@test "is:ubuntu is true when the current OS is a Linux" (
    mock uname -s 0 "echo Linux"
    mock lsb_release -i 0 "echo Distributor ID: Nobuntu"
    is:ubuntu
) $status = 1


@test "is:ubuntu is true when the current OS is an Ubuntu Linux" (
    mock uname -s 0 "echo Linux"
    mock lsb_release -i 0 "echo Distributor ID: Ubuntu"
    is:ubuntu
) $status = 0
