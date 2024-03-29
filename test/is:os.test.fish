@echo (status basename)

source (status dirname)"/../functions/is:os.fish"

function teardown
    unmock uname
end

@test "is:os returns false when no arguments are provided" (
    is:os
) $status = 1

@test "is:os darwin is true when the current OS is Darwin" (
    mock uname -s 0 "echo Darwin"
    is:os darwin
) $status = 0
