defmodule Math do
  def sum_fold(l) do
    List.foldl(l, 0, fn elem, acc -> elem + acc end)
  end

  def sum_list([]), do: 0
  def sum_list([x | xs]), do: sum_list(xs, x)
  defp sum_list([x | xs], acc), do: sum_list(xs, x + acc)
  defp sum_list([], acc), do: acc
end

IO.puts(Math.sum_fold([1, 2, 3]))
IO.puts(Math.sum_list([1, 2, 3]))
IO.puts(Math.sum_list([]))
