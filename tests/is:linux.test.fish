@echo (status basename)

source (status dirname)"/../functions/is:os.fish"
source (status dirname)"/../functions/is:linux.fish"

function teardown
    mock -e uname
end

@test "is:linux is true when the current OS is a Linux" (
    mock uname \* "echo Linux"
    is:linux
) $status = 0

@test "is:linux is false when the current OS is not a Linux" (
    mock uname \* "echo Nope"
    is:linux
) $status = 1
