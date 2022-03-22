defmodule TestServer do
  def listen do
    receive do
      {:ping, value} ->
        IO.inspect({:pong, value})
        # code
    end

    listen()
  end
end

# pid = spawn(Server, :listen, [])
# result = send(pid, {:ping, 10})
