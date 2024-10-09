defmodule EchoServer do
  @moduledoc """
    module for ping pong testing
  """
  def ping(pid) do
    send(pid, {:pong, node()})
  end
end
