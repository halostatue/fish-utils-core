@echo (status basename)

source (status dirname)"/../functions/is:os.fish"
source (status dirname)"/../functions/is:freebsd.fish"

function teardown
    mock -e uname
end

@test "is:freebsd is true when the current OS is a FreeBSD" (
    mock uname \* "echo FreeBSD"
    is:freebsd
) $status = 0

@test "is:freebsd is false when the current OS is not a FreeBSD" (
    mock uname \* "echo Nope"
    is:freebsd
) $status = 1
