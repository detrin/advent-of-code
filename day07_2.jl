
rules = Dict()
open("day07_1.in") do io
    global rules
    for line in readlines(io)
        line = replace(line, ("." => ""))
        line = split(line, "contain ")
        key_bag = split(line[1], " ")[1] * " " * split(line[1], " ")[2]
        bags = split(line[2], ", ")
        tmpDict = Dict()
        for bag in bags
            if bag != "no other bags"
                bag_type = split(bag, " ")[2] * " " * split(bag, " ")[3]
                tmpDict[bag_type] = parse(Int64, split(bag, " ")[1])
            end
        end
        rules[key_bag] = tmpDict
    end
end

function num_of_bags(bag_type::String)::Int64
    global rules
    num = 1
    if get(rules, bag_type, 0) != 0
        bags = rules[bag_type]
        for (bag, mult) in bags
            num += mult * num_of_bags(bag)
        end
    end
    return num
end

println(num_of_bags("shiny gold")-1)
