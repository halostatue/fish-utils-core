# @halostatue/fish-utils-core/functions/is_os.fish:v3.2.0

function is_os --argument-names type --description 'Checks that current OS matches specified type by uname -s'
    test -z $type
    and return 1

    string match --quiet --entire $type (string lower (uname -s))
end
