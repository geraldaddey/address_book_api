defmodule AddressBook.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AddressBook.Repo,
      :hackney_pool.child_spec(:websrv_pool, timeout: 120_000, max_connections: 10_000),
      {Plug.Cowboy,
       scheme: :http, plug: AddressBook.Router, options: [port: 3069, ip: {10, 136, 168, 7}]}
    ]


    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AddressBook.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
