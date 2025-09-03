# @halostatue/fish-utils-core/tests/is_freebsd.test.fish:v3.2.0

@echo (status basename)

source (status dirname)"/../functions/is_os.fish"
source (status dirname)"/../functions/is_freebsd.fish"

function teardown
    mock --erase uname
end

@test "is_freebsd is true when the current OS is a FreeBSD" (
    mock uname \* "echo FreeBSD"
    is_freebsd
) $status = 0

@test "is_freebsd is false when the current OS is not a FreeBSD" (
    mock uname \* "echo Nope"
    is_freebsd
) $status = 1
