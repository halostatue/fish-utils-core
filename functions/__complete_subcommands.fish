function __complete_subcommands --description 'Returns true if the subcommand chain provided exists'
    set -l cmd (commandline -poc)
    set -e cmd[1]

    set -l argc (count $argv)
    set -l cmdc (count $cmd)

    test $argc -eq 0 -o $cmdc -eq 0 -o $argc -ne $cmdc
    and return 1

    set -l i

    for i in (seq 1 $argc)
      test $argv[$i] = '*'; and continue
      test $argv[$i] = $cmd[$i]; and continue

      return 1
    end

    return 0
end
