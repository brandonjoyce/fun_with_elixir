defmodule FunWithElixir do
  use Application

  def start(_type, _args) do
    FunWithElixirSupervisor.start_link
  end
end
