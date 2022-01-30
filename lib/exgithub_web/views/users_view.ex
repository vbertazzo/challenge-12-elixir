defmodule ExgithubWeb.UsersView do
  use ExgithubWeb, :view

  def render("user.json", %{user_repos: user}), do: %{repos: user}

  def render("create.json", %{user: user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("login.json", %{token: token}), do: %{token: token}
end
