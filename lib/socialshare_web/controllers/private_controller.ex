defmodule SocialshareWeb.PrivateController do
  require Logger
  use SocialshareWeb, :controller
  plug Ueberauth

  import Ecto.Query
  import Socialshare.Repo
  alias Socialshare.Accounts.User
  alias Socialshare.Accounts
  alias Ueberauth.Strategy.Helpers

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end
  
  def delete(conn, _params) do
    # Sign out the user
    conn
    |> put_status(200)
    |> Guardian.Plug.sign_out(conn)
    |> redirect("/")
  end
  
  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    # This callback is called when the user denies the app to get the data from the oauth provider
    conn
    |> put_status(401)
    |> render(SocialshareWeb.ErrorView, "401.html")
  end
  
  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case AuthUser.basic_info(auth) do
      {:ok, user} ->
        sign_in_user(conn, %{"user" => user})
    end
    
    case AuthUser.basic_info(auth) do
      {:ok, user} ->
        conn
        |> put_resp_header("current_user", user)
        |> redirect("/")
#        |> render(SocialshareWeb.PageView, "index.html", %{current_user: user})

        Logger.debug "User: #{inspect(user)}"
      {:error} ->
        conn
        |> put_status(401)
        |> render(SocialshareWeb.ErrorView, "401.html")
    end
    
    conn
  end
  
  def sign_in_user(conn, %{"user" => user}) do
    try do
      # Attempt to retrieve exactly one user from the DB, whose
      # email matches the one provided with the login request
      user = User
      |> where(email: ^user.email)
      |> Accounts.get_user!
      cond do
        true ->
          # Successful login
          # Encode a JWT
          { :ok, jwt, _ } = Guardian.encode_and_sign(user, :token)
          auth_conn = Guardian.Plug.api_sign_in(conn, user)
          jwt = Guardian.Plug.current_token(auth_conn)
          {:ok, claims} = Guardian.Plug.claims(auth_conn)
          auth_conn
          |> put_resp_header("authorization", "Bearer #{jwt}")

          conn
          |> put_resp_header("current_user", user)
          |> redirect("/")
#          |> render(SocialshareWeb.PageView, "index.html", %{current_user: user})
        false ->
          # Unsuccessful login
          conn
          |> put_status(401)
          |> render(SocialshareWeb.ErrorView, "401.html")
      end
    rescue
      e ->
        IO.inspect e # Print error to the console for debugging
        # Successful registration
        sign_up_user(conn, %{"user" => user})
    end
  end
  
  def sign_up_user(conn, %{"user" => user}) do
    Logger.debug "User: #{inspect(user)}"

    changeset = %{email: user.email,
                  name: user.first_name <> " " <> user.last_name
                 }
    
    Logger.debug "Changeset: #{inspect(changeset)}"

    case Accounts.create_user changeset do
      {:ok, user} ->
        Logger.debug("User: #{inspect(user)}")

        # Encode a JWT
        { :ok, jwt, _ } = Guardian.encode_and_sign(user, :token)
        conn
        |> put_resp_header("authorization", "Bearer #{jwt}")
        |> put_resp_header("current_user",user)
        |> redirect("/")
#        |> render(SocialshareWeb.PageView, "index.html", %{current_user: user})
      {:error, changeset} ->
        conn
        |> put_status(422)
        |> render(SocialshareWeb.ErrorView, "422.html")
    end
  end
  def unauthenticated(conn, params) do
    conn
    |> put_status(401)
    |> render(SocialshareWeb.ErrorView, "401.html")
  end
  def unauthorized(conn, params) do
    conn
    |> put_status(403)
    |> render(SocialshareWeb.ErrorView, "403.html")
  end
  def already_authenticated(conn, params) do
    conn
    |> put_status(200)
    |> render(SocialshareWeb.ErrorView, "200.html")
  end
  def no_resource(conn, params) do
    conn
    |> put_status(404)
    |> render(SocialshareWeb.ErrorView, "404.html")
  end
  
  def index(conn, _params) do
    render conn, "index.html"
  end
end
