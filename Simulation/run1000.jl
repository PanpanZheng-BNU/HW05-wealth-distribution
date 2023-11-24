#!/home/zpp/julia-1.9.3/bin/julia
include("./myf.jl")

# Create a folder to store data
path2data = "../data-test"
!ispath(path2data) && mkdir(path2data)

path2N1000 = joinpath(path2data, "N1000")
!ispath(path2N1000) && mkdir(path2N1000)

path2m = joinpath(path2N1000, "m")
!ispath(path2m) && mkdir(path2m)

path2lambda = joinpath(path2N1000, "lambda")
!ispath(path2lambda) && mkdir(path2lambda)


N::Int64 = 1000;
lnn::Int64 = 10^6;
bnn::Int64 = 10^3;

m_all = Matrix{Float64}(undef,bnn, N);
lambda_all = Matrix{Float64}(undef, bnn, N);
interval::Vector{Float64} = [0.0, 1.0];


for k in 1:10
    si_all = generate_si_all(N; length=20, lnn=lnn);
    Threads.@threads for j in 1:bnn
        m = ones(N)
        lambda = λ_generator(N, interval)
        shuffle!(si_all)
        Threads.@inbounds for i in 1:lnn
            update!(m; lambda=lambda, si = si_all[i])
        end

        m_all[j,:] = m
        lambda_all[j, :] = lambda
    end

    filename = string(Dates.now()) * ".csv"
    CSV.write(joinpath(path2m,filename), DataFrame(m_all,:auto), header=false)
    CSV.write(joinpath(path2lambda,filename), DataFrame(lambda_all,:auto), header=false)
    println("Finish at $(Dates.now())!")
end
