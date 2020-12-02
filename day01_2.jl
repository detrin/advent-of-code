
input_nums = zeros(Bool, 2021)

open("day01_1.in") do io
    for line in readlines(io)
        num = parse(Int32, line)
        input_nums[parse(Int32, line)] = true
    end
end

for num1 in 1:1010
    for num2 in 1:num1
        num3 = 2020 - num1 - num2
        if num3 > 0 && input_nums[num1] && input_nums[num2] && input_nums[num3]
            println(num1 * num2 * num3)
        end
    end
end