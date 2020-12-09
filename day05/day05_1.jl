
seats = []
open("day05/day05.in") do io
    global map_str, passports
    for line in readlines(io)
        push!(seats, line)
    end
end

function seatID(s::String)::Int64
    id = 0
    for chi in 1:10
        id *= 2
        if s[chi] == 'B' || s[chi] == 'R'
            id += 1
        end
    end
    return id
end

seatID_max = 0
for seat_s in seats
    global seatID_max
    seatID_max = max(seatID_max, seatID(seat_s))
end
println(seatID_max)