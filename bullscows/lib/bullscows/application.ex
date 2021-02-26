defmodule BullsCows.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BullsCowsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BullsCows.PubSub},
      # Start the Endpoint (http/https)
      BullsCowsWeb.Endpoint,
      # Start a worker by calling: BullsCows.Worker.start_link(arg)
      # {BullsCows.Worker, arg}
      BullsCows.BackupAgent,
      BullsCows.GameSup,
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BullsCows.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BullsCowsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
