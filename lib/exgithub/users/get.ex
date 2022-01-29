defmodule Exgithub.Users.Get do
  alias Exgithub.Error

  def call(username) do
    with {:ok, repos} <- client().get_repos(username) do
      {:ok, repos}
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  defp client do
    :exgithub
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:github_adapter)
  end
end
