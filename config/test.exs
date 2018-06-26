use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :socialshare, SocialshareWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :socialshare, Socialshare.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "socialshare",
  password: "socialshare",
  database: "socialshare_test",
  hostname: "ldangelo-2.local",
  pool: Ecto.Adapters.SQL.Sandbox

config :socialshare, :feed_api, SocialshareWeb.FeedScraperApi
