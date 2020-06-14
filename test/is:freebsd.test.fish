source "$current_dirname/../functions/is:os.fish"
source "$current_dirname/../functions/is:freebsd.fish"

function teardown
    unmock uname
end

@test "is:freebsd is true when the current OS is a FreeBSD" (
    mock uname \* 0 "echo FreeBSD"
    is:freebsd
) $status = 0

@test "is:freebsd is false when the current OS is not a FreeBSD" (
    mock uname \* 0 "echo Nope"
    is:freebsd
) $status = 1
