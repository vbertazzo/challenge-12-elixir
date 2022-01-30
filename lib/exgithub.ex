defmodule Exgithub do
  alias Exgithub.Users.Create, as: UserCreate
  alias Exgithub.Users.Get, as: UserGet

  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate get_user_repos(username), to: UserGet, as: :get_repos
  defdelegate create_user(params), to: UserCreate, as: :call
end
