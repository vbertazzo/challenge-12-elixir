defmodule ExgithubWeb.Plugs.TokenRefresher do
  import Plug.Conn
  alias ExgithubWeb.Auth.Guardian

  def init(options), do: options

  def call(conn, _opts) do
    with token <- Guardian.Plug.current_token(conn),
         {:ok, _old_token, {new_token, _new_claims}} <- Guardian.refresh(token, ttl: {1, :minute}) do
      put_private(conn, :refreshed_token, new_token)
    end
  end
end
