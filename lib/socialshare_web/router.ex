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
    get "/posts", PostController, :index

    resources "/users", UserController
    resources "/google", GoogleController
    resources "/linkedin", LinkedinController
    resources "/posts", PostController
  end


  scope "/auth", SocialshareWeb do
    pipe_through [:browser] 
    
    get "/", PrivateController, :index
    
    get "/:provider", PrivateController, :request
    get "/google/callback", PrivateController, :google_callback
    post "/google/callback", PrivateController, :google_callback
    get "/linkedin/callback", PrivateController, :linkedin_callback
    post "/linkedin/callback", PrivateController, :linkedin_callback
#    get "/:provider/callback", PrivateController, :callback
#    post "/:provider/callback", PrivateController, :callback
    delete "/logout", PrivateController, :delete


  end

  # Other scopes may use custom stacks.
  # scope "/api", SocialshareWeb do
  #   pipe_through :api
  # end
end
