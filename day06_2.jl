
open("day06_1.in") do io
    answers = Dict()
    answers_count = 0
    group_count = 0
    for line in readlines(io)
        line = line * " "
        if cmp(line, " ") == 0
            for (item, value) in answers
                if value == group_count
                    answers_count += 1
                end
            end
            answers = Dict()
            group_count = 0
        else
            for ch in line
                if ch != ' '
                    answers[ch] = get(answers, ch, 0) + 1
                end
            end
            group_count += 1
        end
    end
    for (item, value) in answers
        if value == group_count
            answers_count += 1
        end
    end
    println(answers_count)
end

