defmodule Exgithub do
  alias Exgithub.Users.Get, as: UserGet

  defdelegate get_user(username), to: UserGet, as: :call
end
