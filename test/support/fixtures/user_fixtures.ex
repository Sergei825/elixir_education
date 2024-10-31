defmodule Education.UserFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Education.User` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        bio: "some bio",
        email: "some@email.com",
        number_of_pets: 1
      })
      |> Education.create_user()

    user
  end
end
