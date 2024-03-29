defmodule AddressBook.MixProject do
  use Mix.Project

  def project do
    [
      app: :address_book,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {AddressBook.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.10"},
      {:ecto, "~> 3.10"},
      {:ecto_sql, "~> 3.10"},
      {:poison, "~> 5.0"},
      {:plug, "~> 1.14"},
      {:plug_cowboy, "~> 2.6"},
      {:postgrex, "~> 0.17.2"},
      {:httpoison, "~> 2.1"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
