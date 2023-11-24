#!/home/zpp/julia-1.9.3/bin/julia
include("./myf.jl")

# Create a folder to store data
path2data = "../data-test"
!ispath(path2data) && mkdir(path2data)

path2N100 = joinpath(path2data, "N100")
!ispath(path2N100) && mkdir(path2N100)

path2alpha = joinpath(path2N100, "alphan03")
!ispath(path2alpha) && mkdir(path2alpha)

path2m = joinpath(path2alpha, "m")
path2lambda = joinpath(path2alpha, "lambda")

N::Int64 = 100
lnn::Int64 = 10^5
bnn::Int64 = 10^3

m_all = Matrix{Float64}(undef, bnn, N);
lambda_all = Matrix{Float64}(undef, bnn, N);
α::Float64 = -0.3


for k in 1:10
    si_all = generate_si_all(N; length=1, lnn = lnn);
    Threads.@threads for j in 1:10^3
        m = ones(N)
        lambda = λ_generator(N, α)
        shuffle!(si_all)
        Threads.@inbounds for i in 1:lnn
            update!(m; lambda=lambda, si = si_all[i])
        end
        # println("$(maximum(m))" * " by thread $(Threads.threadid())")
        m_all[j,:] = m
        lambda_all[j, :] = lambda
    end

    filename = string(Dates.now()) * ".csv"
    CSV.write(path2m*filename, DataFrame(m_all,:auto), header=false)
    CSV.write(path2lambda*filename, DataFrame(lambda_all,:auto), header=false)

    println("Finish at $(Dates.now())!")
end
