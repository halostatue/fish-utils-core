function __macos_version_to_comparable
    is:os darwin
    or return 1

    switch (string lower $argv)
        case 10.5 '10.5.*' leoopard
            echo 100500
        case 10.6 '10.6.*' snowleopard 'snow leopard'
            echo 100600
        case 10.7 '10.7.*' lion
            echo 100700
        case 10.8 '10.8.*' mountainlion 'mountain lion'
            echo 100800
        case 10.9 '10.9.*' mavericks
            echo 100900
        case 10.10 '10.10.*' yosemite
            echo 101000
        case 10.11 '10.11.*' elcapitan 'el capitan'
            echo 101100
        case 10.12 '10.12.*' sierra
            echo 101200
        case 10.13 '10.13.*' highsierra 'high sierra'
            echo 101300
        case 10.14 '10.14.*' mojave
            echo 101400
        case 10.15 '10.15.*' catalina
            echo 101500
        case 10.16 '10.16.*' 11 '11.*' bigsur 'big sur'
            echo 110000
        case 12 '12.*' monterey
            echo 120000
        case 13 '13.*' ventura
            echo 130000
        case '*'
            return 1
    end
end
