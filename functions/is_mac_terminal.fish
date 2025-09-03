# @halostatue/fish-utils-core/functions/is_mac_terminal.fish:v3.2.0

function is_mac_terminal --description 'Checks that the current terminal is well-known'
    is_mac
    or return 1

    if set --query argv[1]
        set --function match (string lower $argv)

        switch $match
            case alacritty io.alacritty
                set match io.alacritty
            case iterm2 com.googlecode.iterm2
                set match com.googlecode.iterm2
            case terminal terminal.app com.apple.terminal
                set match com.apple.Terminal
            case kitty net.kovidgoyal.kitty
                set match net.kovidgoyal.kitty
            case wezterm com.github.wez.wezterm
                set match com.github.wez.wezterm
            case ghostty ghost com.mitchellh.ghostty
                set match com.mitchellh.ghostty
        end

        test $__CFBundleIdentifier = $match
    else
        contains -- $__CFBundleIdentifier \
            io.alacritty \
            com.googlecode.iterm2 \
            com.apple.Terminal \
            net.kovidgoyal.kitty \
            com.github.wez.wezterm \
            com.mitchellh.ghostty
    end
end
