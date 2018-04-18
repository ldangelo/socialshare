defmodule Linkedin.Server do
  use GenServer

  require Logger
  alias HttpPotion

  ## Client API
  @doc """
  Starts the LinkedIn Server
  """
  def start_link do
    Logger.info("Started Linkedin Server")
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__ )
  end

  def check do
    GenServer.call(__MODULE__, {:check})
  end

  def share(post) do
    GenServer.call(__MODULE__, {:share, post})
  end

  def gettoken(code, redirectUrl) do
    GenServer.call(__MODULE__, {:gettoken, code, redirectUrl})
  end
  
  ## Server Callbacks
  def init(:ok) do
    {:ok, %{}}
  end

  def get_body(post) do
    Poison.encode!(%{"comment" => post.comment,
                     "content" => %{"title" => post.title,
                                    "description" => post.description,
                                    "submitted-url" => post.url,
                                   "sutmitted-image" => post.image},
                     "visibility" => %{"code" => "anyone"}})
#    [comment: Enum.join([post.url,post.comment]," "), [visability: [code: , anyone: ]
  end

  def get_headers(token) do
    [
      Authorization: Enum.join(["Bearer",token]," "),
      "Content-Type": "application/json",
      "x-li-format": "json"
    ]
  end

  def handle_call({:gettoken, code, redirectUrl}, _from, opts) do
    clientId = ""
    clientSecret = ""

    response = HTTPotion.post "https://api.linkedin.com/oauth/v2/accessToken", [body: URI.encode_www_form(Enum.concat(["grant_type=authorization_code&code=",code,"&redirect_url=",redirectUrl,"&client_id=",clientId,"&client_secret=",clientSecret])), headers: ["Content-Type": "application/x-www-form-urlencoded"]]

    case HTTPotion.Response.success?(response) do
      true ->
      Logger.debug "Authorization token successfull: #{inspect(response)}"
      json = Poison.decode!(response.body)
      ret = {:ok, json, json}
      _ ->
      Logger.debug "Authorization token failed: #{inspect(response)}"
      ret = {:error, response.status_code}
    end
  end

  # Loop through all the linkedin records sharing this article to each
  # users linkedin profile
  #
  # FIXME: this should be a handle cast and return :ok
  # errors should be logged and saved in the posts_status table
  def handle_call({:share, post}, _from, opts) do
    Logger.debug fn -> "Sharing post to linkedin #{inspect(post)}" end
    
    Enum.each Socialshare.Accounts.list_linkedin(), fn linkedin -> 
      Logger.debug "Sharing body: #{inspect(get_body(post))}"
      Logger.debug "Sharing headers: #{inspect(get_headers(linkedin.token))}"
      Logger.debug " "
      response = HTTPotion.post "https://api.linkedin.com/v1/people/~/shares", [body: get_body(post), headers: get_headers(linkedin.token)]
      Logger.debug "Sharing response: #{inspect(response)}"

      #
      # TODO: If the response is 'ok' mark post as shared 
    end
    {:reply, %{}, opts}
  end

  def handle_call({:check}, _from, opts) do
    {:reply, :ok, :ok}
  end
end
