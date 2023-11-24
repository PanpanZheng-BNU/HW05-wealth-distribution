#!/Users/zhengpanpan/julia-1.9.3/bin/julia
include("./myf.jl")

N = 100
lnn = 10^5
bnn = 4
α = 0.3
interval = [0.0, 0.5];

m_all = Matrix{Float64}(undef, bnn, N);
lambda_all = Matrix{Float64}(undef, bnn, N);

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



path_m = "./m"
path_lambda = "./lambda"
filename = "test.csv"
CSV.write(path_m*filename, DataFrame(m_all,:auto), header=false)
CSV.write(path_lambda*filename, DataFrame(lambda_all,:auto), header=false)

println("Finish at $(Dates.now())!")
# end
