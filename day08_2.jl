
instructions = []
open("day08_1.in") do io
    global instructions
    for line in readlines(io)
        line = split(line, " ")
        push!(instructions, [line[1], parse(Int64, line[2])])
    end
end

function code_runner(checkpoints, num)
    global instructions
    executed = zeros(Bool, length(instructions))
    exec_pos = 1
    accumulator = 0
    while exec_pos <= length(instructions) && !executed[exec_pos]
        executed[exec_pos] = true
        instruction = instructions[exec_pos]
        exec_pos += 1
        if instruction[1] == "acc"
            accumulator += instruction[2]
        elseif instruction[1] == "jmp"
            exec_pos += instruction[2]-1
            if num == -1
                push!(checkpoints, exec_pos)
            elseif checkpoints[num] == exec_pos
                exec_pos -= instruction[2]-1
            end
        elseif instruction[1] == "nop"
            if num == -1
                push!(checkpoints, exec_pos)
            elseif checkpoints[num] == exec_pos
                exec_pos += instruction[2]-1
            end
        end
    end
    if num == -1
        return checkpoints
    else
        return accumulator, exec_pos == length(instructions)+1
    end
end

checkpoints = code_runner([], -1)
checkpoint_pos = length(checkpoints)
succ = false
accumulator = 0
while !succ
    global checkpoints, succ, checkpoint_pos, accumulator
    accumulator, succ = code_runner(checkpoints, checkpoint_pos)
    checkpoint_pos -= 1
end

println(accumulator)
