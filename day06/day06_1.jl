
open("day06/day06.in") do io
    answers = Dict()
    answers_count = 0
    for line in readlines(io)
        line = line * " "
        if cmp(line, " ") == 0
            answers_count += length(answers)
            answers = Dict()
        else
            for ch in line
                if ch != ' '
                    answers[ch] = get(answers, ch, 0) + 1
                end
            end
        end
    end
    answers_count += length(answers)
    println(answers_count)
end

