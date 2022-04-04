@echo (status basename)

source (status dirname)"/../functions/is:os.fish"
source (status dirname)"/../functions/is:mac.fish"

function teardown
    unmock uname
end

@test "is:mac is true when the current OS is a macOS" (
    mock uname -s 0 "echo Darwin"
    is:mac
) $status = 0

@test "is:mac is false when the current OS is not a macOS" (
    mock uname -s 0 "echo Nope"
    is:mac
) $status = 1

@test "is:mac is true when the current OS is a macOS version later than specified" (
    mock uname -s 0 "echo Darwin"
    mock uname -r 0 "echo 9.1.0"
    is:mac leopard
) $status = 0

@test "is:mac is false when the current OS is a macOS version earlier than specified" (
    mock uname -s 0 "echo Darwin"
    mock uname -r 0 "echo 17.3.2"
    is:mac catalina
) $status = 1
