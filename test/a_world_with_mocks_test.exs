defmodule AWorldWithMocksTest do
  use ExUnit.Case
  import Mock

  test "says hello to the console" do
    with_mock IO, [puts: fn(x) -> x end] do
      AWorldWithMocks.process
      assert called IO.puts("hello")
    end
  end
end

defmodule AWorldWithMocks do
  def process do
    IO.puts("hello")
  end
end
