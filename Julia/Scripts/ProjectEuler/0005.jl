#  "Smallest multiple"
#   -----------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0005.jl`

# Solve the problem
function problem()
    return 2^4 * 3^2 * 5 * 7 * 11 * 13 * 17 * 19
end

@show problem()