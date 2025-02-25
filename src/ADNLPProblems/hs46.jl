export hs46

function hs46(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6,
    T[sqrt(2) / 2, 1.75, 0.5, 2, 2],
    x -> [(x[1]^2) * x[4] + sin(x[4] - x[5]) - 1; x[2] + (x[3]^4) * (x[4]^2) - 2],
    zeros(T, 2),
    zeros(T, 2),
    name = "hs46";
    kwargs...,
  )
end
