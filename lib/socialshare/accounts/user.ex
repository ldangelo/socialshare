defmodule Socialshare.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  

  schema "users" do
    field :admin, :boolean, default: false
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :admin])
    |> validate_required([:name, :email, :admin])
  end
end
