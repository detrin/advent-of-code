
seats_check = zeros(Bool, 2^10)

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

for seat_s in seats
    global seats_check
    seats_check[seatID(seat_s)+1] = true
end

for seat in 100:800
    global seats_check
    if !seats_check[seat]
        println(seat-1)
    end
end