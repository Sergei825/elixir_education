defmodule Education.User do
  @moduledoc """
    user model for test many_to_many association
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :number_of_pets, :integer

    many_to_many :posts, Education.Blog.Post, join_through: Education.Comment, on_delete: :delete_all, on_replace: :delete
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :bio, :number_of_pets])
    |> validate_required([:name, :email, :bio, :number_of_pets])
    |> cast_assoc(
      :posts, drop_param: :posts_delete
    )
  end
end
