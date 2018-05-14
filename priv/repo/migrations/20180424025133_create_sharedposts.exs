defmodule Socialshare.Repo.Migrations.CreateSharedposts do
  use Ecto.Migration

  def change do
    create table(:sharedposts) do
      add :post_id, references(:posts, on_delete: :nothing)
      add :linkedin_id, references(:linkedin, on_delete: :nothing)
      add :comment_id, references(:comments, on_delete: :nothing)

      timestamps()
    end

    create index(:sharedposts, [:post_id])
    create index(:sharedposts, [:linkedin_id])
    create index(:sharedposts, [:comment_id])
  end
end
