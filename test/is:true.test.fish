source "$current_dirname/../functions/is:true.fish"

@test "Returns false if given no test value" (
    is:true
) $status = 1

for v in 1 y yes t true o on Y YES T TRUE O ON
    @test "Returns true if the value is $v" (
        is:true $v
    ) $status = 0
end

@test "Returns true if the value is not a truthy value" (
    is:true 0
) $status = 1
