#  "Even Fibonacci numbers"
#   ----------------------
#  Julien VALENTIN, July 2022
#  julien.vlnt@gmail.com
#  usage : `julia 0002.jl <n>`

# Check the number of arguments
@assert(length(ARGS) == 1, "Bad call : `julia 0002.jl <n>`")

# Parse the argument
n = parse(Int64, ARGS[1])

# Implement the Binet formula : the m-th number of the Fibonacci sequence.
function binet(m)
    return trunc(Int, ( ((1 + sqrt(5))/2)^m - ((1 - sqrt(5))/2)^m ) / sqrt(5) )
end

function problem(n)

    if n < 3
        return -1
    end

    r = 0           # the result
    i = 3           # first index for which fib(i) is even
    f = binet(i)    # compute the i-th terme of Fibonacci

    while f < n
        r += f           # add f to the result
        i += 3           # one term over three are even, the two ohers are odd
        f  = binet(i)    # update f
    end

    return r
end

@assert( problem(2) == -1, "Test case `2` failed !" )
@assert( problem(3) ==  2, "Test case `3` failed !" )

println("The solution is ", problem(n))