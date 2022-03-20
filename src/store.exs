# Here we put in practice some learnings on tuples, maps
# Pattern matching, conditionals and guards,
# as well as basic error handling using pair tuples

defmodule GroceryStore do
  defguard is_positive(term) when is_integer(term) and term > 0

  def add_item(store, {name, quantity}) when is_integer(quantity) do
    {:ok, Map.put(store, name, quantity)}
  end

  def buy(store, {item, n}) when is_positive(n) do
    quantity = Map.get(store, item, 0)

    cond do
      quantity > n ->
        {:ok, %{store | item => quantity - n}}

      quantity == n ->
        {:ok, Map.delete(store, item)}

      true ->
        {:err, "There is no #{item} in stock"}
    end
  end
end

{:ok, store} = GroceryStore.add_item(%{}, {:apple, 3})
IO.inspect(store)
{:ok, store} = GroceryStore.buy(store, {:apple, 2})
IO.inspect(store)
{:ok, store} = GroceryStore.buy(store, {:apple, 1})
IO.inspect(store)
{:err, message} = GroceryStore.buy(store, {:apple, 2})
IO.inspect(message)
