defmodule ExgithubWeb.UsersController do
  use ExgithubWeb, :controller
  alias Exgithub.User
  alias ExgithubWeb.FallbackController

  action_fallback FallbackController

  def show(conn, %{"username" => username}) do
    with {:ok, user_repos} <- Exgithub.get_user(username) do
      conn
      |> put_status(:ok)
      |> render("user.json", user_repos: user_repos)
    end
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- Exgithub.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
