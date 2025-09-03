# @halostatue/fish-utils-core/tests/is_mac.test.fish:v3.2.0

@echo (status basename)

source (status dirname)"/../functions/__macos_version_to_comparable.fish"
source (status dirname)"/../functions/is_os.fish"
source (status dirname)"/../functions/is_mac.fish"

function teardown
    mock --erase uname
    mock --erase sw_vers
end

@test "is_mac is true when the current OS is a macOS" (
    mock uname -s "echo Darwin"
    is_mac
) $status = 0

@test "is_mac is false when the current OS is not a macOS" (
    mock uname -s "echo Nope"
    is_mac
) $status = 1

@test "is_mac is true when the current OS is a macOS version later than specified" (
    mock uname -s "echo Darwin"
    mock sw_vers -productVersion "echo 10.9.0"
    is_mac leopard
) $status = 0

@test "is_mac is false when the current OS is a macOS version earlier than specified" (
    mock uname -s "echo Darwin"
    mock sw_vers -productVersion "echo 10.9.0"
    is_mac catalina
) $status = 1
