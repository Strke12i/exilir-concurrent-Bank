defmodule CreditCardLedger.Repo.Migrations.CreateTransactionTable do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, type: :uuid), null: false
      add :amount, :float, null: false
      add :inserted_at, :naive_datetime, default: fragment("now()")
    end
  end
end
