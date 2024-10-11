defmodule ApiClean.Infrastructure.Adapters.Repository.Repo.Migrations.Books do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
    end
  end
end
