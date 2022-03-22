# Go back and look at the groceries list map you created after lesson "Operations on Data Structures".
# Write a function that can take a map and insert grocery items into it.
# Then, write another function that can remove grocery items from within a given map.

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
