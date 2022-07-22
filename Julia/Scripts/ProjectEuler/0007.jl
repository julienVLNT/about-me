#  "10.001st prime"
#   -------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0007.jl`

function isPrime(m)
    if m < 2
        return false
    end

    for j ∈ 2 : floor(Int, sqrt(m))
        if mod(m, j) == 0
            return false
        end
    end
    return true
end

function problem()
    primes  = []
    i = 0

    while(length(primes) < 10001)
        i += 1
        
        if i > 1 && i % 10 == 0
            println("> $i")
        end

        if isPrime(i)
            push!(primes, i)
        end
    end
    return last(i)
end

@show problem()