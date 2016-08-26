defmodule PingPong do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def ping do
    GenServer.cast(__MODULE__, :ping)
  end

  def pong do
    GenServer.cast(__MODULE__, :pong)
  end

  def handle_cast(:ping, count) do
    "#{:ping} #{count}"
    |> Say.say
    |> IO.puts
    cast_random_neighbor :pong
    {:noreply, count + 1}
  end

  def handle_cast(:pong, count) do
    "#{:pong} #{count}"
    |> Say.say
    |> IO.puts
    cast_random_neighbor :ping
    {:noreply, count + 1}
  end

  defp cast_random_neighbor(cast) do
    if Enum.count(Node.list) > 0 do
      GenServer.cast({__MODULE__, Enum.random(Node.list)}, cast)
    end
  end
end
