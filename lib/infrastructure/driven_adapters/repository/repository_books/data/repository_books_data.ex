defmodule ApiClean.Infrastructure.Adapters.Repository.RepositoryBooks.Data.RepositoryBooksData do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:id, :title, :author]}
  schema "books" do
    field :title, :string
    field :author, :string 
  end
end
