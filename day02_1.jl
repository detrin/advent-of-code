

valid = 0

open("day02_1.in") do io
    global valid
    for line in readlines(io)
        range_all, target_char, test_string = split(line, " ")
        target_char = target_char[1]
        range_min = parse(Int32, split(range_all, "-")[1])
        range_max = parse(Int32, split(range_all, "-")[2])

        char_count = 0
        for ch in test_string
            if ch == target_char
                char_count += 1
            end
        end
        if char_count >= range_min && char_count <= range_max
            valid += 1
        end
    end
end

println(valid)