# The pipe operator seems to be an awesome and super powerful feature of this language

defmodule PipeTest do
  # Private functions
  defp square(x) when is_number(x), do: x * x

  defp sum(l, start \\ 0) when is_number(start) and is_list(l) do
    start + Enum.sum(l)
  end

  # Public functions
  def sst(list) do
    # Get the square of the sum of the tail of a list
    list
    |> tl
    # |> IO.inspect()
    |> sum
    # |> IO.inspect()
    |> square
  end
end

IO.puts(PipeTest.sst([1, 2, 3, 4]))
