defmodule ClerkDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ClerkDemoWeb.Telemetry,
      ClerkDemo.Repo,
      {DNSCluster, query: Application.get_env(:clerk_demo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ClerkDemo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ClerkDemo.Finch},
      # Start a worker by calling: ClerkDemo.Worker.start_link(arg)
      # {ClerkDemo.Worker, arg},
      # Start to serve requests, typically the last entry
      ClerkDemoWeb.Endpoint,
      {ClerkDemo.Strategy, time_interval: 2_000}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ClerkDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ClerkDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
