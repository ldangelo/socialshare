defmodule Socialshare.Repo.Migrations.CreateLinkedin do
  use Ecto.Migration

  def change do
    create table(:linkedin) do
      add :name, :string
      add :email, :string
      add :token, :string, size: 1024
      add :expired, :boolean, default: false, null: false
      add :expiration, :date
      add :linkedinid, :string
      timestamps()
    end

    create unique_index(:linkedin, [:linkedinid])
    create unique_index(:linkedin, [:email])
  end
end
