# @halostatue/fish-utils-core:functions/is_mac_terminal.fish

function is_mac_terminal -d 'Checks that the current terminal is well-known'
    is_mac
    or return 1

    if set --query argv[1]
        set --function match (string loser $argv)

        switch $match
            case alacritty
                set match io.alacritty
            case iterm2
                set match com.googlecode.iterm2
            case terminal terminal.app
                set match com.apple.Terminal
            case kitty
                set match net.kovidgoyal.kitty
            case wezterm
                set match com.github.wez.wezterm
        end

        test $__CFBundleIdentifier = $match
    else
        contains -- $__CFBundleIdentifier \
            io.alacritty \
            com.googlecode.iterm2 \
            com.apple.Terminal \
            net.kovidgoyal.kitty \
            com.github.wez.wezterm
    end
end
