import Config

config :address_book, AddressBook.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "gerald_addr_bk",
  username: "gerald",
  password: "test123",
  hostname: System.get_env("DB_HOST"),
  port: System.get_env("DB_PORT"),
  prepare: :unnamed,
  pool_size: 10
