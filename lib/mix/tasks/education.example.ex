# lib/mix/tasks/quadratic_equation.example.ex

defmodule Mix.Tasks.Education.Example do
  @moduledoc """
    task for test calculator
  """
  use Mix.Task

  @shortdoc "Calculator. Example of calculation."

  def run(_) do
    {_status, result} = Education.calc("sum", 2, 3)
    IO.puts "hello world"
    IO.puts result
  end
end
