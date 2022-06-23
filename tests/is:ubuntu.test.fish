@echo (status basename)

source (status dirname)"/../functions/is:os.fish"
source (status dirname)"/../functions/is:linux.fish"
source (status dirname)"/../functions/is:ubuntu.fish"

function teardown
    mock -e uname
    mock -e lsb_release
end

@test "is:ubuntu is false when the current OS is not a Linux" (
    mock uname -s "echo Nope"
    is:ubuntu
) $status = 1

@test "is:ubuntu is true when the current OS is a Linux" (
    mock uname -s "echo Linux"
    mock lsb_release -i "echo Distributor ID: Nobuntu"
    is:ubuntu
) $status = 1


@test "is:ubuntu is true when the current OS is an Ubuntu Linux" (
    mock uname -s "echo Linux"
    mock lsb_release -i "echo Distributor ID: Ubuntu"
    is:ubuntu
) $status = 0
