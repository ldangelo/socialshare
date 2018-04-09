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
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end
  
  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    # This callback is called when the user denies the app to get the data from the oauth provider
    conn
    |> put_flash(:error, "Failed to authenticate")
    |> redirect(to: "/")
  end
  
  def google_callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    require IEx; IEx.pry

    case UserFromAuth.find_or_create(auth) do
      {:ok, user} ->
        if Accounts.find_user_by_email(user.email) == nil do
          Accounts.create_user(%{admin: false, name: user.name, email: user.email})
        end
        
        conn
        |> put_flash(:info, "Successfully authenticated.")
        |> put_session(:current_user, user)
        |> redirect(to: "/")
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end   
  
  def linkedin_callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    require IEx

    case LinkedInFromAuth.find_or_create(auth) do
      {:ok, linkedin} -> 
        if Accounts.find_linkedin_by_email(linkedin.email) == nil do
          
          expiration = Timex.local
          expiration = Timex.shift(expiration, milliseconds: linkedin.expiration)
          
          case   Accounts.create_linkedin(%{name: linkedin.name, email: linkedin.email, token: linkedin.token, expiration: expiration, expired: false}) do
            {:error, reason} ->
              Logger.debug(reason)
          end
        end
        
        conn
        |> put_flash(:info, "Successfully authenticated.")
        |> put_session(:current_linkedin, linkedin)
        |> redirect(to: "/")
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end 
end
