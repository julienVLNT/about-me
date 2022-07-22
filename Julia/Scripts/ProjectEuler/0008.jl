#  "Largest product in a series"
#   ---------------------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0008.jl`

# First, let parse the `.txt` file.
function parse(path::String)
    data = []

    open(path) do file
        for (i, line) in enumerate(eachline(file))
            push!(data, [])
            for char in line
                push!(data[i], char-'0')
            end
            println(last(data))
        end
    end
    return data
end

function problem(n)

end