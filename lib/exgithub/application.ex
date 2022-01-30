defmodule Exgithub.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Exgithub.Repo,
      # Start the Telemetry supervisor
      ExgithubWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Exgithub.PubSub},
      # Start the Endpoint (http/https)
      ExgithubWeb.Endpoint
      # Start a worker by calling: Exgithub.Worker.start_link(arg)
      # {Exgithub.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Exgithub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExgithubWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
