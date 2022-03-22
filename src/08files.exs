defmodule Files do
  def open_file(path) when is_binary(path) do
    File.open(path, [:write, :read])
  end

  def read_file(path) when is_binary(path) do
    File.read(path)
  end

  def join_path(slug1, slug2) do
    Path.join(slug1, slug2)
  end

  def expand_path(path) do
    Path.expand(path)
  end
end

path = Files.join_path("data", "stopwords.txt")

case Files.read_file(path) do
  {:ok, contents} -> IO.puts(contents)
  {:err, error} -> IO.inspect(error)
  _ -> IO.puts("Unexpected result")
end
