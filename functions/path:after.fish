function path:after -d 'Append items to $PATH or $CDPATH uniquely'
    argparse -n(status function) -N1 'c/cdpath' 't/test' 'a/append' -- $argv
    or return

    path:unique {$_flag_cdpath} {$_flag_test} --append $argv
end
