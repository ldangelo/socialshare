defmodule Socialshare.Social.SharedPosts do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sharedposts" do
    field :post_id, :id
    field :linkedin_id, :id
    field :comment_id, :id

    timestamps()
  end

  @doc false
  def changeset(shared_posts, attrs) do
    shared_posts
    |> cast(attrs, [])
    |> validate_required([])
  end
end
