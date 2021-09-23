export palmer1c 
 
function palmer1c(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  X = T[
    -1.788963,
    -1.745329,
    -1.658063,
    -1.570796,
    -1.483530,
    -1.396263,
    -1.308997,
    -1.218612,
    -1.134464,
    -1.047198,
    -0.872665,
    -0.698132,
    -0.523599,
    -0.349066,
    -0.174533,
    0.0000000,
    1.788963,
    1.745329,
    1.658063,
    1.570796,
    1.483530,
    1.396263,
    1.308997,
    1.218612,
    1.134464,
    1.047198,
    0.872665,
    0.698132,
    0.523599,
    0.349066,
    0.174533,
    -1.8762289,
    -1.8325957,
    1.8762289,
    1.8325957,
  ]

  Y = T[
    78.596218,
    65.77963,
    43.96947,
    27.038816,
    14.6126,
    6.2614,
    1.538330,
    0.000000,
    1.188045,
    4.6841,
    16.9321,
    33.6988,
    52.3664,
    70.1630,
    83.4221,
    88.3995,
    78.596218,
    65.77963,
    43.96947,
    27.038816,
    14.6126,
    6.2614,
    1.538330,
    0.000000,
    1.188045,
    4.6841,
    16.9321,
    33.6988,
    52.3664,
    70.1630,
    83.4221,
    108.18086,
    92.733676,
    108.18086,
    92.733676,
  ]
  function f(x)
    n = length(x)
    return sum((Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8))^2 for i = 1:35)
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer1c"; kwargs...)
end
