function is:mac-terminal -d 'Returns true if currently using a well-known macOS terminal'
    is:mac
    or return 1

    switch $__CFBundleIdentifier
        case io.alacritty com.googlecode.iterm2 com.apple.Terminal net.kovidgoyal.kitty
            return 0

        case '*'
            return 1
    end
end
