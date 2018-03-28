defmodule SocialshareWeb.GoogleController do
  use SocialshareWeb, :controller

  alias Socialshare.Accounts
  alias Socialshare.Accounts.Google

  def index(conn, _params) do
    google = Accounts.list_google()
    render(conn, "index.html", google: google)
  end

  def new(conn, _params) do
    changeset = Accounts.change_google(%Google{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"google" => google_params}) do
    case Accounts.create_google(google_params) do
      {:ok, google} ->
        conn
        |> put_flash(:info, "Google created successfully.")
        |> redirect(to: google_path(conn, :show, google))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    google = Accounts.get_google!(id)
    render(conn, "show.html", google: google)
  end

  def edit(conn, %{"id" => id}) do
    google = Accounts.get_google!(id)
    changeset = Accounts.change_google(google)
    render(conn, "edit.html", google: google, changeset: changeset)
  end

  def update(conn, %{"id" => id, "google" => google_params}) do
    google = Accounts.get_google!(id)

    case Accounts.update_google(google, google_params) do
      {:ok, google} ->
        conn
        |> put_flash(:info, "Google updated successfully.")
        |> redirect(to: google_path(conn, :show, google))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", google: google, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    google = Accounts.get_google!(id)
    {:ok, _google} = Accounts.delete_google(google)

    conn
    |> put_flash(:info, "Google deleted successfully.")
    |> redirect(to: google_path(conn, :index))
  end
end
