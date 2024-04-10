defmodule CreditCardLedger.Entity.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :full_name, :string
    field :credit_limit, :float
    field :inserted_at, :naive_datetime

  end

  def cast(params) do
    now = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
    %__MODULE__{inserted_at: now}
    |> cast(params, [:full_name, :credit_limit])
    |> validate_required([:full_name])
  end

end
