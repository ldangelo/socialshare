defmodule Socialshare.Social.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comments" do
    field :comment, :string
    field :tag_id, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:comment])
    |> validate_required([:comment])
  end
end
