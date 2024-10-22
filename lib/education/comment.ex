defmodule Education.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :text, :string
    # field :user_id, :integer
    # field :post_id, :integer
    belongs_to :user, Education.User
    belongs_to :post, Education.Blog.Post
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:user_id, :post_id, :text])
    |> validate_required([:user_id, :post_id, :text])
  end
end
