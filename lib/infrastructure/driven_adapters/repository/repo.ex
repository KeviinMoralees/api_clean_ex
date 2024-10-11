defmodule ApiClean.Infrastructure.Adapters.Repository.Repo do
  use Ecto.Repo,
    otp_app: :api_clean,
    adapter: Ecto.Adapters.Postgres
end
