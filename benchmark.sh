#!/bin/bash

julia benchmark.jl | grep "allocations" | awk 'NR%2{printf "%s ",$0;next;}1' | tr ')' ' ' | awk '{print "| " NR" | "$1" "$2" | "$5" "$6" | "$7" "$8" | "$11" "$12" |"}'