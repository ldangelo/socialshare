defmodule Socialshare.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :comment, :string
      add :tag_id, references(:tags, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:tag_id])
  end
end
