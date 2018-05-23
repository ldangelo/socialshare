defmodule Linkedin.Supervisor do
  use Supervisor

  require Logger

  def start_link() do
    Logger.info "Linkedin Supervisor Started"
   Supervisor.start_link(__MODULE__, []) 
  end

  def init(_) do
    children = [
      worker(Linkedin.Server, [])
    ]

    supervise(children, [strategy: :one_for_one])
  end
end
