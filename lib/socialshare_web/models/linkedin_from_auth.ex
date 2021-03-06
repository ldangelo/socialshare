defmodule LinkedInFromAuth do
  @moduledoc """
  Retrieve the linkedin information from an auth request
  """
  require Logger
  require Poison

  alias Ueberauth.Auth

  def find_or_create(%Auth{provider: :identity} = auth) do
    case validate_pass(auth.credentials) do
      :ok ->
        {:ok, basic_info(auth)}
      {:error, reason} -> {:error, reason}
    end
  end

  def find_or_create(%Auth{} = auth) do
    {:ok, basic_info(auth)}
  end

  # github does it this way
  defp avatar_from_auth( %{info: %{urls: %{avatar_url: image}} }), do: image

  #facebook does it this way
  defp avatar_from_auth( %{info: %{image: image} }), do: image

  # default case if nothing matches
  defp avatar_from_auth( auth ) do
    Logger.warn auth.provider <> " needs to find an avatar URL!"
    Logger.debug(Poison.encode!(auth))
    nil
  end

  defp basic_info(auth) do
    %{id: auth.uid, name: name_from_auth(auth), email: email_from_auth(auth), token: token_from_auth(auth), expiration: expiration_from_auth(auth), linkedinid: linkedinid_from_auth(auth)}
  end

  defp name_from_auth(auth) do
    if auth.info.name do
      auth.info.name
    else
      name = [auth.info.first_name, auth.info.last_name]
      |> Enum.filter(&(&1 != nil and &1 != ""))

      cond do
        length(name) == 0 -> auth.info.nickname
        true -> Enum.join(name, " ")
      end
    end
  end

  defp linkedinid_from_auth(auth) do
    if auth.extra.raw_info.user["id"] do
      auth.extra.raw_info.user["id"]
    end
  end
  defp email_from_auth(auth) do
    if auth.info.email do
      auth.info.email
    end
  end

  defp token_from_auth(auth) do
    if (auth.extra.raw_info.token.access_token) do
      auth.extra.raw_info.token.access_token
    end
  end

  defp expiration_from_auth(auth) do
    if auth.extra.raw_info.token.expires_at do
      auth.extra.raw_info.token.expires_at
    end
  end
  defp validate_pass(%{other: %{password: ""}}) do
    {:error, "Password required"}
  end
  defp validate_pass(%{other: %{password: pw, password_confirmation: pw}}) do
    :ok
  end
  defp validate_pass(%{other: %{password: _}}) do
    {:error, "Passwords do not match"}
  end
  defp validate_pass(_), do: {:error, "Password Required"}
end
