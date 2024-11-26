defmodule Education do
  @moduledoc """
    module for education purposes
  """
  alias Education.{Repo, Comment, User}

  defmodule CalcRequest do
    @type t :: %__MODULE__{
      operation: String.t(),
      param1: integer(),
      param2: integer()
    }

    @moduledoc false
    defstruct operation: "sum", param1: 27, param2: 3
  end

  @spec calc(String.t(), integer(), integer() | CalcRequest.t()) :: {:ok, integer() | String.t()}
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
        {:ok, sum(num1, num2)}
      "multiplication" ->
        {:ok, multiplication(num1, num2)}
      "subtraction" ->
        {:ok, sum(num1, -num2)}
      "division" ->
        {:ok, multiplication(num1, 1 / num2)}
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
    a + b
  end

  defp multiplication(a, b) do
    a * b
  end

  @spec create_comment(any()) :: {:ok, Comment.t() | Ecto.Changeset.t()}
  @doc """
  Creates a comment
  """
  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  @spec create_user(any()) :: {:ok, User.t() | Ecto.Changeset.t()}
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
