defmodule Education.CommentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Education.Comment` context.
  """

  @doc """
  Generate a comment_fixture.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        user_id: 1,
        post_id: 1,
        text: "что круче, elixir или go?"
      })
      |> Education.create_comment()

    comment
  end
end
