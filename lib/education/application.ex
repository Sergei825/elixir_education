defmodule Education.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EducationWeb.Telemetry,
      Education.Repo,
      {DNSCluster, query: Application.get_env(:education, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Education.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Education.Finch},
      # Start a worker by calling: Education.Worker.start_link(arg)
      # {Education.Worker, arg},
      # Start to serve requests, typically the last entry
      EducationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Education.Supervisor]
    IO.puts "======================================== HERE ========================================================"
    IO.puts "NODE #{node()}======================================================="
    IO.puts "COOKIE #{Node.get_cookie()}======================================================="
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EducationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
