
instructions = []
open("day08_1.in") do io
    global instructions
    for line in readlines(io)
        line = split(line, " ")
        push!(instructions, [line[1], parse(Int64, line[2])])
    end
end

executed = zeros(Bool, length(instructions))
exec_pos = 1
accumulator = 0
while !executed[exec_pos]
    global accumulator, exec_pos
    executed[exec_pos] = true
    instruction = instructions[exec_pos]
    exec_pos += 1
    if instruction[1] == "acc"
        accumulator += instruction[2]
    elseif instruction[1] == "jmp"
        exec_pos += instruction[2]-1
    end
end
println(accumulator)