
code_dic = Dict()
code = []
open("day09/day09.in") do io
    line_num = 1
    global instructions
    for line in readlines(io)
        num = parse(Int64, line)
        code_dic[num] = line_num
        line_num += 1
        push!(code, num)
    end
end

check = 25
for num_pos in (check+1):length(code)
    num = code[num_pos]
    num_check = false
    for pos_back in 1:check
        pair_num = num - code[num_pos-pos_back]
        if get(code_dic, pair_num, 0) != 0 && (num_pos-pos_back <= code_dic[pair_num] <= num_pos-1)
            num_check = true
        end
    end
    if !num_check
        println(num)
    end
end