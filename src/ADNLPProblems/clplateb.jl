export clplateb

function clplateb(;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  wght = -0.1,
  kwargs...,
) where {T}
  p = floor(Int, sqrt(n))
  p * p != n && @warn("clplateb: number of variables adjusted from $n down to $(p*p)")
  n = p * p
  hp2 = T(1 / 2) * p^2
  disw = T(wght) / (p - 1)
  function f(x)
    return sum(disw * x[p + (j - 1) * p] for j = 1:p) +
           sum(
             sum(
               T(1 / 2) * (x[i + (j - 1) * p] - x[i + (j - 2) * p])^2 +
               hp2 * (x[i + (j - 1) * p] - x[i + (j - 2) * p])^4 for j = 2:p
             ) for i = 2:p
           ) +
           sum(T(1 / 2) * (x[2 + (j - 1) * p])^2 + hp2 * (x[2 + (j - 1) * p])^4 for j = 2:p) +
           sum(
             sum(
               T(1 / 2) * (x[i + (j - 1) * p] - x[i - 1 + (j - 1) * p])^2 +
               hp2 * (x[i + (j - 1) * p] - x[i - 1 + (j - 1) * p])^4 for j = 2:p
             ) for i = 3:p
           )
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "clplateb"; kwargs...)
end
