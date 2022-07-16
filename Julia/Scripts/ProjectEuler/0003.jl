#  "Largest prime factor"
#   ----------------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0003.jl <n>`

# Check the number of arguments
@assert(length(ARGS) == 1, "Bad call : `julia 0003.jl <n>`")

# Parse the argument
n = parse(Int64, ARGS[1])

# Let begin with a naive prime test
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

@assert( isPrime(1)  == false, "isPrime(1) test failed !")
@assert( isPrime(2)  == true,  "isPrime(2) test failed !")
@assert( isPrime(3)  == true,  "isPrime(3) test failed !")
@assert( isPrime(6)  == false, "isPrime(4) test failed !")

# Now, let factorize an integer in prime factors
function primeFactorization(m)
    if m < 2
        return -1
    end
    
    factors = []
    for j ∈ 2 : floor(m/2)
        if m == 1
            break
        end

        if isPrime(j) && (mod(m, j) == 0)
            push!(factors, j)
            while mod(m, j) == 0
                m = m ÷ j
            end
        end
    end

    return factors
end

# Finally, solve the problem.
function problem(n)
    return primeFactorization(n)[end]
end

@assert( problem(13195) == 29, "Test case failed !" )

println("The solution is ", problem(n))
