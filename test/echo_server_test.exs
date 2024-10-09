defmodule EchoServerTest do
  use ExUnit.Case

  test "assert_receive/1" do
    EchoServer.ping(self())
    assert_receive {:pong, :nonode@nohost}
  end
end
