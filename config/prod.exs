import Config

config :api_clean,
  timezone: "America/Bogota",
  env: :prod,
  http_port: 8083,
  enable_server: true,
  version: "0.0.1",
  custom_metrics_prefix_name: "api_clean"

config :logger,
  level: :warning

config :api_clean, ecto_repos: [ApiClean.Infrastructure.Adapters.Repository.Repo]

config :api_clean, ApiClean.Infrastructure.Adapters.Repository.Repo,
database: "clean_bookdb",
username: "postgres",
password: "postgres",
hostname: "postgres-db-1",
pool_size: 10,
  telemetry_prefix: [:elixir, :repo]
