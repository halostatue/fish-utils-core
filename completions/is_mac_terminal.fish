# @halostatue/fish-utils-core/completions/is_mac_terminal.fish:v3.2.0

complete --erase --command is_mac_terminal
complete --command is_mac_terminal --no-files

complete --command is_mac_terminal --arguments alacritty --description Alacritty
complete --command is_mac_terminal --arguments io.alacritty --description Alacritty
complete --command is_mac_terminal --arguments iterm2 --description iTerm2
complete --command is_mac_terminal --arguments com.googlecode.iterm2 --description iTerm2
complete --command is_mac_terminal --arguments terminal --description Terminal.app
complete --command is_mac_terminal --arguments terminal.app --description Terminal.app
complete --command is_mac_terminal --arguments com.apple.terminal --description Terminal.app
complete --command is_mac_terminal --arguments kitty --description kitty
complete --command is_mac_terminal --arguments net.kovidgoyal.kitty --description kitty
complete --command is_mac_terminal --arguments wezterm --description Wezterm
complete --command is_mac_terminal --arguments com.github.wez.wezterm --description Wezterm
complete --command is_mac_terminal --arguments ghostty --description GhosTTY
complete --command is_mac_terminal --arguments ghost --description GhosTTY
complete --command is_mac_terminal --arguments com.mitchellh.ghostty --description GhosTTY
