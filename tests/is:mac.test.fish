@echo (status basename)

source (status dirname)"/../functions/is:os.fish"
source (status dirname)"/../functions/is:mac.fish"

function teardown
    mock -e uname
    mock -e sw_vers
end

@test "is:mac is true when the current OS is a macOS" (
    mock uname -s "echo Darwin"
    is:mac
) $status = 0

@test "is:mac is false when the current OS is not a macOS" (
    mock uname -s "echo Nope"
    is:mac
) $status = 1

@test "is:mac is true when the current OS is a macOS version later than specified" (
    mock uname -s "echo Darwin"
    mock sw_vers -productVersion "echo 10.9.0"
    is:mac leopard
) $status = 0

@test "is:mac is false when the current OS is a macOS version earlier than specified" (
    mock uname -s "echo Darwin"
    mock sw_vers -productVersion "echo 10.9.0"
    is:mac catalina
) $status = 1
