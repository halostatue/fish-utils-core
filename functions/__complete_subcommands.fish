function __complete_subcommands --description 'Returns true if the subcommand chain provided exists'
    set -l cmd (commandline -poc)
    set -e cmd[1]
    set -l argc (count $argv)

    test $argc -ne 0
    and test (count $cmd) -ne 0
    and test (string join ';' $argv) = (string join ';' $cmd[1..$argc])
end
