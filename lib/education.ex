defmodule Education do
  @moduledoc """
    module for education purposes
  """
  alias Education.{Repo, Comment, User}

  defmodule CalcRequest do
    defstruct operation: "sum", param1: 27, param2: 3
  end

  # import Ecto.Query

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

  @doc """
    Calculate operations with 2 params

    iex> Education.calc(%Education.CalcRequest{})
    { :ok, 30 }
  """
  def calc(%CalcRequest{}) do
    apply(Education, :calc, list_it(%CalcRequest{}))
  end

  defp sum(a, b) do
    {:ok, a + b}
  end

  defp multiplication(a, b) do
    {:ok, a * b}
  end

  @doc """
  Creates a comment
  """
  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a user
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def list_it(input) do
    Lister.list_it(input)
  end
end
