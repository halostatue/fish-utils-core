source "$current_dirname/../functions/is:os.fish"
source "$current_dirname/../functions/is:mac.fish"
source "$current_dirname/../functions/is:mac-terminal.fish"

function setup
    mock uname -s 0 "echo Darwin"
    set -g ____TERM_PROGRAM $TERM_PROGRAM
end

function teardown
    unmock uname
    set -g TERM_PROGRAM $____TERM_PROGRAM
    set -e ____TERM_PROGRAM
end

@test "is:mac-terminal is false when the current OS is not a MacOS" (
    mock uname -s 0 "echo Nope"
    is:mac-terminal
) $status = 1

@test "is:mac-terminal is true when using iTerm.app" (
    set TERM_PROGRAM iTerm.app
    is:mac-terminal
) $status = 0

@test "is:mac-terminal is true when using Terminal.app" (
    set TERM_PROGRAM Apple_Terminal
    is:mac-terminal
) $status = 0

@test "is:mac-terminal is false when using anything else" (
    set TERM_PROGRAM
    is:mac-terminal
) $status = 1
