#  "Largest product in a series"
#   ---------------------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0008.jl`

function parsetxt(path::String)
    
    data = zeros(Int, 20, 50)

    file = open("0008.txt")

    for (i, line) ∈ enumerate(readlines(file))
        for (j, num) ∈ enumerate(collect(line))
            data[i, j] = parse(Int, num)
        end
    end

    close(file)
    
    return data
end

function problem(k)
    sol = 0
    prodx = 0
    prody = 0
    m, n = size(data)
    for i ∈ 1:m
        for j ∈ 1:n
            if j < n-(k-1)
                prodx = prod(data[i, j:j+(k-1)])
            end
            if i < m-(k-1)
                prody = prod(data[i:i+(k-1), j])
            end
            if max(prodx, prody) > sol
                sol = max(prodx, prody)
            end
        end
    end
    return sol
end

data = parsetxt("0008.txt")

@assert(problem(4) == 5832, "Test case failed !")

@show problem(13)