defmodule Exgithub.Repo do
  use Ecto.Repo,
    otp_app: :exgithub,
    adapter: Ecto.Adapters.Postgres
end
