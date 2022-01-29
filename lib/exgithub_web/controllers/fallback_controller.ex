defmodule ExgithubWeb.FallbackController do
  use ExgithubWeb, :controller
  alias Exgithub.Error
  alias ExgithubWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
