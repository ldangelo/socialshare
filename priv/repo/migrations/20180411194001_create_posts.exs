defmodule Socialshare.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :url, :string
      add :comment, :string
      add :shared, :boolean, default: false, null: false

      timestamps()
    end

  end
end
