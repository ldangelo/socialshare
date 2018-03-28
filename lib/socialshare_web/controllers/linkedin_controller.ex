defmodule SocialshareWeb.LinkedinController do
  use SocialshareWeb, :controller

  alias Socialshare.Accounts
  alias Socialshare.Accounts.Linkedin

  def index(conn, _params) do
    linkedin = Accounts.list_linkedin()
    render(conn, "index.html", linkedin: linkedin)
  end

  def new(conn, _params) do
    changeset = Accounts.change_linkedin(%Linkedin{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"linkedin" => linkedin_params}) do
    case Accounts.create_linkedin(linkedin_params) do
      {:ok, linkedin} ->
        conn
        |> put_flash(:info, "Linkedin created successfully.")
        |> redirect(to: linkedin_path(conn, :show, linkedin))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    linkedin = Accounts.get_linkedin!(id)
    render(conn, "show.html", linkedin: linkedin)
  end

  def edit(conn, %{"id" => id}) do
    linkedin = Accounts.get_linkedin!(id)
    changeset = Accounts.change_linkedin(linkedin)
    render(conn, "edit.html", linkedin: linkedin, changeset: changeset)
  end

  def update(conn, %{"id" => id, "linkedin" => linkedin_params}) do
    linkedin = Accounts.get_linkedin!(id)

    case Accounts.update_linkedin(linkedin, linkedin_params) do
      {:ok, linkedin} ->
        conn
        |> put_flash(:info, "Linkedin updated successfully.")
        |> redirect(to: linkedin_path(conn, :show, linkedin))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", linkedin: linkedin, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    linkedin = Accounts.get_linkedin!(id)
    {:ok, _linkedin} = Accounts.delete_linkedin(linkedin)

    conn
    |> put_flash(:info, "Linkedin deleted successfully.")
    |> redirect(to: linkedin_path(conn, :index))
  end
end
