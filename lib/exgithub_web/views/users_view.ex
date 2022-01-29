defmodule ExgithubWeb.UsersView do
  use ExgithubWeb, :view

  def render("user.json", %{user_repos: user}), do: %{repos: user}
end
