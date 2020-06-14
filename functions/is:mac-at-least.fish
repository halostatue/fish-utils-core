function is:mac-at-least -d 'Returns true if running MacOS of at least the specified version'
    is:mac $argv; or return 1

    test (count $argv) -eq 0; and return 1

    return 0
end
