# @halostatue/fish-utils-core/functions/is_mac.fish:v3.2.0

function is_mac --description 'Checks that current OS is macOS, optionally at a minimum version'
    if set --query argv[1]
        set --local minimum_version (__macos_version_to_comparable $argv)
        or return

        set --local current_version (__macos_version_to_comparable --current)
        or return

        test $current_version -ge $minimum_version
    else
        is_os darwin
    end
end
