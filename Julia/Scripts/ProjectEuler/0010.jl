#  "Summation of primes"
#  ---------------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0010.jl`

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
    res = 0

    for n ∈ 2:(2000000-1)
        # println(n, "\t", isPrime(n))
        if isPrime(n)
            res += n
        end
    end

    return res
end

@show problem()