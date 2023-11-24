#!/home/zpp/julia-1.9.3/bin/julia
include("./myf.jl")


path2data = "../data-test"
!ispath(path2data) && mkdir(path2data)

path2N100 = joinpath(path2data, "N100")
!ispath(path2N100) && mkdir(path2N100)

path2u = joinpath(path2N100, "u81")
!ispath(path2u) && mkdir(path2u)

path2m = joinpath(path2u, "m")
path2lambda = joinpath(path2u, "lambda")



N::Int64 = 100
lnn::Int64 = 10^5
bnn::Int64 = 10^3
interval::Vector{Float64} = [0.8,1.0]

m_all = Matrix{Float64}(undef, 10^3, N);
lambda_all = Matrix{Float64}(undef, 10^3, N);


for k in 1:10
    si_all = generate_si_all(N; length=1, lnn = lnn);
    Threads.@threads for j in 1:bnn
        m = ones(N)
        lambda = λ_generator(N, interval);
        shuffle!(si_all)
        Threads.@inbounds for i in 1:lnn
            update!(m; lambda=lambda, si = si_all[i])
        end
        m_all[j,:] = m
        lambda_all[j, :] = lambda
    end

    filename = string(Dates.now()) * ".csv"
    CSV.write(path2m*filename, DataFrame(m_all,:auto), header=false)
    CSV.write(path2lambda*filename, DataFrame(lambda_all,:auto), header=false)

    println("Finish at $(Dates.now())!")
end
