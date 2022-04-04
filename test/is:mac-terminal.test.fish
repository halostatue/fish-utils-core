@echo (status basename)

source (status dirname)"/../functions/is:os.fish"
source (status dirname)"/../functions/is:mac.fish"
source (status dirname)"/../functions/is:mac-terminal.fish"

function teardown
    unmock uname
end

@test "is:mac-terminal is false when the current OS is not a macOS" (
    mock uname -s 0 "echo Nope"
    is:mac-terminal
) $status = 1

@test "is:mac-terminal is true when using iTerm.app" (
    mock uname -s 0 "echo Darwin"
    __CFBundleIdentifier=com.googlecode.iterm2 is:mac-terminal
) $status = 0

@test "is:mac-terminal is true when using Terminal.app" (
    mock uname -s 0 "echo Darwin"
    __CFBundleIdentifier=com.apple.Terminal is:mac-terminal
) $status = 0

@test "is:mac-terminal is true when using Alacritty" (
    mock uname -s 0 "echo Darwin"
    __CFBundleIdentifier=io.alacritty is:mac-terminal
) $status = 0

@test "is:mac-terminal is true when using kitty" (
    mock uname -s 0 "echo Darwin"
    __CFBundleIdentifier=net.kovidgoyal.kitty is:mac-terminal
) $status = 0

@test "is:mac-terminal is false when using anything else" (
    mock uname -s 0 "echo Darwin"
    __CFBundleIdentifier=somethingUnknown is:mac-terminal
) $status = 1
