defmodule Socialshare.Mixfile do
  use Mix.Project

  def project do
    [
      app: :socialshare,
      version: "0.0.1",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Socialshare.Application, []},
      applications: [
        :phoenix,
        :phoenix_html,
        :cowboy,
        :logger,
        :runtime_tools,
        :phoenix_ecto,
        :postgrex,
        :ueberauth,
        :ueberauth_google,
        :ueberauth_linkedin,
        :timex,
        :httpotion
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:ueberauth, "~> 0.4"},
      {:ueberauth_google, "~> 0.2"},
      {:ueberauth_linkedin, "~> 0.3"},
      {:ja_serializer, "~> 0.13.0"},
      {:guardian, "~> 0.14.2"},
      {:timex, "~> 3.0"},
      {:timex_ecto, "~> 3.0"},
      {:httpotion, "~> 3.1.0"},
      {:scrape, "~> 2.0"},
      {:html5ever, "~> 0.5.0", override: true, git: "http://github.com/hansihe/html5ever_elixir.git"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
