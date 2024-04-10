defmodule CreditCardLedger.Transaction do
  alias CreditCardLedger.Repo
  alias CreditCardLedger.Entity.{User, Transaction}
  import Ecto.Query

  def add_transaction(user_id, amount) do
    with user = %User{} <- Repo.get(User, user_id),
          user_limit <- get_available_limit(user) do
      if user_limit + amount <= user.credit_limit do
        Transaction.cast(%{amount: amount}, user) |> Repo.insert()
      end

      :error

      |> Repo.insert()
    end
  end

  defp get_available_limit(user) do
    from(t in Transaction, where: t.user_id == ^user.id, select: sum(t.amount))
    |> Repo.all()
    |> case do
      [nil] -> nil
      [number] -> number
      _ -> 0.0
    end
  end
end
