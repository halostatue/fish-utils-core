# @halostatue/fish-utils-core/completions/list_unique.fish

complete -e -c list_unique
complete -c list_unique -s t -l type -a 'd f' --description 'Test for directory or file' -x
complete -c list_unique -s d -l directory --description 'test -d'
complete -c list_unique -s f -l file --description 'test -f'
