#  "Sum square difference"
#   ---------------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0006.jl`

function problem()
    return convert(Int32, (100*101/2)^2 - (100^3)/3 + (100^2)/2 - 100/6)
end

@show problem()