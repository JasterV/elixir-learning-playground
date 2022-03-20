defmodule Math do
  def zero?(0), do: true
  def zero?(x), when is_integer(x), do: false
  def zero?(_), do: false
end

IO.inspect(Math.div(1, 0))
IO.inspect(Math.div(1, 2))
