# @halostatue/fish-utils-core:functions/is_mac.fish
function is_mac -d 'Checks that current OS is macOS, optionally at a minimum version'
    if set -q argv[1]
        set -l minimum_version (__macos_version_to_comparable $argv)
        or return

        set -l current_version (__macos_version_to_comparable --current)
        or return

        test $current_version -ge $minimum_version
    else
        is_os darwin
    end
end
