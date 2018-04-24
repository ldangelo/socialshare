defmodule Socialshare.Accounts.Linkedin do
  use Ecto.Schema
  import Ecto.Changeset


  schema "linkedin" do
    field :email, :string
    field :expiration, :date
    field :expired, :boolean, default: false
    field :name, :string
    field :token, :string, size: 1024
    field :linkedinid, :string
    timestamps()
  end

  @doc false
  def changeset(linkedin, attrs) do
    linkedin
    |> cast(attrs, [:name, :email, :token, :expired, :expiration, :linkedinid])
    |> validate_required([:name, :email, :token, :expired, :expiration])
    |> unique_constraint(:linkedinid)
    |> unique_constraint(:email)
  end
end
