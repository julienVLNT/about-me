#  "Multiples of three and five"
#  -----------------------------
#  Julien VALENTIN (July, 2022)
#  julien.vlnt@gmail.com
#  usage : `julia 0001.jl <k> <m> <n>`

# Test for a legal call.
@assert(length(ARGS) == 3, "Bad call : `julia 0001.jl <k> <m> <n>`")

# Parse the arguments
k = parse(Int64, ARGS[1])
m = parse(Int64, ARGS[2])
n = parse(Int64, ARGS[3])

function problem(k, m, n)
    # upper bounds of each sum
    iₘ = (k-1) ÷ m
    iₙ = (k-1) ÷ n
    iₘₙ = (k-1) ÷ (m*n)

    # express the three sums
    Sₘ = m*(iₘ * (iₘ+1)) ÷ 2
    Sₙ = n*(iₙ * (iₙ+1)) ÷ 2
    Sₘₙ = (m*n) * (iₘₙ * (iₘₙ+1)) ÷ 2

    S = Int64(Sₘ + Sₙ - Sₘₙ)
    return S
end

# Check the test case.
@assert(problem(10, 3, 5) == 23, "Test case failed !")

S = problem(k, m, n)
println("The sum of all divisors of $m and $n strictly less than $k equals $S.")