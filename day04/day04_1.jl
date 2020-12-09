
map_str = ""
passports = []
open("day04/day04.in") do io
    global map_str, passports
    for line in readlines(io)
        line = line * " "
        if cmp(line, " ") == 0
            push!(passports, map_str)
            map_str = ""
        else
            map_str = map_str * line
        end
    end
end

pass_map = Dict(
    "byr" => 2, "iyr" => 3, "eyr" => 5, "hgt" => 7, "hcl" => 11, "ecl" => 13,
    "pid" => 17, "cid" => 19
    )
pass_valid = Int64(0)
for passport in passports
    global pass_valid
    checkmult = Int64(1)
    for item in split(passport, ' ')
        if length(item) > 2
            checkmult *= pass_map[item[1:3]]
        end
    end
    if checkmult == 9699690 || checkmult == 510510 
        pass_valid += 1
    end
end
println(pass_valid)