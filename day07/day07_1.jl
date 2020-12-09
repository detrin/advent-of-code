
rules = Dict()
open("day07/day07.in") do io
    global rules
    for line in readlines(io)
        line = replace(line, ("." => ""))
        line = split(line, "contain ")
        key_bag = split(line[1], " ")[1] * " " * split(line[1], " ")[2]
        bags = split(line[2], ", ")
        rules[key_bag] = []
        for bag in bags
            push!(rules[key_bag], split(bag, " ")[2] * " " * split(bag, " ")[3])
        end
    end
end

contains_gold = 0
for (bag_type, bags) in rules
    global contains_gold
    used_bags = Set(); push!(used_bags, bag_type)
    heap_bags = Set(); push!(heap_bags, bag_type)
        
    while length(heap_bags) > 0
        for bag_type_current in heap_bags
            push!(used_bags, bag_type_current)
            delete!(heap_bags, bag_type_current)
            if get(rules, bag_type_current, 0) != 0
                bags = rules[bag_type_current]
                for bag in bags
                    if !in(bag, used_bags)
                        push!(heap_bags, bag)
                    end
                end
            end
        end
    end
    if bag_type != "shiny gold" && in("shiny gold", used_bags)
        contains_gold += 1
    end 
end

println(contains_gold)