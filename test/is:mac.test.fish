source "$current_dirname/../functions/is:os.fish"
source "$current_dirname/../functions/is:mac.fish"

function teardown
    unmock uname -s
    unmock uname -r
end

@test "is:mac is true when the current OS is a MacOS" (
    mock uname -s 0 "echo Darwin"
    is:mac
) $status = 0

@test "is:mac is false when the current OS is not a MacOS" (
    mock uname -s 0 "echo Nope"
    is:mac
) $status = 1

@test "is:mac is true when the current OS is a MacOS version later than specified" (
    mock uname -s 0 "echo Darwin"
    mock uname -r 0 "echo 9.1.0"
    is:mac leopard
) $status = 0

@test "is:mac is false when the current OS is a MacOS version earlier than specified" (
    mock uname -s 0 "echo Darwin"
    mock uname -r 0 "echo 17.3.2"
    is:mac catalina
) $status = 1
