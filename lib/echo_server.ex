defmodule EchoServer do
  @moduledoc """
    module for ping pong testing
  """
  use GenServer

  @impl true
  def init(initial_state) do
    {:ok, initial_state}
  end

  @impl true
  def handle_call(:ping, _from, state) do
    {:reply, {:pong, node()}, state}
  end
end
