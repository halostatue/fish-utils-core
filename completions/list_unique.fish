# @halostatue/fish-utils-core/completions/list_unique.fish:v3.2.0

complete --erase --command list_unique
complete --command list_unique --short-option t --long-option type --arguments 'd f' --description 'Test for directory or file' --exclusive
complete --command list_unique --short-option d --long-option directory --description 'type -d'
complete --command list_unique --short-option f --long-option file --description 'type -f'
