function is:mac -d 'Returns true if the OS is macOS (Darwin). If a version value is specified, must be running at least that version.'
    is:os darwin
    or return 1

    set -q argv[1]
    or return 0

    set -l darwin_version (__macos_version_to_comparable $argv)
    or return

    set -l current_version (__macos_version_to_comparable $argv (sw_vers -productVersion))
    or return

    test $current_version -ge $darwin_version
end
