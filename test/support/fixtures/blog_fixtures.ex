defmodule Education.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Education.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Education.Blog.create_post()

    post
  end
end
