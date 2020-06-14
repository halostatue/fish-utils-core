source "$current_dirname/../functions/_dict.fish"

function teardown
    dict:set -e x
end

@test "dict:set fails without a dictionary and key" (
    dict:set 2>&1
) = "dict:set requires a dictionary name and key for assignment."

@test "dict:set x fails without a key" (
    dict:set x 2>&1
) = "dict:set requires a dictionary name and key for assignment."

@test "dict:set x y assigns an empty value to x{y}" (
    dict:set x y 2>&1
    dict:get x y
) = ""

@test "dict:set x y a sets x{y} = a" (
    dict:set x y a
    dict:get x y
) = "a"

@test "dict:set x y a b c sets x{y} = a b c" (
    dict:set x y a b c
    dict:get x y
) = "a b c"

@test "dict:set -q x is false when dictionary is not set" (
    dict:set -q x
) $status = 1

@test "dict:set -q x is true when dictionary has any key" (
    dict:set x y a
    dict:set -q x
) $status = 0

@test "dict:set -q x y is false when x{y} is not set" (
    dict:set x q a;
    dict:set -q x y
) $status = 1

@test "dict:set -q x y is true when x{y} is set" (
    dict:set x y a
    dict:set -q x y
) $status = 0

@test "dict:set -e x y erases x{y}" (
    dict:set x y a
    dict:set -e x y
    dict:set -q x y
) $status = 1

@test "dict:set -e x erases x{}" (
    dict:set x y a
    dict:set -e x
    dict:set -q x
) $status = 1

@test "dict:keys x is empty when there is no dictionary x" (
    dict:keys x
) = ""

@test "dict:keys x returns an alphabetized list of dictionary keys" (
    dict:set x y a
    dict:set x q a
    dict:keys x
) = "q y"

@test "dict:empty x returns true if it does not exist (opposite of dict:set -q x)" (
    dict:empty x
) $status = 0

@test "dict:empty x returns false if any keys are set for x" (
    dict:set x y a
    dict:empty x
) $status = 1

@test "dict:has_key x y returns false if x{y} does not exist (same as dict:set -q x y)" (
    dict:set x q a
    dict:has_key x y
) $status = 1

@test "dict:has_key x y returns true if x{y} exists" (
    dict:set x y a
    dict:has_key x y
) $status = 0
