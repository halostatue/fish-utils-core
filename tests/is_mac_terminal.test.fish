@echo (status basename)

source (status dirname)"/../functions/__macos_version_to_comparable.fish"
source (status dirname)"/../functions/is_os.fish"
source (status dirname)"/../functions/is_mac.fish"
source (status dirname)"/../functions/is_mac_terminal.fish"

function teardown
    mock -e uname
end

@test "is_mac_terminal is false when the current OS is not a macOS" (
    mock uname -s "echo Nope"
    is_mac_terminal
) $status = 1

@test "is_mac_terminal is true when using iTerm.app" (
    mock uname -s "echo Darwin"
    __CFBundleIdentifier=com.googlecode.iterm2 is_mac_terminal
) $status = 0

@test "is_mac_terminal is true when using Terminal.app" (
    mock uname -s "echo Darwin"
    __CFBundleIdentifier=com.apple.Terminal is_mac_terminal
) $status = 0

@test "is_mac_terminal is true when using Alacritty" (
    mock uname -s "echo Darwin"
    __CFBundleIdentifier=io.alacritty is_mac_terminal
) $status = 0

@test "is_mac_terminal is true when using kitty" (
    mock uname -s "echo Darwin"
    __CFBundleIdentifier=net.kovidgoyal.kitty is_mac_terminal
) $status = 0

@test "is_mac_terminal is false when using anything else" (
    mock uname -s "echo Darwin"
    __CFBundleIdentifier=somethingUnknown is_mac_terminal
) $status = 1
