defmodule Exgithub do
  alias Exgithub.Users.Create, as: UserCreate
  alias Exgithub.Users.Get, as: UserGet

  defdelegate get_user(username), to: UserGet, as: :call
  defdelegate create_user(params), to: UserCreate, as: :call
end
