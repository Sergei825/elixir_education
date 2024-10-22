defmodule Education do
  @moduledoc """
    module for education purposes
  """
  alias Education.Repo
  alias Education.Comment
  alias Education.User

  import Ecto.Query

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

  @doc """
  Delete a user
  """
  def delete_user(%User{} = user) do
    post_ids_query = from c in Comment,
      where: c.user_id == ^user.id,
      select: c.post_id

    posts_to_delete = from p in Education.Blog.Post,
      where: p.id in subquery(post_ids_query)

    Repo.delete_all(posts_to_delete)
    Repo.delete(user)
  end
end
