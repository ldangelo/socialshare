defmodule Socialshare do
#  use Application
  require IEx
  require Logger

  @moduledoc """
  Socialshare keeps the contexts that define your domain
  and business logic.
 
  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def start(_type, _args) do
    Logger.info "Application Started"
    Linkedin.Supervisor.start_link
  end
end
 
