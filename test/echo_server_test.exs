defmodule EchoServerTest do
  use ExUnit.Case

  test "ping" do
    {_status, pid} = GenServer.start_link(EchoServer, "1, 2, 3")
    {word, node} = GenServer.call(pid, :ping)
    IO.puts "#{word} + #{node}"
    assert word == :pong
  end
end
