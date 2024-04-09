defmodule CreditCardLedgerHTTP.Handler do
  import Plug.Conn
  def index(conn) do
    conn
    |> IO.inspect(label: "Request")
    |> put_resp_content_type("text/plain")
    |> send_resp(:ok, "Hello, world!")
  end
end
