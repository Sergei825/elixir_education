defmodule Tram do
  @moduledoc """
    finite state machine
    depo, move, stop, open_doors
  """
  use GenServer

  @impl true
  def init(initial_state \\ :depo) do
    {:ok, initial_state}
  end

  def legal_transition?(current_state, new_state) do
    paths = %{
      depo: [:move],
      move: [:depo, :stop],
      stop: [:move, :open_doors],
      open_doors: [:stop]
    }
    new_state in paths[current_state]
  end

  def change_state(new_state) do
    current_state = current()
    GenServer.cast(__MODULE__, new_state) if legal_transition?(current_state, new_state)
  end

  # check state
  def current, do: GenServer.call(__MODULE__, :current)

  # transitions
  def move, do: change_state(:move)
  def to_depo, do: change_state(:depo)
  def stop, do: change_state(:stop)
  def open_doors, do: change_state(:open_doors)
  def close_doors, do: change_state(:stop)

  def handle_call(:current, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(new_state, state) do
    {:noreply, new_state}
  end
end
