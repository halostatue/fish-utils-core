# @halostatue/fish-utils-core/tests/is_linux.test.fish:v3.1.1
@echo (status basename)

source (status dirname)"/../functions/is_os.fish"
source (status dirname)"/../functions/is_linux.fish"

function teardown
    mock --erase uname
    mock --erase cat '*'
end

@test "is_linux is true when the current OS is a Linux" (
    mock uname -s "echo Linux"
    is_linux
) $status = 0

@test "is_linux is false when the current OS is not a Linux" (
    mock uname -s "echo Nope"
    is_linux
) $status = 1

@test "is_linux ubuntu  is false when the current OS is Linux but not Ubuntu" (
    mock uname -s "echo Linux"
    mock cat '*' 'printf "ID=debian\n"'
    is_linux ubuntu
) $status = 1

@test "is_linux ubuntu is true when the current OS is an Ubuntu Linux" (
    mock uname -s "echo Linux"
    mock cat '*' 'printf "ID=ubuntu\nID_LIKE=debian\n"'
    is_linux ubuntu
) $status = 0
