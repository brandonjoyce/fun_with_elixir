defmodule AWorldWithoutMocksTest do
  use ExUnit.Case

  test "says hello to the console" do
    AWorldWithoutMocks.process(io_stub)
    assert_receive {:puts, "hello"}
  end

  defp io_stub do
    %{puts: fn(msg) -> send(self(), {:puts, msg}) end}
  end
end

defmodule AWorldWithoutMocks do
  @io %{puts: &IO.puts/1}

  def process(io \\ @io) do
    io.puts.("hello")
  end
end
