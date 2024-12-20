defmodule Education.Comment do
  @moduledoc """
    model for testing many-to-many
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
    text: String.t()
  }

  schema "comments" do
    field :text, :string
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
