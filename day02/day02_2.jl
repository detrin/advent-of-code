valid = 0

open("day02/day02.in") do io
    global valid
    for line in readlines(io)
        range_all, target_char, test_string = split(line, " ")
        target_char = target_char[1]
        a = parse(Int32, split(range_all, "-")[1])
        b = parse(Int32, split(range_all, "-")[2])

        if (target_char == test_string[a]) ⊻ (target_char == test_string[b]) 
            valid += 1
        end
    end
end

println(valid)