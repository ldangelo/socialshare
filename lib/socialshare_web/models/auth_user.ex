defmodule AuthUser do
  alias Ueberauth.Auth
  def basic_info(%Auth{} = auth) do
    {:ok,
     %{
       email: auth.info.email,
       name: auth.info.first_name <> " " <> auth.info.last_name,
       first_name: auth.info.first_name,
       last_name: auth.info.last_name
     }
    }
  end
end
