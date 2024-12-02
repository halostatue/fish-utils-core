@echo (status basename)

source (status dirname)"/../functions/is_os.fish"

function teardown
    mock -e uname
end

@test "is_os returns false when no arguments are provided" (
    is_os
) $status = 1

@test "is_os darwin is true when the current OS is Darwin" (
    mock uname -s "echo Darwin"
    is_os darwin
) $status = 0
