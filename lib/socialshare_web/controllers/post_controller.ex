defmodule SocialshareWeb.PostController do
  use SocialshareWeb, :controller
#  use Socialshare.Controller

  alias Socialshare.Social
  alias Socialshare.Social.Post

  def index(conn, _params) do
    posts = Social.list_posts()
    render(conn, "index.html", posts: posts, current_user: get_session(conn, :current_user))
  end

  def new(conn, _params) do
    changeset = Social.change_post(%Post{})
    render(conn, "new.html", changeset: changeset, current_user: get_session(conn, :current_user))
  end

  def create(conn, %{"post" => post_params}) do
    case Social.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, current_user: get_session(conn, :current_user))
    end
  end

  def show(conn, %{"id" => id}) do
    post = Social.get_post!(id)
    render(conn, "show.html", post: post, current_user: get_session(conn, :current_user))
  end

  def edit(conn, %{"id" => id}) do
    post = Social.get_post!(id)
    changeset = Social.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset, current_user: get_session(conn, :current_user))
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Social.get_post!(id)

    case Social.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset, current_user: get_session(conn, :current_user))
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Social.get_post!(id)
    {:ok, _post} = Social.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: post_path(conn, :index), current_user: get_session(conn, :current_user))
  end
end
