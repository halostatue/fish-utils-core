# @halostatue/fish-utils-core/completions/is_mac_terminal.fish

complete -e -c is_mac_terminal
complete -c is_mac_terminal -f

complete -c is_mac_terminal -a alacritty -d Alacritty
complete -c is_mac_terminal -a io.alacritty -d Alacritty
complete -c is_mac_terminal -a iterm2 -d iTerm2
complete -c is_mac_terminal -a com.googlecode.iterm2 -d iTerm2
complete -c is_mac_terminal -a terminal -d Terminal.app
complete -c is_mac_terminal -a terminal.app -d Terminal.app
complete -c is_mac_terminal -a com.apple.terminal -d Terminal.app
complete -c is_mac_terminal -a kitty -d kitty
complete -c is_mac_terminal -a net.kovidgoyal.kitty -d kitty
complete -c is_mac_terminal -a wezterm -d Wezterm
complete -c is_mac_terminal -a com.github.wez.wezterm -d Wezterm
complete -c is_mac_terminal -a ghostty -d GhosTTY
complete -c is_mac_terminal -a ghost -d GhosTTY
complete -c is_mac_terminal -a com.mitchellh.ghostty -d GhosTTY
