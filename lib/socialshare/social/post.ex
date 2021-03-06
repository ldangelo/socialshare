defmodule Socialshare.Social.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :comment, :string
    field :description, :string
    field :image, :string
    field :shared, :boolean, default: false
    field :title, :string
    field :author, :string
    field :url, :string
    field :pubdate, Timex.Ecto.DateTime
    
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:comment, :description, :image, :shared, :title, :author, :url, :pubdate])
    |> validate_required([:url, :comment, :shared])
    |> unique_constraint(:url)
  end
end
