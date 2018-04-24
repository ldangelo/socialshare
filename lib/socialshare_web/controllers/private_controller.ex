defmodule SocialshareWeb.PrivateController do
  use SocialshareWeb, :controller
  plug Ueberauth

  require Logger
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
          case Accounts.create_user(%{admin: false, name: user.name, email: user.email}) do
            {:error, reason} -> Logger.debug(reason)
          end
        end
        
        conn
        |> put_flash(:info, "Successfully authenticated.")
        |> put_session(:current_user, user)
        |> redirect(to: "/")
      {:error, reason} ->
        Logger.debug(reason)

        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end   

  defp linkedin_create_or_update(nil, linkedin) do
    expiration = Timex.local
    expiration = Timex.shift(expiration, milliseconds: linkedin.expiration)
    case   Accounts.create_linkedin(%{name: linkedin.name, email: linkedin.email, token: linkedin.token, expiration: expiration, expired: false, linkedinid: linkedin.linkedinid}) do
      {:error, reason} -> Logger.debug "Failed to create linkedin profile #{inspect(reason)}"
      {:ok, _ }  -> Logger.debug "Successfully created linkedin profile"
    end
   
  end

  defp linkedin_create_or_update(found, linkedin) do
    expiration = Timex.from_unix(linkedin.expiration)
    #          expiration = Timex.shift(Timex.local, millisecionts: linkedin.expiration)
    Accounts.update_linkedin(found, %{id: found.id, name: linkedin.name, email: linkedin.email, token: linkedin.token, expiration: expiration, expired: false, linkedinid: linkedin.linkedinid})
   
  end

  defp handle_auth({:ok, linkedin}, conn) do
         linkedin_create_or_update Accounts.find_linkedin_by_email(linkedin.email), linkedin
        
        conn
        |> put_flash(:info, "Successfully authenticated.")
        |> put_session(:current_linkedin, linkedin)
        |> redirect(to: "/")
  end

  defp handle_auth({:error, reason}, conn) do
    Logger.debug(reason)

    conn
    |> put_flash(:error, reason)
    |> redirect(to: "/")
  end
  
  def linkedin_callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    Logger.debug "LinkedInCallback #{inspect(auth)}"

    handle_auth LinkedInFromAuth.find_or_create(auth), conn
  end 
end
