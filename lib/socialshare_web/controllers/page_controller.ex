defmodule SocialshareWeb.PageController do
  use SocialshareWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
