defmodule Socialshare.Repo.Migrations.CreateGoogle do
  use Ecto.Migration

  def change do
    create table(:google) do
      add :name, :string
      add :email, :string
      add :token, :string
      add :expired, :boolean, default: false, null: false
      add :expiration, :date

      timestamps()
    end

  end
end
