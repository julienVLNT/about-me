#  "Largest palindrome product"
#   --------------------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0004.jl <n>`

# Check the number of arguments
@assert(length(ARGS) == 1, "Bad call : `julia 0004.jl <n>`")

# Parse the argument
n = parse(Int64, ARGS[1])

"""
This function returns a list of all palindrome with i digits.
"""
function problem(i)
    palindroms = []
    for a0 ∈ 0:9
        for a1 ∈ 0:9
            for a2 ∈ 0:9
                    push!(palindroms, a0*10^5 + a1*10^4 + a2*10^3 + a2*10^2 + a1*10 + a0)
            end
        end
    end
    reverse!(palindroms)

    for palindrom ∈ palindroms
        for m ∈ 999:-1:101
            if palindrom % m == 0
                if palindrom ÷ m < 1000
                    return ( palindrom, m, palindrom ÷ m)
                else
                    continue
                end
            else
                continue
            end
        end
    end
end

@show problem(n)
