function __complete_no_subcommand --description 'Generate a completion function that returns true if one of the following subcommands is not found)'
  set -l fname __complete_no_subcommand__$argv[1]
  set -l subcommands $argv[2..-1]

  echo "
function $fname
    for i in (commandline -opc)
        if contains -- \$i $subcommands
            return 1
        end
    end
    return 0
end" | source
end
