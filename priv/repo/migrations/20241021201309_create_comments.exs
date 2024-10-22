defmodule Education.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :user_id, :integer
      add :post_id, :integer
      add :text, :string

      timestamps(type: :utc_datetime)
    end
  end
end
