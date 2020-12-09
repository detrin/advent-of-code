
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
    validity = true
    for item in split(passport, ' ')
        if occursin(":", item)
            item_type, item_value = split(item, ":")
            if length(item) > 2
                checkmult *= pass_map[item_type]
            end
            if item_type == "byr"
                item_value = parse(Int64, item_value)
                validity &= 1920 <= item_value <= 2002
            elseif item_type == "iyr"
                item_value = parse(Int64, item_value)
                validity &= 2010 <= item_value <= 2020
            elseif item_type == "eyr"
                item_value = parse(Int64, item_value)
                validity &= 2020 <= item_value <= 2030
            elseif item_type == "hgt"
                if occursin("in", item_value)
                    item_value = split(item_value, "in")[1]
                    item_value = parse(Int64, item_value)
                    validity &= 59 <= item_value <= 76
                elseif occursin("cm", item_value)
                    item_value = split(item_value, "cm")[1]
                    item_value = parse(Int64, item_value)
                    validity &= 150 <= item_value <= 193
                else
                    validity = false
                end
            elseif item_type == "hcl"
                validity &= item_value[1] == '#' && length(item_value) == 7
                for ch in item_value[2:end]
                    validity &= '0' <= ch <= '9' || 'a' <= ch <= 'f'
                end
            elseif item_type == "ecl"
                validity &= item_value in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
            elseif item_type == "pid"
                validity &= length(item_value) == 9
                for ch in item_value[1:end]
                    validity &= '0' <= ch <= '9' 
                end
            end   
        end
    end
    if (checkmult == 9699690 || checkmult == 510510 ) && validity
        pass_valid += 1
    end
end
println(pass_valid)