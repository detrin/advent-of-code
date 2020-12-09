
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
target_num = 0
for num_pos in (check+1):length(code)
    global target_num
    num = code[num_pos]
    num_check = false
    for pos_back in 1:check
        pair_num = num - code[num_pos-pos_back]
        if get(code_dic, pair_num, 0) != 0 && (num_pos-pos_back <= code_dic[pair_num] <= num_pos-1)
            num_check = true
        end
    end
    if !num_check
        target_num = num
    end
end

code_cumsum = vcat([0], cumsum(code))
set_found = false
start_pos, end_pos = 2, 3
while !set_found
    global start_pos, end_pos, set_found
    set_sum = code_cumsum[end_pos] - code_cumsum[start_pos-1]
    while set_sum < target_num
        end_pos += 1
        set_sum = code_cumsum[end_pos] - code_cumsum[start_pos-1]
    end
    if set_sum == target_num
        println(minimum(code[start_pos-1:end_pos-1])+maximum(code[start_pos-1:end_pos-1]))
        set_found = true
    end
    start_pos += 1
    end_pos = start_pos+1
end