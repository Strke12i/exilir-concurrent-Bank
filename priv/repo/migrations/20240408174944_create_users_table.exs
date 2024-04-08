defmodule CreditCardLedger.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :full_name, :string, null: false
      add :inserted_at, :naive_datetime, default: fragment("now()")

    end
  end
end
