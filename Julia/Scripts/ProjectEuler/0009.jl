#  "Special Pythagorean triplet"
#   ---------------------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0009.jl`

function problem()
    for a ∈ 2:998
        for b ∈ 2:998
            try
                c = Int(sqrt(a^2 + b^2))    
                
                if a + b + c - 1000 == 0
                    return (a, b, c)
                end
            catch
                continue
            end
        end
    end
    return -1
end

@show problem()