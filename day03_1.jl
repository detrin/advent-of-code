
map_str = ""
width, height = Int32(0), Int32(0)
open("day03_1.in") do io
    global map_str, width, height
    for line in readlines(io)
        map_str = map_str * line
        width = length(line)
        height += 1
    end
end


function encounters(right::Int64, down::Int64)::Int64
    posx, posy = Int64(1+right), Int64(1+down)
    tree_count = Int64(0)
    while posy <= height
        global map_str
        if map_str[(posy-1)*width+posx] == '#'
            tree_count += 1
        end
        # println(posx, " ", posy, " ", map_str[(posy-1)*width+posx], " ", tree_count)
        
        posx = (posx+right-1) % width + 1
        posy = posy+down
        
    end
    return tree_count
end


c = encounters(1, 1)
c *= encounters(3, 1)
c *= encounters(5, 1)
c *= encounters(7, 1)
c *= encounters(1, 2)
println(c)