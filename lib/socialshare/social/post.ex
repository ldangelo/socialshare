defmodule Socialshare.Social.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :comment, :string
    field :shared, :boolean, default: false
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:url, :comment, :shared])
    |> validate_required([:url, :comment, :shared])
  end
end
