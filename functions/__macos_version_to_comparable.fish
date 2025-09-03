# @halostatue/fish-utils-core/functions/__macos_version_to_comparable.fish:v3.2.0

# Convert the macOS version to a comparable number. The special version 'current' or
# '--current' will use sw_vers to produce a value.
function __macos_version_to_comparable --description 'Convert the macOS version to a comparable number'
    is_os darwin
    or return 1

    switch (string lower -- $argv)
        case 10.5 '10.5.*' leopard
            printf 10_05_000
        case 10.6 '10.6.*' snowleopard 'snow leopard'
            printf 10_06_000
        case 10.7 '10.7.*' lion
            printf 10_07_000
        case 10.8 '10.8.*' mountainlion 'mountain lion'
            printf 10_08_000
        case 10.9 '10.9.*' mavericks
            printf 10_09_000
        case 10.10 '10.10.*' yosemite
            printf 10_10_000
        case 10.11 '10.11.*' elcapitan 'el capitan'
            printf 10_11_000
        case 10.12 '10.12.*' sierra
            printf 10_12_000
        case 10.13 '10.13.*' highsierra 'high sierra'
            printf 10_13_000
        case 10.14 '10.14.*' mojave
            printf 10_14_000
        case 10.15 '10.15.*' catalina
            printf 10_15_000
        case 10.16 '10.16.*' 11 '11.*' bigsur 'big sur'
            printf 11_00_000
        case 12 '12.*' monterey
            printf 12_00_000
        case 13 '13.*' ventura
            printf 13_00_000
        case 14 '14.*' sonoma
            printf 14_00_000
        case 15 '15.*' sequoia
            printf 15_00_000
        case 26 '26.*' tahoe
            printf 26_00_000
        case current --current
            printf '%02d_%02d_%03d' (sw_vers -productVersion | string split '.')
        case '*'
            return 1
    end | string replace --all _ ''
end
