defmodule Socialshare.Accounts.Google do
  use Ecto.Schema
  import Ecto.Changeset


  schema "google" do
    field :email, :string
    field :expiration, :date
    field :expired, :boolean, default: false
    field :name, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(google, attrs) do
    google
    |> cast(attrs, [:name, :email, :token, :expired, :expiration])
    |> validate_required([:name, :email, :token, :expired, :expiration])
  end
end
