import Config

config :credit_card_ledger,
  repo: CreditCardLedger.Repo

config :credit_card_ledger, CreditCardLedger.Repo,
  database: "elixir_db",
  username: "myuser",
  password: "mysecret",
  hostname: "localhost",
  port: 5432

  config :credit_card_ledger, ecto_repos: [CreditCardLedger.Repo]

if Mix.env() == :test do
    config :credit_card_ledger, CreditCardLedger.Repo,
      database: "elixir_db",
      hostname: "localhost",
      pool: Ecto.Adapters.SQL.Sandbox
end
