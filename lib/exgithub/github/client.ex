defmodule Exgithub.Github.Client do
  use Tesla
  alias Exgithub.Error
  alias Tesla.Env

  @base_url "https://api.github.com/users/"
  @user_agent "vbertazzo"

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Headers, [{"User-Agent", @user_agent}]

  def get_repos(url \\ @base_url, username) do
    "#{url}#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:error, reason}), do: {:error, Error.build(:bad_request, reason)}

  defp handle_get({:ok, %Env{status: 404}}) do
    {:error, Error.build(:not_found, "GitHub user not found")}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end
end
