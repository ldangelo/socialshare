defmodule SocialshareWeb.Router do
  use SocialshareWeb, :router
  require Ueberauth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SocialshareWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

  end

  scope "/auth", SocialshareWeb do
    pipe_through [:browser] 
    
    get "/", PrivateController, :index
    
    get "/:provider", PrivateController, :request
    get "/:provider/callback", PrivateController, :callback
    post "/:provider/callback", PrivateController, :callback
    delete "/logout", PrivateController, :delete

    resources "/users", UserController
    resources "/google", GoogleController
    resources "/linkedin", LinkedinController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SocialshareWeb do
  #   pipe_through :api
  # end
end
