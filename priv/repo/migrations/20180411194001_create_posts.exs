defmodule Socialshare.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :url, :string
      add :comment, :string
      add :description, :string
      add :title, :string
      add :image, :string
      add :author, :string
      add :pubdate, :datetime
      add :shared, :boolean, default: false, null: false

      timestamps()
    end
  end
end
