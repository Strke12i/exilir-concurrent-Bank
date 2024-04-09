defmodule CreditCardLedger.Entity.UserTest do
  alias CreditCardLedger.Repo
  alias CreditCardLedger.Entity.User
  use ExUnit.Case

  test "Save a user" do
    params = %{
      full_name: "John Doe"

    }

    changeset = User.cast(params)
    Repo.insert(changeset)

    users = Repo.all(User)
    assert [%User{}] = users
  end

end
