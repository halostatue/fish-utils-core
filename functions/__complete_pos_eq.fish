function __complete_pos_eq
    set -l cmd (commandline -opc)
    test (count $cmd) -eq $argv[1]
end
