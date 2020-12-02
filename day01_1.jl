
input_nums = zeros(Bool, 2021)

open("day01_1.in") do io
    for line in readlines(io)
        num = parse(Int32, line)
        input_nums[parse(Int32, line)] = true
    end
end

for num in 1:1011
    if input_nums[num] && input_nums[2020-num]
        println(num * (2020-num))
    end
end
