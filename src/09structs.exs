defmodule User do
  defstruct name: "John", age: 29
end

defmodule Test do
  require User

  def main do
    john = %User{}
    IO.inspect(john)

    IO.puts("Another one")

    jane = %User{name: "jane"}

    jane = %User{jane | age: 31}

    IO.inspect(jane)

    IO.puts("Jane's jane is #{jane.age}")

    # This is wrong!!
    # jane = %User{jane | occ: "Engineer"}
    # IO.inspect(jane)
  end
end

Test.main()
