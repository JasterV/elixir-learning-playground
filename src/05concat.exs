# Tried default parameters for the first time

defmodule Concat do
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end

IO.puts(Concat.join("Hello", "World"))
IO.puts(Concat.join("Hello", "World", ", "))
