using Statistics

ls = split(strip(read("day2.txt", String)), '\n')

good_ids = 0
total_power = 0

for l in ls
    # Process each line
    parts = split(replace(l, r"[;,:]" => ""), ' ')

    # Create a dictionary to store maximum color counts
    colormax = Dict{String, Int}()

    for (count, color) in zip(parts[3:2:end], parts[4:2:end])
        colormax[color] = max(get(colormax, color, 0), parse(Int, count))
    end

    # Calculate the product of maximum color counts
    power = prod(values(colormax))

    # Check conditions and update variables
    if get(colormax, "red", 0) <= 12 && get(colormax, "green", 0) <= 13 && get(colormax, "blue", 0) <= 14
        global good_ids += parse(Int, parts[2])
    end

    global total_power += power
end

# Output results for Part 1 and Part 2
println("Part 1: ", good_ids)
println("Part 2: ", total_power)

