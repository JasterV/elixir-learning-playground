# Trying guards for the first time on functions
# They can also be used in other statements such as `case`

defmodule Math do
  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
  def zero?(_), do: false
end

IO.inspect(Math.zero?(1))
IO.inspect(Math.zero?(2))
