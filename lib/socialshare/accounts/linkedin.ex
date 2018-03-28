defmodule Socialshare.Accounts.Linkedin do
  use Ecto.Schema
  import Ecto.Changeset


  schema "linkedin" do
    field :email, :string
    field :expiration, :date
    field :expired, :boolean, default: false
    field :name, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(linkedin, attrs) do
    linkedin
    |> cast(attrs, [:name, :email, :token, :expired, :expiration])
    |> validate_required([:name, :email, :token, :expired, :expiration])
  end
end
