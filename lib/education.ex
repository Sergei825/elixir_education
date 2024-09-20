defmodule Education do
  @moduledoc """
    module for education purposes
  """

  @doc """
    Calculate operations with 2 params

    iex> Education.calc("sum", 2, 3)
    { :ok, 5 }

    iex> Education.calc("multiplication", 2, 3)
    { :ok, 6 }

    iex> Education.calc("subtraction", 2, 3)
    { :ok, -1 }

    iex> Education.calc("division", 6, 3)
    { :ok, 2.0 }

    iex> Education.calc("bad", 6, 3)
    {:error, "no valid operation: bad"}

    iex> Education.calc("sum", "str", 3)
    ** (ArithmeticError) bad argument in arithmetic expression
  """
  def calc(operation, num1, num2) do
    case operation do
      "sum" ->
        sum(num1, num2)
      "multiplication" ->
        multiplication(num1, num2)
      "subtraction" ->
        sum(num1, -num2)
      "division" ->
        multiplication(num1, 1/num2)
      _ ->
        {:error, "no valid operation: #{operation}"}
    end
  end

  defp sum(a, b) do
    {:ok, a + b}
  end

  defp multiplication(a, b) do
    {:ok, a * b}
  end

end
